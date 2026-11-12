#!/usr/bin/env bash
# Run one repo-manager command for lemonade's CI.
#
#   bash state/runner/run.sh "commit review <sha>"
#
# Lemonade's workflow does only three things: it clones this repository to ./state (with a
# token that may push), clones lemonade to ./checkout, and calls this script with the
# command. Everything that depends on which repo-manager runs — the pins in pin.env, how the
# tools are installed, how the model is served, which flags repo-manager takes — lives here,
# so a pin can change without touching lemonade.
#
# Needs bash, curl, tar and git on the runner, plus RUNNER_TEMP and GITHUB_WORKSPACE (set
# by GitHub Actions) and GH_TOKEN. Every tool goes into $RUNNER_TEMP and is thrown away with
# the job; only the model cache persists between jobs.

set -euo pipefail

RUNNER_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=pin.env
source "$RUNNER_DIR/pin.env"

WORKSPACE="${GITHUB_WORKSPACE:?GITHUB_WORKSPACE is not set}"
STATE_DIR="${STATE_DIR:-$WORKSPACE/state}"
CHECKOUT_DIR="${CHECKOUT_DIR:-$WORKSPACE/checkout}"
TOOLS="${RUNNER_TEMP:?RUNNER_TEMP is not set}/repo-manager-tools"
LOGS="$TOOLS/logs"
# pi writes its provider config and skills under HOME, so it gets one of its own.
RM_HOME="$TOOLS/home"

log() { printf '\n== %s\n' "$*"; }

install_tools() {
  mkdir -p "$TOOLS/gh" "$TOOLS/uv" "$TOOLS/node" "$TOOLS/lemonade" "$LOGS" "$RM_HOME"

  log "GitHub CLI $GH_CLI_VERSION"
  curl -sfL "https://github.com/cli/cli/releases/download/v${GH_CLI_VERSION}/gh_${GH_CLI_VERSION}_linux_amd64.tar.gz" \
    | tar -xz --strip-components=1 -C "$TOOLS/gh"
  export PATH="$TOOLS/gh/bin:$PATH"
  gh --version | head -1

  log "Python $PYTHON_VERSION and repo-manager $REPO_MANAGER_VERSION"
  curl -sfL "https://github.com/astral-sh/uv/releases/download/${UV_VERSION}/uv-x86_64-unknown-linux-gnu.tar.gz" \
    | tar -xz --strip-components=1 -C "$TOOLS/uv"
  export UV_CACHE_DIR="$TOOLS/uv-cache" UV_PYTHON_INSTALL_DIR="$TOOLS/python"
  "$TOOLS/uv/uv" venv --quiet --python "$PYTHON_VERSION" "$TOOLS/venv"
  "$TOOLS/uv/uv" pip install --quiet --python "$TOOLS/venv/bin/python" \
    "git+https://github.com/lemonade-sdk/repo-manager.git@${REPO_MANAGER_VERSION}"
  export PATH="$TOOLS/venv/bin:$PATH"
  repo-manager --version

  log "Node $NODE_VERSION and the pi this repo-manager was tuned against"
  curl -sfL "https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.xz" \
    | tar -xJ --strip-components=1 -C "$TOOLS/node"
  export PATH="$TOOLS/node/bin:$PATH"
  local pi_version
  pi_version=$(repo-manager pi version)
  test -n "$pi_version"
  # `pi` on npm is a different package. This one installs its binary as `pi`.
  npm install --prefix "$TOOLS/npm" -g --no-fund --no-audit --no-update-notifier --loglevel=error \
    "@earendil-works/pi-coding-agent@${pi_version}"
  export PATH="$TOOLS/npm/bin:$PATH"
  pi --version

  log "Lemonade $LEMONADE_VERSION"
  curl -sfL "https://github.com/lemonade-sdk/lemonade/releases/download/v${LEMONADE_VERSION}/lemonade-embeddable-${LEMONADE_VERSION}-ubuntu-x64.tar.gz" \
    | tar -xz --strip-components=1 -C "$TOOLS/lemonade"
  chmod +x "$TOOLS/lemonade/lemond"
  "$TOOLS/lemonade/lemond" --version
}

# lemond's cache is the one thing kept between jobs, because the model in it is 23GB.
# Locate it from the passwd database: other jobs on these runners redirect HOME into their
# workspace, and a wrong value here would put the cache somewhere that gets wiped.
model_cache() {
  local home
  home=$(getent passwd "$(id -u)" | cut -d: -f6)
  test -n "$home"
  echo "$home/.cache/lemonade-ci/repo-manager"
}

LEMOND_PID=""
LEMOND_PORT=""

start_server() {
  local cache
  cache=$(model_cache)
  mkdir -p "$cache"
  log "Starting lemond with its cache in $cache"
  # The default port is usually already taken on these shared runners.
  LEMOND_PORT=$("$TOOLS/venv/bin/python" -c 'import socket; s=socket.socket(); s.bind(("127.0.0.1",0)); print(s.getsockname()[1]); s.close()')
  # lemond keeps weights in the HuggingFace cache rather than the directory it is given,
  # so both point at the cache for either to persist. --no-broadcast keeps this server out
  # of the UDP discovery other jobs' CLIs use.
  HF_HOME="$cache" "$TOOLS/lemonade/lemond" "$cache" --port "$LEMOND_PORT" --host 127.0.0.1 --no-broadcast \
    > "$LOGS/lemond.stdout.log" 2> "$LOGS/lemond.stderr.log" &
  LEMOND_PID=$!
  for _ in $(seq 1 60); do
    curl -sf "http://127.0.0.1:$LEMOND_PORT/api/v1/health" > /dev/null 2>&1 && break
    kill -0 "$LEMOND_PID" 2>/dev/null || { cat "$LOGS/lemond.stderr.log"; return 1; }
    sleep 2
  done
  curl -sf "http://127.0.0.1:$LEMOND_PORT/api/v1/health" > /dev/null
  echo "lemond is healthy on port $LEMOND_PORT (PID $LEMOND_PID)"
  export REPO_MANAGER_LEMONADE_URL="http://127.0.0.1:$LEMOND_PORT/v1"
  export REPO_MANAGER_PI_MODEL="Lemonade/${REPO_MANAGER_MODEL}"
}

pull_model() {
  log "Pulling $REPO_MANAGER_MODEL"
  local response
  response=$(curl -sf -X POST "http://127.0.0.1:${LEMOND_PORT}/api/v1/pull" \
    -H "Content-Type: application/json" -d "{\"model_name\": \"${REPO_MANAGER_MODEL}\"}")
  echo "$response"
  test "$(printf '%s' "$response" | "$TOOLS/venv/bin/python" -c 'import json, sys; print(json.load(sys.stdin).get("status", ""))')" = "success"
}

stop_server() {
  local status=$?
  if [ "$status" -ne 0 ] && [ -f "$LOGS/lemond.stderr.log" ]; then
    log "lemond log (the run failed)"
    tail -n 100 "$LOGS/lemond.stderr.log" || true
  fi
  # Not pkill: other jobs on these machines run lemond too.
  if [ -n "$LEMOND_PORT" ]; then
    curl -sf -X POST "http://127.0.0.1:${LEMOND_PORT}/internal/shutdown" > /dev/null || true
    sleep 2
  fi
  if [ -n "$LEMOND_PID" ]; then
    kill "$LEMOND_PID" 2>/dev/null || true
  fi
  return "$status"
}

main() {
  local command="${1:?usage: run.sh \"<repo-manager command and arguments>\"}"
  : "${GH_TOKEN:?GH_TOKEN is not set}"
  test -d "$STATE_DIR/.git" || { echo "No clone of lemonade-testing at $STATE_DIR"; return 1; }
  test -d "$CHECKOUT_DIR/.git" || { echo "No clone of lemonade at $CHECKOUT_DIR"; return 1; }

  install_tools
  trap stop_server EXIT
  trap 'exit 130' INT TERM
  start_server
  pull_model

  log "Pointing pi at the model server"
  HOME="$RM_HOME" repo-manager pi setup

  git -C "$STATE_DIR" config user.name "Lemonade Bot"
  git -C "$STATE_DIR" config user.email "lemonade@amd.com"

  log "repo-manager $command"
  # $command is a command line, not one argument.
  # shellcheck disable=SC2086
  HOME="$RM_HOME" repo-manager $command --repo lemonade-sdk/lemonade \
    --checkout "$CHECKOUT_DIR" --state "$STATE_DIR"
}

if [ "${BASH_SOURCE[0]}" = "$0" ]; then
  main "$@"
fi

## Lemonade v2026.41.0

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

@everyone this release brings lemonade-tray its own watchdog, AMD GPU support gets a nice bump, Kokoro voices sound right again, and mid-request disconnects no longer hang you in limbo.

### Breaking Changes

- The `--no-sign` flag was removed from the release tagging tool — tags are now unsigned by default (previously signed). Omit the flag or use `--sign` if you want signed tags.

### 🤖 lemonade-tray spawns and supervises lemond on POSIX

`@abn` added `--spawn-server` so the tray can natively spawn and supervise a local lemond daemon with a watchdog pipe for automatic recovery. No more manual starts — the tray keeps it alive.

### 🖥️ AMD GPU support expands — ROCm 10.0 and stable-diffusion.cpp

`@superm1` bumped the ROCm runtime to version 10.0 and moved the stable-diffusion.cpp backend to the lemonade-sdk fork, bringing expanded AMD GPU support to more configurations.

### 🎤 Kokoro TTS fixes four British English and one French voice

`@bitgamma` bumped Kokoro from b17 to b21, fixing bf_emma, bf_isabella, bm_george, bm_lewis, and ff_siwis — they were all returning ~0.3s of fixed-length audio regardless of input text. Now they actually sound like your prompt.

### ⚡ Non-streaming requests abort cleanly on client disconnect

`@abn` fixed non-streaming requests that used to hang indefinitely when a client disconnected mid-request. Upstream HTTP transfers to backends are now cancelled and the whole pipeline respects liveness.

### Additional Improvements

- `@superm1` added the macOS user install config path (~/.config/lemonade) to the documentation files.
- `@pwilkin` replaced the deprecated `--no-mmap`/`--mmap`/`--mlock`/`--direct-io` llama.cpp CLI options with `--load-mode` variants across all docs and test fixtures (with thanks to `@sreeram-11`).
- `@ramkrishna2910` fixed broken README links that were 404ing on the pre-release website.
- `@jeremyfowers` corrected in-repo links for website-only pages, added a RAM filter for the qwen3.6-moe-35b-a3b-FLM model, and wrote a spec-writing guide for the team.
- `@RaulMermans` tightened backend config validation so unknown variant keys are now rejected instead of silently accepted.

The full changelog is on [GitHub Releases](https://github.com/lemonade-sdk/lemonade/releases) — drop into #general if you want to chat about anything here!

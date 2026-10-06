## Lemonade v2026.41.1

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

@everyone today's release brings some important robustness fixes, better audio from Kokoro TTS, a new `--spawn-server` mode for lemonade-tray, and updated llama.cpp examples — plus a quick cleanup of the release tooling.

### Breaking Changes

- The `--no-sign` flag was dropped from the release tagging tool. If you script releases, just drop the flag (it's the default now) or use `--sign` to create signed tags.

### 🎤 Kokoro TTS voices now have the right length

`@bitgamma` bumped the Kokoro TTS backend to b21 on CPU and Metal — the British English and French voices that were outputting a fixed ~0.3s clip now generate audio at the correct length.

### ⚡ Requests don't hang when a client disconnects

`@abn` wired connection-liveness checks through the entire request pipeline, so non-streaming requests abort upstream transfers and stop blocking the moment a client drops the connection.

### 🖥️ lemonade-tray can now spawn lemond natively

`@abn` added the `--spawn-server` flag so lemonade-try can start and supervise a local lemond process on Linux with a pipe-EOF watchdog. `@ramkrishna2910` made the flag a no-op on macOS and documented all lemonade-tray CLI flags.

### 📖 llama.cpp docs now use `--load-mode`

`@pwilkin` updated all Lemonade documentation examples and test fixtures to use the current `--load-mode` flag instead of the deprecated `--no-mmap` / `--mmap` / `--mlock` / `--direct-io` options.

### Additional Improvements

- `@superm1` updated the macOS config path docs and moved stable-diffusion.cpp to the Lemonade SDK fork with an ROCm 10.0 bump. Thanks `@superm1` for the release-tooling cleanup too!
- `@ramkrishna2910` fixed the broken README links that were 404ing on the pre-release site.
- `@jeremyfowers` corrected website-only page links, added a Windows RAM filter for qwen3.6-moe-35b-a3b-FLM, and a spec-writing guide for `docs/dev`.
- `@RaulMermans` tightened backend config validation so unknown keys get rejected instead of silently accepted.
- `@jeremyfowers` bumped the repo-manager CI version pin.

Full release notes are live on [GitHub Releases](https://github.com/lemonade-sdk/lemonade/releases) — take it for a spin and tell me what you think!

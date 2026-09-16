@everyone Big one — HRX gets its first 8B model, TheNoise learns to edit images, and this release overhauls versioning, config flexibility, and docs so you can actually use this thing the way you want. Let's get into it.

## Breaking Changes

- **Version scheme changed** — Lemonade is now `YYYY.WW.N` (this is `2026.39.0`), not `X.Y.Z` (`11.9.0`). If you parse the version string in any tool or script, update it.
- **`registry_source` defaults to `''`** — the field in `GET /pull/variants` and `GET /models` no longer claims `'huggingface'` by default. Clients that assume a non-empty value may misinterpret the source.
- **`/docs` returns a JSON 404** — the unversioned `/docs` endpoint no longer falls through to the SPA web app. Any reliance on that fallback is gone.

### AMD GPU support grows with HRX 🎮

@AaronStGeorge added Meta-Llama-3.1-8B as the first model profile for the HRX backend, and @iswaryaalex wired HRX into the nightly benchmark pipeline — so now it's tested on AMD gfx1100/gfx1151 GPUs on Linux with CI coverage and regression tracking!

### Image editing lands in TheNoise 🎨

@bitgamma brought you `/images/edit` on TheNoise, bumping it to v0.7.1 and expanding support to more AMD ROCm GPU families. You've got full edit, generate, variation, and upscale endpoints now — all from the same backend.

### Config flexibility + docs, oh my ✨

@abn added wildcard port (`*:`) and subdomain (`*.domain`) matching to `allowed_origins`, so local dev and homelab setups no longer need config changes when your frontend switches ports. @jeremyfowers and @abn also overhauled the built-in API docs system (now at `/v1/docs/{page}` with an MCP tool) and fixed up the allowed-origins documentation so it's actually readable.

### Session headers, now relayed 🔄

@SlawomirNowaczyk restored prompt-cache continuity across the Lemonade hop by relaying caller-supplied session headers like `x-opencode-session` and `x-session-id` to cloud providers — with @abn helping nail down the security boundaries.

## Additional Improvements

- 💨 @meghsat stopped soft-idle transitions from nuking VRAM and the prompt cache — `downsize()` is now a no-op, so idle is truly idle.
- 🧠 @popey fixed mixed AMD/NVIDIA GPU systems from using the wrong GPU's memory for context auto-tuning.
- 🔧 @noamsto fixed `gpt-oss-120b-mxfp-GGUF` model loading after a bad checkpoint glob was resolved to the wrong file.
- 🔧 @Yigtwxx fixed a bug where empty SSE streams were reported as successful completions — they're errors now, properly.
- ⚙️ llama.cpp backend bumped across six backends, FastFlowLM NPU bumped to v1.0.5, and the FLM backend now respects `default_model_source` instead of a separate toggle.
- 🔧 @jeremyfowers moved the Hugging Face model cache to a persistent location for CI, removed the unstable Linux Distro Builds CI job, and pinned ARM64 runners with X64 labels — CI should feel noticeably snappier.
- 🤝 @SlawomirNowaczyk fixed a routing bug where hardware filters could drop entire routing policies, with @fl0rianr helping clean it up.
- 📦 The new prerelease channel is live — try candidate builds on Windows, Fedora, Debian, and macOS via GitHub prereleases tagged `candidate-v<version>`.

Full release notes and everything else are up on the releases page — check it out and tell me what you think!
https://github.com/lemonade-sdk/lemonade/releases

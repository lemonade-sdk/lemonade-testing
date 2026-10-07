## Lemonade v2026.42.0

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

@everyone this release has a trio of headline features — streaming requests no longer hang when clients disconnect, TheNoise just got Windows support, and we've added 26 new models on top of six fresh llama.cpp architectures — plus some important reliability fixes and cleanup.

### Breaking Changes

- The FastFlowLM NPU model `hy-mt2:1.8b` was renamed to `hy-mt2-flash:1.8b` in the upstream v1.0.7 release; update any configs or scripts that reference the old tag.
- The release tagging tool no longer accepts the `--no-sign` flag — omitting the flag now creates unsigned annotated tags by default; use `--sign` if you want a signed tag.

### ⚡ Streaming requests don't hang when clients disconnect

`@abn` wired connection-liveness checks through the entire request pipeline, so non-streaming requests abort upstream transfers the moment a client drops the connection instead of sitting there forever.

### 🪟 TheNoise is now on Windows

`@bitgamma` shipped a bundled portable CPython interpreter with TheNoise on Windows, and `@jeremyfowers` added split-zip download support and a new CI test runner. The backend row now reads "Windows, Linux" in both the README and the backends reference.

### 📚 26 new models and six new architectures

`@AaronStGeorge` bumped the HRX runtime to hrx-b99 and added 26 new text-chat models (Qwen3.8-27B, Mistral-Small-3.2-24B, Llama-3.2-3B, and 21 smaller ones). The llama.cpp backend update by `@sreeram-11` and I brought in six new architectures: clef, glm5-next, hrm_text, hy_v4, maple, and spark2_5.

### Additional Improvements

- `@RaulMermans` tightened backend config validation so unknown keys get rejected instead of silently accepted.
- `@bitgamma` fixed four British English and one French Kokoro TTS voice that were outputting fixed-length ~0.3s clips instead of proper audio.
- `@bitgamma` made `lemonade bench --backend <name>` auto-install the specified backend and show actionable error messages when nothing's installed.
- `@jeremyfowers` fixed model name collision resolution so shared folder names (like `alpha/Qwen3-8B-GGUF` and `lmstudio-community/Qwen3-8B-GGUF`) resolve correctly, and added HuggingFace/ModelScope cache naming rules for readable extra_models_dir paths.
- `@jeremyfowers` replaced macOS DirectoryWatcher's kqueue with FSEvents and added inotify-based nested folder watches on Linux so subdirectory changes are detected immediately.
- `@ramkrishna2910` fixed HTTPS connection failures on Windows when connecting to servers secured by internal/private CAs.
- `@superm1` added the macOS user install config path (`~/.config/lemonade`) to the config docs, moved stable-diffusion.cpp to the Lemonade SDK fork, and bumped ROCm to 10.0.
- `@ramkrishna2910` fixed broken README links that were 404ing on the pre-release site.
- `@jeremyfowers` corrected in-repo links for website-only pages and added a Windows RAM filter for qwen3.6-moe-35b-a3b-FLM.
- `@pwilkin` and I updated all documentation examples and test fixtures to use the current `--load-mode` flag instead of the deprecated options.

Full release notes are over on [GitHub Releases](https://github.com/lemonade-sdk/lemonade/releases) — go take it for a spin!

## Lemonade v2026.41.1

@everyone v2026.41 is out: ROCm 10 across every ROCm backend, requests that let go the moment a client disconnects, fixed Kokoro voices, and stricter config validation.

### Breaking Changes

- ROCm backends now use ROCm 10. The first ROCm model load after upgrading downloads the new runtime (about 2.6 GB), so do it while you're online.
- `lemonade config set` now rejects unknown backend keys (for example `flm.flm_bin`) instead of silently accepting them.

### 🔥 ROCm 10 everywhere

`@superm1` and `@sreeram-11` moved the ROCm runtime to ROCm 10 and switched stable-diffusion.cpp back to the Lemonade fork. llama.cpp, whisper.cpp, stable-diffusion.cpp, ThinkSound, TRELLIS and ACE-Step all pick up the new runtime on their next load.

### ⚡ Abandoned requests no longer tie up the server

`@abn` wired connection-liveness checks through the whole request pipeline. When a client disconnects or times out during a non-streaming request, Lemonade aborts the backend request right away, and the next request is served immediately.

### 🎤 Kokoro voices fixed

`@bitgamma` bumped Kokoro to b21. The British English voices (bf_emma, bf_isabella, bm_george, bm_lewis) and the French voice ff_siwis now produce audio of the right length instead of a fixed ~0.3 s clip.

### Additional Improvements

- `@RaulMermans` tightened backend config validation so typos in backend keys are caught.
- `@jeremyfowers` hid qwen3.6-moe-35b-a3b-FLM on Windows PCs with less than 64 GB RAM, where it cannot run, and added a spec-writing guide.
- `@pwilkin` moved the llama.cpp docs and examples to the current `--load-mode` option. Saved `--no-mmap` args still work.
- `@abn` added `lemonade-tray --spawn-server` for Linux source builds. On macOS the flag is accepted but ignored, because the LaunchDaemon already runs lemond.
- `@ramkrishna2910` and `@jeremyfowers` fixed broken README and docs links, and `@superm1` added the missing macOS config path to the docs.

### Known issues

- On Strix Halo, llama.cpp with the ROCm backend can misread prompts longer than about 1k tokens. This also affects v2026.40. Use the Vulkan backend for long-context and agent workloads until it is fixed.
- The Snap update may arrive later than the other packages.

Full release notes are on [GitHub Releases](https://github.com/lemonade-sdk/lemonade/releases). Thanks to everyone who tested the candidates in #release-candidate!

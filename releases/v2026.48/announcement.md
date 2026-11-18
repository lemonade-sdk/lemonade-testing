## Lemonade v2026.48.0

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

@everyone v2026.48 is out: https://github.com/lemonade-sdk/lemonade/releases/tag/v2026.48.0

MTP speculative decoding speeds up HRX models, a multi-GPU monitor shows per-card utilization and memory, GGUF prompt-router models join `/v1/classify`, and multi-image editing lets you work with several images in a single conversation.

### Breaking Changes

- **API and metrics routes now require authentication** — when `LEMONADE_API_KEY` is set and `LEMONADE_ADMIN_API_KEY` is explicitly empty, requests that previously succeeded without a key now return 401. Set `LEMONADE_ADMIN_API_KEY` to a value or leave it unset.
- **Upgrading TheNoise shared backend changes inference behavior** — bumping from v0.12.1 to v0.15.0 may alter sampler handling, memory layout, or output for existing models shipped with the release.

### 🚀 Automatic MTP speculative decoding for HRX models

`@AaronStGeorge` enables MTP (speculative decoding) for HRX models by detecting the `mtp` label in the catalog and launching with `--spec-type draft-mtp`, so supported model pairs get a throughput boost automatically. Try it with `Qwen3.5-35B-A3B-HRX` — it ships with the MTP label already set.

### 🖥️ Multi-GPU monitor

`@fl0rianr` adds a multi-GPU monitor to the GUI that shows per-GPU utilization and memory usage with selectable GPU history charts for 2–4 GPUs, sitting alongside the existing single-GPU System Vitals layout.

### 🏷️ GGUF prompt-router models for classification

`@meghsat` brings GGUF zero-shot prompt-router models to `llama.cpp` — the encoder runs on GPU inside llama-server and the scoring vector runs in lemond, giving you GPU-accelerated `POST /v1/classify` with the same JSON response as the ONNX implementation.

### 🖼️ Multi-image editing and explicit image selection

`@fl0rianr` adds conversation-scoped image references so you can edit specific images, send them to Vision LLMs, and get direct Vision LLM analysis when your active chat model supports it — all within a single conversation.

### Additional Improvements

- `@superm1` adds gfx1170 and gfx1171 ROCm GPU targets and bumps llama.cpp for those platforms.
- `@danielholanda` adds backend description, author, publisher, license, and project_url metadata, visible on backend cards and via `lemonade backends info`.
- `@meghsat` fixes the autotune fallback on AMD iGPU and NPU for Windows so context sizing works correctly.
- `@fl0rianr` fixes CPU usage display on macOS and the KV Cache gauge across platforms.
- `@fl0rianr` adds a download button for generated and edited images in the Chat view.
- `@sreeram-11` adds `images` support to Ollama's `/api/generate` endpoint and improves Ollama error handling on SSE streams.
- `@sreeram-11` adds speech and decision capability reporting to `/api/show`, and accepts an empty voice field for TTS.
- `@MrAnayDongre` makes the CLI 401 error message clearer and adds API key help to every `--help` footer.
- `@danielholanda` switches the Backends tab to a dynamic multi-column grid that adapts to window width.
- `@jeremyfowers` adds logos and display styling for Halogen, Gufo, DwarfStar4, and TheNoise backends.
- `@fl0rianr` adds `generation_info` to the image generation API response and supports TheNoise as a custom image model recipe in the GUI.
- `@pwilkin` makes `/files` enumerate every shard for multi-shard GGUF models in extra_models_dir.
- `@apollo-2006` returns 400 instead of 500 from `/pull/variants` when a repository has no supported files.

Check out v2026.48.0 on GitHub Releases and tell us what you think!

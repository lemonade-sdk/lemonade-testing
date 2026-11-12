## Lemonade v2026.47.0

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

@everyone v2026.47.0 is out: new AMD GPUs supported on the Rock backend, HRX models get automatic speculative decoding, GGUF classification models are here, and a multi-GPU monitor lands in the GUI!

### Breaking Changes

- Setting `LEMONADE_ADMIN_API_KEY` to an empty string no longer bypasses authentication — API and metrics routes return 401 unless `LEMONADE_API_KEY` is also provided (affects misconfigured setups only).
- The `/files` endpoint now returns one entry per shard for multi-shard GGUF models in `extra_models_dir` instead of a single aggregated entry, so clients that assumed one response may need updating.

### 🤖 New AMD GPUs on the Rock backend

`@superm1` added gfx1170 and gfx1171 to the Rock backend, so more AMD hardware is covered now.

### ⚡ Automatic MTP speculative decoding for HRX models

`@AaronStGeorge` enabled automatic speculative decoding for HRX models — just pull an HRX model and Lemonade applies MTP behind the scenes. `@AaronStGeorge` also added the Qwen3.5-35B-A3B-HRX model to the registry, ready to `lemonade pull`.

### 🏷️ GGUF classification models in llama.cpp

`@meghsat` brought zero-shot prompt-router classification to the llama.cpp backend with GGUF models — the same `/v1/classify` interface you already know, now backed by GPU-accelerated encoders.

### 📊 Multi-GPU monitor in the GUI

`@fl0rianr` added a multi-GPU monitor to the GUI that shows per-GPU utilization and memory usage with selectable history charts for 2–4 GPUs. `@meghsat` helped polish it up.

### Additional Improvements

- `@meghsat` restored CPU usage on the Monitor page for macOS and fixed the KV Cache gauge on all platforms.
- `@fl0rianr` added a download button on generated images, a Copy button on user messages, and conversation-scoped image references so you can build multi-image chats and send images to vision models directly.
- `@danielholanda` added description, author, publisher, license, and project URL to backend descriptors — you can see who made a backend and what it's licensed under right in the app, CLI, and API.
- `@danielholanda` made the Backends catalog flow into a dynamic multi-column grid that fills your window.
- `@MrAnayDongre` improved the CLI 401 error message and added a `--help` footer pointing to global options.
- `@fl0rianr` added an optional `generation_info` field to the images API response.
- `@DigitalFlow` added OpenSUSE package name alternatives so RPMs build cleanly on Tumbleweed.
- A handful of smaller fixes from `@sreeram-11`, `@Bekhouche`, `@julianxhokaxhiu`, `@fl0rianr`, `@sawansri`, `@jeremyfowers`, and `@meghsat`.

Grab v2026.47.0 from [GitHub Releases](https://github.com/lemonade-sdk/lemonade/releases) and let me know what you make with it!

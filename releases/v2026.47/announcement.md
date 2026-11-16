## Lemonade v2026.47.1

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

@everyone v2026.47.1 is out: https://github.com/lemonade-sdk/lemonade/releases/tag/v2026.47.1

RDNA 3.5 GPUs finally join the party, HRX models get speculative decoding out of the box, you can chain multiple images in one conversation, and the backends tab is getting a fresh look.

### Breaking Changes

- Setting `LEMONADE_ADMIN_API_KEY` to an empty string no longer bypasses authentication — treat it as unset and provide `LEMONADE_API_KEY` for API and metrics routes.
- The `/files` endpoint now returns one entry per shard for multi-shard GGUF models in `extra_models_dir` — clients expecting a single aggregated response need to handle multiple entries.

### 🎮 AMD RDNA 3.5 GPUs now supported

`@superm1` added gfx1170 and gfx1171 (RDNA 3.5) to the ROCm architecture list with an updated llama.cpp backend, so those cards can run models natively.

### ⚡ MTP speculative decoding on HRX models

`@AaronStGeorge` enabled automatic MTP speculative decoding for supported HRX models — the `mtp` label triggers `--spec-type draft-mtp` under the hood, giving you faster inference without changing a single flag.

### 🖼️ Multiple images, one conversation

`@fl0rianr` added conversation-scoped image references, so you can chain multiple images in a single chat for multi-image editing and get direct Vision LLM analysis. Thanks `@meghsat` for the download button on generated images so you can grab them right from chat.

### Additional Improvements

- `@meghsat` brought GGUF zero-shot prompt router models to llama.cpp, running the encoder on GPU with scoring in lemond.
- `@fl0rianr` added per-GPU utilization and memory charts for 2–4 GPU systems, and `generation_info` to image API responses.
- `@danielholanda` added description, author, publisher, license, and project URL to backend descriptors, and `@DigitalFlow` added openSUSE RPM alternatives.
- `@meghsat` restored CPU usage display on macOS Monitor and fixed the KV Cache gauge.
- `@MrAnayDongre` improved the CLI 401 error message and added a help footer pointing to `lemonade --help`.

Check v2026.47.1 on GitHub Releases — happy to see what you build with the new multi-image chat!

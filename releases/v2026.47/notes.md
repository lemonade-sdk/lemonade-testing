## Headline

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

- ROCm gfx1170 and gfx1171 GPUs are now supported on the Rock backend for broader AMD hardware compatibility.
- Automatic MTP speculative decoding is enabled for HRX models, boosting inference speed on supported hardware.
- GGUF-based zero-shot classification models run in the llama.cpp backend with the same `/v1/classify` interface as the ONNX implementation.
- A multi-GPU monitor in the GUI shows per-GPU utilization and memory usage with selectable history charts.

## Breaking Changes

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

- Setting LEMONADE_ADMIN_API_KEY to an empty string no longer bypasses authentication; API and metrics routes return 401 unless LEMONADE_API_KEY is also set.
- The /files endpoint returns one entry per shard for multi-shard GGUF models in extra_models_dir instead of a single aggregated entry; clients that parse the response may need updating.

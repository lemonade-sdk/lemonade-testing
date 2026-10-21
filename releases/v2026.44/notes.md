## Headline

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

- `lemonade launch pi` now supports MCP mode (`--mcp`) and code mode (`--codemode`), with per-model context windows, image input, and tool-calling.
- sd-cpp ROCm backend is re-enabled on Windows with a full HIP runtime bundle, enabling model streaming on AMD integrated GPUs.
- Auto-tuned context sizing now reserves runtime buffer memory for discrete GPUs, unified-memory GPUs, and host backends, improving model fit accuracy.
- LFM2.5-24B-A2B-GGUF joins the model registry with labels for chat, reasoning, and tool-calling.

## Breaking Changes

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

- The `/v1/models/{model}/options` endpoint's `resolved_ctx_size` field can now return null when automatic GPU sizing cannot fit a valid context; clients must handle null gracefully.

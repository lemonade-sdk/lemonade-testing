## Headline

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

- Model loading on shared-memory (iGPU/APU) systems fixed, enabling larger models by using total physical RAM instead of RAM-in-use for the context-size auto-tune pool cap.
- Stable diffusion ROCm backend restored on Windows with full HIP runtime staging, preventing silent CPU fallback.
- LFM2.5-24B-A2B-GGUF added to the server model registry with chat, reasoning, and tool-calling labels.
- Deleted models now remove their files from disk instead of leaving orphaned checkpoints.

## Breaking Changes

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

- The `/v1/models/{model}/options` endpoint's `resolved_ctx_size` field can now return `null` instead of a numeric value when automatic GPU sizing cannot fit a valid context — clients must handle `null` gracefully.

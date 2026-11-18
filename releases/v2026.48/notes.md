## Headline

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

- Automatic MTP speculative decoding is enabled for HRX models, improving throughput on supported model pairs.
- A new multi-GPU monitor displays per-GPU utilization and memory usage with selectable GPU history charts for 2 to 4 GPUs.
- GGUF zero-shot prompt-router models extend `/v1/classify` with a GPU-accelerated encoder and scoring vector.
- Multi-image editing and explicit image selection let you edit specific images and send them to Vision LLMs within a single conversation.

## Breaking Changes

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

- Requests that previously succeeded without authentication on API and metrics routes now return 401 when `LEMONADE_API_KEY` is set and `LEMONADE_ADMIN_API_KEY` is explicitly empty.
- Upgrading TheNoise shared backend from v0.12.1 to v0.15.0 may change inference behavior, sampler handling, or memory layout for existing models shipped with the release.

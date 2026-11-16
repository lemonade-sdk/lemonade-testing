## Headline

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

- AMD gfx1170 and gfx1171 (RDNA 3.5) GPUs are now supported via ROCm with the updated llama.cpp backend.
- MTP speculative decoding is automatically enabled on supported HRX models for faster inference.
- Conversation-scoped image references enable multi-image editing and direct Vision LLM analysis within a chat.

## Breaking Changes

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

- Setting LEMONADE_ADMIN_API_KEY to an empty string no longer bypasses authentication; a valid LEMONADE_API_KEY must be provided for API and metrics routes.
- The `/files` endpoint now returns one entry per shard for multi-shard GGUF models in extra_models_dir instead of a single aggregated entry; clients expecting a single response must handle multiple entries.

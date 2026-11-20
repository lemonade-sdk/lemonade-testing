## Headline

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

- Multi-modal conversations: `images` and `audio` parameters on `/api/generate` let you pass images and audio through to backends, and `/api/show` now reports `speech`, `decision`, and `audio` capabilities.
- `/api/chat` and `/api/generate` reject non-LLM models with a 400 error instead of loading and failing, and backend errors now end SSE streams with an error line.
- FLM NPU backend updated to v1.0.13 with AMD-signed Windows binaries, enabling embedding models on the `/v1/embeddings` endpoint.

## Breaking Changes

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

- `/api/chat` returns HTTP 400 for image generation models instead of 500.
- `/api/chat` and `/api/generate` return HTTP 400 for embedding and reranking models instead of 500.
- The TheNoise shared backend is updated from v0.12.1 to v0.15.0, which may change inference behavior or memory layout for existing models.
- `GET /pull/variants` returns HTTP 400 instead of 500 when a repository has no supported model files or an invalid or oversized collection manifest.

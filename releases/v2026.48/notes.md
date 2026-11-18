## Headline

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

- Images and audio parameters added to `/api/generate` for multi-modal conversations, with speech and decision capabilities now reported on `/api/show`.
- `/api/chat` and `/api/generate` now reject non-LLM models with a clear 400 error, and backend failures end streams with an error line.
- TheNoise backend upgraded to v0.15.0 with new image generation models and GUI recipe support.

## Breaking Changes

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

- `/api/chat` and `/api/generate` return 400 for non-LLM models instead of 500 — clients that rely on 500 status codes to detect invalid model types should update their error handling.
- TheNoise backend upgraded to v0.15.0 — existing image generation models may produce different output or fail under the new backend.

## Headline

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

- The Lemonade app is redesigned with six workspaces, a visual router policy editor, and multi-provider model search.
- Five K2-Horizon and Flint-GGUF models added to the model registry.
- Models that previously failed to load on 128 GB Strix Halo systems now start reliably with improved shared-memory management.
- Model and backend update progress is visible directly in the app with server-owned sync jobs.

## Breaking Changes

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

- The resolved_ctx_size field on /v1/models/{model}/options may now be null when automatic context sizing cannot produce a valid context — clients must handle null instead of assuming an integer.
- GET requests to POST-only paths (slots/{id}, jobs/{id}/pause, jobs/{id}/interrupt, jobs/{id}/resume, models/register) return 405 instead of 404 — clients relying on 404 for these paths will need to check for 405.
- A request missing the model field now raises a consistent "Missing model field in request" error across all model routes (chat/completions, completions, embeddings, responses, rerank) — previous inconsistent error messages may no longer appear.
- Form-encoded requests with invalid field types (such as a non-numeric temperature on transcription) now return 400 instead of 500 — clients catching 500 for this condition should handle 400.
- Streaming responses carry a cancel token that stops the server from sending data after a TCP disconnect.

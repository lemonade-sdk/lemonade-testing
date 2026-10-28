## Headline

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

- The GUI3 desktop app is a full rewrite: six workspaces, model search across providers, a visual router policy editor, and Chinese localization.
- Auto-tuned context sizing now reserves runtime buffer for discrete and unified-memory GPUs, and returns null when a valid context cannot fit.
- Model catalog expands with GRG-Halo GPU support and several new entries, including gpt-oss-20b-MXFP4, Flint-GGUF, K2-Horizon variants, and LFM2.5-24B-A2B.
- Browser chat history is enabled by default in the desktop app, with API key persistence restored for both browser and native clients.

## Breaking Changes

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

- `GET /v1/models/{model}/options` resolved_ctx_size can now be null when automatic context sizing cannot fit a valid context — clients that parse it as an integer must handle null.
- GET on previously-404 POST-only endpoints (slots/{id}, jobs/{id}/pause|interrupt|resume, models/register) now returns 405 — clients relying on 404 for not-found checks should update their error handling.
- A request without the model field now raises "Missing model field in request" consistently across all model routes — clients expecting varied error messages on chat/completions, embeddings, responses, or rerank endpoints should adjust accordingly.
- Form-encoded requests with invalid field types now return 400 instead of 500 — clients that treat 500 as the expected failure code for malformed input should update their error handling.
- Streaming responses now carry a cancel token to stop the server after a TCP disconnect — clients should implement token-based cancellation for abandoned streams.

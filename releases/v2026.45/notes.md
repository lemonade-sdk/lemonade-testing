## Headline

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

- GUI3 desktop client rewritten with six workspaces — Chat, Models, Backends, Apps, Monitor, Settings — including a visual router policy editor and Chinese localization.
- New model catalog entries for GPT-OSS 20B MXFP4, Qwen3-Coder 32B, and K2-Horizon family (0.9B through MoVA-36B-A4B) across chat, coding, and reasoning use cases.
- HTTP server refactored into a route-class architecture with drift-protected generated API docs and a new GET /internal/routes inspection endpoint.
- Model manager rebuilt with lock-free store snapshots, checkpoint status tracking, and a new /internal/model-sources endpoint for external consumers.

## Breaking Changes

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

- The resolved_ctx_size field returned by GET /v1/models/{model}/options can now be null instead of a numeric value when automatic context sizing cannot fit a valid context — clients that parse it as an integer will need to handle the null case.
- GET requests to previously-404 POST-only paths (slots/{id}, jobs/{id}/pause|interrupt|resume, models/register) now return 405 Method Not Allowed instead of 404 Not Found — clients checking for 404 on these paths should update their error handling.
- A request missing the model field now raises 'Missing model field in request' consistently across all model routes (chat/completions, completions, embeddings, responses, rerank) — clients relying on the previous inconsistent error messages will need to update their parsers.
- Form-encoded requests with invalid field types (for example, a non-numeric temperature on a transcription endpoint) now return 400 Bad Request instead of 500 Internal Server Error — clients catching 500 for malformed form data will not see the error.
- Streaming responses include a cancel token that stops the server from sending data after a TCP disconnect — clients that depended on the server continuing to flush buffered data after a disconnect will see the stream terminate early.

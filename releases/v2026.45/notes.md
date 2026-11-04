## Headline

- The Lemonade desktop app and web ui are completely redesigned with built-in tools, an all-new model manager, a visual router policy editor, Chinese localization, mobile web ui, an LLM telemetry viewer, and much more.
- Watch a deep dive of the new GUI here: https://youtu.be/mg2PqmRujMo
- The HTTP server is rebuilt on a route-class architecture with consistent errors and generated API docs.
- New models: K2-Horizon family (0.9B to MoVA-36B-A4B) and Flint.

## Breaking Changes

- GET requests to POST-only paths (`slots/{id}`, `jobs/{id}/pause`, `jobs/{id}/interrupt`, `jobs/{id}/resume`, `models/register`) return 405 instead of 404.
- A request without a `model` field returns the same error, "Missing model field in request", on every model route (`chat/completions`, `completions`, `embeddings`, `responses`, `rerank`).
- Form-encoded requests with invalid field types (for example, a non-numeric `temperature` on transcription) return 400 instead of 500.

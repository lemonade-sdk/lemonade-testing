## Headline

- The Lemonade app is redesigned with six workspaces, a visual router policy editor, Chinese localization, and multi-provider model search.
- The HTTP server is rebuilt on a route-class architecture with consistent errors and generated API docs.
- New models: K2-Horizon family (0.9B to MoVA-36B-A4B), Flint, and LFM2.5-24B-A2B.
- Models that previously failed to load on 128 GB Strix Halo systems now start reliably with improved shared-memory management.
- Model and backend update progress is visible directly in the app with server-owned sync jobs.

## Breaking Changes

- GET requests to POST-only paths (`slots/{id}`, `jobs/{id}/pause`, `jobs/{id}/interrupt`, `jobs/{id}/resume`, `models/register`) return 405 instead of 404.
- A request without a `model` field returns the same error, "Missing model field in request", on every model route (`chat/completions`, `completions`, `embeddings`, `responses`, `rerank`).
- Form-encoded requests with invalid field types (for example, a non-numeric `temperature` on transcription) return 400 instead of 500.

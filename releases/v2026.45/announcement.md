## Lemonade v2026.45.3

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

@everyone v2026.45 is out: the Lemonade app gets a complete redesign with six workspaces and multi-provider model search, five new models land in the registry, 128 GB Strix Halo systems finally stop choking on big models, and update progress is visible right in the app.

### Breaking Changes

- `GET /v1/models/{model}/options` can now return `null` for `resolved_ctx_size` when automatic context sizing has nothing valid to give — clients that assumed an integer will need to handle `null`.
- Hitting POST-only paths with `GET` (like `slots/{id}` or `models/register`) now returns 405 instead of 404 — update any clients that depended on the 404.
- A request missing the `model` field now raises `"Missing model field in request"` consistently across every route (chat, completions, embeddings, responses, rerank), so the old inconsistent messages are gone.
- Form-encoded requests with invalid field types (e.g. a non-numeric temperature on transcription) return 400 instead of 500 — catch 400 for this case now.
- Streaming responses carry a cancel token that stops the server from sending after a TCP disconnect.

### The Lemonade app, redesigned from scratch

`@meghsat` rebuilt the entire app as six workspaces — Chat, Models, Backends, Apps, Monitor, Settings — with multi-provider model search, a visual router policy editor, Chinese localization, and a whole lot of polish along the way.

### Five new models for K2-Horizon and Flint

`@ramkrishna2910` added five K2-Horizon GGUF models (0.9B, 3.7B, 7B, 32B, and MoVA-36B-A4B) and `@sawansri` added Flint-GGUF to the registry.

### Strix Halo 128 GB models actually start now

`@jeremyfowers` fixed the shared-memory calculation so models like `gpt-oss-120b`, `Qwen3-Next-80B`, and `Qwen3-Coder-Next` load reliably on 128 GB Strix Halo systems — no more failing to start.

### See update progress right in the app

`@fl0rianr` replaced per-model pulls with server-owned sync jobs, so model and backend updates show progress directly in the app with a compact indicator in the model pill.

### Additional Improvements

- `@fl0rianr` fixed telemetry to emit `null` instead of `0.0` for unmeasured timing fields, preventing upstream gauges from poisoning `Prometheus`.
- `@meghsat` added the GRG-Halo GPU device name so it's recognized instead of reported as unsupported.
- `@fl0rianr` added a compact progress indicator for backend installs and model downloads during chat preparation, and unified ROCm backend job IDs.
- `@fl0rianr` fixed API key persistence in the browser, made chat history persistence enabled by default, and added an Update button to the model detail panel.
- `@fl0rianr` added automated contrast checks across five primary views and fixed two WCAG AA violations in light mode.
- `@ramkrishna2910` fixed `*_bin` override examples in the docs to show full executable paths, and `@ramkrishs` distinguished closed connections from server-not-running in the CLI.

Grab v2026.45.3 from [GitHub Releases](https://github.com/lemonade-sdk/lemonade/releases) — I'll save a longer write-up for the blog, but tell me in #general what you think of the new look!

## Lemonade v2026.45.0

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

@everyone v2026.45 is out: a fully rewritten GUI3 with six workspaces and a visual router editor, several new models across chat, coding, and reasoning, the HTTP server refactored into a route-class architecture, and the model manager rebuilt for reliability.

### Breaking Changes

- `resolved_ctx_size` returned by `GET /v1/models/{model}/options` can now be `null` instead of a number when automatic GPU sizing can't fit a valid context window — update your clients to handle the null case gracefully.
- GET requests to previously-404 POST-only paths (`slots/{id}`, `jobs/{id}/pause|interrupt|resume`, `models/register`) now return 405 Method Not Allowed — clients checking for 404 on these endpoints will need to update their error handling.
- A request missing the model field now raises `Missing model field in request` consistently across every model route (chat/completions, completions, embeddings, responses, rerank) — parsers relying on the previous inconsistent error messages will need a refresh.
- Form-encoded requests with invalid field types (e.g. a non-numeric temperature on a transcription endpoint) now return 400 Bad Request instead of 500 — clients catching 500 for malformed form data will not see the error anymore.
- Streaming responses include a cancel token that stops the server from sending data after a TCP disconnect — clients depending on the server continuing to flush buffered data after a disconnect will see the stream terminate early.

### 🖥️ GUI3: six workspaces, visual router, Chinese

`@meghsat` merged a full rewrite of the desktop client — six workspaces (Chat, Models, Backends, Apps, Monitor, Settings), a model manager with multi-provider search, a visual router policy editor, and Chinese localization (`zh-CN`). Thanks to `@kpoineal` for the Chinese localization, and `@fl0hrnr` for the browser key persistence fix, accessibility improvements, and a bunch of polish along the way.

### 📦 New models: GPT-OSS 20B MXFP4, Qwen3-Coder 32B, K2-Horizon family, and more

`@lucbruni-amd`, `@fl0hrnr`, `@ramkrishna2910`, `@sawansri`, and `@jeremyfowers` added GPT-OSS 20B MXFP4, Qwen3-Coder 32B, five K2-Horizon models (0.9B through MoVA-36B-A4B), Flint, and LFM2.5-24B-A2B to the catalog — grab them all with `lemonade pull`.

### 🔀 HTTP server refactored into route-class architecture

`@jeremyfowers` rebuilt the HTTP server with a route-class structure, drift-protected generated API docs, and a new `GET /internal/routes` inspection endpoint. Every route now has formalized arguments, errors, descriptions, and examples in schema-driven classes — with `@fl0hrnr` helping to keep it all in shape.

### 🔐 Model manager rebuilt for reliability

`@bitgamma` refactored the model manager with a lock-free store snapshot, checkpoint status tracking (`checkpoint_status[]` with `include_paths`), and a new `/internal/model-sources` endpoint for external consumers. Thanks to `@fl0hrnr` for the review.

### Additional Improvements

- `@meghsat` fixed model deletion so it no longer leaves orphaned files on disk.
- `@sreeram-11` stopped Hugging Face rate limits from failing model pulls — returns a 503 with Retry-After headers instead.
- `@fl0hrnr` fixed a v2026.44 regression on 128 GB Strix Halo where GPT-OSS and Qwen3 models refused to load by correcting the iGPU shared-memory cap.
- `@fl0hrnr` preserved the composer model when Whisper/Moonshine ASR models load and enabled microphone dictation in non-chat modes.
- `@ramkrishs` improved CLI error messages to distinguish a closed connection from a server that is not running.
- `@bitgamma` added auto-install for `lemonade bench` backends and more actionable error messages when no backend is found.

Grab v2026.45.0 from [GitHub Releases](https://github.com/lemonade-sdk/lemonade/releases) and let me know what you think — I'm in #general if anything feels off!

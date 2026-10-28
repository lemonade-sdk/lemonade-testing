## Lemonade v2026.45.2

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

@everyone v2026.45.2 is here: GUI3 has landed as a full rewrite, auto-tuned context sizing got a runtime memory budget, several new models join the catalog, and the desktop app remembers your API key again.

### Breaking Changes

- `GET /v1/models/{model}/options` now returns `null` for `resolved_ctx_size` when automatic GPU sizing can't fit a valid context window — clients that expect an integer should handle the null case.
- GET on POST-only paths (`/slots/{id}`, `/jobs/{id}/pause|interrupt|resume`, `/models/register`) now returns 405 instead of 404 — if you were using 404 as a "not found" signal, update your error handling.
- A request missing the model field now raises `Missing model field in request` consistently across every route (chat, completions, embeddings, responses, rerank) — if your error handling depended on route-specific messages, adjust accordingly.
- Form-encoded requests with invalid field types return 400 instead of 500 — clients that expect 500 for malformed input should update their error handling.
- Streaming responses now carry a cancel token so the server stops sending after a TCP disconnect — implement token-based cancellation for abandoned streams.

### 🖥️ GUI3, the full desktop rewrite

`@meghsat` (with `@kpoineal`) shipped a complete desktop and web client overhauling the entire interface: six workspaces (Chat, Models, Backends, Apps, Monitor, Settings), model search across providers, a visual router policy editor, and Chinese localization.

### 🧠 Auto-tuned context sizing with a runtime memory budget

`@fl0hrnr` taught the tuner to reserve runtime buffer memory for discrete and unified-memory GPUs, and when automatic sizing can't fit a valid context, `resolved_ctx_size` now returns null instead of guessing. A 128 GB Strix Halo fix also restored loading for gpt-oss-120b and Qwen3-Next-80B.

### 📦 Model catalog expands

`@sawansri` added LFM2.5-24B-A2B-GGUF and Flint-GGUF, `@ramkrishna2910` (with `@mvillmow`) added five K2-Horizon GGUF models, `@meghsat` added GRG-Halo GPU support, and `@lucbruni-amd` fixed the gpt-oss-20b-MXFP4 loader to stop picking up stale draft files.

### 💾 Chat history and API key persistence restored

`@fl0hrnr` (with `@bitgamma`) made browser chat history the default and brought back API key persistence for both browser and native clients — your keys are remembered again, and the remembered checkbox actually remembers.

### Additional Improvements

- `@meghsat` fixed model deletion so it no longer leaves orphaned files on disk.
- `@sreeram-11` stopped Hugging Face rate limits from failing model pulls by returning 503 with Retry-After headers instead.
- `@sreeram-11` re-enabled the sd-cpp ROCm backend on Windows with a full HIP runtime DLL bundle so model streaming on AMD integrated GPUs works.
- `@sawansri` added `--mcp`, `--no-mcp`, and `--codemode` flags to `lemonade launch pi` for per-model context windows, image input, and tool-calling.
- `@bernardogv` fixed `*_bin` directory resolution so pointing the config at a directory actually works as documented.
- `@bernardogv` documented the systemd `ProtectHome=yes` restriction on `.deb`/`.rpm` packages with a drop-in solution.
- `@jeremyfowers` and `@fl0hrnr` rewrote the HTTP server into a route-class architecture with generated API docs and drift checking.

Grab v2026.45.2 from [GitHub Releases](https://github.com/lemonade-sdk/lemonade/releases) — let me know in #general what you're thinking!

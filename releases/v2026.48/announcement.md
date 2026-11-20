## Lemonade v2026.48.3

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

@everyone v2026.48.3 is out: https://github.com/lemonade-sdk/lemonade/releases/tag/v2026.48.3

You can pass images and audio through to backends, non-LLM models get rejected before they load, the SSE error line is back, and FLM v1.0.13 brings AMD-signed Windows binaries with working embeddings.

### Breaking Changes

- `/api/chat` now returns HTTP 400 for image generation models instead of 500 — you won't see a server error when you ask a chat model to make pictures.
- `/api/chat` and `/api/generate` now return HTTP 400 for embedding and reranking models instead of 500 — no more silent hangs, just a clean rejection.
- TheNoise shared backend is updated from v0.12.1 to v0.15.0, which may change inference behavior or memory layout for existing models.
- `GET /pull/variants` now returns HTTP 400 instead of 500 when a repository has no supported model files or an invalid or oversized collection manifest — so you can spot bad searches at a glance.

### 🖼️ Images and audio, one conversation

`sreeram-11` added the `images` parameter to `/api/generate` (base64-encoded images and WAV audio passed through as one-message chat) and `audio` capability reporting to `/api/show` for llama.cpp models with the `chat-transcription` label, plus `speech` for TTS models and `decision` for SystemOne decision models.

### ✋ Non-LLM models rejected before they load

`sreeram-11` made `/api/chat` and `/api/generate` return a 400 error when asked to use a non-LLM model, instead of loading it and failing. The image generation capability is now reported on `/api/show`, and upscaling models are correctly excluded from image generation.

### 📡 SSE streams now end with an error line

`sreeram-11` fixed `/api/chat` and `/api/generate` so a backend error — like a prompt exceeding context size — ends the stream with an `{"error": "..."}` line and no `done` line, matching Ollama's own behavior. No more silent empty successes.

### 🔤 FLM v1.0.13 with embeddings support

`@zaneni6` bumped the FastFlowLM NPU backend to v1.0.13 with AMD-signed Windows binaries, and thanks `@iswaryaalex` the embeddings endpoint now works through the OpenAI-compatible API — use `GET /v1/embeddings` with FLM embedding models and get results back.

### 🎨 Three new image models on TheNoise

`@bitgamma` updated TheNoise to v0.15.0 and added MOSS-Image-SFT-8-Steps, MOSS-Image-Base-8-Steps, and H3-Image-INT8 with 8-step euler defaults.

### Additional Improvements

- `@itomek` moved the WebSocket API key from the URL query string to the Sec-WebSocket-Protocol header.
- `@sreeram-11` made the Ollama `/api/show` endpoint resolve model aliases and prevented name collisions with `:latest` aliases.
- `@meghsat` fixed autotune context size on AMD iGPU and NPU on Windows by reading memory from DXGI instead of WMI.
- `@fl0rianr` added a docs-only PR gate that skips expensive CI jobs for small Markdown-only PRs.
- `@sreeram-11` and `@jeremyfowers` improved maintainer workflow tools and Windows signing infrastructure.

Check v2026.48.3 on GitHub Releases — try the images and audio params and let me know what you build!

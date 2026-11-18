## Lemonade v2026.48.0

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

@everyone v2026.48 is out: https://github.com/lemonade-sdk/lemonade/releases/tag/v2026.48.0

You can now pass images and audio through `/api/generate`, get speech and decision capabilities from `/api/show`, and non-LLM models are rejected upfront with a clean error instead of a silent fail.

### Breaking Changes

- `/api/chat` and `/api/generate` return 400 instead of 500 for non-LLM models — clients that match on 500 to detect invalid model types will get a different status code.
- TheNoise upgraded to v0.15.0 — existing image generation models run with the new backend and may produce different output or fail.

### 🖼️ Images, audio, speech, and decisions in multi-modal conversations

`@sreeram-11` added the `images` parameter to `/api/generate` so you can pass base64-encoded images and WAV audio through to the backend as a one-message chat. They also added `speech` capability reporting for TTS models, `decision` capability reporting for SystemOne decision models, and `audio` for llama.cpp models with the `chat-transcription` label on `/api/show`. Thanks `@fl0rianr` for adding TheNoise as a custom image model recipe in the GUI so you can work with standalone pixel upscalers too.

### ✅ Non-LLM models rejected before they even load

`@sreeram-11` made `/api/chat` and `/api/generate` reject non-LLM models upfront with a clean 400 instead of loading and failing, and fixed SSE streams so backend errors — like prompts exceeding context size — end with a single error line instead of silently returning empty success.

### 🎨 TheNoise v0.15.0 with new image models

`@bitgamma` bumped TheNoise from v0.12.1 to v0.15.0, bringing three new image generation models — MOSS-Image-SFT-8-Steps, MOSS-Image-Base-8-Steps, and H3-Image-INT8 — and `@fl0rianr` added GUI recipe support for the upgrade.

### Additional Improvements

- `@itomek` moved the API key out of WebSocket connect URLs and into the `Sec-WebSocket-Protocol` header for a cleaner security story.
- `@meghsat` fixed autotune falling back to 4k context size on AMD iGPU and NPU on Windows by reading memory from DXGI instead of WMI.
- `@sreeram-11` resolved model aliases in `/api/show` so they match what you expect.
- `@apollo-2006` changed `/pull/variants` to return 400 instead of 500 when a repository has no supported files, giving you a clearer error on bad searches.

Check v2026.48.0 on GitHub Releases — I can't wait to see what you build with images and audio in chat!

## Headline

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

- Benchmark results can now be submitted from `lemonade bench` to the public leaderboard with a single `--submit` flag, and a claim link lets others verify your setup.
- New classification and decision-model capabilities: zero-shot text classification via `POST /v1/classify` with a `labels` parameter, and SystemOne decision models for typed, image-based, or score-based questions.
- Image generation expands to CUDA on Linux x86_64 and older NVIDIA GPUs (Pascal/Volta), with TheNoise models now accepting custom fractional upscale factors.
- Container backends for AMD Strix Halo grow to five variants — including DS4 with speculative decoding, ROCm FP4, Halogen Flash, Gufo, and a community llama.cpp fork — bringing new model families to the platform.

## Breaking Changes

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

- `image_defaults` and `audio_defaults` are no longer returned in the `/models` API response; their values are now nested under `recipe_options`, so clients reading the old keys will find them absent.
- A new `user_configurable` boolean flag on backend descriptor options may expose technical knobs such as `soft_pixel_cap`, `pcm_sample_rate`, and `pcm_channels` to users — filter on this flag to hide internal settings.
- FLM v1.0.11 returns `max_tokens` exactly as requested rather than `max_tokens+1`, so chat completions that relied on the extra token will now stop one token early.
- FLM v1.0.11 streams token usage counts only when `stream_options.include_usage` is set; without it, the `/api/v1/stats` endpoint records no token counts or throughput for FLM streams.
- FLM v1.0.11 returns 400 for previously-accepted invalid fields including invalid `tool_choice`, forced tool calls on small Qwen3 models (up to 1.7B), conversation history on `*-flash` models, and requests with no messages or prompt.

## Headline

- Container backends are now supported! Learn more: https://youtu.be/zfFuFRdyWgg
- Adds the Halogen container backend and 5 containers from Strix Halo Toolboxes: Gufo, strix-llama.cpp, nathanw, rocmfpx, and DwarfStar4.
- Benchmark results can now be submitted from `lemonade bench` to the public leaderboard with a single `--submit` flag, and a claim link lets others verify your setup.
- New classification and decision-model capabilities: zero-shot text classification via `POST /v1/classify` with a `labels` parameter, and SystemOne decision models for typed, image-based, or score-based questions.
- CUDA support added to TheNoise image generation engine.

## Breaking Changes

- The native backend for DwarfStar4 has been replaced by the container backend. 
- `image_defaults` and `audio_defaults` are no longer returned in the `/models` API response; their values are now nested under `recipe_options`, so clients reading the old keys will find them absent.
- A new `user_configurable` boolean flag on backend descriptor options may expose technical knobs such as `soft_pixel_cap`, `pcm_sample_rate`, and `pcm_channels` to users — filter on this flag to hide internal settings.
- FLM v1.0.11 returns `max_tokens` exactly as requested rather than `max_tokens+1`, so chat completions that relied on the extra token will now stop one token early.
- FLM v1.0.11 streams token usage counts only when `stream_options.include_usage` is set; without it, the `/api/v1/stats` endpoint records no token counts or throughput for FLM streams.
- FLM v1.0.11 returns 400 for previously-accepted invalid fields including invalid `tool_choice`, forced tool calls on small Qwen3 models (up to 1.7B), conversation history on `*-flash` models, and requests with no messages or prompt.

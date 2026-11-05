## Headline

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

- Benchmark results can be submitted directly from `lemonade bench` and shared via claim link at https://bench.lemonade-server.ai.
- Zero-shot classification is available via `POST /v1/classify` with a `labels` parameter, and as a `zero_shot` condition type in router policies.
- TheNoise image generation gains a CUDA backend for Linux x86_64 alongside existing ROCm support.
- New container backends for AMD Strix Halo (gfx1151) — including `ds4:rocm`, `rocmfpx:rocm`, `gufo:rocm`, and `llamacpp:halobox` — bring GPU-accelerated inference to the platform.
- `POST /v1/systemone` forwards typed questions to a decision model, with support for router-classified choices and SystemOne zero-shot classification.

## Breaking Changes

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

- The `/models` API response no longer includes `image_defaults` or `audio_defaults`; their values are now under `recipe_options`, so external clients reading the old fields will find them absent.
- The `/models` response includes a `user_configurable` boolean flag on backend descriptor options; consumers that assumed all listed options are editable may show technical knobs like `soft_pixel_cap`, `pcm_sample_rate`, and `pcm_channels` to users.
- FLM v1.0.11 (bumped from v1.0.7) returns `max_tokens` exactly as requested rather than `max_tokens+1`, so chat completions that relied on the extra token will now stop one token early.
- FLM v1.0.11 streams token usage counts only when `stream_options.include_usage` is set; without it the server's `/api/v1/stats` endpoint records no token counts or throughput for FLM streams.
- FLM v1.0.11 returns 400 for previously-accepted invalid fields including invalid `tool_choice`, forced tool calls on small Qwen3 models (up to 1.7B), conversation history on *-flash models, and requests with no messages or prompt.

## Lemonade v2026.46.2

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

@everyone v2026.46.2 is out: Gufo, Halogen, strix-llama.cpp, nathanw, rocmfpx and DwarfStar4 join Lemonade as container backends! You can now submit benchmark results to the public leaderboard with a single `--submit` flag, new classification and decision-model endpoints are live, and TheNoise adds CUDA support.

### Breaking Changes

- The native backend for DwarfStar4 has been replaced by the container backend. 
- **`/models` no longer returns `image_defaults` or `audio_defaults`** — those values are now nested under `recipe_options`, so clients reading the old keys will find them absent.
- **Backend descriptor options now carry a `user_configurable` flag** — filter on it to hide technical knobs like `soft_pixel_cap`, `pcm_sample_rate`, and `pcm_channels` from users.
- **FLM v1.0.11 returns `max_tokens` exactly as requested** — no more `max_tokens+1`, so chat completions that relied on the extra token will now stop one token early.
- **FLM v1.0.11 streams token usage counts only when `stream_options.include_usage` is set** — without it, `/api/v1/stats` records no token counts or throughput for FLM streams.
- **FLM v1.0.11 returns 400 for previously-accepted invalid fields** — invalid `tool_choice`, forced tool calls on small Qwen3 models (up to 1.7B), conversation history on `*-flash` models, and requests with no messages or prompt are all rejected now.

### 🐳 Six new AMD Strix Halo container backends

`@jeremyfowers` `@sawansri` `@superm1` `@iswaryaalex` `@abn` `@Geramy` `@kyuz0` `@wenis` `@francescobozzo` `@Nathanw1014` `@pwilkin` `@LaurentZuijdwijk` shipped six new container backends for AMD Strix Halo: Gufo, Halogen, strix-llama.cpp, nathanw, rocmfpx and DwarfStar4.

> Note: support for container backends on Windows, Lemonade's docker, and Snap are planned for the future.

### 📊 Benchmark leaderboard submission

`@bitgamma` added `--submit` and `--submit-file` flags to `lemonade bench` so you can push results to the public leaderboard and get a claim link for others to verify your setup. Thanks `@iswaryaalex` for adding ROCm version tracking to the benchmark data so AMD runners are properly represented.

### 🏷️ Classification and decision models

`@meghsat` added zero-shot text classification via `POST /v1/classify` with a `labels` parameter — just pass the labels and let Lemonade sort it out. `@meghsat` also introduced SystemOne decision models on `POST /v1/systemone`, so you can send typed or image-based questions to a llama.cpp decision model and get back structured answers. Both show up as new router classifier types for your policy engine.

### 💥 CUDA image generation on Linux + older NVIDIA GPUs

`@fl0rianr` brought TheNoise CUDA backend to Linux x86_64 alongside the existing ROCm support, and `@pwilkin` added a CUDA 12 variant for older NVIDIA Pascal and Volta GPUs — so those cards can now generate images too. TheNoise models also accept a custom fractional `upscale_factor` on `POST /v1/images/upscale`, letting you dial in exactly how much you want to scale.

### Additional Improvements

- `@fl0rianr` made the web app accept `?q=` prompts from the Firefox chatbot sidebar, starting a new chat with the prompt text and disabling MCP tool execution for external prompts.
- `@fl0rianr` added missing `cuda_args`, `rocm_args`, and `vulkan_args` configuration keys for llama.cpp CUDA and whisper.cpp ROCm/Vulkan backends.
- `@fl0rianr` fixed vertical misalignment of the chat model picker and toolbar toggle.
- `@jeremyfowers` revamped model downloads to explicitly list every checkpoint file, fixing interrupted-folder detection for ACE-Step, ThinkSound, and OpenMOSS.
- `@mike2307` fixed custom model loading in the web app to honor `ctx_size` from `recipe_options.json` instead of unconditionally overwriting it.
- `@meghsat` fixed model load banner state across model switches — the loading indicator now persists correctly and buttons release after failed operations.
- `@meghsat` made disabling "Save chat history in this browser" stop saving new messages while keeping previously saved sessions alive, and added cross-tab deletion safety with retry UI.
- `@Zorro-Zhang` made pulling built-in Suggested models from the configured `modelsource` (for example, modelscope) instead of always defaulting to Hugging Face.
- `@kenvandine` expanded the llama.cpp CI validation to ARM64 (DGX Spark) and RTX 5070 runners, including sm_121 (GB10) support.
- `@jeremyfowers` added a weekly CI workflow that validates container backend image tags and opens pin PRs automatically.

Check out v2026.46.2 on [GitHub Releases](https://github.com/lemonade-sdk/lemonade/releases/tag/v2026.46.2) and fire up `lemonade bench --submit` — I'd love to see where your setup lands!

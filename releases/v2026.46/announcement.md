## Lemonade v2026.46.2 🚀 🚀

@everyone v2026.46.2 is out: https://github.com/lemonade-sdk/lemonade/releases/tag/v2026.46.2

Gufo, Halogen, strix-llama.cpp, nathanw, rocmfpx and DwarfStar4 join Lemonade as container backends! You can now submit benchmark results to the public leaderboard with a single `--submit` flag, new classification and decision-model endpoints are live, and TheNoise adds CUDA support.

### Breaking Changes

- The native backend for DwarfStar4 has been replaced by the container backend. 
- **`/models` no longer returns `image_defaults` or `audio_defaults`** — those values are now nested under `recipe_options`, so clients reading the old keys will find them absent.
- **Backend descriptor options now carry a `user_configurable` flag** — filter on it to hide technical knobs like `soft_pixel_cap`, `pcm_sample_rate`, and `pcm_channels` from users.
- **FLM v1.0.11 returns `max_tokens` exactly as requested** — no more `max_tokens+1`, so chat completions that relied on the extra token will now stop one token early.
- **FLM v1.0.11 streams token usage counts only when `stream_options.include_usage` is set** — without it, `/api/v1/stats` records no token counts or throughput for FLM streams.
- **FLM v1.0.11 returns 400 for previously-accepted invalid fields** — invalid `tool_choice`, forced tool calls on small Qwen3 models (up to 1.7B), conversation history on `*-flash` models, and requests with no messages or prompt are all rejected now.

### 🐳 Six new AMD Strix Halo container backends

`@jeremyfowers` `@sawansri` `@superm1` `@iswaryaalex` `@abn` `@Geramy` `@kyuz0` `@wenis` `@francescobozzo` `@Nathanw1014` `@pwilkin` `@LaurentZuijdwijk` shipped six new container backends for AMD Strix Halo: Gufo, Halogen, strix-llama.cpp, nathanw, rocmfpx and DwarfStar4.

Learn more on YouTube: https://youtu.be/zfFuFRdyWgg

### 📊 Benchmark leaderboard submission

`@bitgamma` added `--submit` and `--submit-file` flags to `lemonade bench` so you can push results to the public leaderboard and get a claim link for others to verify your setup. Thanks `@iswaryaalex` for adding ROCm version tracking to the benchmark data so AMD runners are properly represented.

### 🏷️ Classification and decision models

`@meghsat` dropped SystemOne decision models (`POST /v1/systemone`) and zero-shot text classification (`POST /v1/classify`) — now running across CPU, GPU, and NPU. D3 decision models run on Ryzen AI NPU via FLM v1.0.11. Both show up as new router classifier types for your policy engine.

### 💥 CUDA image generation on Linux + older NVIDIA GPUs

`@fl0rianr` brought TheNoise CUDA backend to Linux x86_64 alongside the existing ROCm support, and `@pwilkin` added a CUDA 12 variant for older NVIDIA Pascal and Volta GPUs — so those cards can now generate images too. TheNoise models also accept a custom fractional `upscale_factor` on `POST /v1/images/upscale`, letting you dial in exactly how much you want to scale.

### Additional Improvements

- `@fl0rianr` made the web app accept `?q=` prompts from the Firefox chatbot sidebar.
- `@fl0rianr` added missing `cuda_args`, `rocm_args`, and `vulkan_args` configuration keys.
- `@fl0rianr` fixed vertical misalignment of the chat model picker and toolbar toggle.
- `@jeremyfowers` revamped model downloads to explicitly list every checkpoint file, fixing interrupted-folder detection for ACE-Step, ThinkSound, and OpenMOSS.
- `@mike2307` fixed custom model loading to honor `ctx_size` from `recipe_options.json`.
- `@meghsat` fixed model load banner state across model switches.
- `@meghsat` made disabling "Save chat history" keep previously saved sessions alive.
- `@Zorro-Zhang` made Suggested model pulls use the configured `modelsource`.
- `@kenvandine` expanded llama.cpp CI validation to ARM64 (DGX Spark) and RTX 5070, including sm_121 (GB10) support.
- `@jeremyfowers` added a weekly CI workflow that validates container backend image tags.

Check out v2026.46.2 on GitHub Releases and fire up `lemonade bench --submit` — I'd love to see where your setup lands!

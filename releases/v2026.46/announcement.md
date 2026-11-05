## Lemonade v2026.46.1

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

@everyone v2026.46 is out: AMD Strix Halo gets its first wave of container backends, thenoise gains a CUDA backend on Linux, and you can now submit benchmark results right from `lemonade bench`.

### Breaking Changes

- `image_defaults` and `audio_defaults` have been removed from the `/models` API response and folded into `recipe_options` — clients reading those old fields will need to look under `recipe_options` now.
- `/models` adds a `user_configurable` boolean flag to backend descriptor options; consumers that assumed every listed option was editable may surface technical knobs like `soft_pixel_cap`, `pcm_sample_rate`, or `pcm_channels` to users.
- FLM v1.0.11 (up from v1.0.7) returns `max_tokens` exactly as requested instead of `max_tokens+1` — chat completions that relied on that extra token will now stop one token earlier.
- FLM v1.0.11 only streams token usage counts when `stream_options.include_usage` is set; without it, the `/api/v1/stats` endpoint records no token counts or throughput for FLM streams.
- FLM v1.0.11 returns 400 for previously-accepted invalid fields: invalid `tool_choice`, forced tool calls on small Qwen3 models (up to 1.7B), conversation history on `*-flash` models, and requests with no messages or prompt.

### 🏁 Benchmark submission from `lemonade bench`

`@bitgamma` added `--submit` and `--submit-file` flags so you can upload benchmark results to the Lemonade benchmark server and get back a claim link to share with the community. `@iswaryaalex` added ROCm version tracking to benchmark data so everyone can see what backend versions powered your results.

### 🔮 Zero-shot classification

`@meghsat` added zero-shot classification as a `POST /v1/classify` endpoint accepting a `labels` parameter, and as a `zero_shot` classifier type in router policies — classify text without training a model.

### 🎨 TheNoise image generation gets CUDA on Linux

`@fl0rianr` brought TheNoise to Linux x86_64 with a CUDA backend alongside existing ROCm support — NVIDIA GPU users on Linux can now generate images too.

### 💥 AMD Strix Halo container backends

`@jeremyfowers` with help from `@sawansri` and `@wenis` brought four container backends to AMD Strix Halo (gfx1151): `ds4:rocm` with GPU-aware memory planning for speculative decoding, `rocmfpx:rocm` with three FP4-quantized models, `gufo:rocm` with Qwen3.8 and DeepSeek variants using advanced decoding, and `llamacpp:halobox` running the community halo-box fork.

### 🔮 SystemOne decision models

`@meghsat` added `POST /v1/systemone` to forward typed questions to a decision model for router-classified choices, and wired up FastFlowLM 1.0.11 to the NPU for SystemOne and zero-shot classification — `@iswaryaalex` reviewed it all.

### Additional Improvements

- `@fl0rianr` added missing config keys: `cuda_args`, `rocm_args`, and `vulkan_args` for llama.cpp CUDA and whisper.cpp ROCm/Vulkan.
- `@meghsat` fixed five GUI3 load-banner bugs, and the "save chat history" toggle now gracefully retains saved conversations on page refresh with cross-tab deletion safety.
- `@mike2307` fixed custom model loading so it respects the saved `ctx_size` from `recipe_options.json` instead of overwriting it.
- `@Zorro-Zhang` made `lemonade pull` on built-in Suggested models respect `LEMONADE_DEFAULTS_PATH`'s `modelscope` setting.
- `@pwilkin` bumped TRELLIS and ACE-Step versions, and added a `trellis.cuda12` backend variant for older NVIDIA GPUs.
- `@fl0rianr` added optional `upscale_factor` to `POST /v1/images/upscale` for TheNoise models.
- `@jeremyfowers` fixed model downloads for ACE-Step and ThinkSound checkpoint selection.
- `@fl0rianr` fixed the chat model picker and toolbar toggle vertical alignment in GUI3.
- Firefox chatbot sidebar prompts (`?q=`) now auto-start a chat with the prompt text.
- `@jeremyfowers` and `@kenvandine` added self-hosted CI runners for llama.cpp and a weekly workflow to keep container image pins fresh.

Grab v2026.46.1 from [GitHub Releases](https://github.com/lemonade-sdk/lemonade/releases) and tell me in #general what you think!

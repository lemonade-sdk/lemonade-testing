## Lemonade v2026.46.0

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

@everyone v2026.46 is out: AMD Strix Halo is getting serious power with five new container backends, SystemOne brings typed questions to decision models, zero-shot classification lands on the API, and TheNoise gets a CUDA backend for Linux.

### Breaking Changes

- The `/models` API no longer returns `image_defaults` or `audio_defaults` — those values now live under `recipe_options`, so any clients reading the old fields will find them absent.
- `/models` responses now include a `user_configurable` boolean on each backend option, which means you might spot technical knobs like `soft_pixel_cap`, `pcm_sample_rate`, and `pcm_channels` that weren't meant for users.

### 🖥️ AMD Strix Halo container backends

`@jeremyfowers` (with `@sawansri`) packed five new container backends for AMD Strix Halo — `llamacpp:halobox`, `ds4:rocm` with DSpark speculative decoding, `gufo:rocm` with DFlash2, `rocmfpx:rocm` for quantized models, and `halogen:rocm` for Flash Next. Each one ships pre-configured for the gfx1151 GPU. Try `lemonade pull` to grab any of the new Strix Halo models.

### 🎯 SystemOne decision models

`@meghsat` added `POST /v1/systemone` for typed questions — send a structured question and get a decision back from a llama.cpp model. There's also a `systemone` router classifier type for your policies, so you can route based on model decisions alongside everything else.

### 🔍 Zero-shot classification

`@meghsat` also brought zero-shot classification to `POST /v1/classify` with a new `labels` parameter and a `zero_shot` classifier condition for router policies. Pass any set of labels and let the model figure out the rest — no fine-tuning required.

### 🎨 TheNoise CUDA backend for Linux

`@fl0rianr` added a CUDA backend for TheNoise on Linux x86_64, so NVIDIA GPU users can now generate images alongside the existing ROCm support.

### Additional Improvements

- `@bitgamma` added `--submit` and `--submit-file` flags to `lemonade bench` for uploading results to the benchmark leaderboard, and `@iswaryaalex` added ROCm version tracking to benchmark entries.
- `@Zorro-Zhang` fixed Suggested model pulls when `default_model_source=modelscope` is set, so they download from your configured source instead of always hitting Hugging Face.
- `@fl0rianr` added `cuda_args`, `rocm_args`, and `vulkan_args` config keys for llama.cpp and whisper.cpp backends, and made TheNoise's upscale endpoint accept a custom `upscale_factor` parameter.
- `@meghsat` made disabling "save chat history" stop saving new messages while keeping old conversations, fixed five GUI3 load-banner bugs, and added Firefox sidebar prompt support.
- `@mike2307` restored saved `ctx_size` for custom models loaded from the web app.
- `@pwilkin` bumped TRELLIS to v0.8.1 and added a CUDA 12 variant for NVIDIA Pascal/Volta GPUs, with thanks to `@jeremyfowers`.
- `@kenvandine` added CUDA validation for llama.cpp on ARM64 DGX Spark and RTX 5070 runners.

You can grab v2026.46.0 from [GitHub Releases](https://github.com/lemonade-sdk/lemonade/releases) — we'd love to hear what you make with all this new stuff!

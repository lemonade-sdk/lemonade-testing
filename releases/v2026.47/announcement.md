## Lemonade v2026.47.0

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

@everyone v2026.47 is out: five new AMD Strix Halo container backends, TheNoise on NVIDIA GPUs, decision models with GGUF zero-shot classifiers, and `lemonade bench` submissions to the online leaderboard — plus a handful of fixes and quality-of-life improvements.

### Breaking Changes

- The `/models` API no longer returns `image_defaults` or `audio_defaults` — those values live under `recipe_options` now, so clients reading the old keys won't find them.
- Router residency conflicts return HTTP 409 (`router_residency_conflict`) instead of 400, so error handlers expecting 400 need updating.
- Router policy labels are strictly validated now (unique, non-blank, no control characters) — a policy with invalid labels won't load at startup and all requests return 500, so re-save or edit policies to use valid labels.
- The `enable_containers` config key is gone; if you read or set it you'll hit an unknown config key error, so remove it from your configuration.
- FLM chat behavior changed: `max_tokens` returns exactly the requested count (one fewer than before), streamed usage is opt-in via `stream_options.include_usage`, and invalid requests that were silently ignored now return 400 — adjust clients that depend on the old lenient behavior.
- The `/files` endpoint for a multi-shard GGUF model in `extra_models_dir` now returns one entry per shard instead of one summary entry, so clients iterating the response and expecting a single main-file entry may need updating.

### 🐳 Five new AMD Strix Halo container backends

`@jeremyfowers` and `@sawansri` added the nathanw, DwarfStar4, rocmfpx, halogen, and halobox container backends for AMD Strix Halo (gfx1151). `@superm1` added gfx1170 and gfx1171 ROCm support, and `@jeremyfowers` set up a weekly CI workflow that keeps container image pins up to date. Try them with `lemonade pull`.

### 🖼️ TheNoise CUDA backend on Linux x86_64

`@fl0rianr` brought TheNoise CUDA support to Linux x86_64 alongside the existing ROCm backend, and `@pwilkin` added a CUDA 12 variant for older NVIDIA Pascal and Volta GPUs. `@pwilkin` also added an optional `upscale_factor` parameter to `POST /v1/images/upscale` for TheNoise models, letting you dial in exactly how much to scale.

### 🧠 SystemOne decision models and GGUF zero-shot classifiers

`@meghsat` added SystemOne decision models on `POST /v1/systemone` for typed and image-based questions, GGUF-based zero-shot classifiers on `POST /v1/classify` that run the encoder inside llama-server on GPU, and FastFlowLM 1.0.11 d3 decision model support on the NPU. `@AaronStGeorge` enabled automatic MTP speculative decoding for HRX models, and `@meghsat` added the Qwen3.5-35B-A3B-HRX model with the MTP label.

### 📊 Benchmark leaderboard submissions

`@bitgamma` added `--submit` and `--submit-file` flags to `lemonade bench` so you can push results to the public leaderboard at bench.lemonade-server.ai and get a claim link for others to verify your setup. `@iswaryaalex` added ROCm version tracking to the benchmark data so AMD runners are properly represented.

### Additional Improvements

- `@fl0rianr` made the web app accept `?q=` prompts from the Firefox chatbot sidebar, starting a new chat and disabling MCP tool execution for external prompts.
- `@fl0rianr` added a multi-GPU monitor to the GUI for 2–4 GPUs, conversation-scoped image references for multi-image editing, and a download button on generated images.
- `@bitgamma` added a `user_configurable` flag to backend descriptor options so the GUI can hide technical knobs like `soft_pixel_cap` and `pcm_sample_rate`.
- `@danielholanda` added description, author, license, and project metadata to every backend and replaced the single-column backends catalog with a dynamic multi-column grid.
- `@mike2307` made custom model loading honor `ctx_size` from `recipe_options.json` instead of unconditionally overwriting it.
- `@Zorro-Zhang` made pulling built-in Suggested models from the configured `modelsource` (for example, modelscope) instead of always defaulting to Hugging Face.
- `@meghsat` fixed GUI model load banner state across model switches, made disabling "Save chat history" stop saving new messages while keeping old sessions alive, and restored CPU usage display on the macOS Monitor page.
- `@jeremyfowers` fixed interrupted-folder detection for ACE-Step, ThinkSound, and OpenMOSS by listing every checkpoint file explicitly in the server model manifest.
- `@fl0rianr` fixed vertical misalignment of the chat model picker and toolbar toggle.
- `@MrAnayDongre` improved the CLI 401 error message to mention `--api-key`, and added a helpful footer to every subcommand's `--help`.
- `@DigitalFlow` added OpenSUSE package name alternatives to RPM runtime dependencies, `@festeraeb` fixed UDP beacon parsing for hostnames with special characters, and `@julianxhokaxhiu` fixed MSVC 2026 build failures.
- `@sreeram-11` eliminated network dependencies from Ollama and Whisper tests, improved test shutdown cleanup logging, and replaced fixed sleeps with retry loops in the DirectoryWatcher test.

Grab v2026.47.0 over on [GitHub Releases](https://github.com/lemonade-sdk/lemonade/releases/tag/v2026.47.0) and drop your feedback in #general!

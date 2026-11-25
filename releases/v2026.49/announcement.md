## Lemonade v2026.49.0

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

@everyone v2026.49 is out: MCP tools now let external clients manage models, health, and audio directly; video generation lands in both stable-diffusion.cpp and TheNoise; AMD HRX gets an experimental Loom backend; and cost metadata is preserved through routing.

### Breaking Changes

- The `--backend cpu` and `--backend hybrid` flags are gone — use `--backend npu` instead.
- All CPU and hybrid model IDs (for example, Llama-3.2-1B-Instruct-CPU) have been removed; use the new NPU IDs (for example, Llama-3.2-1B-Instruct-NPU).
- Checkpoint paths changed from `onnx-ryzenai` format to `*_rai_1.9.0_npu`.
- `POST /v1/responses` with a `collection.router` and `previous_response_id`, `conversation`, or `item_reference` now returns 400 instead of routing to a candidate.
- `previous_response_id` is marked `Support::Partial` since llama.cpp and router collections reject it.
- On Windows, `gufo:rocm` switches from a containerized backend bound to `0.0.0.0` to a native backend bound to `127.0.0.1`, removing external network access.
- Models registered, pulled, loaded, or patched through the REST API with backend argument keys (`llamacpp_args`, `whispercpp_args`, `merge_args`) now require the admin API key; the regular API key returns 403.
- The ModelManager C++ API: `download_model()`, `register_model()`, `register_user_model()`, and `replace_options()` now require an `allow_backend_args` parameter.
- For OpenMOSS models, a non-empty `voice` field now triggers voice design (Generate reference sample) instead of acting as a style instruction; existing clients sending `voice=default` will see unexpected voice design behavior.
- stable-diffusion.cpp now explicitly rejects `output_format=mp4`; use the TheNoise backend for MP4 output.
- Loom model bundles cached before this release that lack a Quick start record in `info.json` will fail to load, even if they worked before.
- The `kDefaultDevice` constant and `BundlePlan::preset` field were removed from the Loom public API.

### 🤖 MCP tools control Lemonade externally

`@fl0rianr` and `@Bekhouche` brought a full suite of MCP tools — model info, load/unload, pull, delete, system health, backend info, audio generation, and live web search — so external clients can manage Lemonade directly. Thanks `@jeremyfowers` for server health, system info, and web search!

### 🎬 Video generation via stable-diffusion.cpp and TheNoise

`@Bekhouche` added video generation through stable-diffusion.cpp with Wan2.1-T2V-1.3B, and `@fl0rianr` brought TheNoise video support with the Wan 2.2 family and LTX 2.5 — both with cooperative cancel and WebM/MP4 output. Thanks `@SlawomirNowaczyk` for the initial design.

### 🧪 Experimental Loom backend for AMD HRX

`@danielholanda` brought in the Loom backend (`loom` recipe) with support for Strix Halo and Radeon AI PRO R9700, over 50 catalog models, and a `format=loom` registry search. Thanks `@superm1` and `@jeremyfowers` for the help.

### 💰 Cost metadata and auto model registry

`@Bekhouche` made cost metadata survive POST /models/register and appear in routing decisions, and `@jeremyfowers` added `auto` for `default_model_source` so the server probes Hugging Face and ModelScope at startup and picks whichever responds.

### Additional Improvements

- `@fl0rianr` added GPU device selection for TheNoise, sd.cpp, Trellis, ThinkSound, ACE-Step, OpenMOSS, and llamacpp backends.
- `@sawansri` added a `lora` checkpoint role to llama.cpp so a model can list a GGUF LoRA adapter alongside `main`.
- `@meghsat` optimized /v1/classify from 4 to 1-2 /tokenize calls by caching per-label token results.
- `@iswaryaalex` fixed extra_models_dir update checks and added a ModelScope mirror for backend binaries.
- `@anishp55` made `lemonade launch` print env vars and a launch command when the agent CLI is missing.
- `@jeremyfowers` added huggingface_token() that falls back from env var to file paths like huggingface_hub.
- `@pwilkin` added image generations, audio speech, and audio generations to the job engine.
- `@fl0rianr` added a ContextMeter token usage ring to the Chat composer.
- `@iswaryaalex` filtered out RDP indirect display adapters from the AMD GPU monitor.
- `@fl0rianr` fixed vertical misalignment of the chat model picker.
- `@vjanelle` fixed the Backend args textarea dropping spaces while typing in Gufo.

Check v2026.49.0 on GitHub Releases — I'd love to see what you build with MCP tools and video generation! https://github.com/lemonade-sdk/lemonade/releases

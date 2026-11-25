## Headline

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

- MCP tools now expose model management, server health, audio generation, and live web search so external clients can control Lemonade directly.
- Video generation is available through both the stable-diffusion.cpp and TheNoise backends with Wan2.1 and Wan 2.2 family models.
- The experimental Loom backend for AMD HRX chips brings Strix Halo and Radeon AI PRO R9700 support with new model entries and GUI integration.
- Cost metadata is preserved through API model registration and routing, and the server auto-selects its model registry at startup.

## Breaking Changes

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

- The `--backend cpu` and `--backend hybrid` options are no longer supported; pass `--backend npu` instead.
- All CPU and hybrid model IDs (e.g., Llama-3.2-1B-Instruct-CPU) were removed; use the new NPU model IDs (e.g., Llama-3.2-1B-Instruct-NPU).
- Checkpoint paths changed from onnx-ryzenai format to `*_rai_1.9.0_npu` format.
- POST /v1/responses with a collection.router and previous_response_id, conversation, or item_reference now returns 400 instead of routing to a candidate.
- The previous_response_id argument is now marked as Support::Partial because llama.cpp rejects it and router collections also reject it.
- On Windows, gufo:rocm switches from a containerized backend bound to 0.0.0.0 to a native backend bound to 127.0.0.1, removing external network access.
- Models registered, pulled, loaded, or having options patched or deleted through the REST API with backend argument keys (llamacpp_args, whispercpp_args, merge_args) now require the admin API key; the regular API key returns 403.
- The ModelManager C++ API changes: download_model(), register_model(), register_user_model(), and replace_options() now require an allow_backend_args parameter.
- For OpenMOSS models, a non-empty voice field now triggers voice design (Generate reference sample) instead of being used as a style instruction; existing clients sending voice=default will see unexpected voice design behavior.
- stable-diffusion.cpp backend now explicitly rejects output_format=mp4; use the TheNoise backend for MP4 output.
- Loom model bundles cached before this release that lack a Quick start record in info.json will fail to load, even if they worked before.
- The kDefaultDevice constant and BundlePlan::preset field were removed from the Loom public API.

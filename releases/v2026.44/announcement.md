## Lemonade v2026.44.1

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

@everyone v2026.44 is out: model loading on iGPU/APU systems is back, the stable diffusion ROCm backend works on Windows again, deleted models are properly cleaned up, and the new LFM2.5-24B model joins the server registry.

### Breaking Changes

- The `/v1/models/{model}/options` endpoint's `resolved_ctx_size` field can now return `null` when automatic GPU sizing can't fit a valid context — clients should handle that gracefully instead of expecting a number.

### 🖥️ Model loading on shared-memory systems fixed

`@jeremyfowers` fixed the context-size auto-tune to use total physical RAM instead of RAM-in-use for the iGPU/APU pool cap, so you can now load larger models on shared-memory systems without them getting stuck.

### 💾 Stable diffusion ROCm backend restored on Windows

`@sreeram-11` re-enabled the sd-cpp ROCm backend on Windows by staging the full HIP runtime DLLs, so you're back to GPU acceleration instead of silently falling back to CPU.

### 🗑️ Deleted models remove their files

`@meghsat` fixed model deletion so the files actually get removed from disk instead of leaving orphaned checkpoints behind.

### 🆕 LFM2.5-24B-A2B-GGUF in the registry

`@sawansri` added the LFM2.5-24B-A2B-GGUF model to the server model registry with chat, reasoning, and tool-calling labels — about 14.9 GB.

### Additional Improvements

- `@sreeram-11` stopped Hugging Face rate limits from failing model pulls, now returning 503 with Retry-After headers instead.
- `@sreeram-11` tightened the CI matrix to reduce GitHub Actions runner handoffs.
- `@QuTosh` added 176 model-backed conformance test cases across L0a, L2, and L3 tiers, with thanks to `@fl0rianr`.
- `@iswaryaalex` added the halo-box-strix backend fork to the benchmark regression CI.
- `@bernardogv` documented the systemd ProtectHome=yes restriction on extra_models_dir when used under /home.
- `@sawansri` added `--mcp`, `--no-mcp`, and `--codemode` flags to `lemonade launch pi`.
- `@bernardogv` fixed `*_bin` config patterns pointing at directories so they resolve correctly.
- `@jeremyfowers` published the auto-opt vision blog post and added a news-publishing workflow.

Grab v2026.44.1 from [GitHub Releases](https://github.com/lemonade-sdk/lemonade/releases) and tell me what you think!

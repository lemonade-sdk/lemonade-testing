## Headline

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

- New container backends for AMD Strix Halo — DS4, FP4, Halogen Flash, Gufo, and llama.cpp — let you run more models on the platform.
- TheNoise image backend now runs on NVIDIA GPUs for Linux x86_64 alongside ROCm.
- SystemOne decision models and GGUF-based zero-shot classifiers add new routing and decision-making capabilities.
- `lemonade bench` can submit results to the online leaderboard at bench.lemonade-server.ai.

## Breaking Changes

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

- The `/models` API response no longer includes `image_defaults` or `audio_defaults` keys; their values are now under `recipe_options` — clients reading those fields must update their read path.
- Router residency conflicts now return HTTP 409 (`router_residency_conflict`) instead of HTTP 400 — error handlers expecting 400 will need updating.
- Router policy labels are now strictly validated (unique, non-blank, no control characters); a saved policy with invalid labels will fail to load at startup and all requests return 500 — re-save or edit the policy to use valid labels.
- The `enable_containers` config key was removed; any user or script that reads or sets it will encounter an unknown config key — remove it from your configuration.
- FLM chat behavior changed: `max_tokens` now returns the exact requested count (one fewer than before), streamed usage is opt-in via `stream_options.include_usage`, and invalid requests that were silently ignored now get HTTP 400 — adjust clients that depend on the old lenient behavior.
- The `/files` endpoint for a multi-shard GGUF model in extra_models_dir now returns one entry per shard instead of one summary entry — clients iterating the response and expecting a single main-file entry may need updating.

## Headline

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

- AMD Strix Halo gets dedicated container backends for llama.cpp, ds4, gufo, rocmfpx, and halogen models.
- SystemOne decision models accept typed questions via POST /v1/systemone, with a new router classifier type.
- Zero-shot classification arrives at POST /v1/classify with a `labels` parameter and zero-shot classifier condition.
- TheNoise image generation gains a CUDA backend for Linux x86_64 alongside existing ROCm support.

## Breaking Changes

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

- The /models response no longer includes `image_defaults` or `audio_defaults` keys; their values moved under `recipe_options`, so external clients reading the old fields will find them absent.
- The /models response now includes a `user_configurable` boolean flag on backend descriptor options; consumers that assumed all listed options are editable may show technical knobs like `soft_pixel_cap`, `pcm_sample_rate`, and `pcm_channels` to users.

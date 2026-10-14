## Headline

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

- Multi-reference image editing now accepts one or more reference images with automatic dimension sizing, preserving original image bytes without re-encoding.
- TheNoise image backend moves from Experimental to Core tier for supported AMD GPUs on Linux and Windows.
- Live inference tracking reports active request count and estimated tokens per second on GET /v1/stats.
- Prefill throughput (TTFT-based prompt tokens per second) added to the `lemonade bench` table and JSON output.

## Breaking Changes

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

- GET /api/v1/system-stats now reports gpu_percent and vram_gb for the primary GPU by total memory instead of the most utilized GPU — on multi-GPU systems the values change and existing dashboards or alerting that depends on these fields will see different numbers.
- Guest-tier models are now hidden from GET /v1/models?show_all=true and return model_not_supported on pull until the guest backend is installed — setups that relied on the model being visible without installing the backend will see them disappear.

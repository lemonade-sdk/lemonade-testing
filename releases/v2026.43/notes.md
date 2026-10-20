## Headline

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

- TheNoise image backend promoted to Core tier for ROCm on AMD GPUs across Linux and Windows.
- Image editing now accepts multiple reference images with automatic size selection and lossless passthrough.
- Live inference metrics added to GET /v1/stats, showing active requests and estimated tokens per second.
- AMD GPU utilization and VRAM telemetry now reported on Windows alongside NVIDIA in system-stats.

## Breaking Changes

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

- GET /api/v1/system-stats now reports gpu_percent and vram_gb for the primary GPU by total memory instead of the GPU with the highest utilization — on multi-GPU systems these fields will show different values, requiring updates to dashboards and alerting rules.
- Models gated behind a guest-tier backend are now hidden from GET /v1/models?show_all=true and return model_not_supported on pull until the guest backend is installed — existing setups relying on those models being visible will no longer see them.

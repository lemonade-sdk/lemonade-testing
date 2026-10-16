## Headline

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

- `GET /api/v1/system-stats` selects the primary GPU by total memory instead of highest utilization, with NVIDIA GPU utilization and VRAM reporting, so the numbers match what you expect on multi-GPU systems.
- Image editing now accepts one or more reference images with auto-selected output dimensions and a configurable soft pixel cap.
- Live inference throughput is now available on `GET /v1/stats` as `live.active_requests` and `live.estimated_tokens_per_second`.
- `lemonade bench` shows prefill throughput (PP t/s) in table output and `--json`, with `--compare` mode tracking PP change.

## Breaking Changes

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

- `GET /api/v1/system-stats` now reports the primary GPU by total memory instead of the GPU with highest utilization, so dashboard values and alerting thresholds may change on multi-GPU systems.
- Models gated behind a guest-tier backend are now hidden from `GET /v1/models?show_all=true` and return `model_not_supported` on pull until the guest backend is installed.

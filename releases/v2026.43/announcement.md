## Lemonade v2026.43.3

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

@everyone v2026.43.3 is out: the thenoise image backend lands on AMD GPUs across Linux and Windows, image editing now accepts multiple reference images, live inference metrics show up on `/v1/stats`, and AMD GPU telemetry joins NVIDIA on Windows.

### Breaking Changes

- `GET /api/v1/system-stats` reports `gpu_percent` and `vram_gb` for the primary GPU by total memory instead of the GPU with the highest utilization — on multi-GPU setups the numbers will change, so update your dashboards and alerting rules accordingly.
- Models gated behind a guest-tier backend are now hidden from `GET /v1/models?show_all=true` and return `model_not_supported` on pull until you install the guest backend — if your setup relied on those models being visible without the backend, they'll disappear now.

### 💥 thenoise on AMD GPUs

`@bitgamma` promoted the thenoise image backend to Core tier for ROCm on AMD GPUs (Linux and Windows), so AMD users can now generate and edit images alongside everyone else.

### 🎨 Multiple reference images for editing

`@fl0rianr` taught the edit endpoint to accept multiple reference images with automatic size selection and lossless passthrough — the output dimensions come from the first reference with a 4 MP soft cap, and images flow through TheNoise and SD CPP backends without re-encoding.

### 📊 Live inference metrics on `/v1/stats`

`@fl0rianr` added live inference throughput tracking to `/v1/stats`, surfacing `live.active_requests` and `live.estimated_tokens_per_second` so you can see what's happening in real time.

### 🖥️ AMD GPU telemetry on Windows

`@iswaryaalex` added AMD GPU utilization and VRAM reporting on Windows, bringing parity with the NVIDIA data already available through `/system-stats`.

### Additional Improvements

- `@sreeram-11` bumped ROCm backend version pins: TheRock to 10.1.0, llama.cpp ROCm to b11580, and sd-cpp to master-957-90e86d1.
- `@bitgamma` added a `PP t/s` (prefill throughput) column to `lemonade bench`, including JSON keys and `--compare` percentage tracking.
- `@superm1` rolled back the FLM NPU backend to v1.0.7 to fix a regression where FLM fails to launch under systemd.
- `@joshuacox` added the missing "Start the service" step to the Arch Linux install page.

Grab v2026.43.3 from [GitHub Releases](https://github.com/lemonade-sdk/lemonade/releases) and let me know in #general if anything doesn't look right!

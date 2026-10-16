## Lemonade v2026.43.1

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

@everyone v2026.43.1 is out with multi-GPU stats that finally make sense, image editing with reference images, live inference throughput tracking, and prefill throughput in the bench tool — plus thenoise is now a Core backend for AMD GPUs.

### Breaking Changes

- `GET /api/v1/system-stats` now reports `gpu_percent` and `vram_gb` for the primary GPU (the one with the most total memory) instead of the GPU with the highest utilization — if you're on a multi-GPU setup your dashboards and alerting thresholds may need updating.
- Models gated behind a guest-tier backend are now hidden from `GET /v1/models?show_all=true` and return `model_not_supported` on pull until the guest backend is installed — setups that relied on seeing those models without the backend will no longer work.

### 📊 Multi-GPU stats that make sense

`@fl0rianr` rewrote the primary GPU selection to pick by total memory instead of highest utilization and added NVIDIA GPU utilization and VRAM reporting — on multi-GPU systems the numbers now match what you'd expect. Thanks to @kenvandine and @superm1 for the help.

### 🖼️ Image editing with reference images

`@fl0rianr` extended the image editing endpoint to accept one or more reference images, auto-selecting output dimensions from the first one with a soft 4 MP cap. A new Qwen-Image-2.1-Turbo-INT8 recipe is also available in thenoise.

### 📈 Live inference throughput at a glance

`@fl0rianr` added live inference throughput tracking to `GET /v1/stats`, so you can see `live.active_requests` and `live.estimated_tokens_per_second` — you can't optimize what you can't measure.

### ⚡ Prefill throughput in `lemonade bench`

`@bitgamma` added prefill throughput (`PP t/s`) to the bench output — a new `PP t/s` column in table mode, `pp_tps` stats in `--json`, and `PP change` percentage tracking in `--compare` mode.

### Additional Improvements

- `@bitgamma` promoted TheNoise from Experimental to Core for ROCm on AMD GPUs.
- `@sreeram-11` bumped TheRock to 10.1.0, updated llama.cpp ROCm-stable to b11580, and updated stable-diffusion.cpp to master-957-90e86d1.
- `@zaneni6` bumped the FastFlowLM NPU backend from v1.0.7 to v1.0.9.
- `@fl0rianr` fixed a bug where incomplete GGUF shard families would appear as spurious duplicate models.
- `@jeremyfowers` fixed the distro defaults path so `lemond` reads `defaults.json` relative to its install prefix on Linux.
- `@joshuacox` added the missing "Start the service" step to the Arch Linux install guide.

Head over to [GitHub Releases](https://github.com/lemonade-sdk/lemonade/releases) for the full changelog — happy to hear how this version treats your setup!

## Lemonade v2026.43.0

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

@everyone v2026.43 is out: you can now drop one or more reference images into the edit endpoint and get consistent output sizes, thenoise graduates to core on AMD, live inference stats are back, and `lemonade bench` finally measures prefill throughput too.

### Breaking Changes

- `GET /api/v1/system-stats` reports `gpu_percent` and `vram_gb` for the primary GPU (the one with the most total memory) instead of the most utilised GPU — on multi-GPU systems dashboards and alerts that depend on those fields will see different numbers.
- Guest-tier models are now hidden from `GET /v1/models?show_all=true` and return `model_not_supported` on pull until the guest backend is installed — if your setup relied on seeing these models before installing the backend they will disappear.

### 🖼️ Multi-reference image editing

`@fl0rianr` extended the image edit endpoint to accept one or more reference images — output dimensions are picked automatically from the first reference with a 4 MP soft cap, and original image bytes are preserved without re-encoding. A new `soft_pixel_cap` model setting lets you tune that cap, and thenoise 0.10.1 adds the Qwen-Image-2.1-Turbo-INT8 recipe.

### 🎨 thenoise joins the core tier

`@bitgamma` promoted thenoise from Experimental to Core for ROCm on AMD GPUs (gfx103X, gfx110X, gfx1150, gfx1151, gfx1152, gfx120X) on both Linux and Windows. If your card is on that list it's ready for everyday use.

### 📊 Live inference tracking returns

`@fl0rianr` added live inference tracking to the stats endpoint — `GET /v1/stats` now reports `live.active_requests` and `live.estimated_tokens_per_second` by counting output deltas across all SSE event types, so you can see what your server is doing right now.

### ⚡ Prefill throughput on `lemonade bench`

`@bitgamma` added a `PP t/s` (prompt tokens per second, TTFT-based) column to the bench table, corresponding `pp_tps` keys to `--json` output, and a `PP change` percentage in `--compare` mode, so you can measure whether your prompt changes are actually speeding things up.

### Additional Improvements

- `@jeremyfowers` and `@fl0rianr` labelled every backend with a tier (core, experimental, guest) and format — the CLI backends table and `/system-info` now show this metadata, and guest-tier models are gated behind their backends.
- `@fl0rianr` fixed spurious duplicate GGUF entries when shard families were incomplete.
- `@fl0rianr` fixed config defaults to read from the install prefix rather than a hardcoded path.
- `@jeremyfowers` refactored the server process abstraction for cleaner backend lifecycle management, and added an auto-pull test to the test suite.
- `@sreeram-11` bumped ROCm, llamacpp, and sd-cpp to their latest versions.
- `@zaneni6` bumped the FLM NPU backend to v1.0.8.
- `@joshuacox` added the missing systemd service step to the Arch Linux install page.

Grab the new release over on [GitHub Releases](https://github.com/lemonade-sdk/lemonade/releases) — I'd love to hear what you build with it!

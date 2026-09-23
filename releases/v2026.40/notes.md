## Headline

- Streaming models now run on AMD integrated GPUs by sizing against the APU GTT pool instead of the fixed VRAM carve-out, enabling model streaming on hardware previously unsupported.
- Junie by JetBrains is a new launch agent available via `lemonade launch junie`, with profile generation and integration documentation.
- Cloud provider context window and completion token limits are now parsed from model metadata and surfaced on `GET /v1/models`.
- AMD GPU entries in `GET /api/v1/system-info` show a marketing name (e.g. "AMD Radeon RX 9070 XT (gfx1201)") instead of a raw numeric code.

## Breaking Changes

- The POST /v1/images/upscale endpoint requires the 'upscaling' model label; models without it return a 400 error — label your model 'upscaling' to use the endpoint.
- OpenMOSS backend 'rocm' and 'rocm_bin' removed on Windows and Linux because ROCm builds run ~40x slower than Vulkan on the same hardware — use `backend: vulkan` or `backend: cuda` instead.
- sd-cpp ROCm removed on Windows where the backend ran at CPU speed without any acceleration — switch to `backend: vulkan` or `backend: auto`.
- AMD GPU entries in `GET /api/v1/system-info` now show a marketing name instead of a raw numeric code — parse the `family` field for the ISA code.
- Editing `user_models.json` no longer takes effect without a restart of `lemond`; the restart requirement was always implied and is now documented.

## Headline

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

- Two new Ornith 1.5 models (9B and 35B-A3B) join the server catalog with vision, chat, coding, reasoning, and tool-calling capabilities.
- `lemonade launch junie` adds JetBrains' Junie as a new launch agent for automated model workflows.
- AMD GPU names in `/api/v1/system-info` now return human-readable marketing names (e.g., `AMD Radeon RX 9070 XT`) instead of raw numeric codes.
- Streaming models are now supported on AMD integrated GPUs via an improved server memory filter that accounts for the APU GTT pool.
- Cloud provider model metadata now exposes context window and completion token limits on the `/v1/models` API response.

## Breaking Changes

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

- ROCm backend removed from OpenMOSS on Linux; set backend to `vulkan` or `cuda` instead.
- ROCm backend removed from sd-cpp on Windows; set backend to `vulkan` or `auto` instead.
- The POST /v1/images/upscale endpoint now requires the `upscaling` model label; models without it are rejected with a 400 error.
- The /api/v1/system-info API returns AMD GPU names in marketing form (e.g., `AMD Radeon RX 9070 XT (gfx1201)`) instead of raw numeric codes; consumers that parse the name field for numeric versions need to adapt.
- The release tagging tool no longer accepts --no-sign; omit the flag (now the default) or use --sign for signed tags.

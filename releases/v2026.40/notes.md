## Headline

- Streaming models now run on AMD integrated GPUs by sizing against the APU GTT pool instead of the fixed VRAM carve-out, enabling model streaming on hardware previously unsupported.
- Junie by JetBrains is a new launch agent available via `lemonade launch junie`, with profile generation and integration documentation.
- Cloud provider context window and completion token limits are now parsed from model metadata and surfaced on `GET /v1/models`.
- AMD GPU entries in `GET /api/v1/system-info` show a marketing name (e.g. "AMD Radeon RX 9070 XT (gfx1201)") instead of a raw numeric code.

## Breaking Changes

- 'openmoss:rocm' and `sd-cpp:rocm` temporarily removed while we work on a couple of bugs.

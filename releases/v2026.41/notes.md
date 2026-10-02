## Headline

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

- lemonade-tray supports natively spawning and supervising a local `lemond` via `--spawn-server` with a pipe-EOF watchdog, removing the need for manual daemon management.
- Non-streaming requests no longer hang indefinitely when a client disconnects mid-request; the server now detects dropped connections and aborts upstream transfers.
- Five Kokoro TTS voices (bf_emma, bf_isabella, bm_george, bm_lewis, ff_siwis) no longer return a fixed ~0.3s of audio regardless of input text, after an upgrade to backend version b21.

## Breaking Changes

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

- The ROCm backend for OpenMOSS on Linux has been removed; set backend to `vulkan` or `cuda` instead.
- The ROCm backend for sd-cpp on Windows has been removed; set backend to `vulkan` or `auto` instead.
- The `POST /v1/images/upscale` endpoint now requires the `upscaling` model label; models without it are rejected with a 400 error.
- The `/api/v1/system-info` API returns AMD GPU names in marketing form (e.g. `AMD Radeon RX 9070 XT (gfx1201)`) instead of raw numeric codes; consumers that parse the name field for numeric versions need to adapt.
- The release tagging tool no longer accepts `--no-sign`; omit the flag (now the default) or use `--sign` for signed tags.

## Lemonade v2026.41.0

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

@everyone a good one this week: lemonade-tray can now manage the daemon for you, five Kokoro TTS voices that were stuck on 0.3 seconds of audio are singing again, and your connections won't hang around waiting for clients that already left. Plus some ROCm cleanup.

### Breaking Changes

- The ROCm backend for OpenMOSS on Linux is gone; use `vulkan` or `cuda` instead.
- The ROCm backend for sd-cpp on Windows is gone; use `vulkan` or `auto` instead.
- `POST /v1/images/upscale` now requires the `upscaling` model label — models without it get a 400.
- `/api/v1/system-info` returns AMD GPU names in marketing form now (e.g. `AMD Radeon RX 9070 XT (gfx1201)`) instead of raw numeric codes — adapt if you parse that field.
- The release tagging tool dropped `--no-sign`; leave it off (it's the default) or use `--sign` to get signed tags.

### 🍋 Tray manages your daemon with `--spawn-server`

`@abn` added `--spawn-server` to lemonade-tray so you can let the tray app natively spawn and supervise `lemond` on POSIX, complete with a pipe-EOF watchdog. No more babysitting the daemon yourself.

### 🎙️ Five Kokoro TTS voices are fixed

`@bitgamma` upgraded the Kokoro backend to b21, and four British English voices (bf_emma, bf_isabella, bm_george, bm_lewis) plus one French voice (ff_siwis) are back from the dead — they were returning a fixed ~0.3s of audio regardless of your input text, and now they actually speak.

### ⚡ Dropped connections no longer hang your requests

`@abn` wired connection-liveness checks through the entire request pipeline, so when a client disconnects mid-request the server detects it and aborts upstream transfers to backends. No more indefinite hangs.

### Additional Improvements

- `@pwilkin` (thanks `@sreeram-11`) replaced deprecated `--no-mmap` / `--mmap` / `--mlock` / `--direct-io` with `--load-mode` across all Lemonade documentation examples and test fixtures.
- `@jeremyfowers` added a Windows RAM filter for `qwen3.6-moe-35b-a3b-FLM` on systems with less than 64 GB RAM.
- `@ramkrishna2910` fixed broken README links that were returning 404 on the pre-release website.
- `@superm1`, `@abn`, and `@jeremyfowers` kept the docs in shape — config paths, link policies, and the release guide all got attention.

Full release notes are live on [GitHub Releases](https://github.com/lemonade-sdk/lemonade/releases) — drop me a note in #general if something feels off!

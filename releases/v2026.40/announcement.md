## Lemonade v2026.40

@everyone this week we're getting AMD integrated GPUs into the streaming party, a new launch agent from JetBrains, cloud provider metadata on the models endpoint, and some important cleanup.

### Breaking Changes

- `POST /v1/images/upscale` now requires the `upscaling` model label — models without it return a 400. Label your model `upscaling` to use the endpoint.
- OpenMOSS `rocm` and `rocm_bin` backends have been removed on Windows and Linux — they ran ~40× slower than Vulkan. Use `backend: vulkan` or `backend: cuda` instead.
- sd-cpp ROCm removed on Windows where it ran at CPU speed with no acceleration — switch to `backend: vulkan` or `backend: auto`.
- AMD GPU entries in `GET /api/v1/system-info` now show a marketing name (e.g. "AMD Radeon RX 9070 XT (gfx1201)") instead of a raw numeric code — parse the `family` field for the ISA code.
- Editing `user_models.json` no longer takes effect without a restart of `lemond` — the restart requirement was always implied and is now documented.

### 🖥️ Streaming on AMD integrated GPUs

`@bong-water-water-bong` sized streaming models against the APU GTT pool instead of the fixed VRAM carve-out, which means streaming now works on AMD integrated GPUs that previously couldn't make the cut.

### 🤖 Junie by JetBrains is here

`@mashan555` added Junie as a supported launch agent — just run `lemonade launch junie` and it'll handle profile generation, integration docs, and everything in between.

### ☁️ Context window and token limits on /v1/models

`@abn` parses context window and completion token limits from cloud provider model metadata and surfaces them on the `GET /v1/models` response, so you can see the real limits your provider enforces.

### Additional Improvements

- `@fl0rianr` refactored the MCP tools onto a declarative registry that co-locates name, description, schema, and handler — plus the MCP tool reference is now generated from a live `tools/list` response.
- `@fl0rianr` and I cleaned up the platform install pages and link checking so everything actually leads somewhere.
- `@superm1` added an upgrade-test job and a new systemd-emulation composite action to CI to catch PPA upgrade regressions.
- `@zaneni6` bumped the FastFlowLM NPU backend to v1.0.6.
- `@noamsto` added two new Ornith 1.5 model entries (9B and 35B-A3B GGUF) with vision, chat, coding, reasoning, and tool-calling labels.
- `@bitgamma` helped design the upscaling capability interface behind the scenes.
- `@fl0rianr` updated cpp-httplib to v0.51.0 for Arch Linux compatibility.

Full release notes are live on [GitHub Releases](https://github.com/lemonade-sdk/lemonade/releases) — ping me in #general if anything feels off!

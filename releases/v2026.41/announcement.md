## Lemonade v2026.41.0

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

@everyone we've got streaming on AMD APUs, a brand-new launch agent from JetBrains, cloud provider model metadata, and two new Ornith 1.5 models ready to go.

### Breaking Changes

- OpenMOSS on Linux no longer supports the ROCm backend; switch your config to `vulkan` or `cuda`.
- sd-cpp on Windows no longer supports the ROCm backend; switch to `vulkan` or `auto`.
- `POST /v1/images/upscale` now requires the `upscaling` model label — models without it will return a 400 error.
- `/api/v1/system-info` now returns AMD GPU names in marketing form (e.g. `AMD Radeon RX 9070 XT (gfx1201)`) instead of raw numeric codes — if you parse the name field for numeric versions, you'll need to adapt.
- The release tagging tool no longer accepts `--no-sign`; omit the flag (it's the default now) or use `--sign` for signed tags.

### 🖥️ Streaming on AMD integrated GPUs

`@bong-water-water-bong` sized streaming models against the APU GTT pool instead of the fixed VRAM carve-out, which means streaming now works on AMD integrated GPUs that previously couldn't make the cut.

### 🦜 Two new Ornith 1.5 models

`@noamsto` added the 9B GGUF and 35B-A3B GGUF Ornith 1.5 models — both sporting vision, chat, coding, reasoning, and tool-calling labels.

### 🤖 Junie by JetBrains is here

`@mashan555` added Junie as a supported launch agent — just run `lemonade launch junie` and it'll handle profile generation, integration docs, and everything in between.

### ☁️ Context window and token limits on /v1/models

`@abn` parses context window and completion token limits from cloud provider model metadata and surfaces them on the `GET /v1/models` response, so you can see the real limits your provider enforces.

### Additional Improvements

- `@abn` fixed non-streaming requests hanging indefinitely when a client disconnects mid-request, propagating connection-liveness checks through the entire pipeline.
- `@apollo-2006` swapped raw numeric codes for human-readable marketing names from libdrm on the system-info endpoint — `AMD Radeon RX 9070 XT (gfx1201)`, not some inscrutable number.
- `@jeremyfowers` added a Windows-specific RAM filter for qwen3.6-moe-35b-a3b-FLM on systems with less than 64 GB RAM.
- `@fl0rianr` refactored the MCP tools onto a declarative registry that co-locates name, description, schema, and handler, and generated the tool reference from a live `tools/list` response.
- `@fl0rianr` and I cleaned up the platform install pages and link checking so everything actually leads somewhere.
- `@fl0rianr` updated cpp-httplib to v0.51.0 for Arch Linux compatibility.
- `@superm1` added an upgrade-test job and a new systemd-emulation composite action to CI to catch PPA upgrade regressions.
- `@Copilot` with `@superm1` fixed the release tagging tool to default to unsigned annotated tags, eliminating the ambiguous git error when signing isn't configured.
- `@RaulMermans` tightened backend config validation to reject unknown variant keys instead of silently accepting them.
- `@bitgamma` bumped the Kokoro TTS backend to b21, fixing four British English and one French voice that returned fixed-length audio instead of actual synthesis.
- `@zaneni6` bumped the FastFlowLM NPU backend to v1.0.6.
- `@superm1` added the missing macOS user config path (`~/.config/lemonade`) to the config docs.
- `@jeremyfowers` added a spec-writing guide for the team.

Full release notes are live on [GitHub Releases](https://github.com/lemonade-sdk/lemonade/releases) — check them out and let me know what you think!

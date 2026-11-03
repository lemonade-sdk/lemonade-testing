## Lemonade v2026.45.3

@everyone v2026.45 is out: a completely redesigned Lemonade app, a rebuilt HTTP server and Model Manager, seven new models, and big models finally loading on 128 GB Strix Halo.

### The Lemonade app, redesigned from scratch

The new app has six workspaces (Chat, Models, Backends, Apps, Monitor, Settings), multi-provider model search, a visual router policy editor, and Chinese translation. This was a true community effort: `@kpoineal`, `@fl0rianr`, `@meghsat`, `@jeremyfowers`, `@abn`, `@falabellamichael`, `@pwilkin`, `@sofiageo`, `@danielholanda`, `@apollo-2006`, `@popey`, `@siavashhub`, and `@boclifton-MSFT` all built it.

### Rebuilt HTTP server and Model Manager

`@jeremyfowers` rebuilt the HTTP server around route classes, with consistent errors and generated API docs. `@bitgamma` refactored the Model Manager for reliability. `GET /v1/models` now reports `checkpoint_status` and `update_available`.

### Seven new models

`@ramkrishna2910` added the K2-Horizon family (0.9B, 3.7B, 7B, 32B, and MoVA-36B-A4B). `@sawansri` added Flint and LFM2.5-24B-A2B. Try them with `lemonade pull`.

### Strix Halo 128 GB models start again

`@jeremyfowers` fixed a v2026.44 regression. `gpt-oss-120b`, `Qwen3-Next-80B`, and `Qwen3-Coder-Next` load again on 128 GB Strix Halo.

### Breaking Changes

- `GET` on POST-only paths (like `slots/{id}` or `models/register`) now returns 405 instead of 404.
- A request without a `model` field returns `"Missing model field in request"` on every model route.
- Form-encoded requests with invalid field types (for example, a non-numeric `temperature` on transcription) return 400 instead of 500.

### Additional Improvements

- `@sawansri` improved `lemonade launch pi`: API keys go through an env var, and vision models and MCP are configured automatically.
- `@sreeram-11` restored ROCm image generation on Windows.
- `@meghsat` fixed model delete so shared files no longer stay on disk, and added GRG-Halo to the supported devices.
- `@fl0rianr` added model and backend update progress in the app, mic dictation in every mode, the "Remember API key" option in the browser, and chat history on by default.
- `@iswaryaalex` added AMD GPU usage and VRAM reporting on Windows.
- `@mike2307` made telemetry report `null` instead of `0.0` for unmeasured timing.
- `@bernardogv` made `*_bin` overrides accept a directory.
- `@ramkrishs` made the CLI tell a closed connection apart from a server that isn't running.

Get v2026.45.3 from [GitHub Releases](https://github.com/lemonade-sdk/lemonade/releases/tag/v2026.45.3) and tell us in #general what you think of the new app!

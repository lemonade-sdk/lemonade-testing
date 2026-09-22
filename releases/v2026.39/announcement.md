## Lemonade v2026.39

@everyone Big release today — image editing lands on AMD GPUs, a browsable API reference, and you can now test prerelease builds before they hit stable.

### Breaking Changes

- Versions now use `2026.39.0` (year-week-number) instead of `11.9.0`.
- Upgraded to llama.cpp b10825, which no longer supports `--no-mmap`. If you have `llamacpp-args` with that set, you will need to unset it.

### 🎨 Image editing on AMD 🎨

`@bitgamma` implemented `/images/edit` in thenoise 0.7.1 and expanded supported AMD ROCm GPU families — the endpoint is live and ready to use.

### `allowed_origins` now accepts wildcards

`@abn` added `:*` for wildcard ports and `*.domain` for subdomain patterns, so local dev and homelab setups work without reconfiguring every time your frontend switches ports.

### Browsable API docs at `/v1/docs`

`@anditherobot` built a bundled API docs system that serves a JSON index at `GET /v1/docs` and individual markdown reference pages at `GET /v1/docs/{page}` — plus an MCP tool so agents can fetch docs directly.

### VRAM auto-eviction and prompt-cache preservation

`@GabrielReusRodriguez` added `auto_evict` and `auto_evict_threshold_pct` for pressure-based VRAM cleanup, and `@meghsat` removed the soft-idle `downsize()` override that was erasing the prompt cache for nothing — they now stick around as you'd expect. Session headers relay to cloud providers (reviewed by `@abn`) keeps continuity working across the hop, too.

### 🚀 Prerelease builds are here!

Try candidate releases early via GitHub prereleases (`candidate-v<version>` tags) or Docker's new `candidate` tag — the whole pipeline runs automatically every Wednesday. Thanks `@jeremyfowers`, `@superm1`, and `@kenvandine` for building it out.

### Additional Improvements

- Routing policy survives hardware filters (`@Bekhouche` with `@fl0rianr`), FLM backend respects `default_model_source` (`@wariobot09` with `@ZaneNi`), and CI merge flow got much friendlier (`@jeremyfowers`).
- Backend version bumps across the board, new `Meta-Llama-3.1-8B` on HRX, and a handful of model-loading fixes.

Full release notes are over on [GitHub Releases](https://github.com/lemonade-sdk/lemonade/releases) — happy to answer any questions, and please let us know what you think!

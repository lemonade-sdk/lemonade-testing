## Lemonade v2026.39.1

@everyone we're back to having weekly Lemonade releases! Today we're getting image editing in TheNoise, an awesome `/docs` endpoint and MCP tool, and the candidate testing system is fully in place.

### Breaking Changes

- Versions now use `2026.39.1` (year-week-number) instead of `11.9.0`.

> Heads up: llama.cpp b10875, which Lemonade will upgrade to in a future release, no longer supports `--no-mmap`. If you have `llamacpp-args` with that set, you should adopt the new `--load-mode` arg now to avoid a breaking change problem later.

### Fast Image editing on AMD

`@bitgamma` implemented `/images/edit` in thenoise 0.7.1 and expanded AMD GPU support to include gfx103X, gfx110X, and gfx120X.

### `allowed_origins` now accepts wildcards

`@abn` added `:*` for wildcard ports and `*.domain` for subdomain patterns, so local dev and homelab setups work without reconfiguring every time your frontend switches ports.

### Browsable API docs at `/v1/docs`

`@anditherobot` built a bundled API docs system that serves a JSON index at `GET /v1/docs` and individual markdown reference pages at `GET /v1/docs/{page}`. Plus, an MCP tool so agents can fetch docs directly!

### 🚀 Prerelease builds are here!

Try candidate releases early via GitHub prereleases (`candidate-v<version>` tags) or Docker's new `candidate` tag. The whole pipeline runs automatically every Wednesday and you can participate in the #release-candidates channel. Thanks `@superm1`, `@jeremyfowers`, and `@kenvandine` for building it out.

### Additional Improvements

- `@GabrielReusRodriguez` added `auto_evict` and `auto_evict_threshold_pct` to `lemonade config` to help you configure pressure-based VRAM cleanup.
- `@meghsat` and `@pwilkin` removed the soft-idle `downsize()` override that was erasing the prompt cache for nothing.
- Routing policy survives hardware filters (`@Bekhouche` with `@fl0rianr`)
- FLM backend respects `default_model_source` (`@superm1` with `@ZaneNi`)
- CI merge flow got much friendlier (`@jeremyfowers`).
- llamacpp-hrx updated with `Meta-Llama-3.1-8B` support by `@AaronStGeorge`.
- FastFlowLM updated to v1.0.5 by `@ZaneNi`.
- Nice fixes by `@popey`, `@noamsto`, `@jamespthomas`, and `@Yigtwxx`!

Full release notes are over on [GitHub Releases](https://github.com/lemonade-sdk/lemonade/releases)!

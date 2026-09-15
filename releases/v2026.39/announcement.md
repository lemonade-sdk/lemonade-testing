## Lemonade v2026.39

@everyone a proper week for you — a bundled API docs system, wildcard origins, image editing, and prompt-cache continuity across cloud hops, plus the new versioning scheme that makes release candidates accessible to everyone.

### Breaking Changes

- We've switched to a `YYYY.WW.N` version scheme instead of the old `X.Y.Z` — make sure any pinned versions are updated to the new format.
- `GET /models` and `GET /pull/variants` return an empty string for `registry_source` when no source is set, instead of falling back to `huggingface`.
- `GET /docs` now returns a JSON 404; the API reference lives at `GET /v1/docs`.
- FLM downloads now respect your `default_model_source` setting — models without an explicit source fall back to your configured default instead of always using HuggingFace.

### API docs, for real now

@anditherobot brought in a proper API documentation system that serves a JSON index and per-page reference at `GET /v1/docs` — no more SPA fallback. Unversioned `/docs` returns a JSON 404 instead.

### Wildcard origins for local dev

You can now use `*:port` and `*.domain` patterns in `allowed_origins` so your local dev and homelab setups keep working when frontend servers switch ports or domains. Thanks @abn!

### Image editing lands in TheNoise

@bitgamma has brought /images/edit to the API with TheNoise 0.7.1, along with expanded AMD ROCm GPU support. You can't optimize what you can't measure, and this is one more tool for your editing belt.

### Prompt-cache continuity across cloud hops

@SlawomirNowaczyk and @abn have set up session headers like `x-session-id` to be relayed verbatim through Lemonade, so your prompt-cache continuity survives a cloud hop intact.

### Additional Improvements

- A fix for the routing policy by @Bekhouche with @fl0rianr keeps unrelated rules from being dropped on hardware-filtered classifiers, and @popey added pre-download architecture checks that filter out incompatible Hugging Face repos before the download starts.
- @GabrielReusRodriguez has added `auto_evict` and `auto_evict_threshold_pct` default config values — VRAM pressure-based eviction without you having to think about it.
- @meghsat removes the soft-idle `downsize` override that was destroying prompt caches instead of freeing VRAM for llama.cpp.
- @Yigtwxx fixes empty SSE streams from being reported as successful completions, and @AaronStGeorge adds Meta-Llama-3.1-8B to the HRX-qualified models with a backend bump.
- The new Python-based dynamic versioning system by @superm1 with @fl0rianr, weekly release branches and candidate artifact publishing by myself, and @zaneni6 with @ZaneNi bumping the FLM backend to v1.0.5.

Full release notes are on [the GitHub releases page](https://github.com/lemonade-sdk/lemonade/releases) — take a look and let me know what you think!

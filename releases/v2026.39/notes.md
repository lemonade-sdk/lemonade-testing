## Headline

- The new bundled API documentation system serves a JSON index and per-page reference at `/v1/docs`, replacing the old SPA fallback with a proper JSON 404 on unversioned `/docs`.
- `allowed_origins` now accepts wildcard port (`*:port`) and wildcard subdomain (`*.domain`) patterns so local dev and homelab setups keep working when frontend servers switch ports or domains.
- Image editing lands behind `/images/edit` in TheNoise 0.7.1 with expanded support for additional AMD ROCm GPU families.
- Prompt-cache continuity across cloud hops is preserved by relaying session headers like `x-session-id` verbatim to downstream providers.

## Breaking Changes

- Version format switched from semver (e.g. `11.9.0`) to `YYYY.WW.N` (e.g. `2026.39.0`); update any pinned versions to the new format.
- `GET /models` and `GET /pull/variants` return an empty string for `registry_source` when no source is set, instead of `huggingface`; clients that assume a non-empty value should handle the empty case.
- `GET /docs` returns a JSON 404 instead of falling through to the SPA web app; use `GET /v1/docs` for the API reference.
- FLM downloads now respect `default_model_source` and per-model source overrides; FLM models without an explicit source fall back to the configured default rather than always using HuggingFace.

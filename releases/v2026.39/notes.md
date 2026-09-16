## Headline

- The `/images/edit` endpoint added for image editing, backed by thenoise 0.7.1 and expanded AMD ROCm GPU support.
- `allowed_origins` now accepts `:*` wildcard ports and `*.domain` subdomain patterns for local development and homelab setups.
- New `/v1/docs` endpoint serves browsable API reference documentation with a JSON index and individual markdown pages.
- Configurable VRAM auto-eviction via `auto_evict` and `auto_evict_threshold_pct`, with prompt cache now preserved during soft-idle transitions.
- Prerelease candidate builds available for early testing via GitHub prereleases under `candidate-v<version>` tags and the Docker `candidate` image tag.

## Breaking Changes

- Model version format changed from `X.Y.Z` to `YYYY.WW.N` or `YYYY.WW.0~<count>.<hash>`; tools and scripts that parse `--version` output or compare version strings must be updated.
- The `/models` and `/pull/variants` endpoints now serialize `registry_source` as an empty string for models without an explicit source override, instead of `'huggingface'`; clients that assume the field is always set to a registry name will need to handle empty values.
- The unversioned `/docs` endpoint subtree now returns a JSON `404` instead of falling through to the SPA web app; any client relying on that fallback will receive a 404 response.

## Headline

- TheNoise updated to 0.7.1 with support for image editing and additional AMD GPUs.
- `allowed_origins` now accepts `:*` wildcard ports and `*.domain` subdomain patterns for local development and homelab setups.
- New `/v1/docs` endpoint serves browsable API reference documentation with a JSON index and individual markdown pages.
- Configurable VRAM auto-eviction via `auto_evict` and `auto_evict_threshold_pct`, with prompt cache now preserved during soft-idle transitions.
- Prerelease candidate builds available for early testing via GitHub prereleases under `candidate-v<version>` tags and the Docker `candidate` image tag.

## Breaking Changes

- Version format changed from `X.Y.Z` to `YYYY.WW.N` or `YYYY.WW.0~<count>.<hash>`; tools and scripts that parse `--version` output or compare version strings must be updated.

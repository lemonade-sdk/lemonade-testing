## Headline

- Wildcard ports (`:*`) and wildcard domains (`*.domain`) are now supported in `allowed_origins`, letting local dev and homelab setups connect without reconfiguring when frontend servers switch ports.
- New `/images/edit` endpoint lets you edit and modify existing images, backed by the expanded thenoise backend with broader ROCm GPU support.
- The bundled API documentation is now available at `/v1/docs` with a JSON index and individual markdown pages, plus an MCP tool for programmatic access.
- Weekly release candidate builds are published as GitHub prereleases and Docker `candidate` tags so you can test upcoming releases before they ship.
- Model versions now use a `YYYY.WW.N` format (e.g. `2026.39.0`) derived from git branches and tags, replacing the previous `X.Y.Z` scheme.

## Breaking Changes

- Model versions now use the `YYYY.WW.N` format instead of `X.Y.Z`; tools and scripts that parse `--version` output or compare version strings must be updated to handle the new scheme.
- The `/models` and `/pull/variants` API endpoints now return an empty string for `registry_source` on models without an explicit source override; clients that assume this field is always `'huggingface'` or `'modelscope'` will need to handle the empty string value.
- Unversioned `/docs` requests now return a JSON `404` instead of falling through to the SPA web-app; users relying on that fallback must migrate to `/v1/docs` for API documentation or serve the web-app on a different path.

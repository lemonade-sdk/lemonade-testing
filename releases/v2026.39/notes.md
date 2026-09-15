## Headline

- Wildcard port (`:*`) and subdomain (`*.domain`) matching in `allowed_origins` so local development and homelab environments connect without reconfiguring when frontend servers switch ports.
- New `/images/edit` endpoint in TheNoise for image editing and variations, with expanded ROCm GPU family support and backend bumped to 0.7.1.
- Bundled API documentation now served at `GET /v1/docs` (JSON index) and `GET /v1/docs/{page}` (markdown), with a new `lemonade_docs` MCP tool for programmatic access.
- Soft-idle no longer erases llama.cpp KV cache slots, preserving prompt cache so resumed conversations start from the existing cache instead of re-prefilling.

## Breaking Changes

- The version scheme changed from `X.Y.Z` (e.g., `11.9.0`) to `YYYY.WW.N` (e.g., `2026.39.0`); scripts or CI pipelines that parse `--version` output or the server startup log must match the new date-part format.
- FLM model info `registry_source` in `GET /pull/variants` and `GET /models` responses is now an empty string for models without an explicit source instead of `'huggingface'`; clients that assume the field always contains `'huggingface'` or `'modelscope'` will see `''` and may misinterpret it.
- The unversioned `/docs` route now returns a JSON 404 instead of falling through to the SPA web-app; anyone relying on `/docs/example` being silently served by the SPA should update to use the new `GET /v1/docs/{page}` endpoints.

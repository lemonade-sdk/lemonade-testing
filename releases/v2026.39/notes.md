## Headline

- The `llamacpp-hrx` backend adds Meta-Llama-3.1-8B as a new HRX-qualified model and receives a backend bump that expands what AMD Strix Halo users can run.
- Wildcard port and subdomain patterns (`:*` and `*.domain`) in `allowed_origins` simplify CORS for local dev and homelab setups.
- Session continuity headers are relayed verbatim to cloud providers so prompt-cache persists across connections.
- A bundled API documentation system at `/v1/docs` provides a local reference for the server's REST endpoints.

## Breaking Changes

- Version format changed from `X.Y.Z` to `YYYY.WW.N`; update any tooling or scripts that parse `--version` output, build logs, or installer metadata to expect the new format.
- CMake configure now requires Python 3; builds will fail on systems without a Python 3 interpreter available at configure time.
- Windows installer product version derives from the date-part of the version rather than `PROJECT_VERSION`; installer version numbering differs from the prior release format.

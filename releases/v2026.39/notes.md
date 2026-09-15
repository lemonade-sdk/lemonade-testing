## Headline

- Wildcard ports (:\*) and subdomains (\*.domain) are now accepted by `allowed_origins`, letting local development servers on dynamic ports connect without manual configuration.
- The server's API documentation is now machine-readable at `GET /v1/docs` and accessible via the `lemonade_docs` MCP tool, with individual markdown pages served at `GET /v1/docs/{page}`.
- The project now publishes weekly release candidates on a new YYYY.WW.N version scheme, automating the release cycle with candidate Docker tags and GitHub prereleases.

## Breaking Changes

- The version scheme shifted from M.m.p to YYYY.WW.N — CMake version extraction moved to a Python-based git state derivation system, MSI installer versions use YY.MM.PATCH, and `get-version` now outputs YYYY.WW.N instead of the static CMake VERSION.

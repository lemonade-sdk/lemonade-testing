## Headline

- `allowed_origins` now supports wildcard port (`:*`) and subdomain (`*.domain`) matching so local development servers on dynamic ports can connect without manual configuration.
- The `/images/edit` endpoint is now served on TheNoise backend, adding image editing support alongside existing generation, variation, and upscale operations.
- Session identity headers are relayed verbatim to cloud providers, enabling prompt-cache continuity for applications like OpenCode Zen across the Lemonade proxy.
- The `llamacpp-hrx` backend adds Meta-Llama-3.1-8B-Instruct as a new qualified model and introduces `auto_evict` configuration defaults for GPU memory management.

## Breaking Changes

- The version scheme changed from `M.m.p` to `YYYY.WW.N` format with a Python-based git state derivation replacing CMake version extraction; update downstream tooling and scripts that parse version strings.

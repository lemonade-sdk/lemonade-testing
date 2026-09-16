## Headline

- The experimental `llamacpp-hrx` backend gains a Meta-Llama-3.1-8B model profile and an updated HRX runtime, with CI and nightly benchmark coverage on AMD gfx1100/gfx1151 GPUs on Linux.
- Image editing is now available through the `/images/edit` endpoint in TheNoise, which upgrades to v0.7.1 and supports additional AMD ROCm GPU families.
- `allowed_origins` accepts wildcard ports (`*:`) and subdomain patterns (`*.domain`) so local dev and homelab setups connect without reconfiguring when frontend servers switch ports.
- Prompt-cache continuity across the Lemonade hop is restored by relaying caller-supplied session headers such as `x-opencode-session` and `x-session-id` to cloud providers.

## Breaking Changes

- The version scheme shifted from `X.Y.Z` (e.g. `11.9.0`) to `YYYY.WW.N` (e.g. `2026.39.0`); update any tool or script that parses the version string.
- The `registry_source` field in `GET /pull/variants` and `GET /models` responses now defaults to an empty string instead of `'huggingface'`; clients that assume a non-empty value may misinterpret the source.
- The unversioned `/docs` endpoint now returns a JSON 404 instead of falling through to the SPA web app; remove any reliance on that fallback.

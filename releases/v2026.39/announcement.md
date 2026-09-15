@everyone Happy Wednesday — this release is worth your time. I've reworked the entire release process so you can test prereleases before they ship, the llamacpp-hrx backend just got a big boost for AMD Strix Halo users, and I've been listening to your feedback about session continuity and local docs. Let's get into it.

## Breaking Changes

- The version format shifted from `X.Y.Z` to `YYYY.WW.N` (e.g. `2026.39.0`). If your tools, scripts, or build logs parse `--version` output, update them for the new format.
- CMake configure now requires Python 3 — the build will fail without a Python 3 interpreter at configure time.
- Windows installer product version now derives from the date-part of the version rather than `PROJECT_VERSION`, so installer versioning looks different than the prior release.

## 🤖 Meta-Llama-3.1-8B on llamacpp-hrx

@AaronStGeorge added Meta-Llama-3.1-8B as a new HRX-qualified model and bumped the HRX backend from b59 to b69 — AMD Strix Halo users can now run more models. @iswaryaalex also wired the HRX backend into the nightly benchmark pipeline so we keep regressions in check.

## 🌐 Wildcard CORS for local dev and homelab

@abn added wildcard port (`:*`) and subdomain (`*.domain`) patterns to `allowed_origins`, so your local frontend servers can connect without updating config every time a port changes. @abn also restructured the entire "Allowed Origins" docs section to make it way more readable.

## 🔗 Session continuity headers now relayed to cloud providers

@jeremyfowers now forwards headers like `x-opencode-session` and `x-session-id` verbatim to cloud providers, so your prompt-cache persists seamlessly across connections. Shout-out to @abn for helping nail down the docs on which headers leak vs. stay local.

## 📖 API reference docs at `/v1/docs`

@anditherobot shipped a full bundled API documentation system: GET `/v1/docs` gives you a JSON index, GET `/v1/docs/{page}` serves markdown pages, and there's an MCP tool `lemonade_docs` too. Old unversioned `/docs` now returns clean JSON 404 instead of falling through to the SPA.

## Additional Improvements

- @GabrielReusRodriguez added `auto_evict` and `auto_evict_threshold_pct` configuration defaults with matching docs.
- @wariobot09 made the FLM backend resolve its download source from the server-wide `default_model_source` config (thanks @ZaneNi), and @meghsat preserved prompt cache by stopping `downsize()` from nuking llama.cpp KV cache slots on soft-idle.
- Three fixes from @popey — better GPU memory selection on mixed AMD/NVIDIA systems, pre-download filtering of incompatible repos in `/pull/variants`, and a backend version bump for FLM NPU.
- @superm1 rewrote the entire release CI pipeline (weekly candidate branches, prerelease artifacts as GitHub prereleases, Docker candidate tags) and pinned every self-hosted runner to X64 to prevent ARM runner surprises. @kenvandine and @superm1 also cleaned up snap builds and distro matrix workflows.
- Various smaller wins: a docs integration guide for Interviewer AI by @antmikinka, image generation docs cleaned up by @bitgamma, the internal MCP agent reverts by @fl0rianr, and a fix from @noamsto for `gpt-oss-120b-mxfp-GGUF` loading.

Catch the full release notes here: https://github.com/lemonade-sdk/lemonade/releases — let me know what you think!

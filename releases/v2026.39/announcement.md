## Lemonade v2026.39

@everyone This is a big one — wildcard CORS, machine-readable docs, and a whole new way Lemonade ships itself.

### Breaking Changes

- The version scheme shifted from M.m.p to YYYY.WW.N — CMake version extraction moved to a Python-based git state derivation system, MSI installer versions use YY.MM.PATCH, and `get-version` now outputs YYYY.WW.N instead of the static CMake VERSION.

### Wildcard CORS for local development

If your local dev server lives on a dynamic port or a wildcard subdomain, it just works now. @abn added `:*` for port wildcards and `*.domain` for subdomain wildcards to `allowed_origins`, so you can spin up a server and connect without hand-editing configuration. (A security reminder lives in the docs about non-HTTPS wildcards — please read it!)

### API docs you can actually read programmatically

The server now serves its own reference at `GET /v1/docs` as a machine-readable index, with individual markdown pages available at `GET /v1/docs/{page}`. The same docs are exposed through the `lemonade_docs` MCP tool by @anditherobot, with @jeremyfowers. Grab what you need, parse it, automate it — no more clicking through a browser.

### Weekly release candidates on autopilot

We're publishing release candidates every week now, on a `YYYY.WW.N` version scheme. Weekly `release-v<year>.<week>` branches roll from main, each one tagged with `candidate` Docker images and GitHub prereleases — all automated by a new scheduled workflow and a Python-based version derivation system, by @jeremyfowers with @superm1. Candidate tags never touch the stable namespace, and if you need a specific version, the `candidate-v<version>` tag is there for you. The release guide in `docs/dev/release.md` walks through everything.

### Additional Improvements

- Context auto-tuning now picks the right GPU memory pool for your selected backend, fixing incorrect sizing on mixed AMD/NVIDIA systems — @popey.
- The `/pull/variants` endpoint rejects incompatible Hugging Face repos (wrong media tasks, missing architecture metadata) before you waste bandwidth — @popey.
- Backend HTTP responses that closed without SSE data now report as errors instead of successful completions, and the SSE parser handles all line terminators properly — @Yigtwxx.
- The FLM backend respects the server-wide `default_model_source` config instead of a standalone recipe option, with @ZaneNi.
- OpenCode Zen session headers are relayed verbatim through Lemonade to cloud providers, keeping prompt-cache continuity intact — @SlawomirNowaczyk.
- ROCm support extended to six GPU families and TheNoise `/images/edit` endpoint is live (no longer a stub), with @bitgamma.
- A trio of fixes for the HTML example demos: serve them over localhost instead of `file://`, fix allowed origins docs rendering, and re-enable tool-calling tests for llamacpp and FLM backends — @jeremyfowers and @abn.
- A new Interviewer app integration guide is live for AI-powered interview practice, and docs for Windows prerequisites were expanded — @antmikinka and @sofiageo.
- A classifier fix so models filtered by hardware (e.g. NPUs on non-NPU hosts) no longer silently drop your entire routing policy — @Bekhouche, with @fl0rianr and @SlawomirNowaczyk.
- Soft-idle downsize now preserves the prompt cache instead of needlessly destroying it — @meghsat.

Full release notes: https://github.com/lemonade-sdk/lemonade/releases/tag/v2026.39
Come try the new weekly candidates and tell me how they feel!

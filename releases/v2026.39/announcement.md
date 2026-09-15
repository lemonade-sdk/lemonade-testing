## Lemonade v2026.39

@everyone This release is a big one — we've got wildcard origins for local dev servers, image editing on TheNoise, session-continuity headers for your cloud backends, and Meta-Llama-3.1-8B joining the HRX roster!

### Breaking Changes

- The version scheme has moved from `M.m.p` to `YYYY.WW.N`, and the CMake-based version extraction has been replaced by a Python-driven git state derivation; MSI installer versions are now `YY.MM.PATCH`, and the `get-version` action spits out `YYYY.WW.N` instead of the old static CMake `VERSION`. Any downstream tooling or scripts that parse version strings need a look.

### Wildcard origins for local dev servers

`allowed_origins` now understands wildcard ports (`:*`) and wildcard subdomains (`*.domain`), so spinning up a dev server on a dynamic port doesn't require manual config edits anymore. @abn handled the validation logic and also cleaned up the docs page to make it actually render nicely — thanks @abn!

### Image editing lands on TheNoise

The `/images/edit` endpoint is now live on the TheNoise backend, adding image editing to the generation, variation, and upscale trio already available. @bitgamma also expanded ROCm GPU family support for AMD users — @bitgamma has brought image editing to the party!

### Session identity headers for cloud prompt-cache continuity

Lemonade now relays session identity headers (like `x-opencode-session` and `x-session-id`) verbatim when forwarding inference requests to cloud providers, so applications like OpenCode Zen can maintain prompt-cache continuity across the Lemonade hop. @SlawomirNowaczyk made it happen!

### Llama 3.1 8B on HRX + auto-evict defaults

@AaronStGeorge added Meta-Llama-3.1-8B-Instruct as a new qualified model for the `llamacpp-hrx` backend, and @GabrielReusRodriguez introduced `auto_evict` and `auto_evict_threshold_pct` configuration defaults to help keep GPU memory management from getting out of hand.

### Additional Improvements

- A batch of fixes and cleanups: better context auto-tuning on mixed GPU systems (@popey), GGUF compatibility filtering before downloads (@popey), FLM model source selection through config defaults (@wariobot09), and LlamaCpp soft-idle downsize now preserves the prompt cache instead of needlessly erasing it (@meghsat)
- CI got a tune-up — no more blocking Distro Builds job (@jeremyfowers), Hugging Face model cache persisted outside workspace to stop 9 GB re-downloads (@jeremyfowers), and self-hosted runners pinned to X64 to avoid ARM64 landmines (@jeremyfowers)
- Backend version bumps across the board: FastFlowLM NPU up to v1.0.5 (@zaneni6), stable-diffusion.cpp up to master-843 (@github-actions), and an internal MCP client feature reverted per RFC scope decision (@fl0rianr)
- Release pipeline work: weekly `release-v` branches auto-created (@jeremyfowers), candidate Docker tags and prerelease artifacts for RC builds (@jeremyfowers, @superm1), and an automated Debian PPA routing that sends release-v\* branches to the candidate channel (@superm1)

As always, check out the full release notes on GitHub and tell me what you think!

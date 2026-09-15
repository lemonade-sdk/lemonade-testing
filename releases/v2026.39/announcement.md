## Lemonade v2026.39

@everyone this one's got some real quality-of-life improvements, a few new features you've been asking for, and a big shake-up to how we version builds — let's dive in.

### Breaking Changes

- Version format changed from X.Y.Z (e.g. 11.9.0) to YYYY.WW.N (e.g. 2026.39.0); scripts or CI pipelines parsing `--version` output or the server startup log need to match the new date-part format.
- CMake configure time now requires Python 3 (`find_package(Python3)`); the build will fail on systems without a Python 3 interpreter available at configure time.
- Windows installer product version (`Product.wxs.in`) now derives from the date-part of the version rather than `PROJECT_VERSION`; installer version numbering will differ from the prior release format.

### Wildcard origins for local dev and homelabs

@abn added wildcard port matching (`:*`) and subdomain matching (`*.domain`) to the `allowed_origins` configuration, so your frontend and backend can talk without reconfiguring every time a dev server switches ports. Big thanks @abn for the feature and the clean-up to the docs!

### Image editing and variations in TheNoise

@bitgamma implemented `/images/edit` in TheNoise for image editing and variations, bumped the backend to 0.7.1, and expanded supported ROCm GPU families. Now you can create variations or edit images directly without leaving the flow.

### Bundled API docs and an MCP tool

@anditherobot added a full API documentation system served at `GET /v1/docs` (JSON index) and `GET /v1/docs/{page}` (markdown), plus a `lemonade_docs` MCP tool for programmatic access. The unversioned `/docs` route now returns a JSON 404 instead of falling through to the SPA — use the new endpoints above.

### Soft-idle preserves your prompt cache

@meghsat and I have put a fresh coat of paint on soft-idle: it no longer erases llama.cpp KV cache slots, so resumed conversations start from the existing cache instead of re-prefilling. Huge quality-of-life win when you're juggling context windows.

### Additional Improvements

- CI infrastructure stabilized for macOS and Windows by @jeremyfowers, and the unstable Linux Distro Builds CI job has been retired.
- Session continuity headers (like `x-opencode-session` or `x-session-id`) are now relaying verbatim to cloud providers for prompt-cache continuity across the Lemonade hop, by @SlawomirNowaczyk with help from @abn.
- Mixed AMD/NVIDIA GPU memory routing for context auto-tuning fixed by @popey, so you no longer risk the wrong GPU's memory getting picked on hybrid systems.
- Incompatible Hugging Face repos (media models, missing architectures) are now filtered before download, by @popey.
- A prerelease artifacts channel is live for Windows, Fedora, Debian, and macOS — try candidates via prerelease builds under `candidate-v<version>` tags, by @jeremyfowers.

Full release notes at https://github.com/lemonade-sdk/lemonade/releases. Let me know what you think!

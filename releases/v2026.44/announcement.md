## Lemonade v2026.44.0

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

@everyone v2026.44 is out: `lemonade launch pi` picks up MCP mode and code mode with image input and tool-calling, sd-cpp ROCm is back on Windows, auto-tuned context sizing gets smarter, and a new LFM2.5 model joins the registry.

### Breaking Changes

- The `/v1/models/{model}/options` endpoint can now return `null` for `resolved_ctx_size` instead of a number — this happens when automatic GPU sizing can't fit a valid context window — so make sure your clients handle the null case gracefully.

### 🤖 MCP and code mode for `lemonade launch pi`

`@sawansri` added `--mcp`, `--no-mcp`, and `--codemode` flags to `lemonade launch pi`, so you can now run pi with per-model context windows, image input, tool-calling, and the API key stays off disk by referencing `${LEMONADE_API_KEY}` in the config.

### 🟣 sd-cpp ROCm on Windows is back

`@sreeram-11` re-enabled the sd-cpp ROCm backend on Windows with a full HIP runtime DLL bundle and MAX_PATH guard, so model streaming on AMD integrated GPUs works without silent CPU fallback. Thanks to `@ramkrishna2910` for testing along the way!

### 🧠 Auto-tuned context sizing gets a memory budget

`@fl0hrnr` taught the context size tuner to reserve runtime buffer memory for discrete GPUs, unified-memory GPUs, and host backends — the sizing is more accurate now, and when automatic sizing can't fit a valid context, `resolved_ctx_size` returns null instead of guessing.

### 🌟 LFM2.5-24B-A2B-GGUF joins the registry

`@sawansri` added the LFM2.5-24B-A2B-GGUF model to the catalog with a 14.9 GB checkpoint and labels for chat, reasoning, and tool-calling — grab it with `lemonade pull`.

### Additional Improvements

- `@sreeram-11` stopped Hugging Face rate limits from failing model pulls by disabling per-repo startup checks in CI mode and returning a 503 with Retry-After headers instead.
- `@sreeram-11` fixed a SIGPIPE race condition in the launchpad-ppa CI workflow that was causing spurious failures.
- `@sreeram-11` restructured the self-hosted inference matrix from one job per test suite to one job per runner class, cutting down on runner handoffs and CI drops.
- `@meghsat` fixed model deletion so it no longer leaves orphaned files on disk.
- `@bernardogv` fixed `*_bin` directory resolution so pointing the config at a directory actually works as documented.
- `@bernardogv` documented the systemd `ProtectHome=yes` restriction on `.deb`/`.rpm` packages when using `extra_models_dir` under `/home`, including a drop-in solution.
- `@jeremyfowers` published the auto-BKC vision blog post as an HTML article and set up automatic news publishing so posts go live the moment they merge.

Grab v2026.44.0 from [GitHub Releases](https://github.com/lemonade-sdk/lemonade/releases) and I'd love to hear what you think — drop your feedback in #general!

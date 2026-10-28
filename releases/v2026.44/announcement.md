## Lemonade v2026.44.1

@everyone v2026.44 is out: MCP and code mode for `lemonade launch pi`, sd-cpp ROCm back on Windows, AMD GPU usage and VRAM reporting on Windows, and the new LFM2.5-24B-A2B model.

### MCP and code mode for `lemonade launch pi`

`@sawansri` added `--mcp` to `lemonade launch pi`, which connects pi to the Lemonade MCP server, and `--codemode`, which lets pi's scripts call Lemonade tools like image generation. pi also picks up each model's context window, accepts images on vision models, and keeps your API key out of its config. See the [pi guide](https://github.com/lemonade-sdk/lemonade/blob/main/docs/integrations/pi.md).

### sd-cpp ROCm is back on Windows

`@sreeram-11` re-enabled the sd-cpp ROCm backend on Windows. It was pulled because image generation could silently fall back to CPU, and staging the full HIP runtime next to `sd-server` fixes GPU detection.

### AMD GPU usage and VRAM on Windows

`@iswaryaalex` fixed Lemonade's reporting of AMD GPU usage and VRAM on Windows.

### Additional Improvements

- `@meghsat` fixed deleting a model that shares files with others in its family, such as the Anima models, so the shared files are removed once no downloaded model uses them.
- `@sawansri` added LFM2.5-24B-A2B-GGUF to the model registry.
- `@fl0rianr` improved automatic context sizing to reserve memory for runtime buffers, reducing GPU memory pressure.
- `@bernardogv` fixed `*_bin` config options so pointing one at a directory finds the binary inside it.
- `@bernardogv` documented the drop-in needed to use `extra_models_dir` under `/home` with the .deb and .rpm packages.
- `@QuTosh` added model-backed conformance tests, `@iswaryaalex` added Strix Halo backend benchmarking, and `@sreeram-11` made CI more reliable against Hugging Face rate limits and runner handoffs.
- `@jeremyfowers` published the auto-BKC vision blog post, and news posts now go live on the website as soon as they merge.

Grab the latest release over on [GitHub Releases](https://github.com/lemonade-sdk/lemonade/releases) and drop your feedback in #general!

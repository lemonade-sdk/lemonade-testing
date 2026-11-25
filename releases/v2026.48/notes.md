## Headline

- Better Ollama compatibility: /api/generate passes images and audio through to the model, /api/show reports speech, decision and audio capabilities and resolves model aliases, and models that can't chat or generate get a clear 400 error instead of a failed load.
- New image models on TheNoise v0.15.0: MOSS-Image and H3-Image.
- Automatic context sizing no longer falls back to 4K context when it misreads available memory.
- FLM NPU backend updated to v1.0.13, with embedding models working on it.
- llama.cpp updated to b12233, ROCm stable to b12223 and ROCm nightly to b1372.

## Breaking Changes

- /api/chat and /api/generate return HTTP 400 instead of 500 for models that can't chat or generate (image generation, embedding and reranking models).
- GET /pull/variants returns HTTP 400 instead of 500 when a repository has no supported model files.
- The TheNoise backend moves from v0.12.1 to v0.15.0, which may change output or memory use for existing image models.

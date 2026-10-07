## Headline

- ROCm backends move to ROCm 10 for llama.cpp, whisper.cpp, stable-diffusion.cpp, ThinkSound, TRELLIS, and ACE-Step.
- Non-streaming requests now stop as soon as the client disconnects, so an abandoned request no longer ties up the server.
- Kokoro TTS fixes four British English voices and one French voice that returned short fixed-length audio.
- Configuration now rejects unknown backend keys instead of silently ignoring them.

## Breaking Changes

- ROCm backends now use ROCm 10. The first ROCm model load after upgrading downloads the new runtime (about 2.6 GB).
- lemonade config set now rejects unknown backend keys, for example flm.flm_bin.

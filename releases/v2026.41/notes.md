## Headline

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

- lemonade-tray on POSIX now natively spawns and supervises a local lemond daemon with a watchdog pipe for automatic recovery.
- AMD GPU support expands via ROCm runtime bump to version 10.0 and moving the stable-diffusion.cpp backend to the lemonade-sdk fork.
- Kokoro TTS updated to fix four British English and one French voice returning fixed-length audio regardless of input text.
- Non-streaming requests now abort cleanly when a client disconnects mid-request, with upstream HTTP transfers cancelled.

## Breaking Changes

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

- The --no-sign flag was removed from the release tagging tool; tags are now unsigned by default (previously signed). Use --sign to create signed tags.

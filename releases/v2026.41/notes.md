## Headline

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

- Non-streaming requests no longer hang when a client disconnects mid-request; the server now detects lost connections through the full pipeline and aborts upstream transfers.
- Kokoro TTS voices for British English (bf_emma, bf_isabella, bm_george, bm_lewis) and French (ff_siwis) now generate audio of the correct length instead of fixed ~0.3s output.
- lemonade-tray on Linux now supports spawning and supervising a local lemond process natively via the `--spawn-server` flag.
- Documentation and test fixtures for llama.cpp now use the current `--load-mode` flag instead of the deprecated `--no-mmap` / `--mmap` / `--mlock` / `--direct-io` variants.

## Breaking Changes

### ⚠️ These notes are AI generated and will be revised by a human ⚠️

- The `--no-sign` flag was removed from the release tagging tool; omit the flag (now the default) or use `--sign` for signed tags. Update any scripts or workflows that passed `--no-sign`.

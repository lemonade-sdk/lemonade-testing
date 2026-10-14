## Lemonade v2026.42.1

@everyone v2026.42 is out: Windows support for TheNoise (ROCm), updated llama.cpp with six new model architectures, and HuggingFace-style cache directories now import correctly into `extra_models_dir`.

### Breaking Changes

- The FastFlowLM NPU model tag `hy-mt2:1.8b` is now `hy-mt2-flash:1.8b` (upstream v1.0.7). Update any configs or scripts that reference the old tag.

### 🪟 TheNoise lands on Windows (ROCm)

`@bitgamma` shipped a portable CPython interpreter alongside the ROCm backend, so TheNoise now works on Windows. The README and docs are updated — check them out if you've been waiting.


###Qwen3.8-27B on the NPU!

FLM added support for Qwen 3.8

### 📦 HuggingFace cache directories import into `extra_models_dir`

`@jeremyfowers` taught `extra_models_dir` to recognize HuggingFace and ModelScope cache layouts (`models--<org>--<repo>/snapshots/<commit>/`), so models in your local cache show up with readable repository names instead of commit hashes. Superseded revisions get prefixed by commit and collisions are qualified by org.

### Additional Improvements

- `@fl0rianr` fixed a collision where models registered in the catalog got duplicated when a matching HuggingFace/ModelScope cache also lived in `--extra-models-dir`.
- `@jeremyfowers` and `@fl0rianr` fixed model name resolution so duplicate folder names (e.g. `bartowski/Qwen3-8B-GGUF` vs `lmstudio-community/Qwen3-8B-GGUF`) resolve correctly.
- `@bitgamma` added auto-install for `lemonade bench` backends and more actionable error messages when no backend is found.
- `@ramkrishna2910` fixed HTTPS connections on Windows when servers use internal/private CAs.
- `@julianxhokaxhiu` bumped FastFlowLM NPU to v1.0.7 (see breaking change above for the model rename).

Grab the latest release over on [GitHub Releases](https://github.com/lemonade-sdk/lemonade/releases) and drop your feedback in #general!

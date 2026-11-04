## Lemonade v2026.45.3

@everyone v2026.45 is out: the completely redesigned Lemonade app is finally here! The HTTP server and Model Manager have also been rebuilt, and seven new models added to the catalog.

### The Lemonade app, redesigned from scratch

The new app has six workspaces (Chat, Models, Backends, Apps, Monitor, Settings), built-in tools, mobile web ui, multi-provider model search, a visual router policy editor, Simplified Chinese, and much more. Watch the video on YouTube to learn more: https://youtu.be/mg2PqmRujMo

GUI3 was a true community effort, with 37 contributors who wrote code, tested, reviewed, and reported issues:

`@kpoineal` `@fl0rianr` `@meghsat` `@PCAssistSoftware` `@jeremyfowers` `@falabellamichael` `@Geramy` `@abn` `@superm1` `@pwilkin` `@Rose22` `@bitgamma` `@danielholanda` `@dochoss` `@anditherobot` `@choppu` `@Davedave001` `@itomek` `@apollo-2006` `@boclifton-MSFT` `@mike2307` `@popey` `@ramkrishna2910` `@ckuethe` `@fanz-amd` `@iswaryaalex` `@sofiageo` `@andersmmg` `@blackdeathdrow` `@HyphenifyLimited` `@Jays-1111` `@programmin1` `@relaxedricky` `@siavashhub` `@Slackyster` `@soulafein83` `@storm1er`

Special thanks to `@kpoineal` for starting GUI3 and to `@fl0rianr` for the huge engineering effort. Thank you all!


### Rebuilt HTTP server and Model Manager

`@jeremyfowers` rebuilt the HTTP server around route classes, with consistent errors and generated API docs. `@bitgamma` refactored the Model Manager for reliability. These changes will make it much easier to contribute and review in the future.

### Seven new models

`@ramkrishna2910` added the K2-Horizon family (0.9B, 3.7B, 7B, 32B, and MoVA-36B-A4B), and `@sawansri` added Flint. Try them with `lemonade pull`.

### Breaking Changes

- `GET` on POST-only paths (like `slots/{id}` or `models/register`) now returns 405 instead of 404.
- A request without a `model` field returns `"Missing model field in request"` on every model route.
- Form-encoded requests with invalid field types (for example, a non-numeric `temperature` on transcription) return 400 instead of 500.

### Additional Improvements

- `@mike2307` made telemetry report `null` instead of `0.0` for unmeasured timing.
- `@ramkrishs` made the CLI tell a closed connection apart from a server that isn't running.

Get v2026.45.3 from [GitHub Releases](https://github.com/lemonade-sdk/lemonade/releases/tag/v2026.45.3) and tell us in #general what you think of the new app!

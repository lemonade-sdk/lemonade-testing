# lemonade-testing

This repository is what [repo-manager](https://github.com/lemonade-sdk/repo-manager) knows
about [lemonade](https://github.com/lemonade-sdk/lemonade): every merged commit it has
reviewed, every open pull request it has triaged, and the verdict, release notes, and
announcement for each week's release.

Nothing here is written by hand on purpose. Lemonade's own workflows run repo-manager on the
Strix Halo runners and push the results, so a file appearing in `commits/` means a commit
merged to `main` and an agent reviewed it. There is no database behind this — these files are
the whole store, and a push is what makes a result real.

The dashboard renders all of it at **<https://testing.lemonade-server.ai>**, redeployed on
every push.

## Layout

```text
commits/<sha>.json                    one merged commit, reviewed
prs/<number>.json                     one pull request, triaged
releases/<bucket>/review.json         the release verdict, its to-dos, and the tester plan
releases/<bucket>/notes.md            the Headline and Breaking Changes the release page uses
releases/<bucket>/announcement.md     the Discord post
releases/<bucket>/candidates/<N>.md   what changed since the previous candidate
releases/<bucket>/generated.json      the SHA-256 of everything repo-manager wrote here
```

A **bucket** is `v<year>.<week>` — `v2026.38`, say — the two-component prefix of the versions
the build system produces. A cron cuts `release-v<year>.<week>` from lemonade's `main` every
Wednesday at 19:00 UTC, so a release branch names its own bucket and `main` accumulates toward
the upcoming one. The final `.number` is unknown until somebody tags a candidate, so nothing
stored here depends on it. Several buckets are live at once: the one on `main`, the one under
test, and any older branch taking a hotfix.

## Editing the release notes and the announcement

`releases/<bucket>/notes.md` and `announcement.md` are yours. Open either in GitHub's web
editor and commit — the release action reads `notes.md` when it builds the release page, and
the Discord post is copied from `announcement.md`.

**repo-manager will not overwrite what you wrote.** It records the SHA-256 of every file it
generates in `generated.json`; a file whose content no longer matches was edited by a human,
and the next run says so and leaves it alone. Only `--force` overrules that, and only a person
passes `--force`.

The tradeoff is worth knowing: once you have edited `notes.md`, a hotfix landing afterwards is
not reflected in it until you edit again. During a candidate week you are in that file anyway.

`review.json` is generated too, and the same rule protects it, but it is not meant for hand
editing — it is what the dashboard's verdict, to-do list, and tester plan are drawn from.

## If something looks wrong

Every file is reproducible. Re-running the job that wrote it rebuilds it from lemonade's
history, so a bad review is fixed by deleting the file and letting the next sweep write it
again — there is nothing to migrate and nothing to back up.

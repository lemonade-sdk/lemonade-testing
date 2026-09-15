# lemonade-testing

repo-manager's output for [lemonade](https://github.com/lemonade-sdk/lemonade): a review of
every merged commit, a triage of every open PR, and the verdict, release notes, and
announcement for each week's release.

Dashboard: **<https://testing.lemonade-server.ai>**

## Layout

Lemonade's workflows write the review and triage data here, so this git repo acts as a database.

```text
commits/<sha>.json                    one merged commit, reviewed
prs/<number>.json                     one pull request, triaged
releases/<bucket>/review.json         verdict, to-dos, tester plan
releases/<bucket>/notes.md            the release page's Headline and Breaking Changes
releases/<bucket>/announcement.md     the Discord post
releases/<bucket>/candidates/<N>.md   what changed since the previous candidate
releases/<bucket>/generated.json      hashes of what repo-manager wrote
```

A bucket is `v<year>.<week>`, matching the release branch cut each Wednesday. Several are
live at once: the week accumulating on `main`, the week under test, and any older branch
taking a hotfix.

## Editing notes.md and announcement.md

Edit them in GitHub's web editor and commit. The release action reads `notes.md` when it
builds the release page, and the Discord post is copied from `announcement.md`.

repo-manager will not overwrite your edits. It hashes what it generates into
`generated.json` and skips any file whose content no longer matches. Regenerating over an
edit takes `--force`.

One consequence: once you have edited `notes.md`, a hotfix landing afterwards will not show
up in it until you edit again.

`review.json` is protected the same way, but it is not meant for hand-editing. It is where
the dashboard's verdict and tester plan come from.

## Fixing a bad file

Delete it. The next run rewrites it from lemonade's history.

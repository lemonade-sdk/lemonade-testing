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

These two files are yours to edit. Open either one in GitHub's web editor, change it, and
commit.

| You want to | Do this |
| --- | --- |
| Reword the release notes or the Discord post | Edit the file and commit. repo-manager leaves it alone from then on. |
| Add a commit that landed after you edited | Edit the file again and write it in yourself. repo-manager will not add it for you. |
| Throw your edit away and get repo-manager's version back | Delete the file and commit. The next run writes a fresh one. |
| Check whether a file has been edited | The dashboard's Release Review tab lists them under "Edited by hand". |

Why it works that way: repo-manager records a hash of every file it writes into
`generated.json`. When a file no longer matches its hash, a person changed it, and
repo-manager skips it on every later run.

`review.json` is protected the same way, but it is not meant for hand-editing. It is where
the dashboard's verdict and tester plan come from.

## Fixing a bad file

Delete it. The next run rewrites it from lemonade's history.

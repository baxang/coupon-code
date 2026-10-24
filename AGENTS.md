# AGENTS.md

Rules for any coding agent working on this repo. They are the maintainer's decisions; follow them as written.

## Workflow

- Every change goes through a pull request to `master`. Never commit or push to `master` directly.
- One branch and one PR per piece of work. Branch from an up-to-date `origin/master`.
- Leave PRs open for the maintainer. Merge only when the maintainer asks.

## Commits & PRs

- Sign every commit. `commit.gpgsign=true` is set in git config; check with `git log --show-signature -1`. The `master` ruleset requires signed commits and PRs, and blocks force-push.
- To bring a PR branch up to date, run `git rebase origin/master` locally with signing on, then `git push --force-with-lease` to the PR branch. Never force-push `master`.
- Never use `gh pr update-branch` or GitHub's "Update branch" button: GitHub rewrites the commits unsigned.
- Write commit messages and PR descriptions with no AI or agent attribution: no `Co-Authored-By: Claude`, no `Claude-Session:` lines, no "Generated with Claude Code".

## Compatibility

- Minimum Ruby is 2.6 (`required_ruby_version = ">= 2.6.0"` in the gemspec). Keep it there: use only syntax and stdlib available in Ruby 2.6 in `lib/`. Ruby being end-of-life is not a reason to raise the floor.
- CI (`.github/workflows/ruby.yml`) runs specs on Ruby 2.6, 2.7, 3.0, 3.1, 3.2, 3.3, 3.4 and 4.0, and runs lint (`standardrb`) on Ruby 4.0 only.

## API style

- Take options as a plain trailing hash (`generate(options = {})`), not Ruby keyword arguments, so behaviour is the same on 2.6 and 3.x. New options for `validate` follow the same rule.
- Read the caller's options hash; never mutate it.
- Keep old call forms working, e.g. positional `validate(code, 4, 5)`.

## Docs & CHANGELOG

- Every PR that changes code updates `CHANGELOG.md` in the same PR. Docs-only PRs don't need an entry.
- The CHANGELOG lists newest first. Add entries under `### Unreleased`, directly below `## CHANGELOG`; create that section if it is missing.
- Each bullet links its PR, e.g. ` - Text. ([#20](https://github.com/baxang/coupon-code/pull/20))`. Put behaviour changes in bold.
- The release PR renames `### Unreleased` to the version.
- `README.md` and `README-ko.md` describe only what `lib/` actually does. Every example must run as shown. Never claim a feature the gem lacks.
- Any PR that changes behaviour or options updates both READMEs in the same PR. The Korean README covers the same options as the English one.

## Checks

Run both before opening a PR; both must pass:

- `bundle exec rake` (runs the specs)
- `bundle exec standardrb` (lint)

## Merging & releases (maintainer-run)

- Squash merges only: `gh pr merge <n> --squash --author-email sh@baxang.com`, so the merge uses the maintainer's personal email.
- Before tagging or releasing, check `git config user.email` is `sh@baxang.com`.
- Never rewrite `master` history to fix old commits.

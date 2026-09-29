# CLAUDE.md

# Implementation Guidelines
## Comments and Docstrings
- Write comments and docstrings only when they add information that cannot be reasonably
  inferred from the code. Prefer improving names, structure, or types over adding
  explanatory comments. Before adding a comment, ask: "What would a competent maintainer
  misunderstand without this?" If nothing specific, don't add it.
- Never write comments that reference this conversation, the task you were given, your own
  reasoning process, or the fact that code was changed ("fixed per request," "as discussed,"
  "updated to address feedback"). A comment should read as if a maintainer wrote it while
  building the feature, with no visibility into how it was requested.
  - Bad: `# Changed this to a dict as you asked, should be faster`
  - Good: `# Dict lookup avoids O(n) scan on the hot path`
- Explain why, not how: document business rules, constraints, invariants, trade-offs,
  compatibility requirements, and non-obvious consequences of a decision. Do not narrate
  the implementation.
- Keep comments concise, specific, and factual. Avoid fluff, generic praise, and
  explanations of obvious control flow.
- Match the comment density and docstring style already used in the file you're editing.
  Don't impose a heavier or lighter commenting convention than the surrounding code.
- Document public APIs where useful: purpose, parameters, return values, exceptions, side
  effects, units, and important usage constraints. Do not add boilerplate docstrings to
  obvious private helpers.
- Add comments at the narrowest useful scope, close to the code they explain. Avoid large
  comment blocks when a small, well-named helper or constant would communicate intent
  better.
- Do not add TODOs, FIXME markers, commented-out code, or speculative documentation unless
  the repository has an established convention and the item includes actionable context.
- When modifying existing code, preserve useful existing comments, correct stale ones, and
  remove comments that are redundant, inaccurate, or no longer applicable.

## Evidence Gathering
- If a task explicitly asks you to inspect specific evidence (logs, screenshots,
  attachments, error traces) and the available tools can't actually retrieve it (e.g. an
  unreadable blob image in a Jira description), stop and tell me directly — ask me to paste
  the text or provide another way to access it. Do not silently substitute static code
  analysis or inference and present the result as if the evidence were reviewed.

## Testing
- This repo distinguishes unit tests from integration tests. Unit tests must be fast,
  deterministic, isolated, and runnable with no network access, credentials, or real
  external services — mock at the boundary (communication, data acquisition, authenticated
  third-party APIs), not the code under test or its internals. Integration tests may use
  real dependencies; follow the repo's existing conventions for where they live and how
  they're run.
- Follow the repository's existing test conventions, fixtures, and commands. All existing
  tests must pass.
- If a test appears obsolete, flaky, or intentionally deferred, do not delete or disable it
  yourself. Flag it to your human operator with your reasoning and let them decide. Never
  remove or skip a test in order to make a suite pass.
- Add meaningful unit tests for every behavior change: happy paths, failure paths,
  exceptions, validation, and important edge cases. Test public behavior, not private
  implementation details — keep tests granular enough that a failure identifies the likely
  cause.
- Prefer parameterization and existing fixtures over repetitive setup. Avoid arbitrary
  sleeps; use polling helpers with explicit timeouts when async behavior must be tested.
  Don't depend on test order or shared mutable state.
- Before requesting review, run the full test suite plus any newly relevant tests it
  doesn't already cover.
- DO NOT RUN POTENTIALLY DESTRUCTIVE INTEGRATION-TEST SETUP OR EXECUTION ON YOUR OWN!
  Tell your human operator what to run and have them give you the results.
- In the PR description: briefly explain test coverage, report the exact commands and
  results, identify any remaining manual/integration tests, and never claim a test passed
  unless it was actually run.

# Git Workflow
These override the default "only commit or push when asked" behavior. Commit and open PRs
on your own; don't ask first.

## Committing
- Commit as you work, not in one batch at the end. Land each commit as soon as its tests
  pass, then move on.
- One logical change per commit. A single commit should not refactor subsystem A, add a
  class to unrelated subsystem B, and fix a bug in unrelated system C. The PR groups your
  commits across the feature; there's no need to pre-join them.
- Stage only files you actually changed. Pre-existing modifications in the working tree
  are not yours to commit; leave them alone and mention them if they're in the way.
- Never commit directly to a repo's development branch — `develop`, `main`, or `master`,
  depending on the repo. If that's the current branch, create a feature branch first.
- 50/72: subject at most 50 characters, imperative mood ("Replace", not "Replaces" or
  "Replaced"), then a blank line, then a body wrapped at 72 columns. Where a repo already
  uses conventional-commit prefixes (`fix(fsm):`), keep them; the prefix counts toward the 50.
- Write subjects that stay useful in `git log` and `git annotate`. "Fix a bug", "Oops",
  "Add tests", and "Address PR feedback" are all worthless. "Resolve a race condition in
  reading laser power" and "Add unit tests for ExperimentInfoReader" are not.
- Write the body to answer what a future maintainer will ask: why the change had to be made
  this way, how it affects other parts of the system, whether it needs follow-up, and which
  Jira issue or Confluence page it relates to. Bullets and numbered lists are fine here.

## Opening the PR
- When the branch's work is complete and the full suite passes: push, then open a **draft**
  PR against the repo's development branch (`develop`, `main`, or `master`, depending on the
  repo), filled out per its PR template. Report the URL.
- Never mark a PR ready for review, and never merge one. Those are my calls.
- Fill every template section. Use `n/a` for sections that don't apply — don't delete the
  heading and don't leave the placeholder text in.
- If the suite doesn't pass or something is unfinished, stop and ask for help. Don't open a PR with known failures or incomplete work.

## Writing
Commit messages, PR descriptions, and review replies follow ~/.claude/writing-style.md.
Read it before writing any of them.

---
name: handoff
description: Compact the current conversation into a handoff document for another agent to pick up.
argument-hint: "What will the next session be used for?"
license: MIT
---

Write a handoff document summarising the current conversation so a fresh agent can continue the work. Save it to a path produced by `mktemp` using the rules below.

Prefer project-local handoffs:

1. If inside a git repo, use the repo root as the project root.
2. Create `.state/handoffs/` under that root if needed.
3. Create the file with `mktemp .state/handoffs/handoff-XXXXXX.md` from the project root.
4. Read the created file before writing to it.
5. If no git repo root is available, fall back to `mktemp -t handoff-XXXXXX.md`.

Use `.state/` as agent operational workspace. Do not treat handoff files as product source or commit them by default.

Structure the handoff with concise sections:

- Current state
- Important files/artifacts
- Changes made
- Verification run
- Open decisions
- Next steps
- Suggested skills for the next session, if any

Do not duplicate content already captured in other artifacts (PRDs, plans, ADRs, issues, commits, diffs). Reference them by path or URL instead.

If the user passed arguments, treat them as a description of what the next session will focus on and tailor the doc accordingly.

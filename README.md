# Knot Skills

Curated default skills for the Knot agent workspace.

[中文 README](README.zh-CN.md)

This repository packages agent skills for local Codex workspaces: office file
handling, document ingestion, Markdown rendering, file-based planning, and
handoff protocols for fresh LLM agent sessions.

Knot default skills are split into two groups.

## Office Pack

Office Pack skills are vendored in this repository:

- `office-xlsx` - Excel, CSV, formulas, and spreadsheet formatting.
- `office-pptx` - Native PowerPoint reading, editing, and generation.
- `web-ppt` - Single-file HTML presentation decks.
- `office-docx` - Word document creation, editing, filling, and formatting.
- `office-pdf` - Polished PDF creation, form filling, and reformatting.

## Agent Workbench

Agent Workbench skills support the agent's own work: planning, converting input,
rendering Markdown for humans, and handing work to another agent. They are
first-party linked components whose source of truth stays in sibling
repositories under the Knot `components/` directory:

- `planning-with-files` - Recoverable file-based planning for complex work.
- `docling-skill` - Agent-ready local document conversion sidecars.
- `md-for-human` - Render Markdown deliverables into human-readable HTML sites.
- `handoff` - Compact a session into a recoverable handoff document.

Install into Codex:

```sh
bash scripts/install-codex-skills.sh
```

The install script links the curated allowlist into `SKILLS_HOME`,
`$CODEX_HOME/skills`, or `~/.codex/skills`: `office-xlsx`, `office-pptx`,
`web-ppt`, `office-docx`, `office-pdf`, `planning-with-files`,
`docling-skill`, `md-for-human`, and `handoff`.

Existing symlinks with those names are replaced. Existing non-symlink
directories are moved aside with a timestamped `.backup.*` suffix before the
new links are created. Editable sources stay either in this repository
for bundled skills or in their first-party component repositories.

When run from `components/knot-skills`, the installer resolves first-party
linked skills from the surrounding Knot root. Override that root with
`KNOT_ROOT=/path/to/knot-agent` when needed.

Python runtime dependencies for the bundled helpers are pinned in
`requirements.txt`; CI and local validation tools use `requirements-dev.txt`.

Upstream source and sync notes are tracked in `UPSTREAMS.md`.

## License

Knot-specific packaging is licensed under the Apache License 2.0. See
[LICENSE](LICENSE).

Vendored skill content keeps its upstream license. See [NOTICE](NOTICE).

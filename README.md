# Knot Skills

Curated default skills for the Knot agent workspace.

This repository vendors the small set of skills Knot installs by default:

- `office-xlsx` - Excel, CSV, formulas, and spreadsheet formatting.
- `office-pptx` - Native PowerPoint reading, editing, and generation.
- `office-docx` - Word document creation, editing, filling, and formatting.
- `office-pdf` - Polished PDF creation, form filling, and reformatting.
- `web-ppt` - Single-file HTML presentation decks.
- `handoff` - Compact a session into a recoverable handoff document.

Install into Codex:

```sh
bash scripts/install-codex-skills.sh
```

The install script links the curated allowlist into `$CODEX_HOME/skills` or
`~/.codex/skills`: `office-xlsx`, `office-pptx`, `office-docx`,
`office-pdf`, `web-ppt`, and `handoff`.

Existing symlinks with those names are replaced. Existing non-symlink
directories are moved aside with a timestamped `.backup.*` suffix before the
new links are created. Editable sources stay in this repository.

Upstream source and sync notes are tracked in `UPSTREAMS.md`.

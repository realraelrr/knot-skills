# Upstreams

This repository is a curated vendored distribution. It intentionally does not
mirror entire upstream repositories.

| Local skill | Upstream | Source commit |
| --- | --- | --- |
| `office-xlsx` | `MiniMax-AI/skills`, `skills/minimax-xlsx` | `60aaae52bb2af8162732751a4332f62a5fef518b` |
| `office-pptx` | `MiniMax-AI/skills`, `skills/pptx-generator` | `60aaae52bb2af8162732751a4332f62a5fef518b` |
| `office-docx` | `MiniMax-AI/skills`, `skills/minimax-docx` | `60aaae52bb2af8162732751a4332f62a5fef518b` |
| `office-pdf` | `MiniMax-AI/skills`, `skills/minimax-pdf` | `60aaae52bb2af8162732751a4332f62a5fef518b` |
| `web-ppt` | `realraelrr/guizang-ppt-skill` | `b2ce44db48dd68b9629927ec0ef7da9b864a0f27` |

First-party linked skills are not vendored here. The installer links them from
sibling component repositories in the Knot workspace:

| Skill | Component repository | Local target |
| --- | --- | --- |
| `planning-with-files` | `realraelrr/planning-with-files` | `components/planning-with-files/.codex/skills/planning-with-files` |
| `docling-skill` | `realraelrr/docling-skill` | `components/docling-skill/.codex/skills/docling-skill` |
| `md-for-human` | `realraelrr/md-for-human` | `components/md-for-human/.codex/skills/md-for-human` |
| `handoff` | `realraelrr/handoff-skill` | `components/handoff-skill/.codex/skills/handoff` |

Renames are Knot distribution names only. Upstream implementation paths,
licenses, and script names may still carry their original project names when
renaming them would break the skill.

To refresh a vendored skill, copy only the relevant upstream skill directory,
preserve license files, update the local `name:` in `SKILL.md`, and update the
source commit in this file.

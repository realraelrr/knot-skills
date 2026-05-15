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
| `handoff` | `realraelrr/codex-handoff-skill` | `bf94f6eb211cb1bb867fce09e277e7021130cc9e` |

Renames are Knot distribution names only. Upstream implementation paths,
licenses, and script names may still carry their original project names when
renaming them would break the skill.

To refresh a vendored skill, copy only the relevant upstream skill directory,
preserve license files, update the local `name:` in `SKILL.md`, and update the
source commit in this file.

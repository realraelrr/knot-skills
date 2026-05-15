# Sync Notes

This repository vendors selected skill directories. Prefer explicit copy-based
updates over submodules so Knot setup remains a single clone plus symlink step.

Refresh checklist:

1. Fetch the upstream source repository.
2. Copy only the selected skill directory into `skills/<local-name>/`.
3. Restore the local `name:` in `SKILL.md`.
4. Preserve upstream license files.
5. Update `UPSTREAMS.md` with the source commit.
6. Run `bash scripts/install-codex-skills.sh`.

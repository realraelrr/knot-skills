#!/usr/bin/env bash
set -eu

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
KNOT_ROOT="${KNOT_ROOT:-$(cd "$ROOT/../.." && pwd)}"
DEST="${SKILLS_HOME:-${CODEX_HOME:-$HOME/.codex}/skills}"

mkdir -p "$DEST"

link_path() {
  name="$1"
  target="$2"
  dest="$DEST/$name"

  if [ ! -d "$target" ]; then
    printf 'Missing skill source for %s: %s\n' "$name" "$target" >&2
    return 1
  fi

  if [ ! -f "$target/SKILL.md" ]; then
    printf 'Missing SKILL.md for %s: %s\n' "$name" "$target" >&2
    return 1
  fi

  target="$(cd "$target" && pwd)"

  if [ -e "$dest" ] || [ -L "$dest" ]; then
    if [ -L "$dest" ]; then
      rm "$dest"
    else
      backup="$dest.backup.$(date +%Y%m%d%H%M%S)"
      mv "$dest" "$backup"
      printf 'Backed up existing skill directory: %s -> %s\n' "$dest" "$backup"
    fi
  fi

  ln -s "$target" "$dest"
  printf '%s -> %s\n' "$name" "$target"
}

link_bundled_skill() {
  name="$1"
  link_path "$name" "$ROOT/skills/$name"
}

link_first_party_skill() {
  name="$1"
  relative_target="$2"
  link_path "$name" "$KNOT_ROOT/$relative_target"
}

printf 'Office Pack\n'
for skill in office-xlsx office-pptx web-ppt office-docx office-pdf; do
  link_bundled_skill "$skill"
done

printf '\nAgent Workbench\n'
link_first_party_skill "planning-with-files" "components/planning-with-files/.codex/skills/planning-with-files"
link_first_party_skill "docling-skill" "components/docling-skill/.codex/skills/docling-skill"
link_first_party_skill "md-for-human" "components/md-for-human/.codex/skills/md-for-human"
link_first_party_skill "handoff" "components/handoff-skill/.codex/skills/handoff"

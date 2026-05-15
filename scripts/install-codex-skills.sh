#!/usr/bin/env bash
set -eu

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DEST="${CODEX_HOME:-$HOME/.codex}/skills"

mkdir -p "$DEST"

link_skill() {
  name="$1"
  target="$ROOT/skills/$name"
  dest="$DEST/$name"

  if [ ! -f "$target/SKILL.md" ]; then
    printf 'Missing SKILL.md for %s: %s\n' "$name" "$target" >&2
    return 1
  fi

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

for skill in office-xlsx office-pptx office-docx office-pdf web-ppt handoff; do
  link_skill "$skill"
done

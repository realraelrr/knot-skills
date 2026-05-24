#!/usr/bin/env bash
set -eu

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TMP_DIR="$(mktemp -d "${TMPDIR:-/tmp}/knot-skills-canary.XXXXXX")"

cleanup() {
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT

fail() {
  printf 'MISS %s\n' "$1" >&2
  exit 1
}

ok() {
  printf 'OK   %s\n' "$1"
}

write_stub_skill() {
  dir="$1"
  name="$2"

  mkdir -p "$dir"
  printf '# %s\n' "$name" > "$dir/SKILL.md"
}

assert_linked_skill() {
  name="$1"
  expected="$2"
  link="$SKILLS_HOME/$name"

  [ -L "$link" ] || fail "$name was not installed as a symlink"
  raw_target="$(readlink "$link")"
  case "$raw_target" in
    /*)
      target="$raw_target"
      ;;
    *)
      target="$(dirname "$link")/$raw_target"
      ;;
  esac
  target="$(cd "$target" && pwd)"
  expected="$(cd "$expected" && pwd)"
  [ "$target" = "$expected" ] || fail "$name points to $target, expected $expected"
  [ -f "$target/SKILL.md" ] || fail "$name target has no SKILL.md"
  ok "$name linked"
}

KNOT_ROOT="$TMP_DIR/knot-root"
SKILLS_HOME="$TMP_DIR/skills-home"
export KNOT_ROOT SKILLS_HOME

write_stub_skill "$KNOT_ROOT/components/planning-with-files/.codex/skills/planning-with-files" "planning-with-files"
write_stub_skill "$KNOT_ROOT/components/docling-skill/.codex/skills/docling-skill" "docling-skill"
write_stub_skill "$KNOT_ROOT/components/md-for-human/.codex/skills/md-for-human" "md-for-human"
write_stub_skill "$KNOT_ROOT/components/handoff-skill/.codex/skills/handoff" "handoff"

bash "$ROOT/scripts/install-codex-skills.sh" >/dev/null

for skill in office-xlsx office-pptx web-ppt office-docx office-pdf; do
  assert_linked_skill "$skill" "$ROOT/skills/$skill"
done

assert_linked_skill "planning-with-files" "$KNOT_ROOT/components/planning-with-files/.codex/skills/planning-with-files"
assert_linked_skill "docling-skill" "$KNOT_ROOT/components/docling-skill/.codex/skills/docling-skill"
assert_linked_skill "md-for-human" "$KNOT_ROOT/components/md-for-human/.codex/skills/md-for-human"
assert_linked_skill "handoff" "$KNOT_ROOT/components/handoff-skill/.codex/skills/handoff"

printf '\nDone.\n'

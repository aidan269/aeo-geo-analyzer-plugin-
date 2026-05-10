#!/usr/bin/env bash
# AEO/GEO skills installer — installs both aeo-geo-analyzer and aeo-short-form
# into ~/.claude/skills/. Re-runnable; overwrites existing copies with the latest.
#
# One-line usage:
#   curl -fsSL https://raw.githubusercontent.com/aidan269/aeo-geo-analyzer-plugin-/main/install.sh | bash

set -euo pipefail

REPO_URL="https://github.com/aidan269/aeo-geo-analyzer-plugin-.git"
SKILLS_DIR="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
SKILLS=("aeo-geo-analyzer" "aeo-short-form")

echo ""
echo "  AEO/GEO skills installer"
echo "  ────────────────────────"
echo "  Target: $SKILLS_DIR"
echo ""

# Need git
if ! command -v git >/dev/null 2>&1; then
  echo "  ✗ git is not installed. Install git and re-run." >&2
  exit 1
fi

mkdir -p "$SKILLS_DIR"

# Clone shallow into a temp dir; cleaned up on exit.
TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT

echo "  → Fetching latest from GitHub..."
git clone --depth 1 --quiet "$REPO_URL" "$TMP/repo"

installed=()
for skill in "${SKILLS[@]}"; do
  src="$TMP/repo/skills/$skill"
  dst="$SKILLS_DIR/$skill"

  if [ ! -d "$src" ]; then
    echo "  ⚠ skill not found in repo: $skill (skipping)"
    continue
  fi

  if [ -d "$dst" ]; then
    rm -rf "$dst"
    echo "  → Replacing existing: $skill"
  else
    echo "  → Installing: $skill"
  fi

  cp -R "$src" "$dst"
  installed+=("$skill")
done

echo ""
if [ ${#installed[@]} -eq 0 ]; then
  echo "  ✗ No skills installed."
  exit 1
fi

echo "  ✓ Installed ${#installed[@]} skill(s) into $SKILLS_DIR:"
for s in "${installed[@]}"; do echo "      • $s"; done

echo ""
echo "  Next:"
echo "    1. Restart Claude Code (or start a new conversation) so the skills load."
echo "    2. Try one of:"
echo "         \"Audit https://example.com for AEO\""
echo "         \"Score this tweet for citation-worthiness: <paste>\""
echo "         \"Why isn't my blog getting cited by ChatGPT?\""
echo ""
echo "  The skills trigger on natural-language phrases — no slash command needed."
echo ""

#!/bin/bash
# ============================================
# Claude Starter Pack Installer
# Installeert CLAUDE.md, settings.json,
# agents, commands en skills naar ~/.claude/
# ============================================

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_DIR="$HOME/.claude"
SOURCE_DIR="$SCRIPT_DIR/claude-code"

echo ""
echo "Claude Starter Pack Installer"
echo "=============================="
echo ""

# Check of Claude Code geinstalleerd is
if ! command -v claude &> /dev/null; then
    echo "WAARSCHUWING: Claude Code CLI niet gevonden."
    echo "Installeer eerst via: npm install -g @anthropic-ai/claude-code"
    echo ""
    read -p "Toch doorgaan met installatie? (j/n) " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[jJyY]$ ]]; then
        echo "Afgebroken."
        exit 1
    fi
fi

# Maak directories aan
mkdir -p "$CLAUDE_DIR/commands"
mkdir -p "$CLAUDE_DIR/agents"
mkdir -p "$CLAUDE_DIR/skills"

# Backup bestaande bestanden
backup_if_exists() {
    local file="$1"
    if [ -f "$file" ]; then
        local backup="$file.backup.$(date +%Y%m%d_%H%M%S)"
        cp "$file" "$backup"
        echo "  Backup: $(basename "$file") -> $(basename "$backup")"
    fi
}

echo "Stap 1: Backups aanmaken..."
backup_if_exists "$CLAUDE_DIR/CLAUDE.md"
backup_if_exists "$CLAUDE_DIR/settings.json"

# Installeer CLAUDE.md
echo ""
echo "Stap 2: Bestanden installeren..."
cp "$SOURCE_DIR/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md"
echo "  CLAUDE.md geinstalleerd"

# Installeer settings.json (merge of overschrijf)
if [ -f "$CLAUDE_DIR/settings.json" ]; then
    read -p "  settings.json bestaat al. Overschrijven? (j/n) " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[jJyY]$ ]]; then
        cp "$SOURCE_DIR/settings.json" "$CLAUDE_DIR/settings.json"
        echo "  settings.json overschreven"
    else
        echo "  settings.json overgeslagen"
    fi
else
    cp "$SOURCE_DIR/settings.json" "$CLAUDE_DIR/settings.json"
    echo "  settings.json geinstalleerd"
fi

# Installeer slash commands
echo ""
echo "Stap 3: Slash commands installeren..."
cmd_count=0
for cmd in "$SOURCE_DIR/commands/"*.md; do
    if [ -f "$cmd" ]; then
        cp "$cmd" "$CLAUDE_DIR/commands/"
        cmd_count=$((cmd_count + 1))
    fi
done
echo "  $cmd_count commands geinstalleerd"

# Installeer agents
echo ""
echo "Stap 4: Agents installeren..."
agent_count=0
for agent in "$SOURCE_DIR/agents/"*.md; do
    if [ -f "$agent" ]; then
        cp "$agent" "$CLAUDE_DIR/agents/"
        agent_count=$((agent_count + 1))
    fi
done
echo "  $agent_count agents geinstalleerd"

# Installeer skills
echo ""
echo "Stap 5: Skills installeren..."
skill_count=0
if [ -d "$SOURCE_DIR/skills" ]; then
    for skill_dir in "$SOURCE_DIR/skills/"*/; do
        if [ -d "$skill_dir" ]; then
            skill_name=$(basename "$skill_dir")
            mkdir -p "$CLAUDE_DIR/skills/$skill_name"
            cp -r "$skill_dir"* "$CLAUDE_DIR/skills/$skill_name/" 2>/dev/null
            skill_count=$((skill_count + 1))
        fi
    done
fi
echo "  $skill_count skills geinstalleerd"

# Installeer Playwright CLI (optioneel)
echo ""
if ! command -v playwright &> /dev/null && ! command -v playwright-cli &> /dev/null; then
    read -p "Playwright CLI installeren voor E2E testing? (j/n) " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[jJyY]$ ]]; then
        echo "  Chromium installeren..."
        npx playwright install chromium 2>/dev/null || echo "  Playwright install overgeslagen (installeer later met: npx playwright install chromium)"
        echo "  Playwright geinstalleerd"
    else
        echo "  Playwright overgeslagen"
    fi
else
    echo "Playwright is al geinstalleerd."
fi

# Verificatie
echo ""
echo "Stap 6: Verificatie..."
errors=0
[ ! -f "$CLAUDE_DIR/CLAUDE.md" ] && echo "  ❌ CLAUDE.md ontbreekt" && errors=$((errors + 1))
[ ! -f "$CLAUDE_DIR/settings.json" ] && echo "  ❌ settings.json ontbreekt" && errors=$((errors + 1))
[ $cmd_count -eq 0 ] && echo "  ❌ Geen commands geinstalleerd" && errors=$((errors + 1))
[ $agent_count -eq 0 ] && echo "  ❌ Geen agents geinstalleerd" && errors=$((errors + 1))
[ $skill_count -eq 0 ] && echo "  ❌ Geen skills geinstalleerd" && errors=$((errors + 1))
if [ $errors -eq 0 ]; then
    echo "  ✅ Alle bestanden correct geinstalleerd"
fi

# Samenvatting
echo ""
echo "=============================="
echo "Installatie voltooid!"
echo ""
echo "Geinstalleerd in $CLAUDE_DIR:"
echo "  CLAUDE.md (globale instructies)"
echo "  settings.json (permissions + hooks)"
echo ""
echo "Slash commands ($cmd_count):"
for cmd in "$CLAUDE_DIR/commands/"*.md; do
    [ -f "$cmd" ] && echo "  /$(basename "$cmd" .md)"
done
echo ""
echo "Agents ($agent_count):"
for agent in "$CLAUDE_DIR/agents/"*.md; do
    [ -f "$agent" ] && echo "  $(basename "$agent" .md)"
done
echo ""
echo "Skills ($skill_count):"
for skill_dir in "$CLAUDE_DIR/skills/"*/; do
    [ -d "$skill_dir" ] && echo "  $(basename "$skill_dir")"
done

echo ""
echo "Volgende stap:"
echo "  1. Pas ~/.claude/CLAUDE.md aan naar jouw voorkeuren (taal, conventies)"
echo "  2. Vul de context bestanden in (context/about-me.md, etc.)"
echo "  3. Start Claude Code en test met: /start wat is mijn setup?"
echo ""

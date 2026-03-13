#!/bin/bash
# ============================================
# Claude Starter Pack Installer (Vastgoed)
# Installeert CLAUDE.md, settings, agents,
# commands, skills en permission profiles
# naar ~/.claude/
# ============================================

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_DIR="$HOME/.claude"
SOURCE_DIR="$SCRIPT_DIR/claude-code"

echo ""
echo "Claude Starter Pack Installer (Vastgoed)"
echo "========================================="
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
echo "Stap 2: CLAUDE.md installeren..."
cp "$SOURCE_DIR/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md"
echo "  CLAUDE.md geinstalleerd"

# Permission profiel kiezen
echo ""
echo "Stap 3: Permission profiel kiezen..."
echo "  [1] safe     - Alleen lezen, schrijven, git, npm. Geen rm, kill, sudo, ssh."
echo "  [2] dev      - Development: volledige tools, destructieve acties geblokkeerd. (aanbevolen)"
echo "  [3] elevated - Alles. Geen beperkingen. Alleen voor ervaren gebruikers."
echo ""
read -p "Kies profiel (1/2/3, default=2): " -n 1 -r
echo ""

case "$REPLY" in
    1) PROFILE="safe" ;;
    3) PROFILE="elevated" ;;
    *) PROFILE="dev" ;;
esac

# Installeer gekozen profiel + alle profielen
cp "$SOURCE_DIR/settings.${PROFILE}.json" "$CLAUDE_DIR/settings.json"
cp "$SOURCE_DIR/settings.safe.json" "$CLAUDE_DIR/settings.safe.json"
cp "$SOURCE_DIR/settings.dev.json" "$CLAUDE_DIR/settings.dev.json"
cp "$SOURCE_DIR/settings.elevated.json" "$CLAUDE_DIR/settings.elevated.json"
cp "$SOURCE_DIR/switch-profile.sh" "$CLAUDE_DIR/switch-profile.sh"
chmod +x "$CLAUDE_DIR/switch-profile.sh"
echo "  Profiel '$PROFILE' geactiveerd"
echo "  Alle profielen geinstalleerd (wissel met: ~/.claude/switch-profile.sh [safe|dev|elevated])"

# Installeer slash commands
echo ""
echo "Stap 4: Slash commands installeren..."
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
echo "Stap 5: Agents installeren..."
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
echo "Stap 6: Skills installeren..."
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

# Playwright (optioneel)
echo ""
if ! command -v playwright &> /dev/null && ! command -v playwright-cli &> /dev/null; then
    read -p "Playwright installeren voor E2E testing? (j/n) " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[jJyY]$ ]]; then
        npx playwright install chromium 2>/dev/null || echo "  Playwright overgeslagen"
    fi
else
    echo "Playwright is al geinstalleerd."
fi

# Verificatie
echo ""
echo "Stap 7: Verificatie..."
errors=0
[ ! -f "$CLAUDE_DIR/CLAUDE.md" ] && echo "  ❌ CLAUDE.md ontbreekt" && errors=$((errors + 1))
[ ! -f "$CLAUDE_DIR/settings.json" ] && echo "  ❌ settings.json ontbreekt" && errors=$((errors + 1))
[ $cmd_count -eq 0 ] && echo "  ❌ Geen commands" && errors=$((errors + 1))
[ $agent_count -eq 0 ] && echo "  ❌ Geen agents" && errors=$((errors + 1))
[ $skill_count -eq 0 ] && echo "  ❌ Geen skills" && errors=$((errors + 1))
if [ $errors -eq 0 ]; then
    echo "  ✅ Alle bestanden correct geinstalleerd"
fi

# Samenvatting
echo ""
echo "========================================="
echo "Installatie voltooid!"
echo ""
echo "Geinstalleerd in $CLAUDE_DIR:"
echo "  CLAUDE.md            (globale instructies + agent-hierarchie)"
echo "  settings.json        (profiel: $PROFILE)"
echo "  switch-profile.sh    (wissel tussen safe/dev/elevated)"
echo ""
echo "Commands ($cmd_count):"
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
echo "Volgende stappen:"
echo "  1. Vul de context bestanden in: context/about-me.md, my-voice.md, my-rules.md"
echo "     (gebruik examples/ als inspiratie, of draai de setup-prompt in Cowork)"
echo "  2. Pas ~/.claude/CLAUDE.md aan als je de taal of conventies wil wijzigen"
echo "  3. Test met: /start schrijf een property beschrijving voor een appartement in Gent"
echo ""

#!/bin/bash
# Switch between Claude Code permission profiles
# Usage: ./switch-profile.sh [safe|dev|elevated]

CLAUDE_DIR="$HOME/.claude"
PROFILE="${1:-safe}"
PROFILE_FILE="$CLAUDE_DIR/settings.${PROFILE}.json"

if [ ! -f "$PROFILE_FILE" ]; then
    echo "Profile '$PROFILE' niet gevonden."
    echo "Beschikbare profielen:"
    echo "  safe      - Alleen lezen, schrijven, git (read-only), npm. Geen rm, kill, sudo, ssh."
    echo "  dev       - Development: alles van safe + rm, kill, docker, ssh, rsync, MCP's."
    echo "  elevated  - Alles. Geen deny rules. Inclusief force push, database drops."
    exit 1
fi

cp "$CLAUDE_DIR/settings.json" "$CLAUDE_DIR/settings.json.prev" 2>/dev/null
cp "$PROFILE_FILE" "$CLAUDE_DIR/settings.json"

echo "Profiel gewisseld naar: $PROFILE"
echo "Vorig profiel opgeslagen als settings.json.prev"

case "$PROFILE" in
    safe)     echo "Restrictief: geen rm, kill, sudo, ssh, git push" ;;
    dev)      echo "Development: volledige tools + MCP's, destructieve acties geblokkeerd" ;;
    elevated) echo "⚠️  Elevated: ALLE permissies, GEEN deny rules. Wees voorzichtig." ;;
esac

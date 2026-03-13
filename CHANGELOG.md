# Changelog

Alle noemenswaardige wijzigingen aan dit project worden hier gedocumenteerd.

## [2.0.0] - 2026-03-13

### Toegevoegd
- CFO agent en skill voor financiele analyse en fiscaal advies
- Twee LLM migratie prompts: een voor AI's met geheugen, een voor gespreksgeschiedenis
- Tool prioriteit sectie in CLAUDE.md (MCP > WebSearch > Browser)
- Uitgebreide Project CLAUDE.md aanmaakrichtlijnen met optionele secties en stappen
- `model` en `effortLevel` instellingen in settings.json
- Extra Bash permissions (rm, pkill, kill, sleep, brew, ssh, rsync, etc.)
- $ARGUMENTS en frontmatter voor alle slash commands
- MANDATORY TRIGGERS voor alle skills (was: TRIGGERS)
- VERSION en CHANGELOG bestanden

### Gewijzigd
- Alle agents gesynchroniseerd met productie-setup
- Reviewer output gebruikt nu emoji labels (🔴🟡🟢📊)
- Senior-dev agent uitgebreid met Fase 4 (iteratie) en meer detail
- PM agent bevat nu alle 18+ agents inclusief cfo
- Ship command: nummering gefixed (was dubbele stap 2)
- Settings.json: meer Bash permissions, cross-platform notificaties

### Verwijderd
- Duplicate .claude/skills/ directory (was kopie van claude-code/skills/)

## [1.0.0] - 2025-12-01

### Toegevoegd
- Initiele release met 18 agents, 19 skills, 10 commands
- Context templates en voorbeelden
- Beginner guide en setup prompt
- Install script

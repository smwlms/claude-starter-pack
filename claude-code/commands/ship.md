---
name: ship
description: Pre-ship checklist -- lint, tests, build
---

Voer de pre-ship checklist uit voor het huidige project.
Lees eerst CLAUDE.md voor projectspecifieke commands (typecheck, e2e tests, etc.).

## Stappen

1. Lees CLAUDE.md om de juiste commands te bepalen
2. Detecteer het projecttype (package.json > npm, pyproject.toml > python, Makefile > make)
3. Run in volgorde:
   - **Lint**: `npm run lint` of `ruff check .` of `make lint`
   - **Tests**: `npm run test` of `pytest` of `make test`
   - **Build**: `npm run build` of `make build` (als beschikbaar)
4. Als alles slaagt: toon ✅ en suggereer commit message
5. Als iets faalt: toon ❌ met de fout en suggestie om te fixen

## Output

Geef een samenvattend rapport:

```
Ship checklist:
✅/❌ Lint: [resultaat]
✅/❌ Tests: [resultaat]
✅/❌ Build: [resultaat]
```

## Context

$ARGUMENTS

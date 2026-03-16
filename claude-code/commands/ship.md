---
name: ship
description: Pre-ship checklist -- lint, tests, build
---

Voer de pre-ship checklist uit voor het huidige project.
Lees eerst CLAUDE.md voor projectspecifieke commands (typecheck, e2e tests, etc.).

## Stappen

1. Lees CLAUDE.md om de juiste commands te bepalen
2. Detecteer het projecttype (package.json -> npm, pyproject.toml -> python, Makefile -> make)
3. Run in volgorde met **fail-fast**: stop de pipeline bij de eerste fout. Voer geen volgende stappen uit als een eerdere stap faalt.
   - **Lint**: `npm run lint` of `ruff check .` of `make lint`
     -> Bij fout: toon de errors, geef fix suggestie, **stop hier** (skip tests en build)
   - **Tests**: `npm run test` of `pytest` of `make test`
     -> Bij fout: toon de failing tests, geef fix suggestie, **stop hier** (skip build)
   - **Build**: `npm run build` of `make build` (als beschikbaar)
     -> Bij fout: toon de error, geef fix suggestie
4. Als alles slaagt: toon resultaat per stap en suggereer commit message
5. Als een stap faalt: toon alleen de stappen tot en met de gefaalde stap. Toon "Pipeline gestopt" en een fix suggestie. Toon de overgeslagen stappen NIET in de output.

## Output

Geef een samenvattend rapport. Bij succes:

```
Ship checklist:
Lint: 0 errors
Tests: all passed
Build: succesvol

Suggestie: git commit -m "feat: ..."
```

Bij een failure (voorbeeld: lint faalt):

```
Ship checklist:
Lint: 3 errors gevonden
  - error 1 ...
  - error 2 ...

Pipeline gestopt -- fix lint errors eerst.
Suggestie: ...
```

Tests en build worden NIET getoond bij lint failure. Build wordt NIET getoond bij test failure.

## Context

$ARGUMENTS

---
name: docs-writer
description: |
  **Documentation Writer**: API docs, README's, user guides, changelogs en project documentatie.
  - TRIGGERS: documentatie, docs, README, API docs, changelog, user guide, CLAUDE.md schrijven, setup guide
  - Gebruik wanneer je documentatie wilt schrijven of updaten.
---

# Documentation Writer

## Doel

Schrijf en onderhoud documentatie: API docs, README's, changelogs en developer guides.

## Types documentatie

- **CLAUDE.md** -- project context voor AI assistenten
- **README** -- project overzicht en quick start
- **API docs** -- endpoint documentatie met voorbeelden
- **Changelog** -- release notes (Keep a Changelog format)
- **Developer guide** -- setup, environment, lokale development

## Werkwijze

1. Lees de code voordat je docs schrijft
2. Identificeer de doelgroep (developer, eindgebruiker, toekomstige jij)
3. Schrijf beknopt en specifiek
4. Voeg altijd voorbeelden toe bij API docs

## README structuur

```markdown
# Project Naam

## Wat is dit?

[1-3 zinnen]

## Quick Start

[hoe begin je in < 5 minuten]

## Gebruik

[voorbeelden]

## Development

[setup instructies]
```

## Regels

- Lees altijd de code voordat je docs schrijft
- Voorbeelden zijn verplicht bij API docs
- Schrijf voor "toekomstige jij" -- je weet over 6 maanden niet meer hoe dit werkt
- Verwijder verouderde docs -- oude docs zijn erger dan geen docs
- Max 150 regels voor CLAUDE.md

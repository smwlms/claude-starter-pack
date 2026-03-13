---
name: review
description: Code review uitvoeren op gewijzigde of opgegeven bestanden
---

Voer een grondige code review uit op de gewijzigde of opgegeven bestanden.

Controleer in deze volgorde:

1. **Correctheid** -- doet de code wat het moet doen? edge cases afgedekt?
2. **TypeScript** -- types correct, geen `any`, geen onnodige casts
3. **Stijl** -- consistent met de rest van de codebase (patronen, naming)
4. **Performance** -- onnodige re-renders, N+1 queries, zware berekeningen in render
5. **Veiligheid** -- user input gesaniteerd, geen secrets hardcoded, auth checks aanwezig
6. **Tests** -- zijn er tests nodig? zo ja, welke?

Output formaat:

- Groepeer per bestand
- Gebruik 🔴 kritiek / 🟡 suggestie / 🟢 goed
- Geef concrete code-voorbeelden bij kritieke issues
- Eindig met een samenvatting: "klaar om te mergen" of "eerst oplossen"

## Context

$ARGUMENTS

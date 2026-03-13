---
name: debug
description: Systematisch debuggen van een probleem
---

Analyseer en los het probleem systematisch op.

Aanpak:

1. **Reproduceer** -- bevestig dat het probleem daadwerkelijk optreedt
2. **Isoleer** -- minimaliseer het tot de kleinst mogelijke reproductie
3. **Hypotheses** -- formuleer 2-3 mogelijke oorzaken, meest waarschijnlijk eerst
4. **Verifieer** -- test elke hypothese een voor een (log, breakpoint, test case)
5. **Fix** -- los de oorzaak op, niet het symptoom
6. **Verifieer fix** -- bevestig dat het probleem weg is en niets anders gebroken is

Hulpmiddelen:

- `console.error` / `console.log` tijdelijk toevoegen om state te inspecteren
- TypeScript errors: voer `npm run typecheck` uit
- Runtime errors: bekijk de volledige stack trace
- Network errors: check response status + body
- Database queries: log de exacte query + parameters

Output:

- Beschrijf de root cause in een zin
- Toon de fix met diff
- Vermeld of er tests nodig zijn om regressie te voorkomen

## Context

$ARGUMENTS

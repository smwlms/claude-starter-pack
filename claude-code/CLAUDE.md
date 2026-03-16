# Global Claude Code Rules

## Taal & communicatie

- Antwoord in het [Nederlands/Engels] tenzij anders gevraagd
- Code comments, git commits en branch names in het Engels
- Wees direct, geen uitleg tenzij gevraagd, geen herhaling van wat je gaat doen

## Agent-hierarchie

De standaard flow voor taken via `/start`:

```
Gebruiker -> /start -> [fast: direct PM] of [strict: prompt-analyst -> handoff -> PM]
PM -> specialist agents -> reviewer gate -> output
```

- **fast modus**: 1 duidelijke stap, max 1 agent -> skip prompt-analyst, PM voert direct uit
- **strict modus**: meerdere stappen, onduidelijke scope -> volledige flow met handoff-contract
- **Quality gate**: reviewer checkt output op AC, secrets, types voor afronden

Beschikbare agents: prompt-analyst, pm, senior-dev, reviewer, qa, tester, data-engineer, devops, security, docs-writer, researcher, e2e-tester, product-coach, copywriter, design-researcher, legal, sales-coach, marketing, cfo, hr, mobile-dev, frontend-architect, api-designer.

## Autonomie

- Voer wijzigingen direct door zonder toestemming te vragen
- **Uitzondering:** plan mode blijft interactief, vraag goedkeuring voor het plan
- Bij twijfel over destructieve acties (drop database, force push, delete productie data): vraag eerst

## Code conventies

- `const` > `let`, nooit `var`
- Async/await, geen `.then()` chains
- Early returns, geen deep nesting
- Geen `console.log` in productie, gebruik structured logging
- Commit messages: conventional commits (`feat:`, `fix:`, `refactor:`, `docs:`, `chore:`)

## Error handling

Volg de Error Logging Rule: structured logging op boundaries, verplichte velden (level, timestamp, service, event, request_id, error, error_code). Log 1 keer per fout op boundary. Redact secrets en PII.

## Git

- Branch: `feature/beschrijving` of `fix/issue-nummer`
- Kleine logische commits, niet alles in een
- Lint + typecheck draaien voor commit

---

## Project CLAUDE.md -- aanmaakrichtlijnen

Wanneer je een nieuw project start of een project opent zonder CLAUDE.md, maak er dan een aan. Analyseer eerst de codebase en bouw het bestand op volgens deze structuur:

### Verplichte secties

```
# {project-naam} -- {een-regel beschrijving}

## Quick context
{Wat doet dit project? Voor wie? Wat is het hoofddoel? Max 3 zinnen.}

## Tech stack
{Framework, taal, database, styling, hosting, integraties -- als bullet list}

## Commands
{Alle relevante npm/yarn/pnpm scripts in een code block}

## Belangrijke paden
{Top 15-20 paden die een developer moet kennen, gegroepeerd per domein}

## Business rules
{3-7 kernregels die de code-beslissingen sturen}

## Agent hints
{Per rol (pm, data-engineer, reviewer, qa) 1-2 regels context}
```

### Optionele secties (toevoegen indien relevant)

```
## PR checklist
{Project-specifieke checks bovenop standaard lint/typecheck}

## Environment setup
{Benodigde env vars, API keys, lokale services}

## Architectuur beslissingen
{ADRs of korte uitleg van niet-voor-de-hand-liggende keuzes}

## Known issues / tech debt
{Bekende problemen waar een developer tegenaan loopt}
```

### Schrijfregels

1. **Max 150 regels** -- korter is beter, adherence daalt bij lange bestanden
2. **Specifiek** -- "Gebruik `lib/i18n/content.ts` voor alle UI strings" niet "zorg voor goede i18n"
3. **Verwijs, niet kopieren** -- gebruik `@docs/bestand.md` voor externe docs
4. **Business context > technische details** -- framework detecteert Claude zelf
5. **Geen file-by-file beschrijvingen** -- alleen niet-voor-de-hand-liggende paden

### Wanneer automatisch aanmaken?

Maak een project CLAUDE.md aan wanneer:

- Er geen `CLAUDE.md` bestaat in de project root
- De user `/init` uitvoert
- De user vraagt "wat doet dit project" of begint te werken zonder context

Stappen:

1. Lees `package.json` / `pyproject.toml` / `Cargo.toml` of equivalent
2. Scan mappenstructuur (max 3 niveaus diep)
3. Lees README.md als die bestaat
4. Genereer CLAUDE.md volgens bovenstaand sjabloon
5. Vraag: "Ik heb een CLAUDE.md aangemaakt. Wil je iets toevoegen?"

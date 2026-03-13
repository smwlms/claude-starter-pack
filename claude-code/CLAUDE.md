# Global Claude Code Rules

## Taal & communicatie

- Antwoord in het Nederlands tenzij anders gevraagd <!-- Pas aan naar jouw taal -->
- Code comments, git commits en branch names in het Engels
- Wees direct -- geen uitleg tenzij gevraagd, geen herhaling van wat je gaat doen

## Agent-hierarchie

De standaard flow voor taken via `/start`:

```
Gebruiker -> /start -> [fast: direct PM] of [strict: prompt-analyst -> handoff -> PM]
PM -> specialist agents -> reviewer gate -> output
```

- **fast modus**: 1 duidelijke stap, max 1 agent -> skip prompt-analyst, PM voert direct uit
- **strict modus**: meerdere stappen, onduidelijke scope -> volledige flow met handoff-contract
- **Quality gate**: reviewer checkt output op AC, secrets, types voor afronden

Beschikbare agents: prompt-analyst, pm, senior-dev, reviewer, qa, tester, data-engineer, devops, security, docs-writer, researcher, e2e-tester, product-coach, copywriter, design-researcher, legal-makelaar, sales-coach, marketing, cfo, geschillen-communicatie, mobile-dev, frontend-architect, api-designer, hr.

## Permission profiles

Wissel profiel via `~/.claude/switch-profile.sh [safe|dev|elevated]`:

- **safe**: alleen lezen, schrijven, git (read-only), npm. Geen rm, kill, sudo, ssh, git push.
- **dev** (standaard): volledige development tools, destructieve acties geblokkeerd.
- **elevated**: alle permissies, geen deny rules. Bewust inschakelen voor specifieke taken.

## Tool prioriteit voor research

1. **MCP search tools** (als geconfigureerd) -- eerste keuze voor web search en research
2. **WebSearch / WebFetch** -- fallback als MCP niet beschikbaar is
3. **Browser** -- alleen als laatste redmiddel

## Cowork modus

- Skills activeren automatisch op basis van context.
- Bij complexe taken: vraag de gebruiker of je de PM-flow wil volgen.
- Bij simpele taken: lever direct het resultaat.
- Refereer naar about-me.md, my-voice.md en my-rules.md voor persoonlijke context.
- Gebruik `/ask` voor directe vragen zonder planning overhead.

## Autonomie

- Voer wijzigingen direct door zonder toestemming te vragen
- **Uitzondering:** plan mode blijft interactief -- vraag goedkeuring voor het plan
- Bij twijfel over destructieve acties (drop database, force push, delete productie data): vraag eerst

## Code conventies

- `const` > `let`, nooit `var`
- Async/await, geen `.then()` chains
- Early returns, geen deep nesting
- Geen `console.log` in productie -- gebruik structured logging
- Commit messages: conventional commits (`feat:`, `fix:`, `refactor:`, `docs:`, `chore:`)

## Error handling

Structured logging op boundaries. Verplichte velden: level, timestamp, service, event, request_id, error, error_code. Log 1 keer per fout op boundary. Redact secrets en PII.

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

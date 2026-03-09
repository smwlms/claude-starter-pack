# Global Claude Code Rules

## Taal & communicatie

- Antwoord in het [Nederlands/Engels] tenzij anders gevraagd
- Code comments, git commits en branch names in het Engels
- Wees direct, geen uitleg tenzij gevraagd, geen herhaling van wat je gaat doen

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
## Environment setup
## Architectuur beslissingen
## Known issues / tech debt
```

### Schrijfregels

1. **Max 150 regels**
2. **Specifiek**, niet vaag
3. **Verwijs, niet kopieren**
4. **Business context > technische details**
5. **Geen file-by-file beschrijvingen**

### Wanneer automatisch aanmaken?

Maak een project CLAUDE.md aan wanneer:

- Er geen `CLAUDE.md` bestaat in de project root
- De user `/init` uitvoert
- De user vraagt "wat doet dit project" of begint te werken zonder context

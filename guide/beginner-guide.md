# Claude Starter Guide

> Dit document helpt je om Claude optimaal in te richten zodat het jou kent, jouw toon aanhoudt, en weet hoe je werkt. Of je nu Claude Code, Cowork of beide gebruikt.

---

## Waarom dit doen?

Claude is krachtig out-of-the-box, maar het kent jou niet. Het weet niet in welke taal je werkt, hoe je communiceert, wat je bedrijf doet, of welke tools je gebruikt.

Door een paar configuratiebestanden aan te maken, geef je Claude een geheugen:

- Het antwoordt meteen in jouw taal en toon
- Het kent je bedrijf, sector en tools
- Het weet wat je verwacht en wat je irriteert
- Het hoeft niet telkens dezelfde vragen te stellen

Dit kost je 30 tot 60 minuten, maar bespaart je uren op lange termijn.

---

## Stap 1: Je profiel samenstellen

Er zijn twee manieren om je profiel op te bouwen.

### Optie A: Exporteer je context uit een bestaande AI (aanbevolen)

Als je al een tijd ChatGPT, Gemini, Claude of een andere AI-assistent gebruikt, zit daar waardevolle context in. Gebruik een van deze twee prompts om die context te exporteren.

#### Voor AI's met geheugen/opgeslagen context (ChatGPT Memories, Claude Projects)

Open een nieuw gesprek en plak deze prompt:

```
Export all of my stored memories and any context you've learned about me from past conversations. Preserve my words verbatim where possible, especially for instructions and preferences.

## Categories (output in this order):

1. **Instructions**: Rules I've explicitly asked you to follow going forward -- tone, format, style, "always do X", "never do Y", and corrections to your behavior. Only include rules from stored memories, not from conversations.

2. **Identity**: Name, age, location, education, family, relationships, languages, and personal interests.

3. **Career**: Current and past roles, companies, and general skill areas.

4. **Projects**: Projects I meaningfully built or committed to. Ideally ONE entry per project. Include what it does, current status, and any key decisions. Use the project name or a short descriptor as the first words of the entry.

5. **Preferences**: Opinions, tastes, and working-style preferences that apply broadly.

## Format:

Use section headers for each category. Within each category, list one entry per line, sorted by oldest date first. Format each line as:

[YYYY-MM-DD] - Entry content here.

If no date is known, use [unknown] instead.

## Output:
- Wrap the entire export in a single code block for easy copying.
- After the code block, state whether this is the complete set or if more remain.
```

**Tip:** Als de AI zegt dat de export compleet is maar je vermoedt dat er meer is, vraag: _"Are there any more memories or context you haven't included yet?"_

#### Voor AI's zonder geheugen (of als aanvulling op bovenstaande)

Als je AI geen opgeslagen geheugen heeft maar wel gespreksgeschiedenis, gebruik dan deze prompt:

```
Analyseer mijn volledige gespreksgeschiedenis en maak een "User Operating Manual" over mij.
Dit document wordt gebruikt door een AI-assistent om mij beter te helpen.

Structureer het document als volgt:

## 1. Wie ben ik
- Naam, locatie, gezinssituatie (voor zover relevant)
- Beroep, sector, hoofdactiviteiten
- Bedrijven of organisaties waar ik bij betrokken ben

## 2. Hoe ik communiceer
- Taal/talen die ik gebruik
- Toon: formeel of informeel, kort of uitgebreid
- Schrijfstijl: bullets vs proza, gestructureerd vs vrij
- Woorden of uitdrukkingen die ik vaak gebruik of vermijd

## 3. Hoe ik werk
- Stap-voor-stap of big picture?
- Hoe ga ik om met keuzes?
- Wat vraag ik het vaakst?
- Welke tools en software gebruik ik?

## 4. Mijn voorkeuren voor AI-antwoorden
- Wat irriteert me?
- Wat waardeer ik?
- Hoe gedetailleerd moeten antwoorden zijn?

## 5. Domeinen en expertise
- Onderwerpen waar ik het meest over vraag
- Waar heb ik kennis van? Waar heb ik hulp bij nodig?
- Terugkerende projecten of thema's

Wees zo specifiek mogelijk. Gebruik concrete voorbeelden.
```

**Tip:** Als het antwoord te oppervlakkig is, vraag: _"Ga dieper in op sectie [nummer]. Gebruik meer concrete voorbeelden."_

### Optie B: Handmatig invullen

Geen AI-historiek? Ga direct naar Stap 2.

---

## Stap 2: Aanvullende vragen

Beantwoord deze vragen zo concreet mogelijk. Sla over wat al gedekt is door Stap 1.

### A. Over jou

| #   | Vraag                                                 |
| --- | ----------------------------------------------------- |
| A1  | Wat is je naam? Hoe wil je aangesproken worden?       |
| A2  | Waar woon je? (regio/land)                            |
| A3  | Wat is je beroep of hoofdactiviteit?                  |
| A4  | Bij welke bedrijven of organisaties ben je betrokken? |
| A5  | In welke sector(en) werk je? Wat is je expertise?     |
| A6  | Welke software en tools gebruik je dagelijks?         |

### B. Taal en toon

| #   | Vraag                                                     |
| --- | --------------------------------------------------------- |
| B1  | In welke taal moet Claude antwoorden?                     |
| B2  | Hoe formeel moet Claude zijn?                             |
| B3  | Hoe lang mogen antwoorden zijn?                           |
| B4  | Wat irriteert je in AI-antwoorden?                        |
| B5  | Bij vage vragen: eerst verduidelijken of gewoon proberen? |

### C. Werkwijze

| #   | Vraag                                                         |
| --- | ------------------------------------------------------------- |
| C1  | Stap-voor-stap of meteen het eindresultaat?                   |
| C2  | Bij meerdere opties: allemaal tonen of 1 aanbeveling?         |
| C3  | Waarvoor ga je Claude het meest gebruiken?                    |
| C4  | Zijn er taken waarvoor Claude nooit zelfstandig mag handelen? |
| C5  | Bij fouten: uitleggen wat er misging, of gewoon de fix?       |

### D. Domeincontext

| #   | Vraag                                                         |
| --- | ------------------------------------------------------------- |
| D1  | Over welke onderwerpen ga je het vaakst vragen stellen?       |
| D2  | Zijn er regels of wetten die relevant zijn voor je werk?      |
| D3  | Gebruik je vaktermen die Claude moet kennen?                  |
| D4  | Zijn er terugkerende projecten of thema's?                    |
| D5  | Is er iets wat Claude absoluut niet mag doen in jouw context? |

---

## Stap 3: Bestanden aanmaken

Met je antwoorden maak je drie context-bestanden aan. Gebruik de templates uit de `context/` map en de voorbeelden uit `examples/`.

| Bestand       | Wat het bevat                                       |
| ------------- | --------------------------------------------------- |
| `about-me.md` | Wie je bent, je bedrijven, expertise, tools         |
| `my-voice.md` | Taal, toon, schrijfstijl, communicatievoorkeuren    |
| `my-rules.md` | Werkregels, do's & don'ts, domeinspecifieke context |

### Voor Claude Code CLI gebruikers

Draai het install script om alles automatisch te installeren:

```bash
cd claude-starter-pack
chmod +x install.sh
./install.sh
```

Dit installeert:

- `~/.claude/CLAUDE.md` -- globale instructies
- `~/.claude/settings.json` -- permissions en hooks
- `~/.claude/commands/` -- 10 slash commands
- `~/.claude/agents/` -- 18 gespecialiseerde agents
- `~/.claude/skills/` -- 19 auto-trigger skills

Pas daarna `~/.claude/CLAUDE.md` aan naar jouw voorkeuren.

### Voor Cowork gebruikers

Volg de instructies in `cowork/setup-guide.md`.

---

## Stap 4: Testen en bijsturen

1. Start een nieuw gesprek in Claude
2. Stel een typische vraag
3. Check: klopt de taal? De toon? De lengte?
4. Pas je bestanden aan waar nodig

Dit is een iteratief proces. Je profiel wordt beter naarmate je het bijstuurt.

---

## Wat zit er in dit starter pack?

### Context bestanden (voor iedereen)

- `context/about-me.md` -- template
- `context/my-voice.md` -- template
- `context/my-rules.md` -- template
- `examples/` -- ingevulde voorbeelden

### Claude Code CLI (voor developers)

- `claude-code/CLAUDE.md` -- globale instructies template
- `claude-code/settings.json` -- permissions, hooks, safety rules
- `claude-code/agents/` -- 18 gespecialiseerde agents
- `claude-code/commands/` -- 10 slash commands
- `claude-code/skills/` -- 19 auto-trigger skills
- `install.sh` -- automatische installer

### Cowork (voor niet-technische gebruikers)

- `cowork/setup-guide.md` -- stap-voor-stap setup

---

## Beschikbare agents

| Agent               | Doel                                                 |
| ------------------- | ---------------------------------------------------- |
| `prompt-analyst`    | Analyseert en verbetert prompts voordat werk begint  |
| `pm`                | Orchestrator: plant werk, stuurt agents aan          |
| `senior-dev`        | Codebase analyse, architectuur, product/UX inzichten |
| `reviewer`          | Code review: security, readability, consistency      |
| `qa`                | Testplannen, regressies, edge cases                  |
| `tester`            | Tests schrijven en draaien (unit, integration, e2e)  |
| `data-engineer`     | Schema's, migraties, queries, performance            |
| `product-coach`     | Product visie verhelderen via gerichte vragen         |
| `design-researcher` | UX/UI onderzoek, visueel design, patterns            |
| `copywriter`        | Teksten voor diverse kanalen                         |
| `marketing`         | Strategie, SEO, GEO, social media, email             |
| `sales-coach`       | Verkoopstrategie, scripts, objection handling        |
| `legal`             | Juridische vragen, compliance, GDPR                  |
| `cfo`               | Financiele analyse, budgettering, fiscaal advies     |
| `devops`            | CI/CD, Docker, deployment, monitoring                |
| `security`          | Security audits, OWASP, dependency scanning          |
| `docs-writer`       | API docs, README's, user guides                      |
| `researcher`        | Deep research, technologie-keuzes, best practices    |
| `e2e-tester`        | Playwright CLI browser testing, visuele regressie    |

## Beschikbare slash commands

| Command         | Doel                                                         |
| --------------- | ------------------------------------------------------------ |
| `/start`        | Nieuwe taak starten (prompt analyse + planning + uitvoering) |
| `/plan`         | Implementatieplan maken                                      |
| `/review`       | Code review uitvoeren                                        |
| `/commit`       | Conventional commit aanmaken                                 |
| `/debug`        | Systematisch debuggen                                        |
| `/refactor`     | Code opschonen                                               |
| `/ship`         | Pre-ship checklist (lint, tests, build)                      |
| `/design`       | UI/UX design analyseren en verbeteren                        |
| `/research`     | Research uitvoeren over een onderwerp                        |
| `/init-project` | CLAUDE.md aanmaken voor een project                          |

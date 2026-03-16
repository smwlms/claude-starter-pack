# Claude Starter Pack

> Alles wat je nodig hebt om Claude te laten werken alsof het je kent. Voor Claude Code CLI en Cowork.

## Wat is dit?

Een kant-en-klaar configuratiepakket voor Claude dat bevat:

- **Persoonlijke context** -- templates om Claude te vertellen wie je bent, hoe je werkt, en wat je verwacht
- **23 gespecialiseerde agents** -- van code review tot marketing, van security tot mobile development
- **19 auto-trigger skills** -- dezelfde expertise als skills die automatisch activeren op basis van context
- **11 slash commands** -- workflows voor plannen, reviewen, committen, debuggen, design en meer
- **Veilige defaults** -- permissions, hooks en safety rules die destructieve acties blokkeren
- **Beginner guide** -- stap-voor-stap uitleg om alles in te richten

## Wie is dit voor?

- **Developers** die Claude Code CLI gebruiken en hun workflow willen optimaliseren
- **Niet-technische gebruikers** die Claude Cowork gebruiken en Claude willen personaliseren
- **Teams** die een gestandaardiseerde Claude-setup willen delen

## Quick Start

### Claude Code CLI (developers)

```bash
git clone [deze-repo]
cd claude-starter-pack
chmod +x install.sh
./install.sh
```

Het script installeert alles naar `~/.claude/` met automatische backups van bestaande bestanden.

### Claude Cowork (niet-technisch)

**Snelste manier:** Kopieer de prompt uit `setup-prompt.md` en plak die in een nieuw Cowork gesprek. Claude leidt je stap voor stap door de setup en maakt alle bestanden voor je aan.

**Handmatig:**

1. Kopieer de `context/` map naar je werkmap
2. Vul de templates in (gebruik `examples/` als inspiratie)
3. Volg `cowork/setup-guide.md`

### Beginners

Start met `guide/beginner-guide.md` -- die leidt je door het hele proces.

---

## Wat zit erin?

```
claude-starter-pack/
|
|-- README.md                    # Dit bestand
|-- install.sh                   # Automatische installer (CLI)
|-- setup-prompt.md              # Plak in Cowork, Claude doet de rest
|
|-- guide/
|   +-- beginner-guide.md       # Stap-voor-stap setup guide
|
|-- context/                     # Persoonlijke context templates
|   |-- about-me.md             # Wie je bent
|   |-- my-voice.md             # Hoe Claude moet communiceren
|   +-- my-rules.md             # Werkregels en domeincontext
|
|-- examples/                    # Ingevulde voorbeelden
|   |-- about-me-example.md
|   |-- my-voice-example.md
|   +-- my-rules-example.md
|
|-- claude-code/                 # Claude Code CLI bestanden
|   |-- CLAUDE.md               # Globale instructies
|   |-- settings.json           # Permissions, hooks, safety
|   |-- agents/                 # 23 gespecialiseerde agents
|   |-- commands/               # 11 slash commands
|   +-- skills/                 # 19 auto-trigger skills
|
+-- cowork/                      # Cowork-specifiek
    +-- setup-guide.md           # Setup instructies
```

## Agents

### Workflow agents

| Agent            | Doel                                                           |
| ---------------- | -------------------------------------------------------------- |
| `prompt-analyst` | Analyseert en verbetert prompts voordat werk begint            |
| `pm`             | Orchestrator: plant werk, stuurt agents aan, bewaakt kwaliteit |

### Development agents

| Agent                | Doel                                                          |
| -------------------- | ------------------------------------------------------------- |
| `senior-dev`         | Codebase analyse, architectuur, product/UX inzichten          |
| `reviewer`           | Code review: security, readability, consistency               |
| `qa`                 | Testplannen, regressies, smoke tests, edge cases              |
| `tester`             | Tests schrijven en draaien (unit, integration, e2e)           |
| `data-engineer`      | Database schema's, migraties, queries, performance            |
| `devops`             | CI/CD, Docker, deployment, monitoring, infra                  |
| `security`           | Security audits, OWASP, dependency scanning                   |
| `docs-writer`        | API docs, README's, user guides, changelogs                   |
| `researcher`         | Deep research, technologie-keuzes, best practices             |
| `e2e-tester`         | Playwright CLI browser testing, live flows, visuele regressie |
| `frontend-architect` | Framework keuze, design system, performance, Core Web Vitals  |
| `mobile-dev`         | iOS/Swift/SwiftUI, React Native/Expo, App Store lifecycle     |
| `api-designer`       | REST/GraphQL design, auth patterns, OpenAPI docs, webhooks    |

### Business agents

| Agent               | Doel                                                       |
| ------------------- | ---------------------------------------------------------- |
| `product-coach`     | Product visie verhelderen via gerichte vragen              |
| `copywriter`        | Teksten voor website, email, social media                  |
| `marketing`         | Strategie, SEO, GEO, social media, email marketing         |
| `sales-coach`       | Verkoopstrategie, scripts, objection handling              |
| `legal`             | Juridische vragen, compliance, GDPR                        |
| `design-researcher` | UX/UI onderzoek, visueel design, patterns                  |
| `cfo`               | Financiele analyse, fiscale planning, structuuradvies      |
| `hr`                | Arbeidsrecht, onboarding, verlofregeling, freelance vs FTE |

## Skills (auto-trigger)

Skills worden automatisch geactiveerd wanneer Claude detecteert dat je vraag bij een skill past. Ze werken in zowel **Claude Code CLI** als **Cowork**.

| Skill                | Triggert bij                                          |
| -------------------- | ----------------------------------------------------- |
| `pm`                 | plan maken, project plannen, werk verdelen            |
| `prompt-analyst`     | prompt analyseren, opdracht verbeteren, scope bepalen |
| `senior-dev`         | code analyseren, architectuur review, tech debt       |
| `reviewer`           | code review, PR review, security check                |
| `qa`                 | testplan, edge cases, regressie, smoke test           |
| `tester`             | test schrijven, unit test, integration test           |
| `data-engineer`      | database, schema, migratie, query, SQL                |
| `product-coach`      | product visie, product brief, MVP scope               |
| `design-researcher`  | UX research, UI analyse, accessibility                |
| `copywriter`         | tekst schrijven, copy, email, social media            |
| `marketing`          | marketing strategie, SEO, GEO, campagnes              |
| `sales-coach`        | verkoop, objection handling, pitch, closing           |
| `legal`              | juridisch, GDPR, contract, compliance                 |
| `cfo`                | financieel, budget, ROI, belasting, factuur           |
| `hr`                 | HR, arbeidsrecht, onboarding, verlof, evaluatie       |
| `devops`             | CI/CD, Docker, deployment, monitoring                 |
| `security`           | security audit, OWASP, vulnerability, CVE             |
| `docs-writer`        | documentatie, README, API docs, changelog             |
| `researcher`         | research, vergelijking, best practices                |
| `e2e-tester`         | browser test, playwright, frontend test               |
| `frontend-architect` | framework keuze, design system, performance           |
| `mobile-dev`         | mobile app, iOS, React Native, App Store              |
| `api-designer`       | API design, REST, GraphQL, webhooks                   |

> **Agents vs Skills**: Agents worden gedelegeerd door de PM. Skills activeren automatisch op basis van je vraag. Dezelfde expertise, twee manieren om ze te gebruiken.

## Slash Commands

| Command         | Doel                                                     |
| --------------- | -------------------------------------------------------- |
| `/start`        | Nieuwe taak starten (prompt analyse + plan + uitvoering) |
| `/ask`          | Directe vraag beantwoorden zonder planning overhead      |
| `/plan`         | Implementatieplan maken voor een taak                    |
| `/review`       | Code review uitvoeren                                    |
| `/commit`       | Conventional commit met secrets check en lint            |
| `/debug`        | Systematisch debuggen met hypotheses                     |
| `/refactor`     | Code analyseren en opschonen met cross-file checks       |
| `/ship`         | Pre-ship checklist met fail-fast pipeline                |
| `/design`       | UI/UX design analyseren en verbeteren                    |
| `/research`     | Research uitvoeren over een onderwerp                    |
| `/init-project` | Project CLAUDE.md aanmaken of updaten                    |

## Settings & Safety

De meegeleverde `settings.json` bevat:

### Permissions (allow)

Veelgebruikte CLI tools zijn standaard toegestaan: git, npm, node, python3, docker, curl, jq, playwright, etc.

### Deny rules

Destructieve commando's worden geblokkeerd:

- `rm -rf /` en varianten
- `git push --force`
- `git reset --hard`
- `DROP TABLE` / `drop table`

### Hooks

| Hook             | Wat het doet                                                      |
| ---------------- | ----------------------------------------------------------------- |
| **PostToolUse**  | Draait Prettier automatisch na elke file edit                     |
| **PreToolUse**   | Blokkeert destructieve bash commando's                            |
| **Notification** | Stuurt een desktop notificatie als Claude je aandacht nodig heeft |

## Aanpassen

Dit starter pack is een **startpunt**. Pas het aan naar jouw situatie:

1. **Context bestanden**: Vul de templates in met jouw informatie
2. **CLAUDE.md**: Pas taal, autonomie en code conventies aan
3. **Agents**: Verwijder agents die je niet nodig hebt, pas bestaande aan voor jouw sector
4. **Settings**: Voeg permissions toe voor tools die je gebruikt (SSH, cloud CLI's, etc.)
5. **Commands**: Voeg eigen slash commands toe voor terugkerende workflows

### Agent aanpassen voor jouw sector

De business agents (legal, sales-coach, marketing, copywriter, cfo, hr) zijn generiek gehouden. Maak ze specifiek:

- `legal.md`: voeg jouw sectorspecifieke regelgeving toe
- `sales-coach.md`: beschrijf jouw verkoopproces en klanttypen
- `marketing.md`: voeg jouw kanalen en doelgroepen toe
- `copywriter.md`: definieer jouw brand voice
- `cfo.md`: voeg lokale belastingtarieven en fiscale regels toe
- `hr.md`: voeg lokale arbeidswetgeving en CAO's toe

## Veelgestelde vragen

**Kan ik agents verwijderen die ik niet nodig heb?**
Ja. Verwijder het `.md` bestand uit `~/.claude/agents/`. De andere agents blijven werken.

**Werkt dit met Claude Pro / Team / Enterprise?**
Claude Code CLI werkt met elk Claude abonnement dat API-toegang biedt. Cowork werkt met Pro en hoger.

**Wat als ik al bestanden heb in ~/.claude/?**
Het install script maakt automatisch backups aan met een timestamp.

**Kan ik dit delen met mijn team?**
Ja. Fork de repo, pas de context bestanden aan voor je team, en deel. De agents en commands zijn team-onafhankelijk.

---

Gemaakt door Sam Willems. Gebaseerd op een productie-setup die dagelijks gebruikt wordt.

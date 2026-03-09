# Claude Starter Pack

> Alles wat je nodig hebt om Claude te laten werken alsof het je kent. Voor Claude Code CLI en Cowork.

## Wat is dit?

Een kant-en-klaar configuratiepakket voor Claude dat bevat:

- **Persoonlijke context** -- templates om Claude te vertellen wie je bent, hoe je werkt, en wat je verwacht
- **17 gespecialiseerde agents** -- van code review tot marketing, van security tot product coaching
- **8 slash commands** -- workflows voor plannen, reviewen, committen, debuggen en meer
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
|   |-- agents/                 # 17 gespecialiseerde agents
|   +-- commands/               # 8 slash commands
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

| Agent           | Doel                                                 |
| --------------- | ---------------------------------------------------- |
| `senior-dev`    | Codebase analyse, architectuur, product/UX inzichten |
| `reviewer`      | Code review: security, readability, consistency      |
| `qa`            | Testplannen, regressies, smoke tests, edge cases     |
| `tester`        | Tests schrijven en draaien (unit, integration, e2e)  |
| `data-engineer` | Database schema's, migraties, queries, performance   |
| `devops`        | CI/CD, Docker, deployment, monitoring, infra         |
| `security`      | Security audits, OWASP, dependency scanning          |
| `docs-writer`   | API docs, README's, user guides, changelogs          |
| `researcher`    | Deep research, technologie-keuzes, best practices    |

### Business agents

| Agent               | Doel                                               |
| ------------------- | -------------------------------------------------- |
| `product-coach`     | Product visie verhelderen via gerichte vragen      |
| `copywriter`        | Teksten voor website, email, social media          |
| `marketing`         | Strategie, SEO, GEO, social media, email marketing |
| `sales-coach`       | Verkoopstrategie, scripts, objection handling      |
| `legal`             | Juridische vragen, compliance, GDPR                |
| `design-researcher` | UX/UI onderzoek, visueel design, patterns          |

## Slash Commands

| Command         | Doel                                                     |
| --------------- | -------------------------------------------------------- |
| `/start`        | Nieuwe taak starten (prompt analyse + plan + uitvoering) |
| `/plan`         | Implementatieplan maken voor een taak                    |
| `/review`       | Code review uitvoeren                                    |
| `/commit`       | Conventional commit aanmaken                             |
| `/debug`        | Systematisch debuggen                                    |
| `/refactor`     | Code analyseren en opschonen                             |
| `/ship`         | Pre-ship checklist (lint, tests, build)                  |
| `/init-project` | Project CLAUDE.md aanmaken                               |

## Settings & Safety

De meegeleverde `settings.json` bevat:

### Permissions (allow)

Veelgebruikte CLI tools zijn standaard toegestaan: git, npm, node, python3, curl, jq, etc.

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
4. **Settings**: Voeg permissions toe voor tools die je gebruikt (Docker, SSH, etc.)
5. **Commands**: Voeg eigen slash commands toe voor terugkerende workflows

### Agent aanpassen voor jouw sector

De business agents (legal, sales-coach, marketing, copywriter) zijn generiek gehouden. Maak ze specifiek:

- `legal.md`: voeg jouw sectorspecifieke regelgeving toe
- `sales-coach.md`: beschrijf jouw verkoopproces en klanttypen
- `marketing.md`: voeg jouw kanalen en doelgroepen toe
- `copywriter.md`: definieer jouw brand voice

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

Gemaakt door Sam Willems. Gebaseerd op een productie-setup die dagelijks gebruikt wordt voor vastgoedsoftware, data-analyse en AI-tooling.

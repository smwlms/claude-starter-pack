# Claude Starter Pack voor Vastgoedmakelaars

> Een complete Claude-configuratie voor Belgische vastgoedmakelaars. Met ingebakken kennis van BIV, GDPR, anti-witwas, Belgische fiscaliteit, en een hierarchische agent-architectuur die werkt in zowel Claude Code CLI als Cowork.

## Wat weet Claude na installatie?

- **BIV-regelgeving**: deontologie, plichtenleer, tuchtrecht
- **Informatieplichten**: EPC, bodemattest, stedenbouwkundig uittreksel, overstromingskaarten
- **Huurrecht**: Vlaams Woninghuurdecreet, huurwaarborg, opzegregels
- **Verkooprecht**: compromis, voorkooprechten, opschortende voorwaarden, Wet Breyne
- **GDPR**: verwerkingsregister, toestemming, bewaartermijnen voor klantdata
- **Anti-witwas**: identificatieplicht, waakzaamheidsplicht, meldingsplicht CFI
- **Belgische fiscaliteit**: VenB 20%/25%, BTW 21%/6%, VVPRbis, VAPZ/IPT, CO2-bijdrage
- **Marketing**: Immoweb/Zimmo optimalisatie, GEO (AI search), SEO, seizoenspatronen
- **Verkoopproces**: lead -> intake -> mandaat -> marketing -> bezichtiging -> bod -> compromis -> akte
- **Arbeidsrecht**: Belgische arbeidsovereenkomsten, opzegtermijnen, freelance vs werknemer

## Quick Start

### Claude Code CLI

```bash
git clone [deze-repo]
cd claude-starter-pack
chmod +x install.sh
./install.sh
```

Het script laat je een permission profiel kiezen (safe/dev/elevated) en installeert alles naar `~/.claude/`.

### Cowork

Kopieer de prompt uit `setup-prompt.md` en plak die in een nieuw gesprek. Claude stelt vastgoed-specifieke vragen en maakt alle bestanden voor je aan.

### Beginners

Start met `guide/beginner-guide.md`.

---

## Architectuur

```
Gebruiker -> /start -> [fast/strict] -> prompt-analyst -> handoff -> PM
PM -> specialist agents -> reviewer gate -> output
```

- **fast modus**: simpele taken skippen de prompt-analyst
- **strict modus**: volledige flow met handoff-contract en planning
- **Quality gate**: reviewer checkt output op AC, secrets, types

### Permission profiles

| Profiel | Wat mag het | Wanneer |
|---------|-------------|---------|
| **safe** | Lezen, schrijven, git read-only, npm | Standaard, niet-technisch gebruik |
| **dev** | Alles van safe + rm, ssh, docker, MCP's | Development (aanbevolen voor developers) |
| **elevated** | Alles, geen beperkingen | Specifieke taken die alles nodig hebben |

Wissel met: `~/.claude/switch-profile.sh [safe|dev|elevated]`

---

## Wat zit erin?

```
claude-starter-pack/
|-- README.md
|-- install.sh
|-- setup-prompt.md
|-- VERSION
|-- CHANGELOG.md
|
|-- guide/
|   +-- beginner-guide.md
|
|-- context/                     # Vul in met jouw gegevens
|   |-- about-me.md
|   |-- my-voice.md
|   +-- my-rules.md
|
|-- examples/
|   |-- about-me-example.md
|   |-- my-voice-example.md
|   +-- my-rules-example.md
|
|-- claude-code/
|   |-- CLAUDE.md               # Agent-hierarchie, profiles, cowork modus
|   |-- settings.safe.json
|   |-- settings.dev.json
|   |-- settings.elevated.json
|   |-- switch-profile.sh
|   |-- agents/                 # 24 agents
|   |-- commands/               # 11 commands
|   +-- skills/                 # 20 skills
|
+-- cowork/
    +-- setup-guide.md
```

## Agents (24)

### Workflow
| Agent | Doel |
|-------|------|
| `prompt-analyst` | Analyseert prompts, maakt handoff-contract |
| `pm` | Orchestrator met fast/strict modus en reviewer gate |

### Development
| Agent | Doel |
|-------|------|
| `senior-dev` | Codebase analyse, architectuur, product/UX |
| `reviewer` | Code review + quality gate |
| `qa` | Testplannen, regressies, edge cases |
| `tester` | Unit/integration/e2e tests |
| `data-engineer` | Schema's, migraties, Supabase RLS |
| `devops` | CI/CD, Docker, deployment |
| `security` | OWASP, GDPR, dependency scanning |
| `docs-writer` | API docs, README's, changelogs |
| `researcher` | Deep research, technologie-keuzes |
| `e2e-tester` | Playwright browser testing |
| `mobile-dev` | iOS/Swift, React Native, App Store |
| `frontend-architect` | Framework keuze, design system, Core Web Vitals |
| `api-designer` | REST/GraphQL, auth, OpenAPI |

### Vastgoed & Business
| Agent | Doel |
|-------|------|
| `copywriter` | Property beschrijvingen, website, email, social |
| `marketing` | SEO, GEO, Immoweb/Zimmo, campagnes |
| `sales-coach` | Mandaat binnenhalen, scripts, timing matrix |
| `legal-makelaar` | BIV, huurrecht, verkooprecht, anti-witwas |
| `cfo` | Belgische fiscaliteit, VenB, BTW, VVPRbis |
| `hr` | Arbeidsrecht, onboarding, verlof, evaluatie |
| `geschillen-communicatie` | Dossierbeheer, brieven verzekeraars |
| `product-coach` | Product visie, product brief |
| `design-researcher` | UX/UI, Immoweb benchmarks |

## Slash commands (11)

| Command | Doel |
|---------|------|
| `/start` | Nieuwe taak (fast/strict modus, handoff-contract) |
| `/plan` | Implementatieplan |
| `/review` | Code review |
| `/commit` | Conventional commit |
| `/debug` | Systematisch debuggen |
| `/refactor` | Code opschonen |
| `/ship` | Pre-ship checklist (lint, tests, build) |
| `/design` | UI/UX analyse |
| `/research` | Research uitvoeren |
| `/init-project` | Project CLAUDE.md aanmaken |
| `/ask` | Directe vraag zonder planning |

## Placeholders

Na installatie moet je de volgende placeholders vervangen in `context/` bestanden:

| Placeholder | Voorbeeld |
|-------------|-----------|
| `[BEDRIJFSNAAM]` | Peeters Vastgoed |
| `[REGIO]` | Oost-Vlaanderen |
| `[BIV-NUMMER]` | 123.456 |
| `[NAAM]` | Marie Peeters |
| `[RECHTSVORM]` | BV |

Of gebruik `setup-prompt.md` in Cowork -- Claude vult alles automatisch in.

## FAQ

**Kan Claude juridisch advies geven?**
Claude geeft juridische informatie en analyse met altijd een disclaimer. Het is geen vervanging voor een advocaat of het BIV.

**Werkt dit ook voor Waalse of Brusselse makelaars?**
De focus ligt op Vlaanderen. Voor Wallonie en Brussel past Claude de analyse aan, maar templates zijn Vlaams-gericht.

**Wat is het verschil tussen safe/dev/elevated?**
Safe is read-only + basis tools. Dev voegt rm, ssh, docker toe. Elevated verwijdert alle beperkingen. Wissel met `switch-profile.sh`.

**Hoe werk ik in Cowork?**
Skills activeren automatisch. Gebruik `/ask` voor directe vragen. Bij complexe taken zal Claude voorstellen de PM-flow te volgen.

---

Gebaseerd op een productie-setup die dagelijks gebruikt wordt voor vastgoedsoftware, data-analyse en AI-tooling.

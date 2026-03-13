# Claude Starter Pack voor Vastgoedmakelaars

> Alles wat je nodig hebt om Claude te laten werken als jouw persoonlijke assistent voor vastgoedmakelaardij. Met ingebakken kennis van BIV, GDPR, anti-witwas, de Belgische vastgoedmarkt, en meer.

## Wat is dit?

Een kant-en-klaar configuratiepakket voor Claude, specifiek voor Belgische vastgoedmakelaars:

- **Persoonlijke context** -- templates om Claude te vertellen wie je bent, je kantoor, je regio
- **20 gespecialiseerde agents** -- inclusief legal-makelaar, marketing-specialist, geschillen-communicatie
- **21 auto-trigger skills** -- dezelfde expertise die automatisch activeert op basis van context
- **10 slash commands** -- workflows voor plannen, reviewen, committen, debuggen en meer
- **Veilige defaults** -- permissions, hooks en safety rules
- **Beginner guide** -- stap-voor-stap uitleg

## Wat weet Claude over vastgoed?

Met dit starter pack kent Claude:

- **BIV-regelgeving**: deontologie, plichtenleer, tuchtrecht
- **Informatieplichten**: EPC, bodemattest, stedenbouwkundig uittreksel, overstromingskaarten
- **Huurrecht**: Vlaams Woninghuurdecreet, huurwaarborg, opzegregels
- **Verkooprecht**: compromis, voorkooprechten, opschortende voorwaarden
- **GDPR**: verwerkingsregister, toestemming, bewaartermijnen voor klantdata
- **Anti-witwas**: identificatieplicht, waakzaamheidsplicht, meldingsplicht CFI
- **Belgische fiscaliteit**: VenB, BTW (21%/6%), VVPRbis, VAPZ/IPT
- **Marketing**: Immoweb, Zimmo, GEO (AI search optimalisatie), SEO
- **Verkoopproces**: lead -> intake -> mandaat -> marketing -> bezichtiging -> bod -> compromis -> akte

## Quick Start

### Claude Code CLI (developers)

```bash
git clone [deze-repo]
cd claude-starter-pack
git checkout vastgoed
chmod +x install.sh
./install.sh
```

### Claude Cowork (niet-technisch)

Kopieer de prompt uit `setup-prompt.md` en plak die in een nieuw Cowork gesprek. Claude stelt je vastgoed-specifieke vragen en maakt alle bestanden voor je aan.

### Beginners

Start met `guide/beginner-guide.md`.

---

## Agents

### Workflow agents

| Agent            | Doel                                                           |
| ---------------- | -------------------------------------------------------------- |
| `prompt-analyst` | Analyseert en verbetert prompts voordat werk begint            |
| `pm`             | Orchestrator: plant werk, stuurt agents aan, bewaakt kwaliteit |

### Development agents

| Agent           | Doel                                                          |
| --------------- | ------------------------------------------------------------- |
| `senior-dev`    | Codebase analyse, architectuur, product/UX inzichten          |
| `reviewer`      | Code review: security, readability, consistency               |
| `qa`            | Testplannen, regressies, smoke tests, edge cases              |
| `tester`        | Tests schrijven en draaien (unit, integration, e2e)           |
| `data-engineer` | Database schema's, migraties, queries, performance            |
| `devops`        | CI/CD, Docker, deployment, monitoring, infra                  |
| `security`      | Security audits, OWASP, dependency scanning                   |
| `docs-writer`   | API docs, README's, user guides, changelogs                   |
| `researcher`    | Deep research, technologie-keuzes, best practices             |
| `e2e-tester`    | Playwright CLI browser testing, live flows, visuele regressie |

### Vastgoed agents

| Agent                       | Doel                                                        |
| --------------------------- | ----------------------------------------------------------- |
| `product-coach`             | Product visie verhelderen via gerichte vragen                |
| `copywriter`                | Property beschrijvingen, website, email, social media        |
| `marketing-specialist`      | Strategie, SEO, GEO, Immoweb/Zimmo, social media           |
| `sales-coach`               | Mandaat binnenhalen, bezichtigingen, objection handling      |
| `legal-makelaar`            | BIV, huurrecht, verkooprecht, GDPR, anti-witwas             |
| `cfo`                       | Belgische fiscaliteit, VenB, BTW, vennootschapsstructuur    |
| `geschillen-communicatie`   | Dossierbeheer geschillen, brieven verzekeraars/advocaten    |
| `design-researcher`         | UX/UI onderzoek, visueel design, patterns                   |

## Placeholders aanpassen

Na installatie moet je de volgende placeholders vervangen in de agents en context bestanden:

| Placeholder       | Voorbeeld                    |
| ----------------- | ---------------------------- |
| `[BEDRIJFSNAAM]`  | Peeters Vastgoed             |
| `[REGIO]`         | Oost-Vlaanderen              |
| `[BIV-NUMMER]`    | 123.456                      |
| `[NAAM]`          | Marie Peeters                |
| `[RECHTSVORM]`    | BV                           |
| `[KANTOOR_TYPE]`  | verkoop en verhuur           |

Of gebruik de `setup-prompt.md` in Cowork -- Claude vult alles automatisch in.

## Veelgestelde vragen

**Kan Claude juridisch advies geven?**
Claude geeft juridische informatie en analyse, maar voegt altijd een disclaimer toe. Het is geen vervanging voor een advocaat of het BIV.

**Werkt dit ook voor Waalse of Brusselse makelaars?**
De regelgeving focus ligt op Vlaanderen (Woninghuurdecreet, Vlaamse Codex Wonen). Voor Wallonie en Brussel past Claude de analyse aan, maar de templates zijn Vlaams-gericht.

**Kan ik agents verwijderen die ik niet nodig heb?**
Ja. Verwijder het `.md` bestand uit `~/.claude/agents/`.

---

Gebaseerd op de Claude Starter Pack door Sam Willems. Aangepast voor Belgische vastgoedmakelaars.

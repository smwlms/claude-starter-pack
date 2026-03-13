# Claude Starter Guide voor Vastgoedmakelaars

> Dit document helpt je om Claude optimaal in te richten als je persoonlijke assistent voor vastgoedmakelaardij. Of je nu Claude Code, Cowork of beide gebruikt.

---

## Waarom dit doen?

Claude is krachtig out-of-the-box, maar het kent jou niet. Het weet niet hoe je kantoor heet, in welke regio je werkt, of welke BIV-regels gelden.

Door een paar configuratiebestanden aan te maken, geef je Claude een geheugen:

- Het antwoordt meteen in jouw taal en toon
- Het kent je kantoor, regio en klanttypen
- Het weet van BIV-deontologie, GDPR, anti-witwas
- Het schrijft property beschrijvingen in jouw stijl
- Het hoeft niet telkens dezelfde vragen te stellen

Dit kost je 30 tot 60 minuten, maar bespaart je uren op lange termijn.

---

## Stap 1: Je profiel samenstellen

### Optie A: Exporteer je context uit een bestaande AI (aanbevolen)

Als je al een tijd ChatGPT, Gemini of Claude gebruikt, zit daar waardevolle context in.

#### Voor AI's met geheugen (ChatGPT Memories, Claude Projects)

Open een nieuw gesprek en plak deze prompt:

```
Export all of my stored memories and any context you've learned about me from past conversations. Preserve my words verbatim where possible, especially for instructions and preferences.

## Categories (output in this order):

1. **Instructions**: Rules I've explicitly asked you to follow going forward -- tone, format, style, "always do X", "never do Y".

2. **Identity**: Name, location, education, family, languages, personal interests.

3. **Career**: Current and past roles, companies, skill areas.

4. **Projects**: Projects I meaningfully built or committed to. ONE entry per project.

5. **Preferences**: Opinions, tastes, working-style preferences.

## Format:
[YYYY-MM-DD] - Entry content here. Use [unknown] if no date is known.

## Output:
Wrap in a single code block for easy copying.
```

#### Voor AI's zonder geheugen (fallback)

```
Analyseer mijn volledige gespreksgeschiedenis en maak een "User Operating Manual" over mij.

## 1. Wie ben ik
- Naam, locatie, beroep, sector, bedrijven

## 2. Hoe ik communiceer
- Taal, toon, schrijfstijl, woorden die ik gebruik of vermijd

## 3. Hoe ik werk
- Stap-voor-stap of big picture? Tools? Vaakste vragen?

## 4. Mijn voorkeuren voor AI-antwoorden
- Wat irriteert me? Wat waardeer ik? Hoe gedetailleerd?

## 5. Domeinen en expertise
- Onderwerpen, kennis, hulp nodig bij, terugkerende thema's

Wees zo specifiek mogelijk.
```

### Optie B: Gebruik de interactieve setup

Kopieer de prompt uit `setup-prompt.md` en plak die in een nieuw Cowork gesprek. Claude stelt je vastgoed-specifieke vragen en maakt alle bestanden voor je aan.

### Optie C: Handmatig invullen

Ga direct naar Stap 2.

---

## Stap 2: Bestanden aanmaken

Met je antwoorden maak je drie context-bestanden aan. Gebruik de templates uit `context/` en de voorbeelden uit `examples/`.

| Bestand       | Wat het bevat                                         |
| ------------- | ----------------------------------------------------- |
| `about-me.md` | Kantoor, BIV-nummer, regio, type panden, tools, team  |
| `my-voice.md` | Taal, toon, schrijfstijl, communicatievoorkeuren      |
| `my-rules.md` | BIV-deontologie, GDPR, werkregels, do's & don'ts      |

---

## Stap 3: Installeren

### Claude Code CLI (developers)

```bash
cd claude-starter-pack
chmod +x install.sh
./install.sh
```

Het script installeert:
- `CLAUDE.md` met agent-hierarchie, permission profiles, en cowork modus
- 3 permission profiles (safe/dev/elevated) met switch script
- 24 gespecialiseerde agents (inclusief legal-makelaar, marketing, cfo, hr)
- 20 auto-trigger skills met standalone Cowork instructies
- 11 slash commands (inclusief /start met fast/strict modus en /ask)

### Cowork (niet-technisch)

Volg de instructies in `cowork/setup-guide.md` of gebruik `setup-prompt.md`.

---

## Stap 4: Testen

Test met deze 3 vragen:

1. **Property beschrijving**: "Schrijf een beschrijving voor een appartement met 2 slaapkamers in Gent, 85m2, gerenoveerd in 2023, met terras"
2. **Follow-up email**: "Schrijf een follow-up email naar een eigenaar die vorige week interesse toonde om te verkopen maar nog twijfelt"
3. **Juridische vraag**: "Welke informatieplichten heb ik bij de verkoop van een woning in Vlaanderen?"

Check: klopt de taal? De toon? Wordt BIV-context meegenomen? Staat er een disclaimer bij juridisch advies?

---

## Wat zit er in dit starter pack?

### Agents (24 stuks)

#### Workflow
| Agent | Doel |
|-------|------|
| `prompt-analyst` | Analyseert prompts, maakt handoff-contract voor PM |
| `pm` | Orchestrator: fast/strict modus, plant werk, stuurt agents aan |

#### Development
| Agent | Doel |
|-------|------|
| `senior-dev` | Codebase analyse, architectuur, product/UX |
| `reviewer` | Code review + quality gate in PM-flow |
| `qa` | Testplannen, regressies, edge cases |
| `tester` | Tests schrijven (Vitest, pytest, Playwright) |
| `data-engineer` | Schema's, migraties, Supabase RLS |
| `devops` | CI/CD, Docker, deployment |
| `security` | OWASP, dependency scanning, GDPR |
| `docs-writer` | API docs, README's, CLAUDE.md's |
| `researcher` | Deep research, technologie-keuzes |
| `e2e-tester` | Playwright CLI browser testing |
| `mobile-dev` | iOS/Swift/SwiftUI, React Native, App Store |
| `frontend-architect` | Framework keuze, design system, Core Web Vitals |
| `api-designer` | REST/GraphQL, auth patterns, OpenAPI |

#### Vastgoed & Business
| Agent | Doel |
|-------|------|
| `product-coach` | Product visie verhelderen |
| `copywriter` | Property beschrijvingen, website, email, social |
| `marketing` | SEO, GEO, Immoweb/Zimmo, campagnes |
| `sales-coach` | Mandaat binnenhalen, scripts, objection handling |
| `legal-makelaar` | BIV, huurrecht, verkooprecht, GDPR, anti-witwas |
| `cfo` | Belgische fiscaliteit, VenB, BTW, VVPRbis |
| `hr` | Belgisch arbeidsrecht, onboarding, verlof |
| `geschillen-communicatie` | Dossierbeheer, brieven verzekeraars/advocaten |
| `design-researcher` | UX/UI, visueel design, Immoweb benchmarks |

### Slash commands (11 stuks)

| Command | Doel |
|---------|------|
| `/start` | Nieuwe taak (fast/strict modus) |
| `/plan` | Implementatieplan |
| `/review` | Code review |
| `/commit` | Conventional commit |
| `/debug` | Systematisch debuggen |
| `/refactor` | Code opschonen |
| `/ship` | Pre-ship checklist |
| `/design` | UI/UX analyse |
| `/research` | Research uitvoeren |
| `/init-project` | Project CLAUDE.md aanmaken |
| `/ask` | Directe vraag (geen planning) |

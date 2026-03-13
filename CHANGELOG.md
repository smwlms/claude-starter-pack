# Changelog

## [3.0.0] - 2026-03-13

### Architectuur
- Hierarchische agent-flow met handoff-contract (prompt-analyst -> PM -> specialists -> reviewer gate)
- Fast/strict modus in `/start` -- simpele taken skippen prompt-analyst
- Quality gate: reviewer checkt output op AC, secrets, types voor afronden
- Permission profiles: safe/dev/elevated met switch script
- Cowork-pariteit: alle skills werken standalone met Cowork instructies

### Nieuwe agents (4)
- `mobile-dev` -- iOS/Swift/SwiftUI, React Native, App Store, TestFlight
- `frontend-architect` -- framework keuze, design system, Core Web Vitals, bundler
- `api-designer` -- REST/GraphQL, auth patterns, OpenAPI, webhooks, rate limiting
- `hr` -- Belgisch arbeidsrecht, onboarding, verlof, evaluatie, freelance vs werknemer
- `geschillen-communicatie` -- dossierbeheer geschillen (was alleen skill, nu ook agent)

### Verbeterde agents (19)
- Alle agents hebben diepere domeinkennis met concrete patterns en frameworks
- Alle agents hebben een Samenwerking sectie (delegeer aan / ontvang van / gedeelde context)
- `senior-dev`: Vue 3 Composition API, Next.js App Router, Supabase RLS patterns
- `reviewer`: quality gate modus voor PM-flow (alleen blokkers, snel)
- `tester`: standaard test strategie per framework (Vitest, pytest, Playwright)
- `data-engineer`: Supabase RLS, MongoDB aggregation, migration rollback
- `copywriter`: property beschrijving structuur (hook, features, locatie, CTA), SEO richtlijnen
- `marketing`: GEO als standaard, seizoenspatronen, Immoweb/Zimmo optimalisatie
- `sales-coach`: concrete scripts per fase, email templates, follow-up timing matrix
- `legal-makelaar`: checklists per transactietype (verkoop, verhuur, nieuwbouw), regionale verschillen
- `cfo`: scenario-vergelijkingen, Belgische fiscale referentietabel, CO2-bijdrage

### Nieuwe command
- `/ask` -- directe vraag zonder planning, ideaal voor Cowork

### Overig
- 20 skills met MANDATORY TRIGGERS en standalone Cowork instructies
- CLAUDE.md met agent-hierarchie, permission profiles, cowork modus, error handling
- Depersonalisatie: [BEDRIJFSNAAM], [REGIO], [BIV-NUMMER] placeholders

## [2.0.0] - 2026-03-13

### Toegevoegd
- CFO agent en skill
- Twee LLM migratie prompts (geheugen + gespreksgeschiedenis)
- Tool prioriteit sectie in CLAUDE.md
- VERSION en CHANGELOG

## [1.0.0] - 2025-12-01

### Toegevoegd
- Initiele release

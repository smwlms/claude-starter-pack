---
name: start
description: Start een nieuwe taak -- analyseert je prompt, maakt een plan, en voert uit via agents
---

Dit is het entry point voor elke nieuwe taak. Bepaal eerst de modus, volg dan de bijbehorende flow.

## Modus bepalen

Beoordeel de opdracht op complexiteit:

- **fast**: De opdracht is 1 duidelijke stap, max 1 agent nodig, scope is helder (bugfix, typo, kleine feature, "voeg X toe aan Y", directe vraag). → Skip prompt-analyst, ga direct naar Fase 2.
- **strict**: De opdracht raakt meerdere bestanden, heeft meerdere stappen, of de scope is onduidelijk (nieuwe feature, refactor, nieuw project, meerdere agents nodig). → Start bij Fase 1.

Bij twijfel: kies strict. De gebruiker kan altijd zeggen "ga maar" om te versnellen.

## Fase 1: Prompt Analyse (alleen strict modus)

Werk als de **prompt-analyst agent** (`.claude/agents/prompt-analyst.md`):

1. Lees CLAUDE.md in de project root voor context.
2. Analyseer de opdracht op de 7 dimensies (doel, scope, context, doelgroep, constraints, kwaliteitscriteria, afhankelijkheden).
3. Stel maximaal 5 gerichte vragen om ontbrekende info aan te vullen. Geef defaults.
4. Formuleer het **handoff-blok** (zie prompt-analyst agent voor format).
5. Vraag de gebruiker: "Is deze opdracht correct? Mag ik doorgaan met planning?"

**Stop hier** en wacht op akkoord. Als de gebruiker zegt "ga maar" of "goed genoeg", ga direct door.

## Fase 2: Planning & Uitvoering

Schakel over naar de **pm agent** (`.claude/agents/pm.md`):

1. Ontvang het handoff-blok (strict) of formuleer zelf een mini-plan (fast).
2. Maak een implementatieplan (stappen, agents, complexiteit, afhankelijkheden).
   - Bij **fast**: kort plan, max 3 stappen, geen uitgebreide scope-analyse.
   - Bij **strict**: volledig plan met user stories, edge cases, risico's.
3. Vraag de gebruiker om akkoord op het plan.
4. Voer het plan stap voor stap uit, delegeer naar agents waar nodig.
5. Controleer elke output op kwaliteit en consistentie.

## Fase 3: Quality Gate

Na uitvoering, voor afronden:

1. Roep de **reviewer agent** aan voor een snelle QC check:
   - Klopt de output met de acceptance criteria?
   - Geen secrets of PII gelekt?
   - Types correct? Lint clean?
2. Als de reviewer issues vindt: fix eerst, dan pas afronden.

## Fase 4: Afronden

- Samenvatting van wat er gedaan is.
- Acceptance criteria: ✅ of ❌ per criterium.
- Suggestie voor vervolgstappen.

## Context
$ARGUMENTS

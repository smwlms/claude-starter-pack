---
name: start
description: Start een nieuwe taak -- analyseert je prompt, maakt een plan, en voert uit via agents
---

Dit is het entry point voor elke nieuwe taak. Volg deze workflow **stap voor stap**:

## Fase 1: Prompt Analyse

Werk als de **prompt-analyst agent** (`.claude/agents/prompt-analyst.md`):

1. Lees CLAUDE.md in de project root voor context.
2. Analyseer de opdracht op de 7 dimensies (doel, scope, context, doelgroep, constraints, kwaliteitscriteria, afhankelijkheden).
3. Stel maximaal 5 gerichte vragen om ontbrekende info aan te vullen. Geef defaults.
4. Formuleer een verbeterde, gestructureerde prompt.
5. Vraag de gebruiker: "Is deze opdracht correct? Mag ik doorgaan met planning?"

**Stop hier** en wacht op akkoord. Als de gebruiker zegt "ga maar" of "goed genoeg", ga direct door.

## Fase 2: Planning & Uitvoering

Zodra de prompt goedgekeurd is, schakel over naar de **pm agent** (`.claude/agents/pm.md`):

1. Maak een implementatieplan (stappen, agents, complexiteit, afhankelijkheden).
2. Vraag de gebruiker om akkoord op het plan.
3. Voer het plan stap voor stap uit, delegeer naar agents waar nodig.
4. Controleer elke output op kwaliteit en consistentie.
5. Rond af met samenvatting, AC-checklist, en vervolgstappen.

## Context

$ARGUMENTS

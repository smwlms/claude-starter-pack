---
name: prompt-analyst
description: |
  **Prompt Analyst**: Analyseert en verbetert prompts voordat werk begint. Eerste stap in elke workflow.
  - TRIGGERS: prompt analyseren, opdracht verbeteren, taak starten, prompt verbeteren, scope bepalen, vereisten analyseren
  - Gebruik deze skill als eerste stap bij elke nieuwe taak om de opdracht scherp te krijgen.
---

# Prompt Analyst

## Doel

Analyseer elke opdracht op 7 dimensies voordat werk begint. Lever een verbeterde, gestructureerde prompt op.

## Analyse dimensies

1. **Doel** -- Wat moet er bereikt worden?
2. **Scope** -- Wat is in/out scope?
3. **Context** -- Welke achtergrond is relevant?
4. **Doelgroep** -- Voor wie is het resultaat?
5. **Constraints** -- Welke beperkingen gelden er?
6. **Kwaliteitscriteria** -- Wanneer is het goed genoeg?
7. **Afhankelijkheden** -- Wat moet er eerst gebeuren?

## Werkwijze

1. Lees CLAUDE.md voor projectcontext
2. Analyseer de opdracht op de 7 dimensies
3. Identificeer ontbrekende informatie
4. Stel maximaal 5 gerichte vragen (met defaults)
5. Formuleer een verbeterde, gestructureerde prompt
6. Vraag: "Is deze opdracht correct? Mag ik doorgaan?"

## Output format

```markdown
## Prompt analyse

### Oorspronkelijke opdracht

[de originele vraag]

### Verbeterde prompt

[geherstructureerde versie met alle dimensies]

### Openstaande vragen

1. [vraag] (default: [suggestie])
```

## Regels

- Max 5 vragen, altijd met default antwoord
- Stop na analyse en wacht op akkoord
- Maak geen aannames over scope zonder bevestiging

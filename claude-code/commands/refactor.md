---
name: refactor
description: Analyseer code op kwaliteit, structuur en verbeterpunten -- en implementeer na goedkeuring
---

Analyseer de opgegeven code (of de hele codebase) en stel een refactorplan voor. Schrijf **geen code** voordat de gebruiker akkoord gaat.

## Stappen

### Fase 1: Analyse

1. Lees CLAUDE.md in de project root voor context, conventies en constraints.
2. Lees de opgegeven bestanden (of scan de codebase bij geen opgegeven pad).
3. Identificeer refactorkansen op deze dimensies:
   - **Duplicatie**: herhaalde code die geabstraheerd kan worden
   - **Complexiteit**: functies die te veel doen, geneste conditionals, lange bestanden
   - **Naming**: variabelen/functies die niet zeggen wat ze doen
   - **Structuur**: verkeerde verantwoordelijkheden, tight coupling
   - **Performance**: onnodige re-renders, zware operaties in loops
   - **Types**: `any`, ontbrekende types, zwakke interfaces
   - **Dode code**: ongebruikte imports, functies, variabelen

### Fase 2: Prioritering

Presenteer de bevindingen in een tabel:

```markdown
## Refactor rapport: [bestand/module]

### Bevindingen

| #   | Probleem | Locatie | Impact | Effort | Prioriteit |
| --- | -------- | ------- | ------ | ------ | ---------- |
| 1   | ...      | file:L  | Hoog   | Laag   | Nu         |
| 2   | ...      | file:L  | Midden | Midden | Soon       |

### Wat ik ga aanpassen

- [ ] Stap 1: ...

### Wat ik NIET aanraak

- ...
```

Vraag dan: "Wil je dat ik dit uitvoer? Of wil je bepaalde punten overslaan?"

### Fase 3: Uitvoering (na goedkeuring)

- Implementeer punt voor punt in volgorde van prioriteit.
- Verander **geen gedrag** -- alleen structuur.
- Kleine stappen. Na elke stap: werkt het nog?

## Context

$ARGUMENTS

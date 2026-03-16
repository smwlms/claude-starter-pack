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
   - **Structuur**: verkeerde verantwoordelijkheden, tight coupling, ontbrekende separatie
   - **Performance**: onnodige re-renders, zware operaties in loops, missing memoization
   - **Types**: `any`, ontbrekende types, zwakke interfaces (TypeScript)
   - **Dode code**: ongebruikte imports, functies, variabelen
4. **Cross-file referentie check**: Bij elke rename (variabelen, functies, exports, types) of verplaatsing: zoek in de hele codebase naar referenties. Gebruik grep/search om te controleren of de naam in andere bestanden wordt geimporteerd of gebruikt. Vermeld gevonden referenties in het rapport en neem ze op in het aanpasplan.

### Fase 2: Prioritering

Presenteer de bevindingen in een tabel:

```markdown
## Refactor rapport: [bestand/module]

### Bevindingen

| #   | Probleem | Locatie | Impact | Effort | Prioriteit |
| --- | -------- | ------- | ------ | ------ | ---------- |
| 1   | ...      | file:L  | Hoog   | Laag   | Nu         |
| 2   | ...      | file:L  | Midden | Midden | Soon       |
| 3   | ...      | file:L  | Laag   | Laag   | Later      |

### Wat ik ga aanpassen

- [ ] Stap 1: ...
- [ ] Stap 2: ...

### Wat ik NIET aanraak

- ...
```

Vraag dan: "Wil je dat ik dit uitvoer? Of wil je bepaalde punten overslaan?"

### Fase 3: Uitvoering (na goedkeuring)

- Implementeer punt voor punt in volgorde van prioriteit.
- Gebruik de **tester agent** om bestaande tests te laten draaien na elke stap.
- Gebruik de **reviewer agent** voor een finale check.
- Verander **geen gedrag** -- alleen structuur. Als je gedragswijziging ziet, meld het eerst.

## Regels

- Refactor betekent: zelfde gedrag, betere code. Voeg geen features toe.
- Raak geen code aan buiten de opgegeven scope tenzij expliciet gevraagd.
- Als iets onduidelijk is (waarom de code zo geschreven is), vraag het eerst.
- Kleine stappen. Na elke stap: werkt het nog?

## Context

$ARGUMENTS

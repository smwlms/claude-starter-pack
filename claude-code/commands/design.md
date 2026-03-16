---
name: design
description: Analyseer en verbeter het UI/UX design van een pagina, component of flow
---

Analyseer het design van de opgegeven pagina, component of flow en lever concrete, actionable aanbevelingen.
Werk als de **design-researcher agent** in combinatie met kennis van de tech stack.

## Stappen

### Fase 1: Context begrijpen

1. Lees CLAUDE.md voor bestaand design systeem, kleuren, stack.
2. Lees de opgegeven component/pagina bestanden.
3. Als er geen specifiek bestand is opgegeven: scan de UI-laag van het project.
4. Stel indien nodig 1-3 gerichte vragen:
   - Wat is het doel van deze pagina/flow? (conversie, informatie, navigatie)
   - Wie is de primaire gebruiker?
   - Zijn er specifieke problemen die de gebruiker ervaart?

### Fase 2: Design analyse

Beoordeel op deze dimensies:

- **Gebruikersflow**: Is de route naar het doel helder en logisch?
- **Visuele hierarchie**: Valt het belangrijkste het meest op?
- **Consistentie**: Kloppen spacing, kleuren, typografie met de rest van het project?
- **Call-to-action**: Zijn CTA's duidelijk, zichtbaar en goed geplaatst?
- **Mobile-first & responsive**: Werkt het goed op telefoon? Check alle breakpoints: mobile (< 640px), tablet (640-1024px), desktop (> 1024px). Gebruik een mobile-first aanpak.
- **Laadbaarheid**: Zware assets, blocking renders, onnodige componenten?
- **Interactie & states**: Definieer hover states, active states, focus states en transitions voor interactieve elementen. Beschrijf animaties en micro-interacties.
- **Accessibility**: Contrast, focusstates, aria-labels, keyboard navigatie?
- **Navigatie & informatie-architectuur**: Is de navigatiestructuur logisch? Zijn er breadcrumbs of secondary navigation? Is er zoekfunctionaliteit of filtering beschikbaar?
- **Formulier UX** (bij formulieren): Minimaliseer het aantal velden. Gebruik progressive disclosure of multi-step flows voor complexe formulieren. Beoordeel error handling en inline validatie UX.
- **Friction**: Wat vertraagt of frustreert de gebruiker?

### Fase 3: Output

```markdown
## Design analyse: [pagina/component]

### Wat werkt goed

- ...

### Verbeterpunten

| #   | Probleem | Waarom | Oplossing | Impact | Effort |
| --- | -------- | ------ | --------- | ------ | ------ |
| 1   | ...      | ...    | ...       | Hoog   | Laag   |

### Quick wins (direct implementeerbaar)

- ...

### Grotere wijzigingen (plan eerst)

- ...

### Referenties

- [vergelijkbare implementatie/patroon]
```

### Fase 4: Implementatie (na goedkeuring)

- Quick wins direct implementeren.
- Voor grotere wijzigingen: maak eerst een plan via `/plan`.
- Gebruik de **design-researcher agent** voor visuele research waar nodig.

## Regels

- Denk altijd mobile-first.
- Elke aanbeveling moet een reden hebben (usability principe, conversiedoel, of benchmark).
- Houd rekening met de bestaande tech stack -- geen nieuwe libraries voorstellen zonder reden.
- Lever concrete code aanpassingen, geen vage "maak het mooier" suggesties.

## Context

$ARGUMENTS

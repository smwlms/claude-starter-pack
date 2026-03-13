---
name: init-project
description: Project CLAUDE.md aanmaken
---

Analyseer de huidige projectmap en maak een CLAUDE.md aan als die er nog niet is.

Stappen:

1. Controleer of er al een CLAUDE.md bestaat in de project root
2. Als die bestaat: toon de inhoud en vraag of ik hem wil updaten
3. Als die ontbreekt:
   a. Lees package.json / pyproject.toml / Cargo.toml of equivalent
   b. Scan de mappenstructuur (max 3 niveaus)
   c. Lees README.md als die bestaat
   d. Genereer een CLAUDE.md met:
      - ## Quick context (wat doet dit project, voor wie, hoofddoel)
      - ## Tech stack (framework, taal, database, hosting, integraties)
      - ## Commands (alle relevante scripts in code block)
      - ## Belangrijke paden (top 15-20 paden, gegroepeerd)
      - ## Business rules (3-7 kernregels)
      - ## Agent hints (per rol: pm, data-engineer, reviewer, qa)
   e. Sla op als CLAUDE.md in de project root
   f. Vraag: "Wil je iets aanpassen of aanvullen?"

Regels:

- Max 150 regels
- Specifiek, niet vaag
- Business context > technische details (framework detecteer ik zelf)
- Verwijs naar docs met @pad/naar/bestand.md

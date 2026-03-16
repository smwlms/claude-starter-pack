Analyseer de huidige projectmap en maak een CLAUDE.md aan als die er nog niet is.

Stappen:

1. Controleer of er al een CLAUDE.md bestaat in de project root
2. Als die bestaat:
   a. Toon de huidige inhoud
   b. Analyseer wat er ontbreekt of verbeterd kan worden (vergelijk met het verplichte sjabloon)
   c. Stel specifieke verbeteringen voor (bijv. "Business rules sectie ontbreekt", "Commands sectie is incompleet")
   d. Overschrijf NIET zonder toestemming -- vraag of je de voorgestelde wijzigingen mag doorvoeren
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
- Bij monorepo's of multi-package projecten: beschrijf in Quick context hoe de onderdelen met elkaar samenwerken
- Bij onvoldoende info (nieuw/leeg project): markeer secties die nog aangevuld moeten worden met `<!-- TODO: aan te vullen -->` en vraag om aanvullende context

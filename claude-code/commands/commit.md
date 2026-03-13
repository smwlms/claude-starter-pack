Maak een git commit aan voor de huidige wijzigingen.

Stappen:
1. Voer `git diff --staged` en `git status` uit
2. Als er niets gestaged is: voer `git add -p` suggesties uit en vraag bevestiging
3. Analyseer de wijzigingen en bepaal het type:
   - `feat:` nieuwe functionaliteit
   - `fix:` bugfix
   - `refactor:` code herstructurering zonder gedragswijziging
   - `style:` formatting, geen logica
   - `docs:` documentatie
   - `test:` tests toevoegen of aanpassen
   - `chore:` build, deps, config
4. Schrijf een commit message:
   - Eerste regel: `type(scope): korte beschrijving` (max 72 tekens, Engels)
   - Optioneel: body met uitleg waarom (niet wat -- dat ziet men in de diff)
5. Voer `git commit -m "..."` uit
6. Toon de commit hash en samenvatting

Regels:
- Nooit force push naar main/master
- Nooit `--no-verify` tenzij expliciet gevraagd
- Bij twijfel over scope: vraag even

Maak een git commit aan voor de huidige wijzigingen.

Stappen:

1. Voer `git diff --staged` en `git status` uit
2. Als er niets gestaged is: voer `git add -p` suggesties uit en vraag bevestiging
3. **Secrets check**: scan gestaged bestanden op gevoelige bestanden (.env, credentials.json, .pem, API keys, tokens). Als een gevoelig bestand gevonden wordt:
   - Waarschuw de gebruiker dat dit bestand NIET gecommit mag worden
   - Stel voor om het bestand te unstagen (`git reset HEAD <bestand>`)
   - Verwijs naar `.gitignore` als structurele oplossing
   - Commit het gevoelige bestand NIET -- ga door met de overige veilige bestanden
4. **Logische splitsing check**: als de gestaged wijzigingen meerdere onafhankelijke logische changes bevatten (bijv. een bugfix + een nieuwe feature + een refactor):
   - Herken dat dit meerdere logische wijzigingen zijn
   - Stel voor om ze op te splitsen in meerdere kleinere commits
   - Groepeer de bestanden per logische wijziging
   - Stel per groep een aparte commit message voor in conventional commit format
   - Vraag de gebruiker of ze wil splitsen of alles in een commit wil doen
5. Analyseer de wijzigingen en bepaal het type:
   - `feat:` nieuwe functionaliteit
   - `fix:` bugfix
   - `refactor:` code herstructurering zonder gedragswijziging
   - `style:` formatting, geen logica
   - `docs:` documentatie
   - `test:` tests toevoegen of aanpassen
   - `chore:` build, deps, config
6. Schrijf een commit message:
   - Eerste regel: `type(scope): korte beschrijving` (max 72 tekens, Engels)
   - Optioneel: body met uitleg waarom (niet wat -- dat ziet men in de diff)
7. **Lint check**: draai de project linter (bijv. `npm run lint`, `ruff check`) voor commit. Als lint fouten gevonden worden:
   - Toon de specifieke lint fouten aan de gebruiker
   - Stel voor om de fouten eerst te fixen voordat je commit
   - Commit NIET zolang er lint fouten zijn
8. **Bevestiging**: toon de voorgestelde commit message en vraag de gebruiker om bevestiging voordat je commit
9. Voer `git commit -m "..."` uit
10. Toon de commit hash en samenvatting

Regels:

- Nooit force push naar main/master
- Nooit `--no-verify` tenzij expliciet gevraagd
- Bij twijfel over scope: vraag even

# Claude Starter Pack voor Vastgoedmakelaars -- Blueprint

Kopieer de prompt hieronder in Claude Code. Het installeert de complete setup, vraagt je persoonlijke gegevens, en configureert alles zodat Claude jou kent als makelaar.

---

## Kopieer Alles Onder Deze Lijn In Claude Code

```
Installeer en configureer het Claude Starter Pack voor Vastgoedmakelaars. Dit pack bevat 24 gespecialiseerde agents, 20 skills, 11 slash commands, en permission profiles. Volg deze stappen exact. Pauzeer en vraag mij om input waar aangegeven.

---

### Stap 1: Repo klonen en controleren

Kloon de repo en check of alles aanwezig is:

```bash
git clone https://github.com/SamuelWillems/claude-starter-pack.git
cd claude-starter-pack
git checkout vastgoed
```

Controleer of deze bestanden bestaan:
- `install.sh`
- `claude-code/CLAUDE.md`
- `claude-code/settings.dev.json`
- `claude-code/agents/pm.md`
- `claude-code/skills/pm/SKILL.md`

Als iets ontbreekt, meld het en stop.

---

### Stap 2: Installatie draaien

Draai het install script:

```bash
chmod +x install.sh
./install.sh
```

Het script vraagt je om een permission profiel te kiezen:
- **safe**: alleen lezen/schrijven, geen destructieve acties (aanbevolen voor beginners)
- **dev**: volledige development tools (aanbevolen voor developers)
- **elevated**: alles, geen beperkingen (alleen als je weet wat je doet)

**Wacht tot de installatie voltooid is voor je verdergaat.**

Verifieer de installatie:
```bash
ls ~/.claude/agents/*.md | wc -l
ls ~/.claude/commands/*.md | wc -l
ls -d ~/.claude/skills/*/ | wc -l
```

Verwacht: 24 agents, 11 commands, 20 skills. Als de aantallen kloppen, ga door.

---

### Stap 3: Persoonlijke gegevens (VRAAG MIJ)

**Pauzeer hier en vraag mij deze gegevens:**

1. **Naam** -- Hoe heet je? Hoe wil je aangesproken worden?
   (bv. "Marie Peeters, noem me Marie")

2. **Kantoornaam** -- Wat is de naam van je vastgoedkantoor?
   (bv. "Peeters Vastgoed")

3. **BIV-nummer** -- Wat is je BIV-erkenningsnummer?
   (bv. "123.456")

4. **Regio** -- In welke regio('s) ben je actief?
   (bv. "Oost-Vlaanderen, focus Gent en rand")

5. **Type panden** -- Wat voor type panden behandel je?
   (bv. "Residentieel: appartementen en woningen")

6. **Rechtsvorm** -- Wat is de rechtsvorm van je kantoor?
   (bv. "BV" of "eenmanszaak")

7. **Tools** -- Welke tools gebruik je?
   - CRM: (bv. "Whise" of "Sweepbright" of "geen")
   - Portalen: (bv. "Immoweb, Zimmo")
   - Facturatie: (bv. "Billit")
   - Social media: (bv. "Facebook, Instagram, LinkedIn")

8. **Team** -- Werk je solo of heb je een team?
   (bv. "Klein kantoor: 2 makelaars en 1 admin")

9. **Taal en toon** -- Hoe formeel moet Claude zijn?
   (bv. "Informeel, tutoyeren" of "Professioneel maar niet stijf")

10. **Grootste frustratie met AI** -- Noem 1-2 dingen die je irriteren.
    (bv. "Te lang, herhaalt mijn vraag")

**Wacht op alle antwoorden voor je verdergaat.**

---

### Stap 4: Context bestanden aanmaken

Maak op basis van de antwoorden drie bestanden aan in `~/.claude/`:

**~/.claude/about-me.md:**
```markdown
# Over mij

## Profiel
- Naam: [antwoord 1]
- Kantoor: [antwoord 2]
- BIV-nummer: [antwoord 3]
- Regio: [antwoord 4]
- Type: [antwoord 5]
- Rechtsvorm: [antwoord 6]

## Sector
- Belgische vastgoedmakelaardij
- Doelgroep: kopers, verkopers, huurders, verhuurders
- Panden: [antwoord 5]

## Regelgeving
- BIV-plichtenleer en deontologie
- GDPR: persoonsgegevens kopers/verkopers/huurders
- Anti-witwas: identificatieplicht en waakzaamheidsplicht
- Informatieplichten: EPC, bodemattest, stedenbouw

## Tools & platformen
- CRM: [antwoord 7 CRM]
- Portalen: [antwoord 7 portalen]
- Facturatie: [antwoord 7 facturatie]
- Social media: [antwoord 7 social]

## Team
- [antwoord 8]
```

**~/.claude/my-voice.md:**
```markdown
# Mijn communicatiestijl

## Taal
- Primaire taal: Nederlands (Belgisch Nederlands)

## Toon
- [antwoord 9 -- vertaal naar concrete beschrijving]

## Stijl
- Direct en bondig
- Bullets en lijsten waar mogelijk

## Wat ik waardeer
- Concrete antwoorden die ik meteen kan gebruiken
- Belgische context: wetgeving, Immoweb, lokale markt
- Eerlijk advies

## Wat ik niet wil
- [antwoord 10 -- vertaal naar lijst]
- Juridisch advies zonder disclaimer
```

**~/.claude/my-rules.md:**
```markdown
# Werkregels

## Domeinregels
- Informatieplichten respecteren (EPC, bodemattest, stedenbouw)
- GDPR: persoonsgegevens correct verwerken
- Anti-witwas: identificatieplicht naleven
- BIV-deontologie: commissieregels, mandaatovereenkomsten
- Altijd disclaimer bij juridisch en fiscaal advies

## Wat Claude NIET mag doen
- Juridisch advies geven zonder disclaimer
- Persoonsgegevens van klanten in output tonen
- Beslissingen nemen over contracten of mandaten
```

Schrijf alle drie de bestanden naar `~/.claude/`.

---

### Stap 5: Placeholders vervangen in agents

Vervang de placeholders in de agents en skills die bedrijfsspecifieke referenties bevatten:

```bash
# Vervang [BEDRIJFSNAAM] in alle agents en skills
find ~/.claude/agents ~/.claude/skills -name "*.md" -exec sed -i '' 's/\[BEDRIJFSNAAM\]/[antwoord 2]/g' {} +

# Vervang [REGIO]
find ~/.claude/agents ~/.claude/skills -name "*.md" -exec sed -i '' 's/\[REGIO\]/[antwoord 4]/g' {} +

# Vervang [RECHTSVORM]
find ~/.claude/agents ~/.claude/skills -name "*.md" -exec sed -i '' 's/\[RECHTSVORM\]/[antwoord 6]/g' {} +

# Vervang [BOEKHOUDSOFTWARE] als van toepassing
find ~/.claude/agents ~/.claude/skills -name "*.md" -exec sed -i '' 's/\[BOEKHOUDSOFTWARE\]/[antwoord 7 facturatie]/g' {} +
```

Gebruik de daadwerkelijke antwoorden van de gebruiker, niet de placeholder tekst.

**Verifieer dat er geen [PLACEHOLDER] teksten meer staan:**
```bash
grep -r '\[BEDRIJFSNAAM\]\|\[REGIO\]\|\[RECHTSVORM\]\|\[BOEKHOUDSOFTWARE\]\|\[BIV-NUMMER\]\|\[NAAM\]' ~/.claude/agents/ ~/.claude/skills/ | head -20
```

Als er nog placeholders zijn, vervang die ook.

---

### Stap 6: CLAUDE.md personaliseren

Open `~/.claude/CLAUDE.md` en pas de taalinstelling aan als de gebruiker niet in het Nederlands wil werken.

De rest van het CLAUDE.md (agent-hierarchie, permission profiles, cowork modus, code conventies) hoeft niet aangepast te worden -- dat werkt generiek.

---

### Stap 7: Testen

Test de installatie met drie opdrachten. Voer ze een voor een uit:

**Test 1 -- Property beschrijving (test copywriter + vastgoed kennis):**
```
/ask Schrijf een property beschrijving voor een gerenoveerd appartement met 2 slaapkamers in [antwoord 4 regio], 85m2, met terras en garage. Vraagprijs 295.000 euro.
```

Controleer: Klopt de toon? Wordt de regio correct vermeld? Is er een CTA? Geen misleidende superlatieven?

**Test 2 -- Juridische vraag (test legal-makelaar + disclaimer):**
```
/ask Welke informatieplichten heb ik bij de verkoop van een woning in Vlaanderen?
```

Controleer: Noemt het EPC, bodemattest, stedenbouw? Staat er een disclaimer? Wordt BIV-deontologie gerefereerd?

**Test 3 -- Planning (test /start flow):**
```
/start Maak een content kalender voor onze social media voor de komende maand. Focus op Instagram en Facebook.
```

Controleer: Wordt de prompt-analyst of fast modus geactiveerd? Maakt de PM een plan? Wordt de marketing agent betrokken?

---

### Stap 8: Resultaat tonen

Toon een samenvatting van wat er geinstalleerd is:

```
Installatie compleet!

Geinstalleerd:
- 24 agents (incl. legal-makelaar, marketing, cfo, hr, mobile-dev, etc.)
- 20 skills met Cowork ondersteuning
- 11 commands (incl. /start met fast/strict modus, /ask voor directe vragen)
- 3 permission profiles (safe/dev/elevated)
- Persoonlijke context: about-me.md, my-voice.md, my-rules.md

Profiel: [gekozen profiel]
Kantoor: [antwoord 2]
Regio: [antwoord 4]

Handige commando's:
- /start [opdracht]    -- start een taak met planning
- /ask [vraag]         -- directe vraag zonder planning
- /review              -- code review
- /ship                -- pre-ship checklist

Profiel wisselen:
- ~/.claude/switch-profile.sh safe      -- restrictief
- ~/.claude/switch-profile.sh dev       -- development
- ~/.claude/switch-profile.sh elevated  -- alles

Tips:
- Gebruik /ask voor snelle vragen (property beschrijving, email, advies)
- Gebruik /start voor complexe taken (nieuwe feature, refactor, campagne)
- In Cowork activeren skills automatisch op basis van je vraag
```

Klaar! De gebruiker kan nu Claude gebruiken met volledige vastgoedkennis.
```

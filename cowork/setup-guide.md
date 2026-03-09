# Claude Cowork Setup Guide

> Deze guide helpt je om Claude Cowork in te richten met je persoonlijke context. Cowork is de webgebaseerde versie van Claude met projectmappen en tools.

## Wat is Cowork?

Claude Cowork is de browser-versie van Claude waar je met projecten en bestanden kunt werken. In tegenstelling tot Claude Code (CLI) heb je geen terminal nodig. Cowork is ideaal voor:

- Documenten schrijven en bewerken
- Presentaties en spreadsheets maken
- Email en communicatie
- Research en analyse
- Alles waar je geen code voor hoeft te schrijven

## Stap 1: Werkmap kiezen

In Cowork werk je vanuit een map op je computer. Kies of maak een map aan die je als "thuisbasis" gebruikt, bijvoorbeeld:

```
~/Documents/Claude-workspace/
```

## Stap 2: Context bestanden plaatsen

Kopieer de drie bestanden uit de `context/` map van dit starter pack naar je werkmap:

```
Claude-workspace/
  context/
    about-me.md      <- wie je bent
    my-voice.md      <- hoe Claude moet communiceren
    my-rules.md      <- werkregels en domeincontext
```

Vul ze in aan de hand van de templates. Gebruik de `examples/` map als inspiratie.

## Stap 3: CLAUDE.md aanmaken

Maak een `CLAUDE.md` aan in de root van je werkmap:

```markdown
# CLAUDE.md

## Context

Lees altijd eerst de persoonlijke context:

- `context/about-me.md` -- wie ik ben, bedrijven, expertise, tools
- `context/my-voice.md` -- taal, toon, schrijfstijl
- `context/my-rules.md` -- werkregels, do's & don'ts, domeincontext

## Werkafspraken

- Antwoord in [je taal]
- Sla output op als bestand, niet als lange tekst in chat
- Bij externe acties (e-mail, publicatie): vraag eerst bevestiging
- Bij code en bestanden: werk direct, geen toestemming nodig
```

## Stap 4: Testen

1. Open Claude Cowork
2. Selecteer je werkmap
3. Stel een typische vraag
4. Check: kent Claude je naam? Klopt de taal? De toon?
5. Pas de bestanden aan waar nodig

## Tips

- **Iteratief**: je profiel wordt beter naarmate je het bijstuurt
- **Specifiek**: "geen emoji's" werkt beter dan "wees professioneel"
- **Kort**: lange bestanden worden minder goed gevolgd
- **Update**: als Claude iets fout doet, pas de context bestanden aan

## Cowork vs Claude Code

| Feature          | Cowork (web)                      | Claude Code (CLI)         |
| ---------------- | --------------------------------- | ------------------------- |
| Interface        | Browser                           | Terminal                  |
| Bestanden        | Via werkmap                       | Direct op filesystem      |
| Code uitvoeren   | Nee                               | Ja (Bash)                 |
| Documenten maken | Ja (docx, pptx, pdf)              | Nee                       |
| Agents           | Via skills/plugins                | Via `.claude/agents/`     |
| Slash commands   | Via skills                        | Via `.claude/commands/`   |
| Git operaties    | Nee                               | Ja                        |
| Ideaal voor      | Documenten, communicatie, analyse | Development, devops, code |

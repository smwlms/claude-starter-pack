---
name: write-a-skill
description: Create new skills (commands/agents) with the right structure, description, and optionally an eval. Use when creating, writing, or building a new skill.
---

# Write a Skill — Create a New Skill

Guide the creation of a new skill (command or agent) with the right structure, description, and optionally an eval file.

## Process

### Step 1: Gather requirements

Ask the user about:

- What domain/task does the skill cover?
- What specific use cases should it handle?
- Is it a **command** (user-triggered, e.g., /plan) or an **agent** (called by other agents)?
- Reference material to incorporate?
- Should there be an eval?

### Step 2: Design the skill

Based on the requirements, design:

1. **Name**: short, descriptive slug (e.g., `triage-issue`, `write-a-prd`)
2. **Description**: crucial — see "Description Requirements" section below
3. **Workflow steps**: the process the skill follows
4. **Rules**: constraints and do's/don'ts
5. **Output format**: what the skill produces

### Step 3: Write the skill file

Write the `.md` file to `~/.claude/commands/<name>.md` (commands) or `~/.claude/agents/<name>.md` (agents).

Use this template:

```markdown
---
name: skill-name
description: Short description of the capability. Use for [specific triggers].
---

# Skill Name — Subtitle

[1-2 sentences about what the skill does and when to use it]

## Process

### Step 1: [First step]

[Instructions]

### Step 2: [Second step]

[Instructions]

## Rules

1. **Rule 1** — explanation
2. **Rule 2** — explanation

## Context

$ARGUMENTS
```

### Step 4: Create eval file

Always suggest creating an eval. If the user explicitly wants an eval, create it directly. If the user doesn't ask for it, suggest: "Want an eval with that? It lets you test the skill and iteratively improve it via /improve-skill."

Write the eval file to `evals/<type>/<name>.json` (where `<type>` = `commands` or `agents`).

Use this format:

```json
{
  "skill": "<name>",
  "type": "<command|agent>",
  "version": 1,
  "tests": [
    {
      "name": "test-name",
      "prompt": "The prompt that tests the skill",
      "expected_type": "Type of output expected",
      "assertions": [
        { "id": "A1", "check": "Binary assertion", "weight": 1 },
        { "id": "A2", "check": "Binary assertion", "weight": 1 },
        { "id": "A3", "check": "Binary assertion", "weight": 1 },
        { "id": "A4", "check": "Binary assertion", "weight": 1 },
        { "id": "A5", "check": "Binary assertion", "weight": 1 }
      ]
    }
  ]
}
```

Target: 5 tests x 5 assertions = 25 total.

**Assertion rules**:

- BINARY: true/false, no subjective judgment
- GOOD: "Output contains an acceptance criteria section"
- BAD: "Output is of good quality"

### Step 5: Review with user

Present the draft and ask:

- Does this cover your use cases?
- Is anything missing or unclear?
- Should a section be more or less detailed?

## Description Requirements

The description is **the only thing the agent sees** when choosing which skill to load. It is shown in the system prompt alongside all other installed skills.

**Goal**: give the agent enough info to know:

1. What capability this skill provides
2. When/why to trigger it (specific keywords, contexts)

**Format**:

- Max 1024 characters
- Write in third person
- First sentence: what it does
- Second sentence: "Use for [specific triggers]"

**Good example**:

```
Convert a PRD into GitHub issues with vertical slices and HITL/AFK classification. Use when breaking down a PRD into implementable tasks, issue planning, or "tracer bullets".
```

**Bad example**:

```
Helps with planning.
```

## When to split files

Split into separate files when:

- The skill file gets longer than 100 lines
- Content has clear domains
- Advanced features are rarely needed

## Review Checklist

After writing, verify:

- [ ] Description contains triggers ("Use for...")
- [ ] Skill file under 150 lines
- [ ] No time-sensitive information
- [ ] Consistent terminology
- [ ] Concrete examples included
- [ ] $ARGUMENTS section present
- [ ] Rules are specific and actionable
- [ ] Output format is clearly defined

## Skill structure

Skills live in two places:

- **Commands**: `~/.claude/commands/<name>.md` — triggered by user with `/name`
- **Agents**: `~/.claude/agents/<name>.md` — called by other agents
- **Evals**: `evals/<type>/<name>.json` — binary tests

## Rules

1. **Description is crucial** — it's the only way the agent finds the skill
2. **Max 150 lines** — shorter is better, adherence drops with long files
3. **$ARGUMENTS section** — always present at the end for context passing
4. **Binary assertions** — eval tests are true/false, never subjective
5. **No time-sensitive info** — no version numbers, dates, or links that age

## Context

$ARGUMENTS

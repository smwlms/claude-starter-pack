---
name: prd-to-issues
description: Convert a PRD into independent, vertical GitHub issues — tracer bullet approach with HITL/AFK classification
---

# PRD to Issues — Vertical Slices

Convert a PRD into GitHub issues that cut through all layers of the stack as vertical slices.

## Process

### Step 1: Read the PRD

1. Read the PRD file:
   - From $ARGUMENTS if a path was provided
   - Or search in `docs/prd-*.md` in the project root
2. If no PRD is found: report this and stop

### Step 2: Explore the codebase

1. Read CLAUDE.md for project context
2. Explore the files mentioned in the PRD
3. Understand the current architecture: how do the layers connect?
4. Identify existing patterns for similar features

### Step 3: Determine vertical slices

**Critical: split VERTICALLY, not HORIZONTALLY.**

- WRONG (horizontal): "Issue 1: Database schema", "Issue 2: API endpoints", "Issue 3: UI components"
- RIGHT (vertical): "Issue 1: User can do X (DB + API + UI)", "Issue 2: User can do Y (DB + API + UI)"

Per slice:

1. Identify the user story this slice implements
2. Determine which layers are affected (DB, API, business logic, UI)
3. Ensure the slice is **independently testable**
4. Estimate size: should fit in 1 work session

### Step 4: Determine the tracer bullet

The first issue is ALWAYS the **tracer bullet**:

- The thinnest vertical slice that cuts through the ENTIRE system
- From database to UI, all layers touched
- Minimal functionality, maximum architecture validation
- Goal: prove that the chosen architecture works

### Step 5: HITL vs AFK classification

Classify each issue:

- **HITL (Human-In-The-Loop)**: requires decisions or input from the user during implementation. E.g., UI design choices, business rule validation, unclear requirements.
- **AFK (Away-From-Keyboard)**: can be executed fully autonomously. Requirements are clear, no open questions, tests are clearly defined.

This helps the user plan: AFK issues can be batch-run, HITL issues require presence.

### Step 6: Blocking relations and dependency order

- Determine which issues depend on other issues
- The tracer bullet is always issue #1 and blocks nothing
- Minimize blocking relations — parallelizable where possible
- **Create issues in dependency order** so you can reference real issue numbers in "Blocked by" fields

### Step 7: Quiz — present and iterate

Present the full overview to the user:

1. Show the overview table (see output format)
2. Ask explicitly: "Does this breakdown look right? Want to add, remove, or split differently?"
3. Process feedback and adjust the breakdown
4. Repeat until the user approves
5. After approval: create issues via `gh issue create`

### Step 8: Create issues

Per issue, use this format with `gh issue create`:

```markdown
## [Short title — describes the user-facing capability]

**Parent PRD**: `docs/prd-[name].md`
**User stories addressed**: [numbers from the PRD, e.g., US-1, US-3]
**Type**: HITL / AFK

### Context

User story: As [role] I want [action] so that [value]

### What

[Concrete description of what needs to be built — all layers]

### Layers

- [ ] Database: [migration/schema change]
- [ ] API: [endpoint/route]
- [ ] Business logic: [service/util]
- [ ] UI: [component/page]
- [ ] Tests: [what is tested]

### Acceptance Criteria

- [ ] AC 1: [specific and testable]
- [ ] AC 2: [specific and testable]

### Technical approach

[Files affected, implementation suggestion]

### Blocked by

[Issue numbers that must be completed first, or "None"]

### Size

[S/M/L — S fits in 30 min, M in 1-2 hours, L in 3+ hours]
```

## Rules

1. **Vertical slices** — every issue cuts through ALL layers, never split horizontally
2. **Tracer bullet first** — the first issue is always the thinnest vertical slice
3. **HITL/AFK classification** — every issue is classified so the user can plan
4. **Quiz before approval** — present the breakdown, ask feedback, iterate until approved
5. **Dependency order** — create issues in order so real issue numbers are available
6. **Parent PRD reference** — every issue references the source PRD and user stories it addresses
7. **Independently testable** — each issue can be tested after completion without other issues
8. **1 session per issue** — issues that take longer than 3 hours: split further
9. **Proportional number of issues** — small features: 1-3 issues, large features: 5-10 issues
10. **Concrete files** — name the files that are affected
11. **Use `gh issue create`** — create issues directly in GitHub after confirmation

## Output format (overview for quiz)

```markdown
## Issues overview — [Feature name]

Source: `docs/prd-[name].md`
Total: [N] issues ([X] AFK, [Y] HITL)

| #   | Title                | Type | Layers    | Size | Blocked by | User Stories |
| --- | -------------------- | ---- | --------- | ---- | ---------- | ------------ |
| 1   | [Tracer bullet: ...] | AFK  | DB+API+UI | S    | None       | US-1         |
| 2   | [...]                | HITL | API+UI    | M    | #1         | US-2, US-3   |
| 3   | [...]                | AFK  | DB+API+UI | M    | None       | US-4         |

Does this breakdown look right? Want to add, remove, or split differently?
```

## Integration

- Input: PRD file (from /write-a-prd)
- Output: GitHub issues via `gh issue create`
- Next: use /start or /tdd to implement the issues

## Context

$ARGUMENTS

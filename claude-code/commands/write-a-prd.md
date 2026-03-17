---
name: write-a-prd
description: Write a Product Requirements Document based on conversation or /grill-me output — user stories, architecture, acceptance criteria
---

# Write a PRD — Product Requirements Document

Write a complete PRD based on user input, a /grill-me session, or a direct description.

## Process

### Step 1: Gather context

1. Read input: $ARGUMENTS, /grill-me output, or direct description
2. Read CLAUDE.md in the project root for project context
3. Explore the codebase:
   - Existing files and modules that are relevant
   - Current architecture patterns (routing, state management, API calls)
   - Database schemas and migrations
   - Existing tests and test patterns
   - Dependencies in package.json / pyproject.toml

### Step 2: Resolve ambiguities

- If there are ambiguities: ask targeted questions — **max 1 round, max 5 questions**
- Provide a default with each question: "I assume X unless you say otherwise"
- If input comes from /grill-me: there should be no ambiguities left

### Step 3: Sketch modules (Deep Modules)

Think in **deep modules** (Ousterhout's A Philosophy of Software Design): few modules with broad functionality and a narrow interface. Not many small files that together form 1 concept.

Per module:

- **Interface**: which functions/methods are exposed? As narrow as possible.
- **Responsibility**: what does this module do? Broad and deep.
- **Dependencies**: which other modules does it need?

### Step 4: Write the PRD

Write the PRD in the format below. Save it as: `docs/prd-[feature-name].md` in the project root.

## Output format

```markdown
# PRD: [Feature name]

**Date**: [date]
**Status**: Draft
**Author**: Claude (based on conversation with [user])

## Problem

[What are we solving? For whom? Why is this important? Max 3 sentences.]

## Solution

[How do we solve it? High level description. Max 5 sentences.]

## User Stories

1. As [role] I want [action] so that [value]
   - AC: [acceptance criterion 1]
   - AC: [acceptance criterion 2]

2. As [role] I want [action] so that [value]
   - AC: [acceptance criterion 1]
   - AC: [acceptance criterion 2]

## Implementation Decisions

Architecture decisions that guide implementation. No specific file paths — those change. Focus on patterns and principles.

- [Decision 1: e.g., "Queue-based processing with retry logic for webhook events"]
- [Decision 2: e.g., "Server-side rendering for SEO-critical pages"]
- [Decision 3: e.g., "Optimistic UI updates with rollback on server errors"]

## Testing Decisions

Which modules deserve tests and what type?

- [Module 1]: [unit tests — pure business logic, no I/O]
- [Module 2]: [integration tests — API endpoints with database]
- [Module 3]: [e2e tests — critical user flows]
- Not testing: [trivial wrappers, pure UI layout]

## Scope

### In scope

- [Concrete item 1]
- [Concrete item 2]

### Out of scope

- [Explicitly excluded item 1]
- [Explicitly excluded item 2]

## Architecture

### Modules

[Which deep modules are built or modified? Per module: interface + responsibility]

### Data flow

[How does data flow through the system? From input to storage.]

### Database changes

[New tables, columns, migrations — or "None"]

### API changes

[New endpoints, modified endpoints — or "None"]

## Risks

| Risk   | Impact       | Likelihood   | Mitigation        |
| ------ | ------------ | ------------ | ----------------- |
| [risk] | High/Med/Low | High/Med/Low | [how to mitigate] |

## Open questions

- [Question to be answered later, if applicable]

## Additional notes

[Additional context, references, or considerations that don't fit other sections]
```

## Rules

1. **Always read CLAUDE.md** — for project context, tech stack, conventions
2. **Always explore the codebase** — base architecture on what IS, not what you think
3. **Numbered user stories with AC** — every user story has at least 1 acceptance criterion
4. **Implementation Decisions without file paths** — patterns and principles, no `src/foo/bar.ts`
5. **Testing Decisions required** — which modules to test, what type, what NOT to test
6. **Deep modules** — think in broad modules with narrow interfaces, not many small files
7. **Scope explicit** — in scope AND out of scope, both required
8. **Name risks** — at least 1 risk, with mitigation
9. **Save the file** — save the PRD as `docs/prd-[feature-name].md`
10. **Max 1 round of questions** — if input is unclear, don't endlessly interview

## Integration

- Input: /grill-me output, direct description, or $ARGUMENTS
- Output: saved PRD file
- Next: use /prd-to-issues to convert the PRD into GitHub issues

## Context

$ARGUMENTS

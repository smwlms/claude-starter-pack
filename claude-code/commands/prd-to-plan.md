---
name: prd-to-plan
description: Convert a PRD into a phased implementation plan with vertical slices (tracer bullets) — saved as local Markdown file in ./plans/
---

# PRD to Plan — Vertical Slices as Local Plan

Break a PRD into a phased implementation plan with vertical slices (tracer bullets). Output is a Markdown file in `./plans/`.

**Difference with /prd-to-issues**: this creates a LOCAL plan file, /prd-to-issues creates GitHub issues.

## Process

### Step 1: Confirm the PRD

The PRD must already be in the conversation. If it's not: ask the user to paste it or reference the file.

- From $ARGUMENTS if a path was provided
- Or search in `docs/prd-*.md` in the project root

### Step 2: Explore the codebase

If you haven't explored the codebase yet:

1. Read CLAUDE.md for project context
2. Understand the current architecture, existing patterns and integration layers
3. Identify existing patterns for similar features

### Step 3: Identify durable architecture decisions

Before slicing, identify high-level decisions that will likely NOT change during implementation:

- Route structures / URL patterns
- Database schema shape
- Key data models
- Authentication / authorization approach
- Third-party service boundaries

These go in the **plan header** so every phase can reference them.

### Step 4: Work out vertical slices

Break the PRD into **tracer bullet** phases. Each phase is a thin vertical slice that cuts through ALL integration layers, NOT a horizontal slice of one layer.

**Vertical slice rules**:

- Each slice delivers a narrow but COMPLETE path through every layer (schema, API, UI, tests)
- A completed slice can be demonstrated or verified on its own
- Prefer many thin slices over few thick ones, but keep the count proportional to PRD size (small feature: 1-3 phases, medium: 3-5, large: 5-10)
- Contains NO specific file names, function names, or implementation details that are likely to change
- DOES contain durable decisions: route paths, schema shapes, data model names

### Step 5: Quiz — present and iterate

Present the proposed breakdown as a numbered list. Per phase show:

- **Title**: short descriptive name
- **User stories**: which user stories from the PRD this addresses

Ask the user:

- Does the granularity feel right? (too coarse / too fine)
- Should phases be merged or split further?

Iterate until the user approves.

### Step 6: Write the plan file

Create `./plans/` if it doesn't exist. Write the plan as a Markdown file, named after the feature (e.g., `./plans/user-onboarding.md`).

Use this template:

```markdown
# Plan: [Feature Name]

> Source PRD: [short identifier or link]

## Architecture decisions

Durable decisions that apply to all phases:

- **Routes**: ...
- **Schema**: ...
- **Key models**: ...
- (add/remove sections as needed)

---

## Phase 1: [Title]

**User stories**: [list from PRD]

### What to build

A concise description of this vertical slice. Describe the end-to-end behavior, not layer-by-layer implementation.

### Acceptance criteria

- [ ] Criterion 1
- [ ] Criterion 2
- [ ] Criterion 3

---

## Phase 2: [Title]

**User stories**: [list from PRD]

### What to build

...

### Acceptance criteria

- [ ] ...

<!-- Repeat for each phase -->
```

## Rules

1. **Vertical slices** — every phase cuts through ALL layers, never split horizontally
2. **Tracer bullet first** — the first phase is always the thinnest vertical slice that cuts through the entire system
3. **Durable decisions in header** — architecture decisions that don't change per phase
4. **Quiz before approval** — present the breakdown, ask feedback, iterate until approved
5. **No implementation details** — no file names, function names, or code in the plan
6. **DO include durable choices** — route patterns, schema shapes, data model names
7. **Local file** — output to `./plans/`, not GitHub issues
8. **Complementary to /prd-to-issues** — use this for local planning, /prd-to-issues for GitHub issue tracking

## Integration

- Input: PRD file (from /write-a-prd)
- Output: Local Markdown plan file in `./plans/`
- Next: use /prd-to-issues to convert the phases into GitHub issues

## Context

$ARGUMENTS

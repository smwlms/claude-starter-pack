---
name: triage-issue
description: Triage a bug by exploring the codebase, finding root cause, and creating a GitHub issue with TDD fix plan. Use for bug reports, issue filing, triage, or investigating and planning a fix.
---

# Triage Issue — Bug Investigation + TDD Fix Plan

Investigate a reported problem, find the root cause, and create a GitHub issue with a TDD fix plan. This is a largely **hands-off** workflow — minimize questions to the user.

**Difference with /debug**: this creates an ISSUE with fix plan, /debug fixes directly locally.

## Process

### Step 1: Capture the problem

Get a short description of the problem from the user. If they haven't given one, ask ONE question: "What's the problem you're seeing?"

Do NOT ask follow-up questions. Begin investigating immediately.

### Step 2: Explore and diagnose

Use the Task tool with an Explore sub-agent to deeply investigate the codebase. Your goal is to find:

- **Where** the bug manifests (entry points, UI, API responses)
- **Which** code path is involved (trace the flow)
- **Why** it fails (the root cause, not just the symptom)
- **What** related code exists (similar patterns, tests, adjacent modules)

Look at:

- Related source files and their dependencies
- Existing tests (what is tested, what's missing)
- Recent changes to involved files (`git log` on relevant files)
- Error handling in the code path
- Similar patterns elsewhere in the codebase that DO work correctly

### Step 3: Determine fix approach

Based on your investigation, determine:

- The minimal change to fix the root cause
- Which modules/interfaces are affected
- What behavior needs to be verified via tests
- Whether this is a regression, missing feature, or design flaw

### Step 4: Design TDD fix plan

Create a concrete, ordered list of RED-GREEN cycles. Each cycle is a vertical slice:

- **RED**: describe a specific test that captures the broken/missing behavior
- **GREEN**: describe the minimal code change to make that test pass

Rules:

- Tests verify behavior via **public interfaces**, not implementation details
- One test at a time, vertical slices (NOT all tests first, then all code)
- Each test must survive an internal refactor
- Add a final refactor step if needed
- **Durability**: only propose fixes that survive a radical codebase change. Describe behavior and contracts, not internal structure. Tests assert on observable outcomes (API responses, UI state, user-visible effects), not internal state.

### Step 5: Create GitHub issue

Create a GitHub issue via `gh issue create` with the template below. Create the issue DIRECTLY without asking the user for review — share the URL afterward.

```markdown
## Problem

A clear description of the bug or issue:

- What happens (actual behavior)
- What should happen (expected behavior)
- How to reproduce (if applicable)

## Root Cause Analysis

Describe what you found during investigation:

- The involved code path
- Why the current code fails
- Contributing factors

Contains NO specific file paths, line numbers, or implementation details that couple to the current code layout. Describe modules, behaviors and contracts. The issue must remain useful after a major refactor.

## TDD Fix Plan

A numbered list of RED-GREEN cycles:

1. **RED**: Write a test that [describes expected behavior]
   **GREEN**: [Minimal change to make the test pass]

2. **RED**: Write a test that [describes next behavior]
   **GREEN**: [Minimal change to make the test pass]

...

**REFACTOR**: [Any cleanup after all tests]

## Acceptance Criteria

- [ ] Criterion 1
- [ ] Criterion 2
- [ ] All new tests pass
- [ ] Existing tests still pass
```

After creating: print the issue URL and a one-sentence summary of the root cause.

## Rules

1. **Hands-off** — minimize questions, maximize own investigation
2. **Root cause, not symptom** — dig through until you find the real cause
3. **TDD fix plan** — always RED-GREEN cycles, never "fix this file"
4. **Durable descriptions** — no file paths or line numbers in the issue
5. **Create directly** — create the issue directly, don't ask for review
6. **Vertical slices** — one test at a time, not all tests first
7. **Complementary to /debug** — this creates an issue with plan, /debug fixes directly

## Integration

- Complementary to /debug (this = create issue, that = fix directly)
- Fix plan can be executed with /tdd
- Root cause analysis can be input for /refactor-plan for structural problems

## Context

$ARGUMENTS

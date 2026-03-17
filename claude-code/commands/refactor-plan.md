---
name: refactor-plan
description: Create a detailed refactor plan with tiny commits via an interview — includes test coverage check and GitHub issue. Use when planning a refactor, writing an RFC, or breaking down into safe steps.
---

# Refactor Plan — Detailed Plan with Tiny Commits

Create a refactor plan via a structured interview, break it into the smallest possible commits, and capture it as a GitHub issue.

**Difference with /refactor**: this PLANS a refactor and creates an issue, /refactor ANALYZES and EXECUTES.

## Process

### Step 1: Get the problem description

Ask the user for a long, detailed description of:

- The problem they want to solve
- Any ideas for solutions

If $ARGUMENTS already contains a description, use that as starting point.

### Step 2: Explore the codebase

1. Read CLAUDE.md for project context
2. Explore the repo to verify the user's claims
3. Understand the current state of the code that will be affected

### Step 3: Discuss alternatives

Ask if the user has considered other options. Present alternatives yourself too:

- Other architecture choices
- Less invasive approaches
- Trade-offs per option
- Backward compatibility impact (existing clients, API consumers, data migration)

### Step 4: Interview about implementation

Interview the user about the implementation. Be **extremely detailed and thorough**:

- Which modules are affected?
- Which interfaces change?
- What are the boundaries of the change?
- Are there dependencies that need to change too?

### Step 5: Lock down scope

Determine exactly:

- **What DOES change** — list of modules, interfaces, behaviors
- **What does NOT change** — explicit out-of-scope list

### Step 6: Check test coverage

Search the codebase for test coverage of the affected area:

- Which tests already exist?
- Which areas are NOT covered?
- If coverage is insufficient: ask the user about their plans for testing

### Step 7: Break into tiny commits

Break the implementation into a plan of **minimal commits**. Follow Martin Fowler's advice:

> "Make each refactoring step as small as possible, so that you can always see the program working."

Each commit must leave the codebase in a **working state**.

### Step 8: Create GitHub issue

Create a GitHub issue via `gh issue create` with the template below:

```markdown
## Problem statement

The problem the developer is experiencing, from the developer's perspective.

## Solution

The proposed solution, from the developer's perspective.

## Commits

A LONG, detailed implementation plan. Written clearly, broken into the smallest possible commits. Each commit leaves the codebase in a working state.

## Decision document

A list of implementation decisions taken:

- The modules being built/modified
- The interfaces that change
- Technical clarifications from the developer
- Architecture decisions
- Schema changes
- API contracts
- Specific interactions

Contains NO specific file paths or code snippets — those age quickly.

## Test decisions

A list of test decisions:

- Description of what a good test is (only test external behavior, not implementation details)
- Which modules are tested
- Existing similar tests in the codebase (prior art)

## Out of Scope

Description of what is NOT in scope for this refactor.

## Additional notes (optional)

Any additional notes about the refactor.
```

## Rules

1. **Interview first** — never start planning before you fully understand the problem
2. **Tiny commits** — each commit is the smallest possible step that keeps the codebase working
3. **Test coverage check** — check existing tests before making a plan
4. **No file paths in issue** — only module names and interfaces, no specific paths
5. **Discuss alternatives** — always present at least 1 alternative approach
6. **Scope explicit** — what DOES and what does NOT change, both described
7. **GitHub issue as output** — the plan is captured as an issue via `gh issue create`
8. **Complementary to /refactor** — this plans, /refactor executes

## Context

$ARGUMENTS

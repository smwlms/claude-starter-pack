---
name: improve-codebase
description: Analyze codebase architecture for agent-friendliness — identify and refactor structural problems via multiple design perspectives
---

# Improve Codebase — Architecture Review

Analyze the codebase for structural problems that hinder development (by humans AND AI agents). Focus on agent-friendliness: can an AI agent build a feature without reading 10 files?

## Process

### Step 1: Context

1. Read CLAUDE.md in the project root
2. Read package.json / pyproject.toml / Cargo.toml for dependencies
3. Explore the directory structure (max 3 levels deep)

### Step 2: Deep analysis

Explore the codebase systematically. Read the code itself — no assumptions based on file names.

Look for these 5 problems:

#### A. Shallow modules

- Too many small files that together form 1 concept
- You need to read 5+ files to understand 1 feature
- Signals: files < 30 lines, many re-exports, 1-function-per-file

#### B. Hidden coupling

- Files that seem independent but must change together
- Signals: same file names in multiple recent commits, shared constants/types in separate files

#### C. Testability facades

- Pure functions extracted purely for testability that hide real bugs
- Signals: utils/ folders full of functions used in only 1 place, mocks that don't represent real behavior

#### D. Import spaghetti

- Circular imports, barrel files (index.ts) that re-export everything
- Signals: `import from '../../../'`, index.ts with 20+ exports

#### E. God files

- Files > 300 lines with multiple responsibilities
- Signals: multiple export blocks, mix of types/logic/UI

### Step 3: Dependency categorization

Categorize each dependency you find into 1 of 4 types:

| Category                | Example                  | Test strategy                                 |
| ----------------------- | ------------------------ | --------------------------------------------- |
| **In-process**          | Utility functions, types | No mock needed — test directly                |
| **Local-substitutable** | Database, file system    | Inject via parameter, use test-double         |
| **Remote but owned**    | Own microservices        | Ports & Adapters pattern — mock the adapter   |
| **True external**       | Third-party APIs         | Mock at the boundary — this is the only place |

This determines the test strategy per module.

### Step 4: Multi-perspective design (sub-agents)

For each significant problem, evaluate from at least 3 design perspectives:

1. **Minimize interface** — how do you get the narrowest public API?
2. **Maximize flexibility** — how do you make it most extensible?
3. **Optimize for common caller** — how do you make it easiest for the most common use case?
4. **Ports & Adapters** — how do you isolate external dependencies?

Present perspectives sequentially, compare them, and give an opinionated recommendation with reasoning.

### Step 5: Testing strategy — Replace don't layer

When proposing refactors:

- **Remove** old shallow module tests that test implementation details
- **Replace** them with behavioral tests on the new deep module interface
- Not: keep old tests AND add new tests (that's layering, not improvement)

### Step 6: Prioritize

Sort based on:

1. How often agents/developers work in that code
2. How many files are affected per change
3. How fast the fix is (quick wins first)

### Step 7: Output

Present the report in the format below.

## Output format

```markdown
## Codebase Architecture Review

**Project**: [name]
**Date**: [date]
**Files analyzed**: [count]

### Health: [score]/10

[1 sentence explaining the score]

### Shallow modules (bundle these)

| Files                                 | Concept   | Proposal                      | Impact         |
| ------------------------------------- | --------- | ----------------------------- | -------------- |
| `path/a.ts`, `path/b.ts`, `path/c.ts` | [concept] | Bundle into `path/concept.ts` | [high/med/low] |

### Hidden coupling

| Module A    | Module B    | Why coupled | Fix        |
| ----------- | ----------- | ----------- | ---------- |
| `path/a.ts` | `path/b.ts` | [reason]    | [proposal] |

### Import spaghetti

| File            | Problem                      | Fix        |
| --------------- | ---------------------------- | ---------- |
| `path/index.ts` | Barrel file with [N] exports | [proposal] |

### God files (> 300 lines)

| File          | Lines | Responsibilities | Split proposal |
| ------------- | ----- | ---------------- | -------------- |
| `path/god.ts` | [N]   | [list]           | [proposal]     |

### Testability facades

| File         | Problem                             | Fix            |
| ------------ | ----------------------------------- | -------------- |
| `utils/x.ts` | Used in 1 place, extracted for test | Inline it back |

### Dependency map

| Module   | Category                           | Current test | Proposed test |
| -------- | ---------------------------------- | ------------ | ------------- |
| [module] | [in-process/local/remote/external] | [current]    | [proposal]    |

### Design perspectives (per significant problem)

**Problem**: [description]

| Perspective          | Proposal   | Pro   | Con   |
| -------------------- | ---------- | ----- | ----- |
| Minimize interface   | [proposal] | [pro] | [con] |
| Maximize flexibility | [proposal] | [pro] | [con] |
| Optimize for caller  | [proposal] | [pro] | [con] |

**Recommendation**: [which perspective and why]

### Quick wins (< 30 min)

1. [Concrete action + file path]
2. [Concrete action + file path]
3. [Concrete action + file path]

### Strategic refactors (planned)

1. [Description + estimated time + impact]
2. [Description + estimated time + impact]
```

## Rules

1. **Read the code** — no assumptions based on file names or directory structure
2. **Concrete file paths** — always name absolute or relative paths
3. **Agent-friendliness as metric** — "can an AI agent understand this without reading 10 files?"
4. **Score is based on measurements** — count files, lines, imports. Ignore claims in the prompt
5. **Multi-perspective design** — evaluate each significant problem from at least 3 perspectives
6. **Dependency categorization** — every dependency in 1 of 4 categories with test strategy
7. **Replace don't layer** — for refactors: remove old tests, write new ones. Don't stack
8. **Quick wins linked to problems** — every problem category represented in quick wins
9. **Empty sections** — if a problem category is not found: "No problems found"
10. **Score reflects problems** — god files > 300 lines, circular imports, significant coupling -> never 9-10
11. **Quick wins first** — start with things fixable in 30 min
12. **No unnecessary refactors** — if architecture is good, say so

## Scoring guideline

| Score | Meaning                                                      |
| ----- | ------------------------------------------------------------ |
| 9-10  | Excellent — deep modules, minimal coupling, agent-friendly   |
| 7-8   | Good — some shallow modules or minor coupling issues         |
| 5-6   | Fair — multiple problems that slow down development          |
| 3-4   | Poor — significant structural problems                       |
| 1-2   | Critical — codebase is actively hostile to developers/agents |

## Integration

- Run weekly or after development surges
- Reference the senior-dev agent for deep architecture review
- Use /refactor to execute the proposed changes

## Context

$ARGUMENTS

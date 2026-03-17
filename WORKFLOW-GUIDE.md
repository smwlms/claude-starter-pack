# Workflow Guide — When to Use Which Skill

Reference for the complete skill and agent system. 25 commands, 23 agents, 5 layers.

---

## The Complete Hierarchy

### Layer 1: Idea to Plan

Everything starts with an idea. The vaguer the idea, the more preparation needed.

| Starting point                                 | Command                | What it does                                        | Output                          |
| ---------------------------------------------- | ---------------------- | --------------------------------------------------- | ------------------------------- |
| Vague idea, no direction yet                   | `/grill-me`            | Intensive interview, forces shared understanding    | Shared understanding block      |
| Product unclear, "I don't know how to explain" | `product-coach` agent  | Extracts vision and value proposition via questions | `product-brief.md`              |
| Idea is clear, PRD needed                      | `/write-a-prd`         | Writes full PRD with user stories, architecture, AC | `docs/prd-*.md`                 |
| Establish domain terminology                   | `/ubiquitous-language` | DDD glossary from conversation                      | `UBIQUITOUS_LANGUAGE.md`        |
| Need facts and data                            | `/research`            | Web research                                        | Synthesized answer with sources |

**Typical flow for a new product:**

```
/grill-me -> /write-a-prd -> /prd-to-plan or /prd-to-issues -> /start
```

**Typical flow for an existing product with unclear vision:**

```
product-coach -> /write-a-prd -> /prd-to-plan -> /start
```

---

### Layer 2: Plan to Implementation

A PRD must be broken into workable units. Then `/start` executes it.

#### Breaking down the plan

| Command          | What it does                                                       | Output                              | When to choose                                      |
| ---------------- | ------------------------------------------------------------------ | ----------------------------------- | --------------------------------------------------- |
| `/prd-to-plan`   | PRD to phased Markdown plan with vertical slices                   | `./plans/*.md` local file           | Local planning, no GitHub issues needed             |
| `/prd-to-issues` | PRD to GitHub issues with vertical slices, HITL/AFK classification | GitHub issues via `gh issue create` | Working with GitHub issues, planning AFK batch runs |
| `/plan`          | Interactive implementation plan for a specific task                | Plan with steps, files, risks       | Small scope, no PRD needed, direct feature          |

**Difference `/prd-to-plan` vs `/prd-to-issues`:** Plan creates a local Markdown file, Issues creates real GitHub issues. Plan is input for Issues. Use Plan first to validate the breakdown, then Issues to put it in GitHub.

**Difference `/plan` vs `/prd-to-plan`:** Plan is for a single task ("add X"), PRD-to-Plan is for a complete PRD with multiple user stories.

#### Executing work

| Command  | What it does                                                            | Mode                                                                                   | When to choose                                    |
| -------- | ----------------------------------------------------------------------- | -------------------------------------------------------------------------------------- | ------------------------------------------------- |
| `/start` | Entry point for every task. Analyzes prompt, plans, executes via agents | **fast**: 1 step, direct PM. **strict**: prompt-analyst, handoff, PM, agents, reviewer | Default for all development tasks                 |
| `/tdd`   | Test-Driven Development: Red-Green-Refactor cycles                      | Vertical slices, 1 test at a time                                                      | New features and bugfixes where tests are crucial |

**`/start` internally:**

```
User prompt
    |
[Complex?] --yes--> prompt-analyst -> handoff block -> PM -> agents -> reviewer -> output
    | no
PM (direct) -> agent(s) -> reviewer -> output
```

---

### Layer 3: Quality and Review

After implementation, before merge/deploy.

| Command/Agent    | What it does                                                             | When                                      |
| ---------------- | ------------------------------------------------------------------------ | ----------------------------------------- |
| `/review`        | Code review on correctness, types, style, performance, security, tests   | After every significant change, pre-merge |
| `/ship`          | Pre-ship checklist: lint, tests, build (fail-fast pipeline)              | Before deploy/push                        |
| `/commit`        | Smart git commit: secrets check, logical splitting, conventional commits | At every commit                           |
| `reviewer` agent | Quality gate in PM flow, or standalone review                            | Automatic in `/start` flow, or manual     |
| `qa` agent       | Test plans, regression checks, edge cases, smoke tests                   | For new features, before deploy           |

**Typical quality flow:**

```
Code written -> /review -> fixes -> /ship -> /commit -> push
```

---

### Layer 4: Maintenance and Improvement

Periodic tasks to keep the codebase healthy.

| Command             | What it does                                                                | Frequency                                           |
| ------------------- | --------------------------------------------------------------------------- | --------------------------------------------------- |
| `/improve-codebase` | Architecture review: shallow modules, coupling, god files, import spaghetti | Weekly or after development surges                  |
| `/refactor`         | Analyze specific code, propose refactor plan, execute after approval        | Ad hoc, when code smells are found                  |
| `/refactor-plan`    | Interview about refactor, create GitHub issue with tiny commits plan        | For larger refactors that need planning             |
| `/debug`            | Systematically fix bugs: reproduce, isolate, hypothesize, fix               | For local bugs that need immediate fixing           |
| `/triage-issue`     | Investigate bug, find root cause, create GitHub issue with TDD fix plan     | For bugs that need to be documented as issues       |
| `/init-project`     | Create or improve CLAUDE.md for a project                                   | For every new project, or when CLAUDE.md is missing |

---

### Layer 5: Meta (Self-Improvement)

Improve skills and agents themselves.

| Command            | What it does                                                                | When                                                |
| ------------------ | --------------------------------------------------------------------------- | --------------------------------------------------- |
| `/write-a-skill`   | Create new skill (command or agent) with proper structure and optional eval | New domain or capability needed                     |
| `/improve-skill`   | Autonomous improvement loop: run eval, measure score, iterate               | After writing an eval, or periodically              |
| `/run-eval`        | One-time evaluation of a skill, report score only                           | Quick check, comparison original vs improved        |
| `/activation-eval` | Test if prompts are routed to the correct skill (Layer 1)                   | After changes to routing, agents, or prompt-analyst |

**Meta-improvement flow:**

```
/write-a-skill -> /run-eval (baseline) -> /improve-skill (loop) -> /activation-eval (routing check)
```

---

## Quick Reference: Which Skill When

### "I have an idea but it's vague"

```
/grill-me -> /write-a-prd -> /prd-to-plan or /prd-to-issues -> /start
```

### "I don't know how to explain my product"

```
product-coach agent (via /ask or /start) -> /write-a-prd
```

### "I have a PRD and want to plan it"

```
/prd-to-plan (local) or /prd-to-issues (GitHub)
```

### "I want to build a feature"

```
/start (automatically chooses fast or strict)
```

### "I want to build a feature with tests first"

```
/tdd
```

### "I have a direct question"

```
/ask (no planning overhead, automatically uses the right specialist)
```

### "I want to improve code"

```
/improve-codebase (architecture, whole codebase) or /refactor (specific file/module)
```

### "I want to plan a large refactor"

```
/refactor-plan (interview + GitHub issue with tiny commits)
```

### "I have a bug — fix it now"

```
/debug (fix locally, immediately)
```

### "I have a bug — create an issue"

```
/triage-issue (investigation + GitHub issue with TDD fix plan)
```

### "I want to review my code before merge"

```
/review
```

### "I want to deploy"

```
/ship (lint + tests + build) -> /commit
```

### "I want to design an API"

```
/design-an-interface (compare multiple radical designs, "Design It Twice")
```

### "I want to improve my UI/UX"

```
/design (analysis + concrete recommendations)
```

### "I want to look something up"

```
/research (web research)
```

### "I want to create a new skill"

```
/write-a-skill
```

### "I want to improve a skill"

```
/improve-skill agents/name or /improve-skill commands/name
```

### "I want to capture domain terms"

```
/ubiquitous-language
```

### "I want to set up a new project"

```
/init-project (creates CLAUDE.md)
```

---

## Overlap Clarification

### Asking questions / Intake

| Scenario                                    | USE                           | NOT              | Why                                                                                           |
| ------------------------------------------- | ----------------------------- | ---------------- | --------------------------------------------------------------------------------------------- |
| Work out vague idea to shared understanding | `/grill-me`                   | `prompt-analyst` | grill-me is for open exploration. prompt-analyst is internal to /start strict, not standalone |
| Find product vision/value proposition       | `product-coach` agent         | `/grill-me`      | product-coach focuses on "what is your product", grill-me on "how do we build it"             |
| Clarify prompt for a task                   | `prompt-analyst` (via /start) | `/grill-me`      | prompt-analyst creates a handoff block for the PM, grill-me is a standalone session           |

### Product documents

| Scenario                                       | USE                                                 | NOT               | Why                                                                                                  |
| ---------------------------------------------- | --------------------------------------------------- | ----------------- | ---------------------------------------------------------------------------------------------------- |
| Technical PRD with user stories & architecture | `/write-a-prd`                                      | `product-coach`   | write-a-prd writes a formal PRD, product-coach writes a product brief (higher level, less technical) |
| Product vision and positioning                 | `product-coach`                                     | `/write-a-prd`    | product-coach helps you find the core, write-a-prd takes that core and makes it implementable        |
| Split PRD into workable tasks                  | `/prd-to-issues` (GitHub) or `/prd-to-plan` (local) | `pm` agent direct | prd-to-issues/plan specialize in vertical slices, pm is the orchestrator that executes the plan      |

### Planning and breakdown

| Scenario                 | USE              | NOT              | Why                                             |
| ------------------------ | ---------------- | ---------------- | ----------------------------------------------- |
| Split PRD, local plan    | `/prd-to-plan`   | `/prd-to-issues` | Plan creates a Markdown file, no GitHub issues  |
| Split PRD, GitHub issues | `/prd-to-issues` | `/prd-to-plan`   | Issues creates real GitHub issues with HITL/AFK |
| Plan a single task       | `/plan`          | `/prd-to-plan`   | Plan is lighter, for 1 task, not a full PRD     |
| Execute task with agents | `/start`         | `/plan`          | Start also executes, plan stops after planning  |

### Refactoring

| Scenario                            | USE                 | NOT              | Why                                                                              |
| ----------------------------------- | ------------------- | ---------------- | -------------------------------------------------------------------------------- |
| Refactor specific file/module       | `/refactor`         | `/refactor-plan` | refactor analyzes AND executes (after approval)                                  |
| Plan large refactor as issue        | `/refactor-plan`    | `/refactor`      | refactor-plan creates a GitHub issue with tiny commits, doesn't execute          |
| Review entire codebase architecture | `/improve-codebase` | `/refactor`      | improve-codebase looks at the big picture (shallow modules, coupling, god files) |

### Bug fixing

| Scenario                         | USE             | NOT             | Why                                                   |
| -------------------------------- | --------------- | --------------- | ----------------------------------------------------- |
| Fix bug directly locally         | `/debug`        | `/triage-issue` | debug fixes on the spot                               |
| Investigate bug and create issue | `/triage-issue` | `/debug`        | triage-issue creates a GitHub issue with TDD fix plan |
| Fix bug with tests               | `/tdd`          | `/debug`        | tdd writes a failing test first, then the fix         |

### Reviews

| Scenario                   | USE                          | NOT                     | Why                                                         |
| -------------------------- | ---------------------------- | ----------------------- | ----------------------------------------------------------- |
| Request manual code review | `/review` command            | `reviewer` agent direct | /review is the user entry point, reviewer agent is internal |
| Quality gate after /start  | `reviewer` agent (automatic) | `/review`               | reviewer as quality gate is automatically called by PM      |

### Design

| Scenario                                   | USE                       | NOT                    | Why                                                                                                                    |
| ------------------------------------------ | ------------------------- | ---------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| Analyze UI/UX of existing page             | `/design`                 | `design-researcher`    | /design analyzes and delivers concrete improvements, uses design-researcher internally                                 |
| Compare multiple radical interface designs | `/design-an-interface`    | `api-designer`         | design-an-interface is "Design It Twice" for any interface (API, module, UI), api-designer is specific to REST/GraphQL |
| Design REST/GraphQL API                    | `api-designer` agent      | `/design-an-interface` | api-designer has domain knowledge about REST conventions, auth patterns, OpenAPI                                       |
| UX research, benchmarks, design patterns   | `design-researcher` agent | `/design`              | design-researcher does the research, /design is the command that also proposes action                                  |

### Tests

| Scenario                                 | USE                | NOT            | Why                                                          |
| ---------------------------------------- | ------------------ | -------------- | ------------------------------------------------------------ |
| Build feature with TDD workflow          | `/tdd`             | `tester` agent | /tdd is the full Red-Green-Refactor process                  |
| Write tests for existing code            | `tester` agent     | `/tdd`         | tester writes tests after the fact, tdd is for new code      |
| Create test plan (scenarios, edge cases) | `qa` agent         | `tester` agent | qa defines what to test, tester writes the code              |
| Browser-based e2e tests                  | `e2e-tester` agent | `tester` agent | e2e-tester uses Playwright CLI, tester does unit/integration |

### Skills themselves

| Scenario                           | USE                | NOT              | Why                                                                    |
| ---------------------------------- | ------------------ | ---------------- | ---------------------------------------------------------------------- |
| Create new skill                   | `/write-a-skill`   | `/improve-skill` | write-a-skill creates a new file, improve-skill improves existing ones |
| Improve existing skill             | `/improve-skill`   | `/write-a-skill` | improve-skill runs evals and iteratively adjusts                       |
| Test skill one-time                | `/run-eval`        | `/improve-skill` | run-eval only measures, improve-skill measures AND improves            |
| Test routing (right skill chosen?) | `/activation-eval` | `/run-eval`      | activation-eval tests routing, run-eval tests output quality           |

---

## The Three Core Flows

### Flow 1: Feature Development (most common)

```
User: "Build feature X"
    |
    v
/start
    |
    +-- [fast] PM makes mini-plan -> agent(s) -> reviewer gate -> done
    |
    +-- [strict] prompt-analyst -> handoff block
                        |
                        v
                    PM makes plan
                        |
                    User: "go"
                        |
                        v
                    PM delegates to agents:
                    +-- data-engineer (schema)
                    +-- senior-dev (implementation)
                    +-- tester (tests)
                    +-- ...
                        |
                        v
                    reviewer (quality gate)
                        |
                        v
                    Summary + AC check
```

### Flow 2: Idea to Production (complete)

```
/grill-me           -> shared understanding
    |
/write-a-prd        -> docs/prd-feature.md
    |
/prd-to-plan        -> plans/feature.md
    |
/prd-to-issues      -> GitHub issues (#1, #2, #3...)
    |
/start              -> implement per issue
    |
/review             -> code review
    |
/ship               -> lint + tests + build
    |
/commit             -> git commit
```

### Flow 3: Bug to Fix

```
Bug reported
    |
    +-- Quick fix? -> /debug -> fix -> /commit
    |
    +-- Document? -> /triage-issue -> GitHub issue
                            |
                        /tdd (implement fix with tests)
                            |
                        /review -> /ship -> /commit
```

---

## When Fast vs Strict for /start

### Fast (skip prompt-analyst)

- "Add a loading spinner to the detail page"
- "Fix the typo in the footer"
- "Update the sync interval to 30 minutes"
- "Add a sort option to the overview"

### Strict (full flow)

- "Build a booking system for appointments"
- "Integrate push notifications"
- "Refactor the auth flow to use RLS"
- "Create an admin dashboard with analytics"

**Rule of thumb:** if you can describe it in 1 sentence and need max 1 agent, it's fast. When in doubt: strict.

---

## Anti-patterns

| Don't do this                            | Do this instead                  |
| ---------------------------------------- | -------------------------------- |
| `/grill-me` for a simple feature         | `/start` (fast mode)             |
| `/write-a-prd` for a bugfix              | `/debug` or `/triage-issue`      |
| `/prd-to-issues` without a PRD           | `/write-a-prd` first             |
| `/refactor-plan` for a rename            | `/refactor` directly             |
| `/improve-codebase` on 1 file            | `/refactor` on that file         |
| `prompt-analyst` standalone              | Always via `/start`              |
| `reviewer` directly for review           | `/review` command                |
| `/tdd` to write all tests after the fact | `tester` agent for existing code |
| `/design-an-interface` for UI analysis   | `/design` for UI/UX improvement  |
| `/research` for a direct question        | `/ask` for direct answers        |

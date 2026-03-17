---
name: grill-me
description: Intensive interview session about an idea or plan — forces shared understanding before you start building
---

# Grill Me — Deep Intake Session

Interview the user relentlessly about every aspect of the plan until you reach shared understanding. Walk every branch of the design tree and resolve dependencies between decisions one by one.

If a question can be answered by exploring the codebase: explore the codebase instead of asking.

## Process

### Step 1: Initial scan

1. Read user input (direct description or $ARGUMENTS)
2. Read CLAUDE.md in the project root for context
3. Explore the codebase: relevant files, existing patterns, dependencies, tech stack
4. Identify the **design tree**: all branches of decisions that need to be made
5. Scan for **contradictions**: requirements that cannot coexist (e.g., "realtime" + "minimal API calls"). Name each contradiction explicitly and propose a choice
6. Scan for **vagueness**: terms without measurable definition (e.g., "fast", "user-friendly"). Ask for concrete criteria

### Step 2: Interview rounds

Per round:

1. Ask **max 3 questions** — grouped by theme
2. Rotate themes per round: Scope, User, Technical, Business, Data, Integrations, Risks
3. Wait for user response
4. Process the answer — note decisions, mark remaining open points
5. Continue to the next round

### Step 3: Self-answer where possible

- Technical questions you can answer by reading the codebase: do it YOURSELF
- Read files, check imports, review database schemas, read configuration
- Present your finding and ask for confirmation: "I see you're using X for Y — correct?"

### Step 4: Wrap up

Continue until ALL branches of the design tree are handled. If the plan is already clear: wrap up after max 1 round.

### Step 5: Summary

End with a structured block:

```markdown
## Shared Understanding: [Feature/Plan name]

### Problem

[What are we solving?]

### Solution

[How do we solve it — high level]

### Scope

- In scope: ...
- Explicitly out of scope: ...

### Technical

- Stack/framework: ...
- Affected: [files/modules that change]
- Dependencies: ...

### Decisions made

1. [Decision] — reason: [why]

### Risks

1. [Risk] — mitigation: [how]

### Still open (if applicable)

- [Point that can be decided later]
```

## Rules

1. **No assumptions** — everything must be explicitly confirmed
2. **Explore the codebase** — don't ask questions you can answer yourself
3. **Max 3 questions per round** — grouped by theme
4. **Wait for response** — NEVER continue without user input
5. **Push for decisions** — not "what do you think of X?" but "X or Y? I suggest X because..."
6. **Wrap up quickly when clear** — don't interview for the sake of interviewing

## Integration

After /grill-me you can:

- Use `/write-a-prd` with the shared understanding block as input
- Use `/start` with the summary as context

## Context

$ARGUMENTS

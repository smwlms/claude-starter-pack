---
name: design-an-interface
description: Generate multiple radically different interface designs via parallel sub-agents — "Design It Twice" approach. Use for API design, interface comparison, module shapes, or "design it twice".
---

# Design an Interface

Based on "Design It Twice" from "A Philosophy of Software Design": your first idea is rarely the best. Generate multiple radically different designs, compare them, and synthesize the optimal result.

## Workflow

### 1. Gather requirements

Before designing, understand:

- [ ] What problem does this module solve?
- [ ] Who are the callers? (other modules, external users, tests)
- [ ] What are the core operations?
- [ ] Constraints? (performance, compatibility, existing patterns)
- [ ] What should stay hidden vs what gets exposed?

Ask: "What should this module do? Who's going to use it?"

### 2. Generate designs (Parallel Sub-Agents)

Spawn 3+ sub-agents simultaneously via the Task tool. Each agent must produce a **radically different** design.

Use the **api-designer agent** and **frontend-architect agent** as reference for existing patterns in the project.

```
Prompt template per sub-agent:

Design an interface for: [module description]

Requirements: [gathered requirements]

Constraint for this design: [assign a different constraint per agent]
- Agent 1: "Minimize the number of methods — max 1-3 methods"
- Agent 2: "Maximize flexibility — support as many use cases as possible"
- Agent 3: "Optimize for the most common case"
- Agent 4: "Take inspiration from [specific paradigm/library]"

Output format:
1. Interface signature (types/methods)
2. Usage example (how the caller uses it)
3. What this design hides internally
4. Trade-offs of this approach
```

### 3. Present designs

Show each design with:

1. **Interface signature** — types, methods, parameters
2. **Usage examples** — how callers use it in practice
3. **What it hides** — complexity that stays internal

Present designs **sequentially** so the user can process each one before comparison.

### 4. Compare designs

After all designs, compare on:

- **Interface simplicity**: fewer methods, simpler parameters
- **Generic vs specialized**: flexibility vs focus
- **Implementation efficiency**: does the shape allow efficient internals?
- **Depth**: small interface that hides lots of complexity (good) vs large interface with thin implementation (avoid)
- **Correctness**: easy to use correctly vs easy to misuse

Discuss trade-offs in **prose, not tables**. Highlight where designs diverge most.

### 5. Synthesize

The best design often combines insights from multiple options.

Deliver a concrete recommendation:

```markdown
## Recommendation

**Chosen design**: [name/number]
**Reason**: [why this best fits the primary use case]

### Adopted elements from other designs

- From Design X: [element and why]
- From Design Y: [element and why]

### Proposed interface

[Final interface signature with types]

### Usage example

[How the caller uses the final design]
```

Ask: "Does this fit your primary use case? Want to adopt elements from other designs?"

## Evaluation criteria

From "A Philosophy of Software Design":

- **Interface simplicity**: fewer methods, simpler params = easier to learn and use correctly
- **Generalizability**: can handle future use cases without changes. But watch out for over-generalization
- **Implementation efficiency**: does the interface shape allow an efficient implementation? Or does it force awkward internals?
- **Depth**: small interface that hides lots of complexity = deep module (good). Large interface with thin implementation = shallow module (avoid)

## Anti-patterns

- Do NOT let sub-agents produce similar designs — force radical differences
- Do NOT skip the comparison — the value is in the contrast
- Do NOT implement — this is purely about interface shape
- Do NOT judge based on implementation effort alone

## Rules

1. **At least 3 designs** — fewer yields insufficient contrast
2. **Radically different** — not variations on the same theme
3. **No implementation** — only interface shapes and types
4. **Prose comparison** — trade-offs in text, not tables
5. **Concrete recommendation** — end with clear advice, not "it depends"

## Context

$ARGUMENTS

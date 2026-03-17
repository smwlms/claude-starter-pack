---
name: ubiquitous-language
description: Extract a DDD-style ubiquitous language glossary from conversation — flag ambiguities and propose canonical terms. Saves to UBIQUITOUS_LANGUAGE.md. Use for domain terms, glossary, terminology, DDD, or "domain model".
---

# Ubiquitous Language — Domain Glossary

Extract and formalize domain terminology from the current conversation into a consistent glossary, stored in a local file.

## Process

### Step 1: Scan the conversation

Scan the conversation for domain-relevant nouns, verbs, and concepts. Look for:

- Core business entities (e.g., Order, Customer, Invoice, Product)
- Lifecycle states (e.g., Draft, Active, Archived, Cancelled)
- Actions and processes (e.g., Approve, Submit, Escalate)
- Roles and actors (e.g., Admin, Reviewer, Owner)
- Domain-specific jargon the team uses

### Step 2: Identify problems

Flag three types of terminology problems:

- **Homonymy**: same word, different meanings (e.g., "account" = customer AND login)
- **Synonymy**: different words, same concept (e.g., "item" and "product" and "listing")
- **Vague or overloaded**: terms that are too broad or unclear

### Step 3: Propose canonical glossary

Propose authoritative term choices, grouped by subdomain in tables.

Be **opinionated** — choose the best term and list alternatives as "avoid".

### Step 4: Write to UBIQUITOUS_LANGUAGE.md

Write the file in the working directory with the format below.

### Step 5: Summary in conversation

Give a brief summary of the most important choices and flagged ambiguities inline in the conversation.

## Output Format

Write a `UBIQUITOUS_LANGUAGE.md` file with this structure:

```markdown
# Ubiquitous Language

## [Subdomain name]

| Term     | Definition                               | Avoid (aliases)  |
| -------- | ---------------------------------------- | ---------------- |
| **Term** | Unambiguous definition in max 1 sentence | Alias 1, alias 2 |

## [Next subdomain]

| Term     | Definition | Avoid (aliases) |
| -------- | ---------- | --------------- |
| **Term** | Definition | Aliases         |

## Relationships

- A **Term A** belongs to exactly one **Term B**
- A **Term C** produces one or more **Term D**s

## Example dialogue

> **Dev:** "When a **Customer** creates an **Order**, do we immediately create a **Shipment**?"
> **Domain expert:** "No — a **Shipment** is only created when the **Order** has been **Approved** and all **Items** are in stock."
> **Dev:** "So if an **Item** is out of stock, the **Order** stays in **Pending**?"
> **Domain expert:** "Exactly. Only when all **Items** are available can the **Shipment** be created."

## Flagged ambiguities

- "account" was used for both **Customer** and **User Account** — these are different concepts: a **Customer** is the business entity, a **User Account** is the login credential.
```

## Rules

1. **Be opinionated** — choose the best term if multiples exist, list the rest as "avoid"
2. **Flag conflicts explicitly** — if a term is used ambiguously, name it in "Flagged ambiguities" with a clear recommendation
3. **Short definitions** — max 1 sentence. Define what it IS, not what it does
4. **Show relationships** — use bold term names and give cardinality where clear
5. **Domain terms only** — skip generic programming concepts (array, function, endpoint) unless they have domain-specific meaning
6. **Group in tables** — per subdomain, lifecycle, or actor. If all terms belong to one domain, one table is enough
7. **Write an example dialogue** — 3-5 exchanges between dev and domain expert that show how terms interact. The dialogue should clarify boundaries between related concepts

## On repeated use

When invoked again in the same conversation:

1. Read the existing `UBIQUITOUS_LANGUAGE.md`
2. Process new terms from the follow-up conversation
3. Update definitions if understanding has evolved
4. Mark changed entries with "(updated)" and new ones with "(new)"
5. Re-flag new ambiguities
6. Rewrite the example dialogue to incorporate new terms

## After writing

Report:

> I've written/updated `UBIQUITOUS_LANGUAGE.md`. From now on I'll use these terms consistently. Let me know if I deviate or if you want to add a term.

## Context

$ARGUMENTS

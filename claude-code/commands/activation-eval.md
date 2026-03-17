---
name: activation-eval
description: Run activation tests — check if prompts are routed to the correct skill (Layer 1 evaluation)
---

# Activation Eval — Skill Routing Test

Test whether the system chooses the right specialist for a given prompt.
This is Layer 1 (Karpathy framework): **routing correctness**, not output quality.

## Usage

```
/activation-eval
```

## What it tests

Three categories:

| Category        | Count | What is tested                                            |
| --------------- | ----- | --------------------------------------------------------- |
| `clear_trigger` | 20    | Unambiguous prompts where 1 skill should activate         |
| `edge_case`     | 10    | Edge cases where 2+ skills are close                      |
| `negative`      | 10    | Prompts that don't need a specialist or trigger a command |

## Process

1. Read `evals/activation-tests.json`
2. Per test:
   - Read the `prompt`
   - Determine which skill/agent the system would trigger (based on prompt-analyst logic and CLAUDE.md routing rules)
   - Compare with `should_trigger` and `should_NOT_trigger`
   - Score: PASS if the right skill is triggered AND none of the `should_NOT_trigger` skills
   - Score: FAIL if wrong skill or a blocked skill is triggered
3. For `negative` tests (`should_trigger: null`): PASS if no specialist is triggered

## How to evaluate

Per test, simulate the routing decision:

1. Read the prompt as if you're the prompt-analyst / PM
2. Determine: "which agent would I bring in here?"
3. Compare your choice with the expected values
4. Note why you'd make a different choice (if applicable)

## Output format

```
Activation Eval Report
  Total: 38/40 (95.0%)

-- Clear triggers (19/20) --------------------------
PASS CLEAR-01  copywriter         "Write a LinkedIn post..."
PASS CLEAR-02  copywriter         "Create a product description..."
FAIL CLEAR-03  legal              "Can I sell without a certificate..."
   -> Expected: legal, Got: researcher
   -> Reason: prompt contains "can I" which was interpreted as research

-- Edge cases (9/10) -------------------------------
PASS EDGE-01  sales-coach         "Write an email for after the meeting..."
FAIL EDGE-02  cfo                 "What does it cost to hire someone..."
   -> Expected: cfo, Got: hr
   -> Reason: "hire" triggered hr, but the question is about costs

-- Negative tests (10/10) --------------------------
PASS NEG-01  null                 "What's the difference between let and const..."
PASS NEG-02  null                 "What time is it?"
PASS NEG-03  command:commit       "Commit my changes..."

-- Analysis ----------------------------------------
Most confused pairs:
  - copywriter <> marketing (2 errors)
  - cfo <> hr (1 error)

Recommendations:
  - Add discriminating rules in prompt-analyst for cost-related questions
  - Clarify copywriter vs marketing boundary in agent descriptions
```

## When to run

- After changes to `prompt-analyst` agent
- After changes to agent descriptions (the "when to activate" sections)
- After adding new agents
- After changes to `/start` command routing logic

## Save results

Save results to `results/activation-{date}.json`:

```json
{
  "date": "20260316",
  "total": 40,
  "passed": 38,
  "score": 95.0,
  "failures": [
    {
      "id": "CLEAR-03",
      "expected": "legal",
      "got": "researcher",
      "analysis": "prompt contains 'can I' which was interpreted as research"
    }
  ],
  "confused_pairs": [
    ["copywriter", "marketing"],
    ["cfo", "hr"]
  ]
}
```

## Interpretation

| Score   | Meaning                                              |
| ------- | ---------------------------------------------------- |
| 95-100% | Routing works well, minor edge cases                 |
| 85-94%  | Some systematic errors, update agent descriptions    |
| 70-84%  | Serious routing problems, rewrite prompt-analyst     |
| <70%    | Fundamental routing problem, reconsider architecture |

## Context

$ARGUMENTS

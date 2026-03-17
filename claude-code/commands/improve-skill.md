---
name: improve-skill
description: Autonomous self-improvement loop for skills and agents — eval-driven iterate until perfect score or plateau
---

# Skill Self-Improvement Loop

An autonomous system that improves skills and agents by testing them against binary assertions and iteratively adjusting.

## Usage

```
/improve-skill <type>/<name>
```

Examples:

- `/improve-skill agents/copywriter`
- `/improve-skill commands/review`
- `/improve-skill agents/pm`

## Process

### Phase 0: Setup

1. Determine paths based on argument:
   - **Skill file**: `improved/<type>/<name>.md`
   - **Eval file**: `evals/<type>/<name>.json`
2. Read the eval file. If it doesn't exist: report and stop.
3. Read the current skill file.
4. Create a git branch: `improve/<name>-$(date +%Y%m%d-%H%M)`
5. Initialize a results log in `results/<name>-$(date +%Y%m%d-%H%M).json`

### Phase 1: Baseline measurement

For **each test** in the eval file:

1. Read the `prompt` from the test.
2. **Generate output** by strictly following the skill file instructions with that prompt. Act as if you're executing the skill — follow the process, use the output format, apply all rules.
3. **Evaluate each assertion** against the generated output:
   - Answer PASS or FAIL per assertion
   - Be strict: if it's not 100% clearly true, it's FAIL
4. Record results per test.

Calculate the **baseline score**: `(total PASS / total assertions) * 100`

Log to results file:

```json
{
  "iteration": 0,
  "type": "baseline",
  "score": 95.8,
  "total_pass": 23,
  "total_fail": 2,
  "total_assertions": 25,
  "failed_assertions": [
    { "test": "test-name", "assertion": "A3", "check": "...", "reason": "..." }
  ]
}
```

Show the score to the user:

```
Baseline: 23/25 (92.0%)
Failed:
  - [test-name] A3: assertion text — reason
  - [test-name] A5: assertion text — reason
```

### Phase 2: Improvement Loop

**IF the score is 100%**: stop, report "Perfect score. No improvements needed."

**IF the score < 100%**:

#### Step 1: Analyze failures

- Group failed assertions by theme (structure, format, content, rules)
- Identify the **root cause** — which instruction in the skill file is missing, unclear, or contradictory
- Choose the **most impactful** improvement (solves the most failures)

#### Step 2: Make ONE targeted change

- Modify the skill file (`improved/<type>/<name>.md`)
- Make **exactly one** change — add a rule, clarify an instruction, or remove a contradiction

#### Step 3: Git commit

```bash
git add improved/<type>/<name>.md
git commit -m "improve(<name>): <short description of the change>"
```

#### Step 4: Retest

- Run **all tests** again (not just the failed ones)
- Calculate the new score

#### Step 5: Evaluate result

**IF score improved** (higher than previous iteration):

- Keep the commit
- Log the result
- Show: `Iteration N: score X% -> Y% (+Z%) — change kept`

**IF score equal or decreased**:

- Revert the commit:
  ```bash
  git reset --hard HEAD~1
  ```
- Log the result as "reverted"
- Show: `Iteration N: score not improved — change reverted`
- **Try a DIFFERENT change** (not the same approach again)

#### Step 6: Loop

- Go back to Step 1
- **Continue until**:
  - Score = 100% (perfect)
  - OR 10 consecutive reverts (no improvement possible with current assertions)
  - OR manually stopped by user

### Phase 3: Report

After completion (or interruption):

```
Skill Improvement Report: <name>

  Baseline:     23/25 (92.0%)
  Final score:  25/25 (100.0%)
  Iterations:   3
  Commits:      2 kept, 1 reverted

Changes:
1. [kept] improve(name): added explicit rule for X
2. [reverted] improve(name): changed format (broke other assertion)
3. [kept] improve(name): clarified requirement for Y

Compare original vs improved:
  diff original/<type>/<name>.md improved/<type>/<name>.md
```

## Critical rules

1. **One change per iteration** — never adjust multiple things at once, otherwise you don't know what worked
2. **Rerun all tests** — not just the failed ones, because a fix can break something else
3. **Strict evaluation** — if it's not 100% clearly PASS, it's FAIL
4. **No subjective checks** — assertions are binary (true/false), not "is it good enough"
5. **Git as safety net** — every change committed, every bad change reverted
6. **Never stop to ask** — the user might be away. Continue until perfect score, 10 consecutive reverts, or manual stop
7. **Log everything** — every iteration, every score, every change in the results file
8. **Never modify the eval file** — only the skill file gets adjusted
9. **Never modify the original/ folder** — it's read-only for comparison

## Limitations (be honest)

This loop handles:

- Structure and format (headers, sections, order)
- Output rules (word count, required elements, forbidden patterns)
- Process steps (order, completeness, checklists)
- Consistency (output format matches the rules)

This loop does NOT handle:

- Tone of voice quality (subjective)
- Creative quality (subjective)
- Context usage (whether reference files are well used)
- Interpersonal quality (whether advice "feels" good)

The latter category requires human review.

## Context

$ARGUMENTS

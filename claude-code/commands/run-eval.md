---
name: run-eval
description: Run an eval on a skill/agent without the improvement loop — report score only
---

# Skill Evaluation (Score Only)

Run a one-time evaluation on a skill or agent. No changes, just measure.

## Usage

```
/run-eval <type>/<name>
```

Example: `/run-eval agents/copywriter`

## Process

1. Read the eval file: `evals/<type>/<name>.json`
2. Read the skill file: `improved/<type>/<name>.md` (or `original/<type>/<name>.md` for baseline)

### Per test in the eval file:

1. Read the `prompt`
2. **Generate output** by strictly following the skill instructions
3. **Evaluate each assertion**:
   - PASS = assertion is unmistakably true
   - FAIL = assertion is not true, or it's unclear
4. Record results

### Output

```
Eval Report: <name>
  File: improved/<type>/<name>.md
  Score: 23/25 (92.0%)

Test 1: test-name-1           PPPFP  (4/5)
Test 2: test-name-2           PPPPP  (5/5)
Test 3: test-name-3           PPPPF  (4/5)
Test 4: test-name-4           PPPPP  (5/5)
Test 5: test-name-5           PPPPP  (5/5)

Failed:
  - [test-name-1] A4: assertion text — output didn't meet criterion
  - [test-name-3] A5: assertion text — section was missing
```

## Comparison mode

To compare original vs improved:

```
/run-eval agents/copywriter --compare
```

This runs the eval 2x:

1. On `original/<type>/<name>.md`
2. On `improved/<type>/<name>.md`

And shows a comparison:

```
Original: 21/25 (84.0%)
Improved: 24/25 (96.0%)
Delta:    +3 (+12.0%)
```

## Context

$ARGUMENTS

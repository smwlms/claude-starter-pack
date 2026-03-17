---
name: tdd
description: Test-Driven Development workflow — write the test first, then the code, then refactor. Vertical slices, deep modules, behavior over implementation.
---

# TDD — Test-Driven Development Workflow

Execute a strict Red-Green-Refactor cycle. Test first, code second, clean up third. Always vertical — never all tests first, then all code.

## Anti-pattern: Horizontal slices

**NEVER**: write all tests first, then all code. This is the #1 anti-pattern.

- WRONG: "I'll write 5 tests first, then implement everything"
- RIGHT: "I write 1 test, let it fail, write minimal code, refactor. Then the next test."

Each cycle is a complete vertical slice: 1 test -> 1 implementation -> 1 refactor.

## Core Principles

### Deep Modules (Ousterhout)

Design modules with a **narrow interface** and **broad functionality**. A module that exposes 10 functions to do 1 thing is shallow. A module that exposes 1 function that handles 10 things is deep.

### Interface Design

- **Accept dependencies, don't create them** — take a database client as parameter, don't create one inside your function
- **Return results, don't produce side effects** — return a value instead of console.log or writing directly to a database
- **Narrow interface, broad implementation** — the caller needs to know as little as possible

### Mocking

- **Mock only at system boundaries**: database, external APIs, file system, network
- **NEVER mock internal modules** — if you need to mock an internal module to test, your design is wrong
- **If you need many mocks**: reconsider your interface design

### Good vs bad tests

**Good test** — tests behavior via public interface:

```typescript
test("returns filtered items when status filter applied", () => {
  const result = getItems({ status: "active" });
  expect(result).toEqual([{ id: 1, status: "active" }]);
});
```

**Bad test** — tests implementation details:

```typescript
test("calls filterArray with correct params", () => {
  const spy = jest.spyOn(utils, "filterArray");
  getItems({ status: "active" });
  expect(spy).toHaveBeenCalledWith(data, "status", "active");
});
```

## Process

### Step 0: Setup

1. Read CLAUDE.md for project context and test framework
2. Detect the test framework:
   - JavaScript/TypeScript: Vitest, Jest, Playwright, Cypress
   - Python: pytest, unittest
   - Other: read configuration files
3. Verify that the test framework is installed and configurable
4. Read $ARGUMENTS or discuss with the user: which interface/behavior should be tested?

### Step 1: Red — Write a failing test

1. Write exactly **1 test** that describes the desired behavior
2. The test describes BEHAVIOR, not implementation:
   - GOOD: "should return filtered list when status filter is applied"
   - BAD: "should call filterArray with correct params"
3. Use `data-testid` for UI tests, not CSS selectors
4. Run the test — it MUST fail
5. Show the result:

```
RED: test_[name] — FAIL
  Expected behavior: [what the test expects]
  Actual: [what actually happens — error, undefined, etc.]
```

### Step 2: Green — Write minimal code

1. Write the **minimal code** to make the test pass
2. No premature optimization, no extra features
3. Hardcoded values are OK in this step if that's the simplest solution
4. Run the test — it MUST pass
5. Run ALL tests — no regressions
6. Show the result:

```
GREEN: test_[name] — PASS
  Implementation: [short description of what you wrote]
  All tests: [N] passed, [0] failed
```

### Step 3: Refactor — Improve without changing behavior

1. Review the code: duplication? Naming? Structure?
2. Refactor if there's something to improve
3. Run ALL tests after refactoring — everything must still pass
4. If nothing needs refactoring: skip this step
5. Show the result:

```
REFACTOR: [what was improved, or "No refactor needed"]
  All tests: [N] passed, [0] failed
```

### Checklist per cycle

Before moving to the next cycle, verify:

- [ ] Test describes **behavior**, not implementation
- [ ] Test uses only the **public interface**
- [ ] Test would **survive a refactor** (rename internals -> test still passes)
- [ ] Code is **minimal** — no more than needed for the test
- [ ] Mocks are only at **system boundaries**

### Step 4: Next cycle

1. Determine the next test case:
   - Next edge case
   - Next user story
   - Error handling
   - Boundary conditions
2. Go back to Step 1
3. Repeat until all desired behavior is covered

### Step 5: Wrap up

After all cycles:

```
TDD Summary: [Feature/Bug name]

Cycles: [N]
Tests written: [N]
All tests: PASS

Covered scenarios:
1. [scenario 1]
2. [scenario 2]
3. [scenario 3]

Files created/modified:
- [test file]
- [implementation file]
```

## Test order strategy

For a new feature, follow this order:

1. **Happy path** — the most basic use case
2. **Variations** — other valid inputs
3. **Edge cases** — boundaries, empty values, maximum values
4. **Error cases** — invalid input, missing data, network errors
5. **Integration** — how it works with other modules

## Rules

1. **NEVER write code without a failing test first** — this is the core rule of TDD
2. **NEVER all tests first, then all code** — always vertical: 1 test -> 1 implementation -> 1 refactor
3. **1 test per cycle** — don't write multiple tests at once
4. **Tests describe BEHAVIOR, not implementation** — test what it does, not how
5. **Minimal code in Green** — the simplest solution that makes the test pass
6. **Run ALL tests after every step** — not just the new test
7. **Mock only at system boundaries** — never mock internal modules
8. **data-testid for UI tests** — no CSS class selectors that can change
9. **Start with the simplest case** — happy path first, then edge cases
10. **For bugs: reproduce first** — write a test that demonstrates the bug, then fix

## Integration

- Works with the tester agent for existing code
- Use /tdd for new features and bugfixes
- After /tdd: use /review for a code review

## Context

$ARGUMENTS

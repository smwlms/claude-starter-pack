---
name: e2e-tester
description: |
  **E2E Tester**: Browser-based testing met Playwright CLI voor live exploratie en Playwright Test voor geautomatiseerde tests.
  - TRIGGERS: e2e test, browser test, frontend test, playwright, live test, visuele regressie, UI test, screenshot test
  - Gebruik voor het testen van frontend flows in een echte browser.
allowed-tools: Bash(playwright-cli:*)
---

# E2E Tester

## Doel

Test frontend flows met Playwright CLI (live browser) en Playwright Test (geautomatiseerd).

## Vereisten

```bash
npm install -g @playwright/cli
npx playwright install chromium
```

## Playwright CLI (live exploratie)

```bash
playwright-cli open https://localhost:3000
playwright-cli snapshot                    # accessibility tree naar disk
playwright-cli click e15                   # ref uit snapshot
playwright-cli fill e5 "tekst"
playwright-cli screenshot
playwright-cli network
playwright-cli console
playwright-cli close
```

## Playwright Test (geautomatiseerd)

```bash
npx playwright test
npx playwright test --headed
npx playwright test --trace on
npx playwright show-report
```

## Werkwijze

1. Check of dev server draait
2. Open browser met `playwright-cli open [url]`
3. Neem snapshot voor element refs
4. Test de flow: klik, vul in, navigeer
5. Check netwerk en console op errors
6. Schrijf test specs voor gevonden flows
7. Draai tests met `npx playwright test`

## Regels

- Gebruik `playwright-cli snapshot` boven screenshots voor element detectie
- Gebruik `data-testid` als selectors
- Tests moeten onafhankelijk draaien
- Test happy path eerst, dan edge cases
- Nooit hardcoded sleeps

---
name: finance-log
description: This skill should be used when the user asks "finance check", "monthly finance", "burn audit", "runway check", "income expense", "what am I spending", "am I making money", "kill any subscriptions", "monthly check-in", or when the calendar hits the last Friday of the month. Reads finance-log.csv (one row per transaction) and produces a runway-aware finance pulse with honest-mirror questions tied to the user's stated risk archetype. Active for every NightShiftOS user.
version: 0.1.0
---

# Finance Log

The money truth skill. Reads the user's transaction log. Computes burn, income, runway, and stale subscriptions. Surfaces the gap between what the user said they would spend and what the bank statements show.

Solopreneurs with a day job lie to themselves about three things: how much the business is making, how much the business is costing, and how long they can keep going if income drops. Finance-log makes each of those a number on a page.

## When this skill triggers

- `/finance-log`
- `/finance-check`
- `/monthly-finance`
- "Burn audit"
- "Runway check"
- "Income vs expense"
- "What am I spending"
- "Am I making money"
- "Are there subscriptions I should kill"
- "Monthly check-in"
- Last Friday of every month (when called by `ship-it-friday` or `file-sweep`)
- Inside `weekly-brief` (lightweight check only)

## The data source

Read `business-setup-playbook/finance-log.csv` (or wherever the user pointed it during `/customize-from-assessment`).

Expected schema (one row per transaction):

```
date, type, category, vendor, amount, currency, note, tags
2026-05-22, expense, software, MailerLite, 0.00, USD, free tier, monthly
2026-05-22, expense, software, HubSpot, 20.00, USD, Starter SKU, monthly
2026-05-15, income, client, Sam, 800.00, USD, Foundation mo 2, client-payment
2026-05-01, expense, hosting, Microsoft 365, 6.00, USD, M365 Business Basic, monthly
```

If the CSV is missing or has fewer than 30 rows, ask the user to either:

1. Drop the last 30 days of transactions manually (one per line), or
2. Connect their bank export, or
3. Open `examples/finance-log-starter.csv` and start logging this month forward.

Do NOT fabricate finance data. Estimated burn is worse than honest blank burn.

## The five computations

When `/finance-log` fires, compute and print all five.

### 1. Monthly burn (trailing 30 days)

Sum of all `expense` rows in the last 30 days. Categorize by tag:

- **Recurring** (tags include `monthly` or `annual` or `subscription`)
- **One-time** (everything else)

```
MONTHLY BURN (last 30d)
  Recurring:  $48.00
  One-time:   $312.00
  Total:      $360.00
```

### 2. Monthly income (trailing 30 days)

Sum of all `income` rows in the last 30 days.

```
MONTHLY INCOME (last 30d)
  Client payments: $1,600.00
  Other:           $0.00
  Total:           $1,600.00
```

### 3. Net (income minus burn)

```
NET MONTH: +$1,240.00
```

If negative, surface in red prose: "Net month: -$X. The business cost more than it brought in this month."

### 4. Runway at current burn

Read the user's stated cash reserves from CLAUDE.md (Section "Risk + Comfort" → `runway_months_at_zero_revenue` or the user's most recent stated cash position). Divide by recurring burn.

```
RUNWAY AT CURRENT BURN
  Cash on hand:       $5,000  (per CLAUDE.md, last stated 2026-05-01)
  Monthly recurring:  $48
  Months of runway:   104 months at recurring-only
  Months of runway:   14 months including one-time average
```

If `runway_months_at_zero_revenue` is older than 60 days, ask the user to update before printing the number.

### 5. Three-month revenue trend

Sum income by calendar month for the last 3 months. Print as a line.

```
REVENUE TREND (last 3 months)
  Mar 2026:  $1,200
  Apr 2026:  $1,600
  May 2026:  $1,600

Direction: flat → flat (no growth, no shrink)
```

Direction labels: `growing`, `flat`, `shrinking`, `volatile` (>40% swing month over month).

## The stale-subscription scan

After the five computations, scan recurring expenses for kill candidates.

Flag any subscription that meets one or more of these:

- Recurring monthly, but not used in 30+ days (heuristic: if the vendor has no activity in calendar / email / file references)
- Recurring monthly, but at $0 free tier with no upgrade trigger (these are noise; skip in the kill-candidate list)
- Recurring monthly, but functionally replaced by another tool in the stack
- Annual subscription up for renewal in the next 30 days

Print kill candidates with one-line rationale each:

```
STALE-SUBSCRIPTION CANDIDATES
  - Calendly ($10/mo): replaced by Cal.com on 2026-05-02. Active in finance log
    but unused. Kill or cancel and save $120/yr.
  - Loom Pro ($8/mo): last recorded use was 47 days ago. Free tier covers
    current need. Downgrade or kill.
  - Notion ($10/mo): replaced by file system + memory tools. Kill or downgrade.

Total kill candidates: $336/yr if all cancelled.
```

If no candidates: "No stale subscriptions detected." Do not pad.

## The honest-mirror questions

Tie 2 to 4 questions to the user's risk archetype (from CLAUDE.md). The questions surface the gap between stated comfort and current behavior.

### Risk archetype: Bootstrap-Strict

```
HONEST MIRROR
  Stated max monthly stack: $50
  Actual monthly recurring: $48

  - $48/$50 is 96% of your stated cap. Either the cap drifts up to match
    reality, or one of the $20 tools goes.
  - Three months of $1,600 revenue is enough for survival. It is not enough
    for the runway you said you wanted. What is the leverage move you keep
    putting off?
```

### Risk archetype: Low-Burn

```
HONEST MIRROR
  Stated max monthly stack: $200
  Actual monthly recurring: $48

  - You are well under cap. You have $152/mo of headroom you are not using.
    Is the absence of spend a strategy or a flinch?
  - Revenue is flat at $1,600/mo for three months. Flat is the most expensive
    direction at this stage. What would $200 of paid leverage produce?
```

### Risk archetype: Calculated

```
HONEST MIRROR
  Stated max monthly stack: $500
  Actual monthly recurring: $48

  - You are at 10% of your cap. The cap was supposed to enable speed. What
    is the move you would make at $250/mo that you are not making?
  - Trend is flat. The decision frame: paid path that turns this into $5K/mo
    by month 6, or accept the flat trajectory.
```

### Risk archetype: Aggressive

```
HONEST MIRROR
  Stated max monthly stack: "whatever the math says"
  Actual monthly recurring: $48

  - You wrote "Aggressive" but you are spending like Bootstrap-Strict. Either
    the archetype was a fantasy or the current behavior is risk-aversion in
    disguise. Which?
  - Three months at $1,600 means the ad budget you have not deployed cost
    you the chance to know whether ads would have worked.
```

The questions do not moralize. They state the math and ask the user to sit with it.

## Stage-aware adjustments

### Pre-Rev Builder

Income trend is zero or near-zero. The question is not "what is the trend." The question is "what is the first dollar plan."

```
PRE-REVENUE NOTE
  No income recorded in last 30 days.
  Burn: $48/mo.
  Runway: 8 months at recurring-only.

  The math: at zero revenue, you have 8 months of recurring runway. You said
  your worst-case is missing rent. You are not at rent risk yet.

  The leverage question: what is the smallest revenue test that would tell
  you in 30 days whether this offer will sell? Not perfect product. First
  signal.
```

### Early Operator (under $5K MRR)

The most fragile stage financially. One client churn is a 25 to 50% revenue drop. Surface client concentration:

```
CLIENT CONCENTRATION
  Total clients: 3
  Largest client share: 50% ($800/$1,600)
  Risk: losing top client cuts revenue in half.

  Hold question: is there a second deal you have been letting cool that
  would diversify before the concentration becomes an emergency?
```

### Stable Solo ($5K to $25K)

Stable but susceptible to scope creep and admin bloat. Watch for $ category growth:

```
ADMIN BLOAT WATCH
  Recurring tool spend last 3 months:
    Mar: $42
    Apr: $48
    May: $68

  Admin spend is growing 13%, 42% monthly. New tools added since last check:
  - HubSpot Starter ($20)

  Question: does the HubSpot upgrade have a revenue case behind it, or is
  it operational comfort?
```

### Scaling Solo ($25K+)

Big-ticket spend decisions. Surface unit-econ on the largest expenses:

```
LARGE EXPENSE REVIEW (last 30d, top 3)
  - Contractor: $2,800
  - Ad spend: $1,400
  - HubSpot Pro: $450

  Question for each: what revenue did this enable in the same period?
```

## Last-Friday-of-month variant

When called by `ship-it-friday` on the last Friday of the month, run the full ritual AND add three additional checks.

### Check 1: Year-to-date

```
YEAR TO DATE (Jan 1 to today)
  Income:  $7,200
  Expense: $456
  Net:     +$6,744

  Burn rate (avg monthly): $91
  Income rate (avg monthly): $1,440
```

### Check 2: Quarter-end if applicable

If today is the last Friday of a quarter-ending month (Mar, Jun, Sep, Dec):

```
QUARTER COMPLETE: Q1 2026
  Income:  $3,200
  Expense: $144
  Net:     +$3,056

  vs Q4 2025 (prior quarter):
    Income:  $X,XXX → $3,200  (+33%)
    Expense: $126 → $144      (+14%)
    Net:     +$2,274 → +$3,056

  Quarter direction: revenue up, burn up, net up.
```

### Check 3: Pricing/cap question

Once per month (last Friday) surface one pricing-aware question:

```
PRICING PULSE
  Current Foundation price: $X,XXX (per CLAUDE.md, set 2026-04-28)
  Months at this price: 1
  Clients at this price: 0 (Sam, Jordan, Riley all at legacy pricing)

  Question: when does the new price get its first sale, and what is
  the kill signal if it does not by month 3?
```

## Anti-patterns to refuse

### Fabricating finance numbers

If finance-log.csv is missing or incomplete, refuse to estimate. Ask the user to either drop the data or update the source. Made-up runway numbers are worse than no number because they remove the pressure that produces honest behavior.

### Cheerleading positive months

A positive month is data. The skill states the number, then asks the next-month question. It does not say "great month!" or "amazing growth!"

### Catastrophizing negative months

A negative month is also data. State the number, surface the runway impact, ask the kill-or-double-down question. Do not project doom.

### Hiding stale subscriptions to be polite

If a subscription is unused, flag it. The user can choose to keep it. The skill does not soft-pedal the kill candidate list.

### Mixing personal and business spend

If finance-log.csv contains personal spend rows (e.g., the user logged a coffee), do not include them in business burn. Flag them: "Row 47 looks like personal. Tag `personal` or remove?"

### Moralizing about price points

If the user's offer is priced lower than the skill's heuristics suggest, do not lecture about pricing. The user has stated pricing in CLAUDE.md. Surface the pricing question only on the monthly cadence. Every-call pricing pressure becomes noise.

## Working with other skills

- **`weekly-brief`**: calls finance-log for a light version (last 7 days income, recurring burn, runway). Full ritual runs monthly.
- **`ship-it-friday`**: calls finance-log on the last Friday of each month for the full monthly ritual.
- **`risk-gauge`**: when the user proposes a new commitment, risk-gauge pulls current burn and headroom from finance-log to compute variance.
- **`free-first-checker`**: when a new paid tool gets proposed, free-first-checker references finance-log to show current similar-category spend.
- **`crm-hygiene`**: when CRM client status changes (deal closed, deal lost), cross-check that income rows match.
- **`decision-logger`**: when the user kills a subscription, log the decision (date, vendor, savings, what changed).
- **`business-coach`**: coach can reference finance-log when challenging stuck loops ("revenue flat 3 months, what changes this quarter").

## What finance-log does NOT do

- Does not auto-cancel subscriptions. Kill is a user decision.
- Does not connect to bank APIs by default. The CSV is source of truth.
- Does not give tax advice. Tax-prep is a separate workflow.
- Does not invoice clients or chase payments. Invoicing is its own skill.
- Does not generate financial projections. Past is data; projection is judgment.
- Does not edit CLAUDE.md cap values. The user owns cap changes.

## Output format

Default: print all five computations + stale-subscription scan + honest-mirror questions. Single-screen target (under 60 lines).

Light version (when called from `/weekly-brief`):

```
FINANCE (last 7 days)
  Income: $400
  Recurring burn: $48/mo (no change)
  Runway: 104 months at recurring
```

Monthly version (last Friday of month, called by ship-it-friday): full ritual + last-Friday-of-month additions (YTD, quarter if applicable, pricing pulse).

## The closing question

End every finance check with one question tied to the largest gap surfaced.

Default questions by gap:

- Revenue flat: "What is the leverage move you have been putting off?"
- Stale subscriptions present: "Pick one to kill before you close this brief. Logged via decision-logger."
- Burn growing faster than income: "Which tool added this month earned the upgrade?"
- Client concentration risk: "Which prospect could you warm before the concentration becomes an emergency?"
- Pricing question due: "When does the new price get its first sale, and what is the kill signal?"

Do not stack questions. One. The user sits with it.

## Additional Resources

### Reference files

- **`references/finance-log-schema.md`**: full CSV schema, tag taxonomy, common transaction categories, and rules for tagging recurring vs one-time
- **`references/stale-subscription-rules.md`**: heuristics for detecting kill candidates, including cross-referencing against calendar/file activity

### Example files

- **`examples/finance-log-starter.csv`**: 30-row starter CSV the user can copy and start logging into
- **`examples/example-finance-check-output.md`**: worked example of a monthly check for the example coaching business's actual numbers (Early Operator, Low-Burn, $1,600 MRR, $48 burn)

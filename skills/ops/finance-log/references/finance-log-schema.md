# Finance Log Schema

The CSV that powers `/finance-log`. One row per transaction. Manual entry by default, optional bank-import later.

## Columns

```
date, type, category, vendor, amount, currency, note, tags
```

### `date`

ISO format: `YYYY-MM-DD`. Use the transaction date, not the entry date. Bank-export dates beat memory dates.

### `type`

One of: `income`, `expense`, `refund`, `transfer`.

- `income`: money in for business work or business assets
- `expense`: money out for business operations
- `refund`: money returned (negative expense, e.g., subscription refunded)
- `transfer`: money moved between accounts the user owns. Does not affect burn or income totals; useful for ledger completeness only

### `category`

Required. Use one from this list. If a new category is needed, add to the list AND update the schema doc.

**Income categories:**

- `client`: direct client payment
- `affiliate`: affiliate or referral commission
- `product`: digital or physical product sale
- `course`: course sale
- `speaking`: speaking honorarium
- `consulting`: one-off consulting fee
- `royalty`: book / IP / licensing royalty
- `other-income`

**Expense categories:**

- `software`: SaaS subscriptions
- `hosting`: domain, web hosting, CDN
- `email`: email infrastructure (M365, Google Workspace, ESP)
- `payments`: Stripe, PayPal, processing fees
- `contractor`: VA, designer, developer, contractor
- `marketing`: ads, sponsorships, paid social
- `tools`: one-time tool purchases (hardware, plugins)
- `legal`: legal / accountant / professional services
- `taxes`: quarterly estimates, sales tax remit
- `office`: coworking, office supplies
- `travel`: business travel
- `meals`: client meals, business meals
- `education`: courses, books, conferences
- `bank`: bank fees, payment processor fees not allocated to payments
- `equipment`: laptop, camera, mic
- `other-expense`

### `vendor`

Free text but consistent spelling. Use the legal name of the vendor or the platform name. Examples: `MailerLite`, `HubSpot`, `Microsoft 365`, `Sarah Chen (VA)`, `Stripe`.

If income, use the client name. Examples: `Sam`, `[their company] (Alex)`.

### `amount`

Positive decimal for income and expense. Two decimal places. Use the user's primary currency (set in CLAUDE.md). If the transaction was in another currency, convert at the transaction-date rate and put the original in `note`.

### `currency`

3-letter ISO code: `USD`, `CAD`, `EUR`, `GBP`. Default is the user's primary.

### `note`

Free text. One line. Helpful for future-self review.

Good notes:

- "Foundation mo 2 of 3"
- "Monthly subscription"
- "One-time annual prepay (saves $24)"
- "Refund processed by Stripe, original transaction 2026-04-15"

Bad notes:

- "Stuff"
- "Subscription thing"
- "" (empty when context is needed)

### `tags`

Comma-separated. Drives the report logic.

**Recurrence tags (required for expenses):**

- `monthly`: recurs every month
- `annual`: recurs every year
- `quarterly`: recurs every quarter
- `one-time`: single transaction

**Use-case tags:**

- `subscription`: SaaS sub (almost always pair with `monthly` or `annual`)
- `client-payment`: income from a client
- `personal-overlap`: flag for review; might be partially personal
- `reimbursable`: user paid out-of-pocket for a vendor expense

**Status tags:**

- `paid`: settled
- `pending`: invoiced but not yet collected
- `overdue`: invoiced and past due

## Tag rules

### Recurring vs one-time

Every expense row must have one of: `monthly`, `annual`, `quarterly`, `one-time`.

This is the foundation for the burn calculation. Without it, the skill cannot separate recurring drag from one-time spike.

### Subscription tag

Use `subscription` for any SaaS or recurring service. The stale-subscription scan keys off this tag.

If a vendor is a contractor on retainer (e.g., "VA $200/mo"), tag `monthly` but NOT `subscription`. The stale-sub scan should not flag retained humans.

### Client payment

Use `client-payment` for any income row tied to a named client. This drives client concentration computation in stage-aware adjustments.

If a client pays in tranches (e.g., $800 x 3 months for a 90-day engagement), log each tranche as a separate row. Do not log the contract value upfront. Income is when cash arrives.

## Common transaction patterns

### Monthly SaaS subscription

```
2026-05-22, expense, software, MailerLite, 0.00, USD, free tier, monthly,subscription
2026-05-22, expense, software, HubSpot, 20.00, USD, Starter SKU, monthly,subscription
```

Free-tier subscriptions log as $0. Tracking the row even at $0 prevents "wait was this in our stack" later.

### Annual prepay

```
2026-01-15, expense, hosting, Cloudflare, 120.00, USD, Cloudflare Pro annual, annual,subscription
```

Annual prepays log once at the date the money left. The skill's `monthly recurring` divides annual by 12 when computing average burn.

### Client tranche payment

```
2026-04-15, income, client, Sam, 800.00, USD, Foundation mo 1 of 3, client-payment,paid
2026-05-15, income, client, Sam, 800.00, USD, Foundation mo 2 of 3, client-payment,paid
2026-06-15, income, client, Sam, 800.00, USD, Foundation mo 3 of 3, client-payment,paid
```

Three rows for a 3-tranche package. Easier than synthetic split-row math later.

### Refund

```
2026-05-10, refund, software, Loom, 8.00, USD, refunded after cancellation, one-time
```

`type` is `refund`. The skill subtracts from burn, not adds to income.

### Transfer (out of scope for burn / income)

```
2026-05-01, transfer, other-expense, Business savings, 1000.00, USD, monthly savings transfer, one-time
```

Transfers do not affect the income or expense totals. They show in the ledger for completeness.

### Personal overlap (flag for review)

```
2026-05-19, expense, software, ChatGPT Plus, 20.00, USD, used for both personal and business, monthly,subscription,personal-overlap
```

The `personal-overlap` tag triggers a review prompt: "Row 47 tagged personal-overlap. Split percent or move to personal log?"

## CSV maintenance rules

### One row per transaction

Do not consolidate. "MailerLite + Cloudflare + M365 = $26" is harder to debug 3 months later than three rows. Disk space is free; clarity is not.

### Edits over re-entries

If a transaction is logged wrong, edit the row. Do not log a correction row. The CSV is small enough to edit in place.

### Backup before bulk edit

If the user is about to bulk-edit (import 30 rows from a bank export), back up the current CSV to `business-setup-playbook/finance-log-backup-YYYY-MM-DD.csv` first.

### Year-end archive

At the end of each calendar year, archive the year to `business-setup-playbook/archive/finance-log-YYYY.csv` and start a fresh CSV. The current-year CSV stays under 500 rows for performance.

## What the schema is NOT for

- Not a substitute for accounting software. Schedule C, balance sheet, P&L are downstream tools.
- Not a tax record by itself. Receipts still belong in your shoebox or scanner.
- Not a forecast tool. Past behavior is what the CSV captures. Forecast is judgment.

The schema is a single source of truth for "what did the business cost and earn this month, in cash." That number is the only one that matters until tax time.

## Adding new categories

If the user needs a category not in the list, follow this rule:

1. Use `other-income` or `other-expense` for one-off transactions where the category does not justify a new bucket.
2. Add a new category only if the user expects more than 4 transactions of that type per year.
3. When adding, update this schema doc AND the user's CLAUDE.md > Stack section to note the new category.

This prevents category proliferation that makes the report meaningless.

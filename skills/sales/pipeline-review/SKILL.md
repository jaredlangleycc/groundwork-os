---
name: pipeline-review
description: This skill should be used when the user asks to "review my pipeline", "audit my deals", "pipeline check", "deals review", "weekly pipeline", "where am I bleeding deals", "pipeline health", or wants a deep stage-by-stage audit of their sales pipeline. Identifies stage drift, no-movement deals, missing next-action dates, and forecasting issues. Distinct from weekly-brief (broader scope) and follow-up-tracker (focused on individual stale prospects).
version: 0.1.0
---

# Pipeline Review

Weekly stage-by-stage audit of the user's sales pipeline. Different from the follow-up sweep (which is prospect-by-prospect): pipeline review goes one level higher and audits the SHAPE of the pipeline.

It surfaces: stage drift (deals stuck at same stage 3+ weeks), no-movement clusters (5+ deals at same stage), missing next-action dates (deals with no committed follow-up), stage-progression issues (deals skipping stages or sliding backwards), forecast accuracy gaps, and ICP-fit dilution.

The output is a diagnostic 1-pager: where the pipeline is healthy, where it's bleeding, and 3-5 deals that need specific user action this week.

## When this skill triggers

- "Run the pipeline review"
- "Audit my pipeline"
- "Pipeline check"
- "Deals review"
- "Weekly pipeline"
- "Where am I bleeding deals"
- "Pipeline health"
- "Show me where the pipeline is broken"
- "Friday pipeline"

Best run weekly, ideally Friday morning. Can be run monthly if pipeline volume is low (under 20 active deals).

## The 6-section audit

### Section 1: Pipeline snapshot (top)

Headline numbers for fast scanning:

```
PIPELINE REVIEW: [date]

TOTAL ACTIVE DEALS: N
TOTAL PIPELINE VALUE: $X
DEALS THIS WEEK (closed won + lost): N won, N lost

BY STAGE:
- Lead: N deals, $X
- Discovery Booked: N deals, $X
- Discovery Held: N deals, $X
- Proposal Sent: N deals, $X
- Verbal Yes: N deals, $X
```

Reader gets the math in 10 seconds.

### Section 2: Stage health check

For each stage, evaluate:

**Velocity:** average days in stage before progression (or current pipeline)
**Conversion rate:** of deals that entered this stage, what % progressed vs got stuck or lost
**Volume:** is the stage starving (too few) or bloated (too many)?

Healthy benchmarks (adjust for offer + cycle length):

| Stage | Healthy avg days | Healthy conversion to next | Bloat threshold |
|---|---|---|---|
| Lead | 7-14 days | 30-50% | >30 deals |
| Discovery Booked | 0-7 days | 70-85% (show rate) | >5 deals |
| Discovery Held | 7-14 days | 30-50% to proposal | >10 deals |
| Proposal Sent | 7-21 days | 30-50% close rate | >5 deals |
| Verbal Yes | 0-7 days | 90%+ close rate | >3 deals |

Flag deviations:

> "Discovery Held has 11 deals with average age 28 days. Healthy is 7-14 days. Pattern: deals are not progressing to proposal. Either the discovery isn't earning the proposal, or you owe proposals that aren't getting written. (Cross-ref: `follow-up-tracker` says you owe 4 proposals as of this week.)"

### Section 3: Stage drift detection

Identify specific deals where stage hasn't changed in 21+ days. These are NOT included in follow-up-tracker's 14-day window; they're the deeper-stuck cases.

For each drifted deal:

- Name + stage
- Days at current stage
- Last activity (call, email, note)
- Drift reason (if known from CRM): waiting on prospect / waiting on user / no clear reason / vague punt
- Recommended action: progress / close-loop / convert to "lost"

Example output:

```
STAGE DRIFT (deals stuck 21+ days):

1. Casey (Proposal Sent, 28 days)
   Last activity: proposal sent April 29, no reply.
   Recommended: A/B/C close this week. If no reply in 7 days, move to lost.

2. Marcus T. (Lead, 32 days)
   Last activity: warm intro from Taylor April 22, two-touch follow-up no reply.
   Recommended: close-loop email this week. Move to lost if no reply in 5 days.

3. Alex R. (Discovery Held, 35 days from initial research call,
   but new clarity_booked Friday so movement happening)
   Recommended: hold, conversation moves Friday.
```

### Section 4: Missing next-action audit

For every active deal, the CRM should have a "next action date" or equivalent. Pipeline review identifies deals without one.

> "12 active deals. 4 have no next-action date in CRM. List below. Either set a date or move to lost."

Each undated deal:
- Name + stage
- Last touch date
- Why no next action (likely: user forgot to log it, or no action is planned)

For Pre-Rev Builder and Early Operator, this is a CRM hygiene issue. Refer to `crm-hygiene` skill.

### Section 5: ICP-fit dilution check

Look at the active pipeline. What percentage of deals match the user's stated ICP (from CLAUDE.md)?

Healthy ICP fit: 80%+ of pipeline matches ICP definition.

Below 60% = dilution problem. Either ICP definition is wrong, or user is taking unqualified deals to fill pipeline.

Example output:

```
ICP FIT CHECK:

Stated ICP: Frontline sales managers <18 months in role, B2B SaaS 50-500.

Active pipeline (12 deals):
- 7 deals match (58%)
- 3 deals are adjacent (PMM, Sales Ops, Customer Success leader)
- 2 deals are off-ICP (founder-CEO, freelance consultant)

PATTERN: ICP match is below healthy threshold.

Two questions:
1. Are the 3 adjacent deals worth keeping in pipeline, or do they sap focus?
2. Are the 2 off-ICP deals just for the money, and is that worth it?

Recommended: Push back on yourself before taking the next off-ICP call.
If the answer is "I needed the money," that's a different conversation
about pricing, runway, or pipeline volume.
```

### Section 6: 3-5 deals needing action this week

The closing section is the ACTION list. NOT every deal. The 3-5 that move the most revenue or close the most risk.

Selection rules:
- Verbal Yes deals first (closest to revenue)
- Proposal Sent deals past 14 days (highest probability of close)
- Discovery Held deals where user owes the next step (revenue you can recover)
- Stage drift deals that need decision (close-loop or push)

NEVER include all stale deals. Pick the 3-5 with the highest leverage.

Example:

```
THIS WEEK'S 5 DEALS (in order):

1. Drew (Verbal Yes Q3, 7 days)
   Action: Send Q3 invoice Monday. $X recurring.

2. Sam (Discovery Held → Verbal, 8 days)
   Action: Send Q3 extension proposal. $X.

3. Casey (Proposal Sent, 24 days)
   Action: A/B/C close. If no reply by Friday, move to lost.

4. Morgan (Proposal Sent + price pushback, 23 days)
   Action: Confirm with Jared whether scope-down option is on the table.
   If yes, send revised proposal. If no, A/B/C close.

5. Alex (clarity_booked, Friday call)
   Action: Run the Friday call. Default goal: close strategy session
   in next 14 days. Use call-prep brief at client-experience/
   example-prospect-prep.md.

Total revenue if all 5 close: $X
```

## Forecast accuracy check (Stable Solo+)

For users at Stable Solo and Scaling Solo stages, add a forecast accuracy section.

Each month, log the user's deal forecast at month start vs actual close at month end. Track MAPE (Mean Absolute Percentage Error).

Healthy MAPE: <20% (forecasts within 20% of actuals).
Concerning MAPE: 20-35%.
Broken forecasting: >35% (the user is guessing, not forecasting).

If forecasting is broken, pipeline review surfaces the root cause:
- Are deals slipping (deals forecast to close don't, but neither close-won nor close-lost)?
- Are deals stuck at Verbal Yes too long?
- Is the user counting Proposal Sent as 50% probability when actual close rate is 25%?

## Anti-patterns to refuse

### "Just give me the pipeline number"

Push back. The pipeline number without stage health is misleading. $30K pipeline of 12 deals at Proposal Sent (30% close rate average) = $9K expected. Same $30K pipeline at Verbal Yes (90% close) = $27K expected. Stage health matters more than total.

### "Forecast everything to close this quarter"

Refuse. Forecast = expected value based on historical close rates by stage. If the user is force-forecasting (assigning 90% probability to deals that historically close at 30%), surface it.

### "I'll add 5 deals to the pipeline this week"

Push back if pipeline is already bloated at the wrong stages. Adding leads when you have 11 deals stuck at Discovery Held is making the bottleneck worse.

> "Adding 5 leads makes the top of the funnel bigger. The actual problem is the 11 deals stuck at Discovery Held. Clear those first."

### "Don't mark anything as lost"

Refuse. Refusing to close-loop on stale deals = inflated pipeline = false forecast = bad decisions.

> "Pipeline that doesn't close-loop is decorative. Mark the 3 deals over 30 days stale as lost. The remaining pipeline becomes accurate."

## Coach-mode integration

Pipeline review is also a diagnostic of the USER. The pipeline reveals the seller.

### Pattern 1: "Pipeline grows but doesn't close"

If pipeline is growing 20% month-over-month but close rate is dropping, the user is in collection mode, not close mode.

Surface:
> "Your pipeline grew 22% this month. Close rate dropped from 38% to 24%. You're collecting prospects, not closing them. The work this month is closing, not prospecting. Halt new outreach for 2 weeks, focus on the 8 active deals."

### Pattern 2: "User always closes near end of month"

If most closes happen in last week of month, user is leaning on artificial urgency or end-of-month pressure.

Surface:
> "73% of closes this quarter happened in the last 5 days of the month. That's not skill, that's pressure. The fix: better discovery up front so deals close on natural timeline, not on month-end manufactured timeline."

### Pattern 3: "User keeps lowering prices to close"

If average deal size is dropping while close rate is holding, the user is closing by discounting.

Surface:
> "Your average deal closed at $X,XXX in Q1. Q2 it's down to $1,850. The close rate is steady at 35%, so you're winning by discounting. That's a pricing or positioning problem, not a sales problem. Worth running `/pricing-strategy` or `/positioning`."

## Family floor protection

Pipeline review runs in a 90-120 minute window. Default slot: Friday 10am-12pm.

Inside family floor (M-F 4-7pm or Sundays for default user): flag and reschedule.

## Stage-aware adjustments

### Pre-Rev Builder

- Pipeline review is short (5-10 deals, manual).
- Section 5 (ICP fit) is critical, the user is still learning who their ICP is.
- Sections 2 (stage health), 4 (forecast accuracy) skip until volume warrants.
- Most leverage: Section 6 (3 deals to focus on this week).

### Early Operator

- Pipeline is medium (10-30 deals).
- All 6 sections active. Forecast accuracy skipped if user doesn't have 3 months of data yet.
- Diagnostic patterns starting to surface. Run weekly.

### Stable Solo

- Pipeline is large (30-80 deals).
- All sections active. Forecast accuracy is the highest-value section.
- Pattern: pipeline can mask close-rate issues. Audit close rate by stage monthly.

### Scaling Solo

- Pipeline is very large (80-200+ deals).
- Increasingly delegated. User reviews diagnostics + decides on the 5 strategic deals.
- VA/SDR handles execution of follow-ups.

## Output format

```
PIPELINE REVIEW: [date]

SNAPSHOT
[total deals, total $, this week won/lost, by-stage breakdown]

STAGE HEALTH
[per-stage velocity + conversion + volume, flag deviations]

STAGE DRIFT
[deals stuck 21+ days, recommended actions]

MISSING NEXT-ACTION
[deals without committed next step, list + fix]

ICP FIT
[% match, flag dilution, surface pattern]

FORECAST ACCURACY (Stable Solo+)
[MAPE last 30 days, root cause if >25%]

THIS WEEK'S 5 DEALS
[ranked action list with specifics]

COACH NOTES
[1-3 patterns from this audit, with skill handoff if applicable]

TIME TO REVIEW: 30-45 min
NEXT REVIEW: [date, 7 days out]
```

Save to `reports/pipeline-review-YYYY-MM-DD.md`. Suggest user reviews before Monday morning.

## Working with other skills

- Imports: `voice-rules` (for coach-note framing), `business-coach` (for pattern recognition + push-back framing)
- Reads from: HubSpot MCP, Google Sheets, Notion, file system
- Hands off to: `follow-up-tracker` (for individual prospect drafts), `pricing-strategy` (if discount pattern surfaces), `positioning` (if ICP dilution), `crm-hygiene` (if data is dirty), `proposal-writer` (if post-proposal stalls are common)
- Pairs with: `weekly-brief` (broader weekly cadence), `morning-sales-brief` (daily tactical)

## Additional Resources

### Reference files

- **`references/stage-health-benchmarks.md`**: healthy velocity / conversion / volume ranges per stage, with how to calibrate for offer + cycle length
- **`references/forecast-accuracy-method.md`**: MAPE calculation method, what to track, how to read drift patterns

### Example files

- **`examples/example-pipeline-review.md`**: full pipeline review output for the example coaching business week 21, 12 active deals, all sections populated

# Worked Example: CRM Hygiene Report, the example coaching business

Input: `/crm-hygiene` run on Friday May 23, 2026. CRM is HubSpot Starter (per CLAUDE.md). Data sourced from HubSpot via MCP, cross-referenced against the example CSV in `crm-sheet-template.csv` for missing-source detection.

## Output

```
CRM HYGIENE: the example coaching business
Stage: Early Operator · CRM: HubSpot Starter · Sales cycle: 30 days
Run: 2026-05-23 (Friday)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
1. STALE DEALS (>14 days no movement)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  - Casey Cruz (Sales Mgr, Pixelhaus): stage discovery_held
    Last touch: 23 days ago. Next action: send proposal (overdue 18 days).
    Suggested move: send proposal today or move to lost.

  - Morgan Park (Director Sales, Lighthouse Co): stage discovery_held
    Last touch: 22 days ago. Next action: follow up next week (overdue 15 days).
    Suggested move: cold restart with new angle or move to qualified_out.

  - Taylor Foster (AE, RedDot Ventures): stage discovery_booked
    Last touch: 19 days ago. Next action: send follow-up (overdue 13 days).
    No-show on original discovery call. Suggested move: one last cold restart
    or move to lost / ghosted.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
2. MISSING NEXT-ACTION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  - Alex: stage clarity_booked
    Booked Fri May 22 3:00pm PT. Pre-session form sent, not yet submitted.
    No prep work logged. Action: confirm form submission or run prep without it.

  - Mara Lin: stage research_booked
    Booked Mon May 26 11:00am PT. No prep. No conversation context logged.
    Action: log first-touch source + 1-line context before the call.

  - James Wu: stage research_booked
    Booked Fri May 30 (next week). No prep. Action: schedule prep block on
    Wed or Thu next week.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
3. DUPLICATE SUSPECTS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  - "Taylor Foster" (L004, created 2026-04-20) + "Taylor F." (L005, created 2026-05-03)
    Both at adam@example.com, both RedDot Ventures.
    Confidence: HIGH. Merge candidates.
    Primary record: L004 (older creation date, has more detail).

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
4. STAGE MISFIRES
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  - Sarah Lee: stage won, close date 2026-04-15
    No finance-log income row matching this deal in 30 days after close.
    Pick one:
      a. Confirm cash received, add finance-log row, close the loop.
      b. Move to lost / payment_failed.
      c. Move to lost / ghosted-after-close.

  - Mike Chen: stage lost, close date 2026-04-20
    No lost_reason set. Backfill: price, timing, fit, ghosted, competitor, other.

  - Tanvi Park: stage proposal_sent, deal_value $0
    Active stage with no deal value. Pick one:
      a. Set deal_value to $X,XXX (Foundation default).
      b. Move to qualified_out if proposal was exploratory.
      c. Move to lost with reason.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
5. DEAD LEADS (90+ days no movement)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  - Ravi Patel (Sales Lead, Skyline): stage proposal_sent
    Last touch: 97 days ago. Proposal sent Feb 22, no response.
    Suggested: move to lost / ghosted.

Total dead leads: 1.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
6. MISSING SOURCE ATTRIBUTION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  - Beth Taylors (Sales Mgr, [no company]): created 2026-05-20
    Source: not set. Company: not set.
    Action: where did Beth come from? lead-gen assessment, LinkedIn, contact form?
    Backfill source and verify company name.

Total missing source: 1.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
7. FIELD DRIFT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  - Nia Banks: lead-gen assessment completed 2026-05-12, no vibe_score on contact
    record. Worker likely skipped write. Action: cross-check MailerLite
    subscriber record, manually backfill if MailerLite has the data.

  - 2 deals in proposal_sent without pillar_focus (Casey Cruz,
    Tanvi Park). Backfill or run the pillar question on follow-up.

Total field drift: 2.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
HYGIENE SUMMARY
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Stale deals:           3
  Missing next-action:   3
  Duplicate suspects:    1 pair
  Stage misfires:        3
  Dead leads:            1
  Missing source:        1
  Field drift:           2

Total dirty records: 14

TRIAGE SUGGESTION
  1. Resolve 3 stage misfires first (data correctness > everything else).
     - Sarah Lee: confirm cash or move to lost.
     - Mike Chen: backfill lost reason.
     - Tanvi Park: set deal value or move out of active.
  2. Merge Taylor Foster / Taylor F. duplicate (prevents future dirty growth).
  3. Move Ravi Patel to lost / ghosted (closes the zombie).
  4. Alex, Mara, James prep (next-action critical for booked calls).
  5. Save 3 stale deals for follow-up sprint (allocate 90 minutes Monday).

THE QUESTION
  Of Casey, Morgan, and Taylor: which would you take if it closed
  next week? Restart that one Monday. Move the other two to qualified_out
  or follow-up-next-month batch.
```

## What this output models

### Stage misfires lead the triage

Three stage misfires sit at the top of the triage list because data correctness compounds. Wrong stages drive wrong forecasts. The skill catches them first.

### Alex missing prep flagged but not catastrophized

Alex's session is today (Friday May 22 3pm PT). The skill notes the missing prep as a Check 2 hit, suggests an action ("run prep without form"), and moves on. No moralizing about the form not being submitted.

### Taylor Foster duplicate flagged HIGH confidence

The duplicate is clearly the same person (same email, same company, similar name). The skill picks the older record as primary and recommends merge. The user confirms with one decision; the skill executes the merge.

### Field drift surfaces the worker bug

Nia Banks has lead-gen assessment completion data in MailerLite but not in HubSpot. This is a worker pipeline bug. The skill flags it. The user can investigate the worker separately.

### Triage is action-first, not narrative

Each triage item is a specific action with a deal name. Not "clean up stage misfires" but "Sarah Lee: confirm cash or move to lost." The user can act on each item in under 60 seconds.

### One closing question

The skill asks one question tied to the stale-deals block: which of the three stale deals matters most? The user picks one. The other two get a batch action (qualified_out or follow-up next month). This prevents follow-up paralysis where the user feels obligated to restart all three.

## Alternate output: clean state

If the CRM is clean (zero dirty records):

```
CRM HYGIENE: the example coaching business
Run: 2026-06-13 (Friday)

Zero dirty records.
Skip the rest of the brief and ship a sales call.
```

Short. No padding. The skill respects the user's time when there is no work to do.

## Alternate output: high-volume mess

If the CRM has 50+ dirty records:

```
CRM HYGIENE: the example coaching business
Stage: Stable Solo · CRM: HubSpot Pro · Sales cycle: 45 days
Run: 2026-08-08 (Friday)

Total dirty records: 67

This is a half-day of work. Triage in batches.

Batch 1 (right now, 30 min):
  - 5 high-severity stage misfires (won-no-income deals).
  - 3 high-confidence duplicates.

Batch 2 (Monday morning, 60 min):
  - 12 stale deals: bucket into "restart this week" vs "move to lost."
  - 6 dead leads: bulk move to lost / ghosted.

Batch 3 (Tuesday or skip):
  - 24 missing source attribution.
  - 17 field drift items.

THE QUESTION
  Block 30 min right now or block tomorrow morning? Sitting on 67 dirty
  records past one more weekend means the next hygiene is a full day.
```

The skill batches the work. The user is not facing 67 line items; they are facing two 30-60 minute blocks.

## Working backward: skipped checks

If the user has disabled Check 6 (missing source) and Check 7 (field drift) via CLAUDE.md:

```
Checks 6 and 7 skipped per CLAUDE.md > Skills > crm-hygiene > disabled.
```

The skill notes the skip in one line. Does not list reasons.

---
name: crm-hygiene
description: This skill should be used when the user asks for a "CRM hygiene", "clean up my CRM", "audit contacts", "stale deals", "dedupe contacts", "fix my CRM", "deals review", "find deals with missing fields", or similar. Reads the user's CRM (HubSpot, Google Sheet, or Notion based on what is in CLAUDE.md Stack) and surfaces dirty records: deals stuck without next-action, duplicates, stage misfires (deals marked won but no income row), dead leads. Output is a hygiene report plus a queue of one-click fixes. Active for Early Operator and later stages.
version: 0.1.0
---

# CRM Hygiene

The CRM cleanup skill. Finds the rot. The user fixes it.

Solopreneurs do not lose deals to bad selling. They lose deals to bad CRM hygiene: the prospect who slipped into "stage 3" five weeks ago and never moved, the duplicate contact created on a second form-fill, the deal marked won with no payment row to back it up. Crm-hygiene is the audit that makes the rot visible.

## When this skill triggers

- `/crm-hygiene`
- "Clean up my CRM"
- "Audit my contacts"
- "Find stale deals"
- "Dedupe my contacts"
- "Deals review"
- "Fix my CRM"
- "Find deals with missing fields"
- Inside `/ship-it-friday` as a monthly check (first Friday of each month)
- Inside `weekly-brief` as a light stale-deal flag (under 60 seconds, stale-deal count only)

## Adapting to the user's CRM

Read CLAUDE.md > Stack > CRM. Adapt the data source based on what the user has.

### Priority 1: HubSpot

If the user has `crm: HubSpot` in stack and the HubSpot MCP is connected, use:

- `search_objects` for contacts and deals with property filters
- `get_properties` to confirm custom fields exist before querying
- Query both pipelines if configured (e.g., organic + accelerator)

### Priority 2: Google Sheet

If the user has `crm: Google Sheet` in stack, read the sheet via the configured method (Google Sheets MCP if connected, or instruct the user to export to CSV).

Expected columns (from `examples/crm-sheet-template.csv`):

```
contact_id, name, email, company, role, source, first_touch_at, last_touch_at,
stage, owner, next_action, next_action_date, deal_value, notes
```

### Priority 3: Notion

If the user has `crm: Notion` in stack and the Notion MCP is connected, query the database.

### Priority 4: Manual

If no CRM is connected or accessible, ask: "Drop your top 20 active prospects and current stages. I'll run the hygiene on what you share."

Do not fabricate CRM data.

## The seven hygiene checks

Run all seven by default. Each produces a row in the hygiene report. The user picks which to fix.

### Check 1: Stale deals (no movement >14 days)

A deal is stale if its `last_touch_at` or HubSpot `hs_lastmodifieddate` is more than 14 days ago AND the deal is not in a terminal stage (won, lost, qualified-out).

Output:

```
STALE DEALS (>14 days no movement)
  - Taylor Foster (LinkedIn AE, Acme Corp): stage discovery_booked
    Last touch: 18 days ago. Next action: not set.
    Suggested move: cold restart, qualify out, or skip.

  - Casey Cruz (Sales Mgr, BlueSky): stage discovery_held
    Last touch: 22 days ago. Next action: send proposal (overdue by 14 days).
    Suggested move: send proposal today or move to lost.
```

Sort by days stale, descending. Cap at 10 entries (long lists become a wall the user ignores).

### Check 2: Missing next-action

A deal in an active stage with no `next_action` field, OR `next_action_date` in the past with no follow-up logged.

```
MISSING NEXT-ACTION
  - Alex: stage clarity_booked
    Booked Fri May 22 3:00pm PT. No prep work logged. No follow-up logged.
    Action: log prep before the call.

  - Mara Lin: stage research_booked
    Booked Mon May 26 11:00am PT. No prep. No prior conversation context.
    Action: log first-touch source + 1-line context before the call.
```

### Check 3: Duplicates (same email, different name)

Find contacts where `email` matches another contact but `name` differs OR `company` differs.

```
DUPLICATE SUSPECTS
  - "Taylor Foster" + "Taylor F." both at adam@acmecorp.com
    Created 2026-04-12 + 2026-05-03. Merge candidates.

  - "Jane Smith" + "Jane S." both at jsmith@bluesky.io
    Different companies in record (Acme + BlueSky). Possible job change,
    not duplicate. Verify before merge.
```

For HubSpot, also check for case-insensitive email match (jane@x.com vs Jane@X.com).

For Google Sheet, check for empty-email rows that are likely the same person as a filled-email row (match on name + company).

### Check 4: Stage misfires

Deals in `won` stage without:

- A corresponding income row in `finance-log.csv` within 30 days, OR
- A close date inside the last 90 days

Deals in `lost` stage without:

- A `lost_reason` field populated

Deals in active stages with `deal_value` of $0 (unset).

```
STAGE MISFIRES
  - Sarah Lee: stage won, close date 2026-04-15
    No finance-log income row matching this deal in 30 days after close.
    Action: confirm cash received, or move to lost / payment_failed.

  - Mike Chen: stage lost, close date 2026-04-20
    No lost_reason set. Action: backfill reason (price, timing, fit,
    ghosted, competitor, other) so future patterns are findable.

  - Tanvi Park: stage proposal_sent, deal_value $0
    Active stage with no deal value. Action: set deal value or move
    to qualified_out.
```

### Check 5: Dead leads (no movement 90+ days)

Contacts where last_touch_at >90 days ago AND stage is not terminal. These are not stale; they are dead. Suggest moving to `lost` with reason `ghosted`.

```
DEAD LEADS (90+ days no movement)
  - 7 contacts in active stages with no touch in 90+ days.
    Action: bulk move to lost with reason "ghosted" via decision-logger,
    OR review individually and re-engage 2-3 worth re-warming.
```

Sort by days dead, descending. Do not list more than 10. If more than 10, say so: "More than 10 dead leads. Triage in batches."

### Check 6: Missing source attribution

Contacts created with no `source` field. The skill cannot run sales-channel analytics without knowing where contacts came from.

```
MISSING SOURCE ATTRIBUTION
  - 4 contacts created in last 30 days without source set.
    Sources to check: lead-gen assessment signup, Cal booking webhook, contact form,
    LinkedIn outreach, referral.
    Action: backfill source for these 4, then check why source was not
    captured at form-fill time.
```

### Check 7: Field drift

CRM custom fields that should be filled but are not. Field drift detection:

- lead-gen assessment completion: contacts who took the lead-gen assessment should have `vibe_score`, `vibe_archetype`, `quietest_pillar` populated.
- Booked calls count: contacts who booked >0 calls should have `booked_calls_count` >= 1.
- Funnel source: deals should have `funnel_source` set (organic or accelerator-outbound).
- Pillar focus: deals in proposal_sent stage should have `pillar_focus` set.

```
FIELD DRIFT
  - 3 lead-gen assessment completers missing vibe_score field. Worker likely
    skipped writes. Action: cross-check MailerLite subscriber records.

  - 2 deals in proposal_sent without pillar_focus. Action: backfill
    or run the discovery question to set.
```

## The hygiene report format

Print all seven checks in order. Single-screen target where possible. If output exceeds one screen, truncate each check to top 3 and add "+ N more in full report."

End with three things:

1. **The damage estimate**: number of dirty records across all checks.
2. **The triage suggestion**: what to fix first based on severity.
3. **The one question**: tied to the largest gap.

```
HYGIENE SUMMARY
  Stale deals:           8
  Missing next-action:   5
  Duplicate suspects:    2 pairs
  Stage misfires:        3
  Dead leads:            7
  Missing source:        4
  Field drift:           5

Total dirty records: 34

Triage suggestion:
  1. Resolve the 3 stage misfires first (data correctness > everything else).
  2. Then merge 2 duplicate pairs (prevents future dirty growth).
  3. Then bulk-move 7 dead leads to lost (ghosted).
  4. Save 8 stale deals for a follow-up sprint (allocate 2 hours).

THE QUESTION
  Which one of the 8 stale deals would you take if it closed this week?
  Restart that one tomorrow. Move the other 7 to qualified_out or follow-up
  next month.
```

## Stage misfire resolution

For each stage misfire, the skill does NOT auto-correct. The skill produces a one-click fix prompt:

```
- Sarah Lee: stage won, no income row in finance-log.

  Pick one:
    a. Confirm cash received. Add finance-log row + close the loop.
    b. Move to lost / payment_failed.
    c. Move to lost / ghosted-after-close.
    d. Skip for now.
```

The user picks. The skill writes the change via the CRM MCP. The skill logs the resolution via `decision-logger` if the action is non-trivial (move to lost, merge contacts).

## Dedup workflow

Duplicates are the most dangerous dirty data because merging is reversible only with backup. The workflow:

1. Skill lists duplicate candidates with confidence rating (`high`, `medium`, `low`).
2. For each candidate, skill shows the field-by-field comparison.
3. User picks: merge, keep both (job change), or skip.
4. If merge, skill identifies the "primary" record (older creation date by default, or HubSpot-default rules).
5. Skill writes the merge via CRM MCP.
6. Skill logs the merge via decision-logger.

Never auto-merge without user confirmation, even on high-confidence duplicates. A wrong merge erases history.

## Dead-lead bulk-move workflow

For 7 dead leads, the skill does not auto-move. Workflow:

1. Skill lists each dead lead with last-touch context.
2. User can pick: bulk-move-all, individual-review, or skip.
3. If bulk-move-all, skill asks: "Move all 7 to lost with reason 'ghosted'? This is reversible by re-opening stage in CRM."
4. On confirm, skill writes bulk move and logs via decision-logger as one entry summarizing the 7.

## Anti-patterns to refuse

### Auto-correcting without confirmation

Never edit CRM records without explicit user confirmation. The CRM is canonical for the business; a bad auto-correct is a real cost.

### Hiding low-confidence dedup candidates

If a dedup candidate is low-confidence (different companies, possibly job change), still surface it. Tag it `low-confidence verify`. The skill is the audit; the user is the verifier.

### Cheerleading clean states

If the CRM is clean (zero dirty records), say so in one line: "Zero dirty records. Skip the rest of the brief and ship a sales call." Do not pad.

### Catastrophizing dirty states

A CRM with 50 dirty records is not a crisis. It is one Friday of work. Triage and move. Do not lecture.

### Recommending tools

Do not recommend new tools to manage hygiene. The user has a CRM. The hygiene problem is process. The platform is fine. New tools create migration debt.

### Treating the skill as the source of truth

The CRM is the source of truth. The hygiene report is a derivative view. If the report and the CRM disagree, the CRM wins. Re-pull data before recommending a fix.

## Stage-aware adjustments

### Pre-Rev Builder

The user has no closed deals. Hygiene focus is on the inbound contact list: missing source attribution, duplicates from multiple form-fills, dead leads (anyone who has not moved in 60+ days).

```
PRE-REV HYGIENE NOTE
  No deals to triage. Focus is contact-list quality:
  - 4 missing source attribution. Where did they come from?
  - 1 duplicate pair (same person, two form-fills).
  - 7 contacts never had a first touch logged. Are they real
    leads, or noise?
```

### Early Operator (under $5K MRR)

Most common stage for first real CRM hygiene cleanup. Often the user has bolted HubSpot Free onto a Google Sheet and the two have drifted. Surface the drift explicitly.

```
EARLY OPERATOR HYGIENE NOTE
  Your CRM is HubSpot Starter (per CLAUDE.md). Your finance-log shows
  3 client payments this month. HubSpot shows 4 contacts in "customer"
  lifecycle stage. The off-by-one: is the 4th customer a real client
  the finance-log missed, or a stale "customer" tag that should be
  rolled back?
```

### Stable Solo ($5K to $25K)

The hygiene cost is higher because the volume is higher. Focus on stage misfires (impact on forecast accuracy) and dead-lead bulk moves (clean the pipeline of zombies).

### Scaling Solo ($25K+)

The user is likely managing a small team or contractors. Hygiene focus shifts to ownership clarity: which deals are owned by the user, which by a contractor, which by a partner. Surface ownerless deals.

## Last-of-month variant

When called by `ship-it-friday` on the first Friday of the month, run all seven checks plus three additional analyses.

### Conversion rates by source

```
SOURCE CONVERSION (last 90 days)
  lead-gen assessment:            32 contacts → 4 calls → 1 client (3.1%)
  LinkedIn outbound:     18 contacts → 5 calls → 1 client (5.5%)
  Referral:              4 contacts → 4 calls → 2 clients (50%)
  Contact form:          12 contacts → 2 calls → 0 clients (0%)

Question: contact form is 0% over 90 days. Different traffic source,
or different qualification need?
```

### Pipeline value coverage

If goal coverage is calculated:

```
PIPELINE COVERAGE
  Active pipeline value (open deals): $12,000
  90-day revenue goal: $10,000
  Coverage: 1.2x (below safety ratio of 3x)

Suggestion: top of funnel is light. What's the outreach
sprint this month?
```

### Loss reason patterns

```
LOSS REASON PATTERNS (last 90 days)
  - price: 3 losses
  - timing: 2 losses
  - ghosted: 4 losses
  - competitor: 1 loss

Most common pattern: ghosted (no response after proposal).
Question: at what stage are the ghosters dropping?
```

## Working with other skills

- **`weekly-brief`**: pulls stale-deal count for the brief; full hygiene is monthly.
- **`ship-it-friday`**: runs full hygiene on first Friday of month.
- **`pipeline-review`**: uses hygiene output as the cleaned source for pipeline analysis.
- **`follow-up-tracker`**: uses stale-deal list to draft follow-ups; does not duplicate the staleness check.
- **`finance-log`**: cross-references won-stage deals against income rows for stage-misfire detection.
- **`decision-logger`**: logs every merge, bulk-move, and lost-stage update.
- **`business-coach`**: coach can reference hygiene patterns when challenging stuck loops ("you have 8 stale deals; which one are you avoiding?").
- **`risk-gauge`**: when a new tool is proposed to "fix the CRM," risk-gauge flags it ("CRM hygiene is process; new tools add migration debt").

## What CRM hygiene does NOT do

- Does not auto-edit records. User confirms each change.
- Does not delete contacts. Worst-case is move-to-lost with reason "ghosted." Deletion is irreversible.
- Does not migrate between CRMs. Migration is a separate workflow.
- Does not score leads. Lead scoring is a separate skill.
- Does not draft follow-ups. Follow-up drafting is `follow-up-tracker`.
- Does not modify CLAUDE.md. CRM source-of-truth pointer changes are user-initiated.

## Closing the loop

After the user completes hygiene fixes, the skill prints a short close:

```
HYGIENE CLOSED
  Fixed: 3 stage misfires, 1 dedup merge, 5 dead leads moved to lost,
         4 source backfills, 2 missing next-actions logged.
  Remaining: 8 stale deals (saved for follow-up sprint), 1 field drift
             item (HubSpot worker investigation needed).

  Next hygiene check: first Friday next month (or sooner if pipeline volume
  triples).
```

The close is short. The work is done. The skill does not pad with celebration.

## Additional Resources

### Reference files

- **`references/hygiene-check-rules.md`**: full definitions for each of the seven checks, threshold rationale, false-positive handling
- **`references/crm-adapter-rules.md`**: adapter rules for HubSpot, Google Sheet, and Notion source patterns; how to map field names across CRMs

### Example files

- **`examples/crm-sheet-template.csv`**: starter CRM Google Sheet schema with 5 example rows showing the seven check patterns
- **`examples/hygiene-report-output.md`**: worked example of a full hygiene report on the example coaching business's pipeline

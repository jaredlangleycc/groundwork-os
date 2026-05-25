# Hygiene Check Rules

The seven checks, in detail. Each definition includes the threshold, the rationale for the threshold, and how to handle false positives.

## Check 1: Stale deals (no movement >14 days)

### Definition

A deal is stale if `last_touch_at` (or HubSpot `hs_lastmodifieddate`) is older than 14 days AND the deal is in a non-terminal stage.

Non-terminal stages: anything that is not won, lost, qualified-out, archived, or paid.

### Threshold rationale

14 days is the friction point where the prospect's memory of the conversation degrades materially. Beyond 14 days, the restart cost approaches a cold-touch cost. The skill flags at 14 to give the user the chance to act before the deal becomes a restart project.

Some users in long-cycle sales (enterprise, $50K+ deals) might want 30 days. Read from CLAUDE.md > Sales Motion > cycle_length and adjust:

- cycle < 30 days: threshold 14 days
- cycle 30-90 days: threshold 21 days
- cycle 90+ days: threshold 30 days

### False positives

A deal can show stale even when the user is in legitimate "waiting on the prospect" mode after a clear next-action was agreed. Resolution: if the deal has `next_action_date` set in the future, do not flag stale. Use `next_action_date` as the active waiting marker, not `last_touch_at`.

If `next_action_date` is in the past with no follow-up logged, that flips to Check 2 (missing next-action).

## Check 2: Missing next-action

### Definition

A deal in an active stage AND one of:

- `next_action` field is empty
- `next_action_date` is in the past with no resolution logged (no new `last_touch_at` after the date)
- HubSpot equivalent: `notes_next_activity_date` is in the past with no follow-up activity

### Threshold rationale

Missing next-action is the proximate cause of stale deals. Catching it before staleness sets in is the cheapest hygiene fix.

### False positives

Active stages where the next action is genuinely "wait" (e.g., proposal sent, awaiting signature) should have the next action explicitly logged as "wait for signature by [date]." If the user is using a non-standard convention, normalize during the first hygiene check and write the convention into CLAUDE.md.

## Check 3: Duplicates (same email, different name)

### Definition

Contacts where `email` matches another contact (case-insensitive) AND `name` differs OR `company` differs.

### Threshold rationale

Same email is high-signal for "same human." Different names usually means a nickname variant (Taylor Foster + Taylor F.). Different companies usually means a job change, NOT a duplicate.

### False positives

Job changes are the most common false positive. If two contacts share an email but differ on company AND the older record has `last_touch_at` more than 6 months old, treat as "possible job change, verify." Do not auto-tag as duplicate.

If two contacts have similar names (Jane Smith + Jane S.) and similar companies (Acme + Acme Corp), treat as high-confidence duplicate.

### Edge cases

- Generic emails (info@, contact@, hello@) at the same company: do not flag as duplicate; flag as "generic email, may need re-attribution."
- Two contacts at the same company without shared email: not a duplicate, separate people.
- Same email at different domains (e.g., personal Gmail + work email): treat as same human; the user picks which is primary.

## Check 4: Stage misfires

### Definition

Three sub-checks:

**4a. Won without income:** Deal in `won` stage, close date in last 90 days, with no matching income row in `finance-log.csv` within 30 days after close.

**4b. Lost without reason:** Deal in `lost` stage with no `lost_reason` field set.

**4c. Active with $0 value:** Deal in an active non-discovery stage (e.g., proposal_sent, negotiation) with `deal_value` of 0 or unset.

### Threshold rationale

**4a:** A real "won" deal produces cash. Cash arrival within 30 days is standard for SaaS-shaped offers. For longer payment terms (NET 60, NET 90), adjust the window via CLAUDE.md > Offer > payment_terms.

**4b:** Lost reason is the only retrospective data the user can mine for pattern. Missing it makes the CRM useless for "why are deals dying."

**4c:** Active stages without a value cannot contribute to pipeline coverage math. The number drifts; the math gets meaningless.

### False positives

**4a:** A deal can be "won" without income because the engagement starts in a future month (booked but not yet billed). Tag in `note`: `billing_starts_YYYY-MM` and do not flag if billing_starts is in the future.

**4b:** Some users use a single lost stage without sub-reasons. If CLAUDE.md > Stack > CRM does not have lost_reason field, do not flag; instead surface a one-time prompt: "Want to add lost_reason field for pattern visibility?"

## Check 5: Dead leads (no movement 90+ days)

### Definition

Contact with `last_touch_at` more than 90 days ago AND stage is not terminal (not won, lost, qualified-out, ghosted, paid).

### Threshold rationale

90 days separates stale from dead. Beyond 90 days, the prospect's context for the original conversation is lost. A restart at 90+ days is functionally a new cold touch.

Adjust by sales cycle:

- cycle < 30 days: dead threshold 60 days
- cycle 30-90 days: dead threshold 90 days
- cycle 90+ days: dead threshold 180 days

### False positives

Long-cycle prospects (enterprise sales, multi-year deal cycles) can legitimately go quiet for 6-12 months and reactivate. For these:

- Tag the contact `long-cycle` in the source field.
- Apply 180-day dead threshold instead of 90.
- Surface as "long-cycle quiet" not "dead lead."

If a contact has `last_touch_at` >90 days but is enrolled in a nurture sequence (MailerLite, HubSpot), do not flag as dead; the nurture sequence is the touch.

## Check 6: Missing source attribution

### Definition

Contact created with no `source`, `original_traffic_source`, `first_touch_source`, or equivalent field.

### Threshold rationale

Without source attribution, the user cannot run any channel-level analytics. The 30-day backfill window allows time to remember where each contact came from before memory degrades.

### False positives

If the user does not run channel-level analytics and does not plan to (Pre-Rev Builder with one channel), the field is operational overhead, not a hygiene fix. Surface this and offer to drop the check from monthly review.

If the source field exists but is set to "unknown" or "other" as a default, that is not missing; it is unspecified. Flag at a lower priority.

## Check 7: Field drift

### Definition

Custom CRM fields that should be populated based on the contact's known journey, but are not.

The skill detects field drift by joining known-completion events (lead-gen assessment submitted, Cal booking webhook fired, proposal sent) against expected field values.

### Sub-checks

**7a. lead-gen assessment field drift:** Contact has lead-gen assessment completion event (MailerLite subscriber in `lead-gen assessment subscribers` group OR HubSpot property `vibe_check_submitted_at` is set) but missing `vibe_score`, `vibe_archetype`, or `quietest_pillar`.

**7b. Booked calls drift:** Contact has booked calls events (Cal.com webhook fired for this email) but `booked_calls_count` is 0 or unset.

**7c. Pillar focus drift:** Deals in `proposal_sent` or later stages without `pillar_focus` set. The pillar is the framing question the user is selling on; if it is not captured at proposal-send time, the proposal review later lacks context.

**7d. Funnel source drift:** Deals without `funnel_source` set (organic vs accelerator-outbound). Drives funnel-level analytics.

### Threshold rationale

Field drift detection is a signal that the integration pipeline (worker, form handler, webhook) is silently failing. A single drift is noise; 3+ drifts on the same field across contacts is a worker bug.

### False positives

Free-tier CRMs may not support all custom fields. If CLAUDE.md > Stack lists the CRM as a tier that does not support custom fields (e.g., Notion free, HubSpot Free without custom property creation), drop the field-drift check.

## Cross-check rules

### Stage vs finance-log consistency

For every deal in won stage:

- Pull deal_value, close_date.
- Search finance-log.csv for income rows with vendor matching deal contact name AND date within 30 days of close_date.
- If no match, flag as stage misfire 4a.
- If match, confirm amounts (deal_value should equal total income from this client over the deal period).

### CRM vs MailerLite consistency

If user has MailerLite in stack and HubSpot/Sheet as CRM:

- Cross-check: every MailerLite subscriber in a "Leads" group should have a contact record in CRM.
- Cross-check: every CRM contact with status "customer" should NOT be in any "Leads" group (group hygiene on the ESP side).

### CRM vs Cal.com consistency

If user has Cal.com in stack:

- Cross-check: every Cal.com booking event in last 60 days should have a deal in CRM at the corresponding stage.
- Cross-check: contacts with booked_calls_count >0 should have at least one Cal.com event in the last 90 days. If not, the field is stale.

## Severity ranking

When all seven checks fire, rank by impact on the business:

1. **Stage misfires (Check 4)**: high severity. Wrong data drives wrong decisions.
2. **Duplicates (Check 3)**: high severity. Two records for one human breaks every downstream count.
3. **Dead leads (Check 5)**: medium severity. Pipeline bloat.
4. **Stale deals (Check 1)**: medium severity. Active deals dying.
5. **Missing next-action (Check 2)**: medium severity. Process leak.
6. **Field drift (Check 7)**: low severity unless 3+ drifts on same field (then high).
7. **Missing source attribution (Check 6)**: low severity unless user runs channel analytics.

The triage suggestion at end of report should reflect severity ranking, weighted by count.

## When to skip checks

The user can disable any check via CLAUDE.md > Skills > Disabled checks. Common skip patterns:

- Pre-Rev Builder with no deals: skip Check 1 (stale deals) and Check 4 (stage misfires).
- Single-source funnel: skip Check 6 (source attribution).
- CRM without custom fields: skip Check 7 (field drift).
- Long-cycle enterprise sales: increase Check 1 and Check 5 thresholds (see above).

Document any skips in CLAUDE.md so future runs respect them.

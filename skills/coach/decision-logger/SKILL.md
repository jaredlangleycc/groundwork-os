---
name: decision-logger
description: This skill should be used when the user says "logged", "let's lock this", "decided", "locked", "log this decision", "log it", or after any challenge or hard-call session reaches resolution. It writes the decision + context + alternatives + expected outcome + revisit date to a structured file at decisions/YYYY-MM-DD-slug.md and surfaces relevant past decisions when similar ones come up later. Active for every NightShiftOS user always.
version: 0.1.0
---

# Decision Logger

The user makes 200 micro-decisions a week. Most evaporate. The ones that matter at month 6 are usually the ones the user cannot remember making.

Decision-logger captures the non-trivial decisions, the reasoning behind them, and the date to revisit. Six months later, when the same shape of decision comes up, the log shows what the user decided last time and what they learned. This is how working-parent solopreneurs stay coherent across months of fragmented time.

## When this skill triggers

Fire when the user:

- Says "logged"
- Says "let's lock this"
- Says "decided"
- Says "locked"
- Says "log this decision"
- Says "log it"
- Completes a `challenge` (pre-mortem) session
- Completes a `hard-call` session
- Has made a non-trivial decision in the current conversation (climb to paid tool, new hire, price change, channel launch, etc.)

Also fire when:

- The user proposes a decision similar to one logged in the past 90 days (surface the prior decision for context)
- `risk-gauge` flags a move (log the decision either way, override or hold)
- `free-first-checker` documents a climb

## What counts as non-trivial

The skill logs decisions that meet at least one of these criteria:

- Recurring financial impact above $50/mo
- One-time financial impact above $500
- Time commitment over 10 hours
- Reputation or relationship impact (announcing publicly, ending a contract, naming a price)
- Strategic direction (offer change, channel addition, pricing structure)
- Risk above the user's stated cap

Skip:

- Tactical micro-decisions ("should I email this prospect today")
- Tool clicks ("what time should I schedule this post")
- Decisions made within a logged decision's scope (the logged decision already covered it)

When in doubt, ask the user: "Is this worth logging?"

## The log structure

Each decision gets its own file at `decisions/YYYY-MM-DD-<slug>.md`.

```
---
date: YYYY-MM-DD
slug: <kebab-case-slug>
type: <hire | spend | offer | pricing | channel | quit | climb | other>
status: <active | revisited | reversed | superseded>
revisit_date: YYYY-MM-DD
related_decisions: <slug1, slug2>
related_skills: <challenge, hard-call, risk-gauge, free-first-checker>
---

# <Decision Title>

## Decision

<One paragraph. What was decided, in plain language. Include specific numbers and dates.>

## Context

<Why this came up. What state the business was in. What the trigger was.>

## Alternatives considered

- **Option A: <name>** - <one-sentence summary of the option> - <why not>
- **Option B: <name>** - <one-sentence summary> - <why not>
- **Option C: <chosen>** - <one-sentence summary> - <why yes>

## Expected outcome

<What the user expects to happen if this decision is right. Specific signals at 30, 60, 90 days.>

## Kill signal

<What would tell the user this decision was wrong. Specific. Numeric where possible.>

## Reasoning

<The actual reasoning behind the call. Quote the user's own words from the session if available. Include what they were avoiding naming if hard-call surfaced it.>

## What I am avoiding

<Optional. If the decision is being made knowing it conflicts with a stated value or cap, name the conflict. This is the honest-mirror line. Future-self will thank you.>

## Revisit checklist

When this decision is revisited at `revisit_date`, check:

- [ ] Did the expected outcome land?
- [ ] Did the kill signal fire? If so, what was done about it?
- [ ] Did the decision conflict with what I was avoiding? Was that worth it?
- [ ] What did this decision teach me about how I make decisions?

## Tags

<#tag1 #tag2 #tag3 - for cross-referencing similar decisions>
```

## The log sequence

When the skill fires, run these steps.

### Step 1: Confirm the decision

Read back the decision as you understand it. Get the user's confirmation. If the conversation has been long and meandering, the decision they think they made may not match the decision you think they made. Surface the gap before logging.

### Step 2: Check for related past decisions

Search `decisions/` for tags or slugs that match the current decision pattern. If a related decision was made in the past 90 days, surface it:

> "Logged decision from 2026-03-12 was similar pattern (climbed CRM to HubSpot Starter after Google Sheet broke at manual-write cost). Want to reference that decision in this one?"

### Step 3: Fill the template

Walk through the template fields. Most are quick. Two require the most care:

**Expected outcome.** Push for specifics. "It will help with X" is not a logged outcome. "By 30 days, I will have 5 booked calls. By 60 days, 1 closed deal at $X,XXX. By 90 days, repeatable pipeline at 2 booked calls/wk." That is a logged outcome.

**Kill signal.** Push harder. The kill signal is the single most useful field in the log, and the one users most often hand-wave. "If it's not working, I'll stop" is not a kill signal. "If 30 days post-launch I have zero qualified meetings, I pause the channel and revisit" is a kill signal.

### Step 4: Generate the slug

Kebab-case slug from the decision title. Examples:

- "Launch cold email channel v1" leads to `launch-cold-email-channel-v1`
- "Climb CRM to HubSpot Starter" leads to `climb-crm-hubspot-starter`
- "Quit day job at year end" leads to `quit-day-job-year-end`

If a slug exists already, append `-v2` or a date suffix.

### Step 5: Set the revisit date

Default revisit windows:

- Hire decisions: 30 days
- Spend decisions: 30 days (paid ads), 60 days (recurring tool), 90 days (annual commits)
- Offer decisions: 60 days
- Pricing decisions: 30 days (immediate signal) + 90 days (sustained)
- Channel launches: 30 days (kill signal check) + 90 days (commit decision)
- Quit decisions: 30 days post-transition + 90 days + 180 days
- Climb decisions: 30 days (was the climb worth it)

Ask the user if they want a custom revisit date.

### Step 6: Add to the index

Maintain `decisions/INDEX.md` as a chronological list of all decisions with their date, slug, status, and revisit date. Keep entries to one line:

```
2026-05-22 | climb-crm-hubspot-starter | active | revisit 2026-06-22
2026-05-18 | launch-cold-email-channel-v1 | active | revisit 2026-07-15
2026-05-02 | switch-scheduling-to-calcom | active | revisit 2026-06-02
```

### Step 7: Output

Tell the user the file was written and the revisit date is set. Offer to surface the related past decisions if any exist.

```
[decision-logger] Logged to decisions/2026-05-22-climb-crm-hubspot-starter.md
Revisit set: 2026-06-22 (30 days)
Related past decisions: 1 (decisions/2026-04-05-document-mailerlite-free-attempt.md)
```

## Anti-patterns to refuse

### Logging without specifics

If the expected outcome is "I think it will help" or the kill signal is "I'll just see how it goes," refuse to write the log. Push the user to specifics first. Either the decision is worth specifics or it is not worth logging.

### Logging at the user's discomfort

The "What I am avoiding" field is honest but not mandatory. If the user is not ready to name the conflict, leave it blank and continue. Do not force the disclosure.

### Re-logging the same decision

If the user makes the same decision twice (climbs to ConvertKit, then re-climbs to ConvertKit after switching back), append to the existing log file as a "Revision" section. Do not start a new file. The slug stays the same. The lineage matters.

### Lock-in by default

Do not log decisions the user has not made. The trigger is the user saying "logged" or "locked." If the user is exploring, route to `business-coach` or `hard-call`. Logging premature decisions teaches the user that the log is unreliable.

## Stage-aware adjustments

### Pre-Rev Builder

Log fewer decisions. Most pre-revenue decisions are reversible quickly. Focus the log on the irreversible ones: offer choice, ICP commit, brand commit, naming.

### Early Operator

Log more decisions. This is the stage where pattern-recognition pays off. Stack creep starts here, offer drift starts here, family-floor erosion starts here. The log catches these patterns.

For the example coaching business at Early Operator: decisions logged April-May 2026 included MailerLite Free choice (Apr 5), Calendly leads to Cal.com migration (May 2), HubSpot Free leads to Starter climb (May 18), Cold email channel v1 launch (May 18). Each had a revisit date. Each is now part of the user's institutional memory.

### Stable Solo

Log strategic decisions. Tactical decisions can stay informal. Each logged decision should affect the next 90+ days.

### Scaling Solo

Log decisions that involve portfolio thinking. A single decision is rarely the whole story. Use the `related_decisions` field aggressively to link the portfolio.

## Working with other skills

- Imports from: `customize-from-assessment` (stage, values, caps)
- Imports from: `challenge` (after pre-mortem, log the decision and the realistic failure modes)
- Imports from: `hard-call` (after hard-call resolution, log what was decided and what was avoided naming)
- Imports from: `risk-gauge` (after gauge runs, log the decision either way - overruling the gauge or honoring it)
- Imports from: `free-first-checker` (when a climb is justified, log the climb decision)
- Hands off to: `self-improve` (review logs weekly for patterns)
- Hands off to: `weekly-brief` (surface logged decisions due for revisit)

## Output format

When the skill fires, after writing the file:

```
[decision-logger] Logged to: <file path>

DECISION: <title>
TYPE: <hire | spend | offer | pricing | channel | quit | climb | other>
STATUS: active
REVISIT: <date> (in <N> days)

RELATED PAST DECISIONS: <N>
<list if any, one line each>

The log is the receipt. When you revisit, the questions are pre-loaded.
```

## Revisit protocol

When `revisit_date` arrives (typically surfaced by `weekly-brief`), prompt the user:

```
[decision-logger] Revisit due: <decision title>

Was logged: <date>
You expected: <expected outcome>
Kill signal: <kill signal>

Check the boxes:
- Did the expected outcome land?
- Did the kill signal fire?
- What did you learn?

Update status: active | revisited | reversed | superseded
Set next revisit: <new date or 'closed'>
```

The revisit check happens in conversation. Silent log updates teach the user the log is invisible. The user reads back what they decided and either confirms it, adjusts it, or kills it. The log entry is updated with a "Revisit Notes" section appended.

## Edge cases

**Decision changes mid-revisit.** The user revisits a decision and decides to reverse it. Update the original log's `status` to `reversed`, write a new log file for the reversal that links back via `related_decisions`.

**Decision is partially right.** The expected outcome happened but the kill signal also fired. Log the nuance in the revisit notes. The decision is `active` but with adjustments.

**The user wants to delete a log.** Allowed for genuinely sensitive content (a personal health decision, a relationship decision). For business decisions, prefer `superseded` status over deletion. The log is more useful intact than gone.

**Conflicting logged decisions.** Two decisions from different dates that contradict each other (climbed to ConvertKit Apr 1, climbed back to MailerLite Free Aug 1). Both stay logged. The pattern is the lesson.

**Decisions deferred to a trigger.** Sometimes the user logs "decision: defer X until trigger Y fires." That meta-decision is itself a decision. Log it with type `other` and set the revisit to fire when the trigger condition is met (no calendar date). Example: "Defer second offer launch until $10K MRR x 3 months. Revisit when trigger fires."

**Decisions made under pressure.** If the user logs a decision under explicit time pressure (vendor deadline, client ultimatum), note the pressure in the Context section. At revisit, ask whether the pressure was legitimate or manufactured. This is data for next time.

**Decisions logged across multiple sessions.** Sometimes a decision builds across 2-3 sessions before being locked. Log the final decision with citations to the earlier sessions' transcripts or memory entries. The log captures the lock point, not every intermediate state.

## Surfacing past decisions at relevant moments

The skill maintains a tag index across all logged decisions. When a new conversation starts and the user mentions a topic that matches existing tags, surface the relevant past decisions proactively:

```
[decision-logger] Note: 2 past decisions tagged #channel-cold-email.
  - 2026-05-18 launch-cold-email-channel-v1 (active, revisit 2026-07-15)
  - 2026-04-30 paused-cold-email-pilot (closed, killed at kill signal)

Want context from either before we continue?
```

This is the institutional memory in action. The user does not need to remember what they decided 4 months ago. The skill surfaces it when the topic resurfaces.

## The weekly revisit queue

Maintain a queue of decisions whose `revisit_date` falls in the next 7 days. Surface this in `weekly-brief`:

```
DECISIONS DUE FOR REVISIT THIS WEEK
═══════════════════════════════════
2026-06-18: climb-crm-hubspot-starter (30 days)
2026-06-20: aeo-tier1-batch-shipped (30 days)
```

The user works through them during the weekly review. Most take 5 minutes each. Each revisit updates the file's status and either closes the decision or sets the next revisit.

## Additional Resources

### Reference files

- **`references/decision-types.md`** covers taxonomy of decision types with typical revisit windows and required fields per type

### Example files

- **`examples/log-cold-email-launch.md`** covers full logged decision for the the example coaching business cold email channel v1 launch
- **`examples/log-hubspot-climb.md`** covers full logged decision for the HubSpot Free leads to Starter climb
- **`examples/example-decision-index.md`** covers example INDEX.md showing 6 months of logged decisions

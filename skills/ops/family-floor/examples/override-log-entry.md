# Worked Example: Override Log Entry

When the user picks option 2 (override) in a family-floor conflict, the skill hands off to `decision-logger` with this entry format.

## Trigger

A discovery call hard-conflicts with M-F 4:30-8pm floor. User picks override.

## decision-logger entry created

File: `decisions/2026-05-23-override-discovery-call-cary.md`

```markdown
# Override family floor: Discovery call with Alex

**Date:** 2026-05-23
**Block overridden:** M-F 4:30pm to 8pm (family time, no work)
**Window:** Wed 5/27, 4:30pm to 5:15pm PT (45 min inside the floor)
**Tier:** Hard conflict

## Why

Only slot Alex had in the next two weeks. He flies to a conference Friday and is in
back-to-backs through next Thursday. Lose the slot, lose the deal cycle.

## Partner consulted

Yes. Sarah agreed because the kids have soccer Wed at 5:30pm anyway, so the family
floor was a half-floor that day. Sarah is on parent duty for soccer.

## Make-up plan

Saturday 5/30 morning is mine until 11am as normal floor. In addition, no work
Saturday afternoon (additional family time as offset).

## Revenue context (revenue-mapper tag)

$$$: direct revenue. Alex is in stage `clarity_booked` of accelerator funnel.
Deal value if closed: Foundation 90-day at $X,XXX.

## Override pattern check

This is override 3 in trailing 30 days. Pattern flag threshold is 4. One more
override in next 7 days surfaces the pattern.

## Revisit date

2026-06-13 (3 weeks). If override count is still climbing, run `/family-floor` and
sit with the gap.
```

## What this entry models

### Specificity over softness

Every field is concrete. "Wed 5/27, 4:30pm to 5:15pm PT" not "Wednesday afternoon." "Foundation 90-day at $X,XXX" not "a deal." The future-self reading this in 3 weeks needs the facts to evaluate the pattern.

### Partner consultation as field, not narrative

Yes / No / Not applicable. Three values. No room for "kind of" or "I mentioned it." This is the field that hardens partner-shared floors over time.

### Make-up plan as a future commitment

The override is paired with a return-of-floor commitment. Saturday morning is mine plus Saturday afternoon is added family time. Without the make-up plan, the override is a withdrawal with no deposit.

### Revenue context tagged

The revenue-mapper tag ($$$ direct) makes future pattern analysis possible. If the user logs 5 overrides over 3 months and 4 of them are $$ (leverage to revenue) not $$$ (direct revenue), the pattern question is different: "Are you breaking the floor for content that has not yet converted to revenue?"

### Revisit date enforced

3 weeks from the override. The decision-logger surfaces this entry at 2026-06-13 with the question: "What did this override produce? Was it worth the floor break?"

## When the override is partner-owned

If the overridden block is a partner-owned block (date night, anniversary, partner's solo travel), the log entry adds:

```markdown
## Partner-owned block override

THIS BLOCK BELONGS TO: Sarah
THIS BLOCK NAME: Friday date night, 6:30-10pm
PARTNER CONSULTATION: Required (not optional)
PARTNER RESPONSE: <yes / no / requested reschedule>

## Make-up plan for partner

Specific: when does Sarah get this time back?
```

The partner-owned overrides have a separate trailing-90-day count. Two in 90 days surfaces a pattern flag at next `/family-floor` call.

## When the override is Sunday

Sunday overrides require a second sentence beyond the reason. The log entry adds:

```markdown
## Sunday override: second-sentence test

Why this Sunday specifically, not next Sunday or Monday morning instead?
<user's answer, 1-2 sentences>
```

If the user cannot give the second sentence, the override does not log. The skill loops back: "Pick option 1 (move) or 3 (drop). Sunday requires a reason that holds up next week."

## When the user wants to log AND rewrite the floor

If the user says "this is becoming a pattern, I should change the floor," the override log entry adds:

```markdown
## Floor rewrite proposed

OLD: <original CLAUDE.md block>
NEW: <proposed new block>

Sit-with date: 7 days from now.
```

The skill does NOT rewrite the floor immediately. It pauses 7 days. If the user confirms after 7 days, the floor changes in CLAUDE.md. If the user does not confirm, the original floor holds. This prevents floor erosion-by-frustration.

## What the override log enables downstream

- `weekly-brief` can read the trailing-7-day override count.
- `ship-it-friday` can surface it in the Friday close-out.
- `business-coach` can reference it when challenging stuck loops.
- `risk-gauge` can use the pattern when evaluating new commitments (hire, contract, new offer) that would create more override pressure.
- The user can run `/family-floor` anytime and see the pattern.

The override log is not a punishment ledger. It is the only honest record of what the user is trading the floor for.

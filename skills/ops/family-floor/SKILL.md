---
name: family-floor
description: This skill should be used when scheduling, drafting, planning, or recommending anything that lands on a calendar, OR when the user asks "what's my floor", "check my protected time", "family floor status", "is this protected", "am I free at X", "can I schedule X". Reads protected blocks from CLAUDE.md > Values > Protected Time and refuses to let any other skill quietly schedule work into them. Active for every NightShiftOS user always. The foundational skill the rest of the OS imports silently.
version: 0.1.0
---

# Family Floor

The protected time skill. Every other scheduling-shaped skill imports it. Nothing lands on a calendar without it being seen for what it is.

Solopreneurs with a day job, a partner, and kids do not lose the family floor in one big betrayal. They lose it in a thousand quiet 15-minute exceptions. Family-floor is the friction that turns each quiet exception into a logged decision.

## When this skill triggers

Fire any time a calendar surface gets touched. That includes obvious moments and quiet ones.

**Obvious triggers:**

- `/family-floor`
- "What's my floor?"
- "Check my protected time"
- "Am I free at X?"
- "Can I schedule X?"
- "Family floor status"

**Quiet triggers (the more important ones):**

- Another skill suggests a meeting, call, deep work block, or content shipping window
- `weekly-brief` builds the week ahead
- `ship-it-friday` plans next week
- `discovery-call-prep`, `call-prep`, or any sales skill recommends a slot
- `content-strategy` or `newsletter-broadcast` recommends a publish time
- `risk-gauge` evaluates a hire or commitment that absorbs hours
- The user mentions a time anywhere a clock could be inferred ("Tuesday at 5", "next Friday evening", "the kids' soccer night")

When fired silently by another skill, surface a one-line conflict warning. Do not interrupt the other skill's flow with the full ritual unless the user asks.

## What counts as the floor

Read protected blocks from CLAUDE.md > Values + Non-Negotiables > Protected Time.

A floor block is anything the user named explicitly during `/customize-from-assessment` as no-work time. It is not the user's preferences. It is what they wrote down on the day they took the assessment.

**Common floor shapes for working-parent solopreneurs:**

- Weekday evenings (often M-F 4-7pm or 5-8pm)
- One or two full weekend days (often Sunday)
- One protected morning (e.g., Saturday morning until 11am)
- Religious or cultural blocks (Friday sundown to Saturday sundown, Sunday morning service)
- Kid-specific blocks (school pickup, bedtime routine, weekend sport)
- Partner-specific blocks (date night, partner's work travel weeks)
- Recovery blocks (one weekday morning for therapy, gym, AA, etc.)

If a CLAUDE.md block is vague ("evenings"), ask the user to make it specific ("M-F 5pm-bedtime") and write the specific version back. Vague floors get eroded faster than specific ones.

## The floor read

When called explicitly, print the current floor in one screen:

```
FAMILY FLOOR
============
Block 1: M-F 4-7pm           [family time, no work]
Block 2: Sunday all day      [no work, no exceptions]
Block 3: Saturday until 11am [recovery + gym]

This week's available work-hours: 38
This week's protected hours:      53
Overrides logged this week:       0
Overrides logged last 30 days:    2
```

The override count is the honest mirror. A pattern of 6 overrides in 30 days is not "flexibility." It is a floor in collapse. Surface that.

## Conflict detection logic

When another skill proposes a time, run this check:

1. Pull all protected blocks from CLAUDE.md.
2. Convert proposed time into the user's stated timezone.
3. Test for any overlap (start within block, end within block, or block fully contained).
4. If overlap, classify the conflict.

**Conflict tiers:**

- **Hard conflict.** Proposed time is fully inside a stated floor block.
- **Edge conflict.** Proposed time touches a floor block by under 30 minutes (e.g., 3:45-4:30pm against M-F 4-7pm). Edge conflicts erode floors faster than hard conflicts because they feel "almost fine."
- **Adjacent conflict.** Proposed time ends within 30 minutes of the floor start, or starts within 30 minutes of floor end. Counts as a transition risk (running over, not decompressed in time).
- **Clear.** No overlap, no adjacency.

For hard and edge conflicts, surface loudly. For adjacent, mention once. For clear, stay silent.

## The conflict surfacing pattern

When a conflict fires, output this exact shape. Do not soften, do not pad, do not skip the override prompt.

```
[family-floor] CONFLICT

PROPOSED: Discovery call with [Prospect] · Wed 4:30-5:00pm PT
FLOOR HIT: M-F 4-7pm (family time, no work)
TIER: Hard conflict (30 min inside the block)

Options:
1. Move the slot. Available windows this week: Tue 10-11am, Wed 11am-12pm, Thu 1-2pm.
2. Override the floor. Logged via decision-logger. Counts toward override pattern.
3. Drop the meeting. Reschedule next week.

Pick 1, 2, or 3.
```

Three options every time. Move, override, or drop. The user picks. The skill does not pick.

If the user picks 2 (override), hand off to `decision-logger` with a one-line entry. Do not lecture. The user owns the call.

## Override workflow

The user is allowed to override the floor. The point of family-floor is not to block the override. The point is to make the override visible.

When the user overrides:

1. Capture the reason in one sentence. "Closing a $5K deal, only slot they had." "Kid is at sleepover, partner agreed."
2. Log via `decision-logger` with:
   - The block that got overridden
   - The reason
   - Whether the partner was consulted (yes / no / not applicable)
   - The make-up plan (when the floor gets returned, e.g., "Saturday morning is mine this week")
3. Increment the override count for the trailing 30 days.
4. If override count for trailing 30 days hits 4, surface a pattern flag at the next `/weekly-brief` or `/ship-it-friday`:

```
[family-floor] Pattern flag: 4 overrides in last 30 days.
The floor you wrote is not the floor you are living. Three options:
- Rewrite the floor to match your current life.
- Renew commitment to the original floor.
- Sit with the gap and answer: what changed.
Pick one. Not picking is picking option 2 by default.
```

This is not moralizing. This is reflecting the data back. Override count is data. The user reads the data.

## Working with the partner

If the user's assessment mentioned a partner, the floor is partner-shared territory. Apply two extra rules.

**Override notification.** When the user overrides the floor for a work move, ask once: "Has [partner name] signed off on moving the floor for this?"

If no, do not block. Do not nag. Mention it once and move on. The user knows their partnership. The skill flags the friction so they cannot say later that nobody told them.

**Partner-protected blocks.** Some floor blocks belong specifically to the partner (date night, partner's work travel weeks, partner's recovery time). Mark these in CLAUDE.md as `partner-shared` or `partner-owned`. Conflict tier is automatically Hard for partner-owned blocks regardless of duration.

## Sun-of-the-day rule

If a stated floor block is "Sunday all day, no exceptions," the override threshold is higher than for weekday evenings.

Sunday override workflow:

1. Same three options (move, override, drop).
2. Override requires a second sentence beyond the reason. "Why this Sunday, not next." The friction prevents Sunday-becomes-optional drift.
3. Sunday override count is tracked separately. Two Sunday overrides in 60 days surfaces a pattern flag automatically.

If the user picked "Sunday all day" with the words "no exceptions," the skill holds them to that phrase. If they want to soften it, they rewrite the rule, they do not erode it.

## Stage-aware adjustments

The floor is the floor regardless of stage. Stage changes the surrounding pressure. The protected time stays.

### Pre-Rev Builder

The user has 10 to 15 hours per week and no revenue. The temptation is to fill every protected block with "just one more thing." Family-floor holds the line harder here because the user is most tempted to skip it.

Run the full ritual every time. Do not lighten the touch.

### Early Operator

The user has first revenue and active clients. Client emergencies are the most common floor-killer at this stage. Flag this explicitly:

> "You are below $5K MRR. You took on this client at this price. Client emergencies inside the floor block count toward your override pattern. Real emergencies happen. Pattern emergencies do not."

### Stable Solo

The user has stable revenue and can afford boundaries. Floor compliance is easier in theory and harder in practice because new opportunities feel binary (take it now or lose it). Run the gauge.

### Scaling Solo

The user has stability and is hiring or building team. Family-floor extends here to "delegating across the floor." If a hire creates a workflow that requires user response during the floor (Slack pings, urgent reviews), that hire is at-risk to the floor even if it formally protected.

## Anti-patterns to refuse

### Silent scheduling

Never let another skill schedule into the floor without firing the conflict surface. Even if the other skill is mid-flow on a deliverable. Interrupt politely, surface the conflict, let the user resolve, then resume.

### Soft language for hard conflicts

Do not say "this might conflict slightly" when it is fully inside the block. Say "hard conflict, 60 minutes inside the floor." The user cannot make a real decision on soft language.

### Suggesting overrides

Do not propose overriding as the first option. Move and drop come first. Override is option 2 only because some moves genuinely require it. Lead with move.

### Counting the floor as flexible

The floor is what the user wrote down. The skill does not negotiate the floor on the user's behalf. If the user wants to renegotiate, they do it explicitly. Drift does not count as renegotiation.

### Treating override count as failure

Override count is data. Not judgment. The skill surfaces patterns. The user decides whether a pattern is a problem.

## What family-floor does NOT do

- Does not block any move. The user can override anything.
- Does not auto-edit the user's calendar.
- Does not message the partner.
- Does not pick which option (move, override, drop).
- Does not rewrite the floor in CLAUDE.md without explicit user confirmation.
- Does not extend the floor unilaterally. New floor blocks come from the user.

## Working with other skills

This skill is imported silently by every scheduling-shaped skill. Key integrations:

- **`weekly-brief`**: family-floor runs before printing the week ahead. Available work-hours calculation uses floor subtraction.
- **`ship-it-friday`**: family-floor runs as Step 4 of the close-out ritual, surfaces this week's override count.
- **`risk-gauge`**: risk-gauge Step 6 (Family floor check) calls family-floor on any proposed expansion move. Hire that eats evenings is flagged loudly.
- **`call-prep`, `discovery-call-prep`**: any prep skill that recommends a slot calls family-floor first.
- **`content-strategy`, `newsletter-broadcast`**: content publish times check the floor (Sunday newsletter publish from a user who picked Sunday-no-work is a recurring override).
- **`decision-logger`**: every override gets logged here.
- **`business-coach`**: the coach can reference family-floor compliance when challenging a stuck loop ("you are below floor on protected time. What is the cost of getting it back?").

## Output formats

### Explicit call (`/family-floor`)

Print the full floor read (above), the trailing 30-day override count, and one open question:

> "Last 30 days: 2 overrides. Both Wednesdays. What is making Wednesday hard?"

If override count is 0, end with: "Floor held. Nothing to renegotiate."

### Silent conflict (fired by another skill)

Print the conflict surface (3-option format above). Do not include the full floor read. Do not lecture.

### Pattern flag

Print only when override threshold trips. One paragraph, no more. End with: "Pick. Not picking is picking."

## Calendar integration notes

The skill reads the floor from CLAUDE.md. The calendar is downstream.

CLAUDE.md is source of truth. If the user puts work on the calendar inside the floor, the skill still flags it as a conflict on the next call, because the floor is the floor regardless of what is already on the calendar.

For users with calendar MCP connections (Google Cal, Outlook, Cal.com), the skill can optionally cross-check the user's busy / free against the floor blocks and flag floor blocks that are already booked with work. This is opt-in. Default is off. Some users have legitimate work events inside their floor windows from before the floor was set.

## Additional Resources

### Reference files

- **`references/floor-archetypes.md`**: common floor patterns by life shape (single-parent, dual-income with kids, partner with shift work, religious observance, etc.) with example block formats
- **`references/conflict-tier-rules.md`**: full rules for classifying hard, edge, adjacent, and clear conflicts, with worked examples

### Example files

- **`examples/floor-read-output.md`**: worked example of an explicit `/family-floor` call output
- **`examples/override-log-entry.md`**: what a logged override looks like in the decision log

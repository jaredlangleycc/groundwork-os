---
name: ship-it-friday
description: This skill should be used when the user asks to "ship it friday", "close out the week", "friday wrap up", "end of week", "week recap", "friday close", or when the calendar hits Friday afternoon. Orchestrates the weekly close-out ritual: logs the week's decisions, runs file-sweep, recaps what shipped, queues next week's revenue-mapped priorities, checks family-floor compliance, and triggers monthly variants (finance-log on last Friday, crm-hygiene on first Friday). Output: friday-close-YYYY-WW.md. Active for every NightShiftOS user from week 2.
version: 0.1.0
---

# Ship It Friday

The weekly close-out ritual. The handoff between this week and next.

Solopreneurs without a Friday close-out lose the compounding effect of weekly rhythm. The week ends in drift. Monday starts in fog. Ship-it-friday is the ritual that turns Friday into a real handoff so Monday opens in a queue.

This skill does not produce new work. It calls four other skills in sequence and ties their output into a single close-out log.

## When this skill triggers

- `/ship-it-friday`
- `/friday-close`
- `/friday-wrap-up`
- `/close-out-the-week`
- `/end-of-week`
- `/week-recap`
- "Ship it Friday"
- "Close out the week"
- "Friday wrap up"
- Optional cron: scheduled task on Friday 5pm local (user opts in via CLAUDE.md)

## The orchestration

Run these in order. Each step delegates to a dedicated skill. Capture each step's output into the final log.

### Step 1: Decision-logger (this week's decisions)

Call `decision-logger` to surface all decisions logged in the last 7 days. The skill returns a list of:

- Decision title
- Decision date
- One-line summary
- Revisit date (if set)

The user reviews. The user can add a decision they did not log mid-week ("I decided not to take the Acme deal, log it now"). The skill writes any new entries.

Output to capture for the close-out log:

```
## Decisions logged this week

- 2026-05-19: Override family floor for Alex discovery call
- 2026-05-20: Kill Blotato subscription (cancel May 29)
- 2026-05-21: Ship Trust the Process essay Sun May 24
- 2026-05-23 (new): Pass on Acme partnership (timing not right)
```

### Step 2: File-sweep

Call `file-sweep`. The skill runs the six-task weekly sweep and returns a short summary.

Capture summary for the close-out log:

```
## File sweep

- Inbox files sorted: 7
- Stale drafts flagged: 4
- Backups rotated: 3 days → cold archive
- Loose root files surfaced: 1
- Cloud sync: 2 uploads

Log: reports/file-sweep-2026-W21.md
```

Do not re-print the full file-sweep log here. The link suffices.

### Step 3: Week recap (what shipped, what did not)

Manually summarize this week's ship list. The user provides:

- Content shipped (essays, social posts, newsletter, video)
- Sales activity (calls held, proposals sent, deals won, deals lost)
- Client work delivered
- Operational moves (system changes, infrastructure, integrations)

If the user does not provide manually, ask:

```
What shipped this week? Drop a short list. Format:
- [type] title (one-line context if needed)

Skip anything that did not ship.
```

Capture in the log:

```
## What shipped this week

Content:
- [essay] Trust the Process (1352 words, Presence pillar, queued for Sun May 24)
- [Threads] 5-post chain on discernment (Mon May 19)
- [LinkedIn co] Carousel on quiet leadership (Thu May 22)

Sales:
- [call] Alex clarity-session (Fri May 22 3pm PT)
- [outbound] 30 ICP contacts uploaded to HubSpot
- [follow-up] 4 stale prospects nudged

Client delivery:
- [session] Drew session 4
- [resource] Alex battle card (private slug deployed)

Ops:
- [build] HubSpot Phase 4 worker shipped
- [build] iMessage daily brief delivery
```

### Step 4: Family-floor compliance

Call `family-floor`. The skill returns the trailing-7-day override count plus the trailing-30-day count.

Capture in the log:

```
## Family floor

This week:
  Overrides logged: 1 (Wed 4:30-5:15pm, Alex call)
  Partner consulted: yes
  Make-up plan: Saturday morning floor extended

Last 30 days:
  Overrides logged: 3
  Sunday overrides: 0
  Pattern flag: no (threshold is 4)
```

If a pattern flag has tripped, surface it loudly in the close-out summary section.

### Step 5: Revenue-mapper on next week's plan

Call `revenue-mapper` on the user's next-week plan. The user provides 5-10 tasks or blocks. Skill tags each $$$, $$, $, distraction. Computes the mix.

The skill DOES NOT skip this step. If the user has not yet planned next week, the close-out is incomplete; ask the user for the plan before continuing.

Capture in the log:

```
## Next week plan (revenue-mapped)

- Mon: 3 outbound emails to FLM ICPs                       [$$]
- Mon: HubSpot stage hygiene fix (5 misfires from this week) [$]
- Tue: Alex follow-up (proposal or warm rejection)         [$$$]
- Wed: Ship Trust the Process newsletter broadcast         [$$]
- Wed: 2 cold calls (Mara, James prep + call)              [$$$]
- Thu: Newsletter content for next week (Sunday spine)     [$$]
- Thu: Sam session 5                                      [$$$]
- Fri: Ship it Friday (this ritual)                        [$]
- Sat: rest                                                [floor]
- Sun: family + newsletter ship                            [floor + $$]

Mix: $$$ 35% · $$ 35% · $ 20% · distraction 10%
Floor ($$$ + $$): 70%  ✓ above 65% (Early Operator floor)
```

### Step 6: Monthly variants

If today is the **last Friday of the month**, call `finance-log` for the full monthly check. Capture summary in the log.

If today is the **first Friday of the month**, call `crm-hygiene` for the full hygiene scan. Capture summary in the log.

If both apply (some months last Friday = first Friday of next month is unusual but happens at fiscal-quarter edges), run finance-log this week and crm-hygiene next week.

If neither applies, skip Step 6.

### Step 7: The closing reflection

End with one open question tied to the largest gap surfaced across all steps.

Default question logic:

- If revenue mix is below floor: "Next week's $$$ is 25%. What is the activity below the line you would not do, and what would you do instead?"
- If family-floor pattern flag tripped: "Pattern in overrides. What changed in your life that the floor has not caught up to?"
- If stale drafts are piling up (4+ over 14 days): "The drafts are not the bottleneck. What is?"
- If a decision is overdue (revisit date passed in prior week): "[Decision title] is overdue. Pick one: revisit, mark done, or kill."
- If pipeline is shrinking 2 weeks running: "What is the prospect you have been letting cool because you do not want the answer?"
- If none of the above: "What is the one thing that, if it shipped next week, would make this week feel worth the floor breaks?"

Do not stack questions. One. The user sits with it through the weekend.

## The close-out log

Write the captured output to `reports/friday-close-YYYY-WW.md` with this structure:

```markdown
# Ship It Friday: Week WW (YYYY-MM-DD)

## Decisions logged this week
[from Step 1]

## File sweep
[from Step 2, summary only]

## What shipped this week
[from Step 3]

## Family floor
[from Step 4]

## Next week plan (revenue-mapped)
[from Step 5]

## Monthly check (if applicable)
[from Step 6]

## The closing reflection
[from Step 7, one question]

---

Next ship-it-friday: <date 7 days from now>
```

## Output to the user

The full log goes to disk. The output to the user in chat is shorter: the closing reflection, the headline numbers, and a link to the full log.

```
SHIP IT FRIDAY: Week 21 (2026-05-23)

Decisions logged: 4 this week (3 mid-week, 1 just now)
Files sorted: 7 (1 ambiguous, see report)
Floor: 1 override, no pattern flag
Next week mix: 70% above floor ✓
Pipeline: 8 stale deals (saved for Monday sprint)

Last Friday of month: finance-log ran. Recurring burn $57/mo
(post-Blotato). 3 clients, 80% concentration. Alex clarity-session
held today, follow-up Tue.

Log: reports/friday-close-2026-W21.md

THE QUESTION
  Of the 8 stale deals, which would you take if it closed next week?
  Restart that one Monday. Move the others to lost / qualified_out.
```

## Stage-aware adjustments

### Pre-Rev Builder

Steps 1, 2, 4, 5 run normally. Step 3 (what shipped) often returns short lists. Step 7's closing question shifts to first-dollar focus:

> "What was the smallest revenue test you ran this week? What would the smallest one be next week?"

Step 6 (monthly variants) usually returns "no revenue this month" for finance-log; the skill notes this and asks about burn instead.

### Early Operator

Most common stage for ship-it-friday adoption. All seven steps run weekly. Monthly variants land as expected.

### Stable Solo

Same seven steps. Step 5 (revenue-mapper) often shows higher $$$ but lower $$; the skill's closing question shifts toward leverage activities.

### Scaling Solo

Steps 1-7 run normally. Step 3 (what shipped) becomes longer; consider summarizing by category instead of line item. Step 7's closing question shifts toward delegation:

> "What did you ship this week that someone else could have shipped? What is the cost of you owning it next week?"

## Anti-patterns to refuse

### Running on a non-Friday silently

If the user invokes `/ship-it-friday` on a Wednesday, ask once: "Today is not Friday. Run anyway?" If yes, proceed. If no, suggest `/weekly-brief` or `/daily-brief`.

### Skipping the revenue-mapper step

Step 5 is the most important step. Without it, the close-out collapses into a review. The handoff to next week disappears. Never skip even if the user "already planned the week elsewhere." Run revenue-mapper on whatever plan they have; the tagging is the value.

### Skipping the family-floor step

Family-floor is the foundational principle. Skipping the override count erases the only weekly visibility on floor compliance.

### Fabricating ship list

If the user does not provide "what shipped" and the skill cannot infer from CRM / file activity / content drafts, leave the section blank with `[no manual input: skipped]`. Do not invent.

### Running multiple times in one Friday

If the user runs `/ship-it-friday` twice on the same day, do not re-run all seven steps. Show the existing log, ask: "Already ran today. Want to add a late decision or update the next-week plan?"

### Padding the close-out

Single screen of chat output. Full log on disk. Do not duplicate the log into chat. Do not summarize at length when one question will do.

## Working with other skills

The ritual is itself a composition. The relationships:

- **`decision-logger`**: called as Step 1. Surfaces the week's decisions, accepts new ones.
- **`file-sweep`**: called as Step 2. Returns short summary; full log is the file-sweep's own output.
- **`family-floor`**: called as Step 4. Returns override count + pattern flag status.
- **`revenue-mapper`**: called as Step 5. Tags the next-week plan, computes the mix, flags floor compliance.
- **`finance-log`**: called as Step 6 if last Friday of month. Full monthly ritual.
- **`crm-hygiene`**: called as Step 6 if first Friday of month. Full hygiene scan.
- **`weekly-brief`**: distinct skill, runs Monday morning to open the week. Ship-it-friday closes the week; weekly-brief opens it. Do not duplicate functions.
- **`business-coach`**: coach posture wraps the close-out's closing reflection. If the user wants to talk through the closing question, hand off to business-coach.
- **`risk-gauge`**: if the user proposes a new commitment as part of next-week's plan, risk-gauge fires inline.

## What ship-it-friday does NOT do

- Does not produce new content.
- Does not draft outreach.
- Does not auto-edit any record.
- Does not commit to next-week's plan on the user's behalf.
- Does not skip a step. The ritual is the value.
- Does not run on Sunday (no work, family floor).
- Does not produce more than one log per Friday.

## The cadence rule

Ship-it-friday is a Friday ritual. Not Thursday. Not Saturday morning. The day matters because the next-week plan needs to be visible BEFORE the weekend so the Sunday brain can pre-process it without doing the work.

If the user is unavailable on Friday (travel, sick, family emergency), the skill can run Saturday morning ONLY if the user did not break floor to get there. The skill surfaces: "Running Saturday because Friday was missed. Floor-respecting?"

## Why this ritual exists

Solopreneurs with a day job have 10 to 15 hours per week for the business. That budget gets eaten three ways:

1. **Friction.** Looking for files, remembering what shipped, recovering context. Friction compounds across weeks if the close-out is missing.
2. **Drift.** Decisions made mid-week but never recorded. Pipeline movement noticed once and forgotten. The drift class of bug is invisible until it produces a wrong decision two months later.
3. **No handoff.** Monday opens the week without a queue. The first hour goes to inbox triage and "where was I." That first hour is the most expensive hour of the week because it sets the rhythm.

Ship-it-friday closes friction and drift through Steps 1 to 4. It builds the Monday handoff through Step 5. Step 6 catches monthly patterns that weekly rhythm cannot detect. Step 7 carries the friction of one open question into the weekend so the user does not lose the weekend AND the question.

Without the ritual, solopreneurs work harder for less effect. The ritual itself takes 30 to 60 minutes. It returns 3 to 5 hours per week through reduced friction on Monday and Tuesday.

## What ship-it-friday surfaces over time

Single-week briefs are useful. Multi-week patterns are the real value.

After 4 weeks, the skill can detect:

- Override count trend (climbing, flat, falling)
- Stale draft accumulation rate (one new stale per week is a content cadence problem)
- Pipeline volatility (deal count swinging week-over-week without close activity)
- Revenue mix drift (the $$$ ratio falling slowly as the user gravitates to $$ work)

After 8 weeks, the skill can detect:

- Quarter-on-quarter pattern (is this quarter actually different from last)
- Pricing test signals (X at-bats at the new price, Y conversion)
- Subscription drift (recurring cost climbing slowly past stated cap)
- Family-floor pattern history (Sunday overrides clustering around certain client cycles)

The close-out log is the only mechanism that produces this multi-week visibility. Without it, each week is a one-shot decision.

## Principles the ritual enforces

### Family-floor first

Step 4 runs before Step 5 deliberately. The user sees this week's overrides BEFORE they plan next week. Planning while staring at the override count produces different plans than planning in the abstract.

### Free-first

Step 6 (monthly variants) surfaces stale subscriptions and stack drift. The user sees the gap between stated cap and current spend before they propose a new paid tool next week.

### Revenue-mapped

Step 5 is the central step. Every task next week gets a tag. The mix gets computed. The floor compliance gets surfaced. The user cannot leave the close-out without seeing the revenue math on next week.

### Risk-gauged

If next week's plan includes a new commitment (hire, paid ads, new offer), risk-gauge fires inline within Step 5. The user does not get to plan a $500 paid commit without the gauge running.

### Coach, not consultant

Step 7's closing question is open. The skill does not recommend an answer. The user sits with the question through the weekend.

### Boring stack ladder

The ritual itself uses no new tools. Decision-logger, file-sweep, family-floor, revenue-mapper, finance-log, crm-hygiene are all existing skills. Ship-it-friday is an orchestration layer over the boring stack.

## Edge cases

### First-run (Week 1 of using ship-it-friday)

The skill has no prior decision-logger entries, no prior file-sweep log, no prior next-week plan. Run the seven steps starting from "today" as the baseline. The closing reflection is calibration:

> "First close-out. The mix and overrides logged today are the starting line. Week 22 we compare."

### User has been gone for 4+ weeks

The skill has not run for a month. Surface this:

```
Last close-out was 32 days ago.

Recovery options:
1. Run a catch-up close-out now (this ritual, scoped to 4 weeks).
2. Reset: close out this week only, ignore the gap.
3. Skip this week, schedule for next Friday to reestablish rhythm.

Pick one.
```

The skill does not auto-pick. The user owns the recovery.

### Holiday Friday

If today is a holiday (in the user's location), ask: "Holiday today. Reschedule to Monday morning, or run now?" Some users prefer to close out the week even on a holiday; some defer.

### Mid-quarter pivot

If the user has had a major change this week (pivot, new offer, role change), the close-out ritual still runs but Step 7's closing question shifts to: "What did the pivot make obvious that was true last week too?"

## Optional: scheduled task

Users can opt in via CLAUDE.md > Skills > ship-it-friday > schedule = "Friday 17:00 local".

When scheduled:

1. Skill fires at the scheduled time.
2. Steps 1, 2, 4 run automatically (decision-logger, file-sweep, family-floor are non-interactive in summary mode).
3. Steps 3, 5, 7 require user input. The skill writes a prompt to the user and waits.
4. Step 6 (monthly variants) runs automatically if applicable.
5. The full log lands on disk by Monday morning even if the user does not respond on Friday.

Scheduled mode trades user interactivity for reliability. Some users prefer the manual ritual because the friction is the value.

## Closing reflection bank

By gap surfaced, default questions:

| Gap | Question |
|---|---|
| $$$ below 25% | "What is the activity below the line you would not do, and what would you do instead?" |
| Floor pattern flag | "What changed in your life that the floor has not caught up to?" |
| 4+ stale drafts | "The drafts are not the bottleneck. What is?" |
| Pipeline shrinking 2+ weeks | "What is the prospect you have been letting cool because you do not want the answer?" |
| Stage misfires unresolved | "Of the won-no-income deals, which one is real and which is the lie you are telling the CRM?" |
| 0 sales activity this week | "What did selling cost you this week that the other work did not?" |
| Strong week, no gaps | "What is the one thing that, if it shipped next week, would make this week feel worth the floor breaks?" |
| Cap close to limit (finance) | "Where is the $50 of stack drift you can cut, and where is the $50 of paid leverage you have not tried?" |

The bank exists so the skill is not asking the same question every Friday. Variety prevents the ritual from becoming rote.

## Additional Resources

### Reference files

- **`references/orchestration-flow.md`**: the seven-step flow in detail, including how each step handles missing data, recovery, and skipping conditions
- **`references/closing-question-bank.md`**: 30+ questions organized by surfaced gap, with rationale for each and when NOT to ask it

### Example files

- **`examples/friday-close-output.md`**: worked example of a full close-out log for an Early Operator (the example coaching business pattern) including a last-Friday-of-month variant

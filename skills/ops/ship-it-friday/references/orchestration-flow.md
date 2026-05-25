# Orchestration Flow

The seven steps in detail. How each step handles missing data, what to do when a skill is unavailable, when to skip and when to halt.

## Step 1: Decision-logger pull

### Default flow

1. Read `decisions/` folder for entries with date in the last 7 days.
2. Group by day.
3. Print a list with title, date, one-line summary.
4. Ask user: "Any decisions you made this week that did not get logged?"
5. If user provides new entries, write them via decision-logger.

### When decisions/ does not exist

The user has not used decision-logger yet. Surface:

```
decision-logger has no entries. Two paths:
1. Skip this step today. Start logging mid-week starting next week.
2. Backfill 1-3 decisions from this week now. Quick form.

Pick.
```

If they pick 2, capture the decisions via a 3-question form per decision (decision, why, revisit date).

### Common decisions to surface

- Stage changes in CRM (won, lost, qualified-out)
- Subscription kills
- Family floor overrides
- Strategic pivots
- "Said no to X" moments (these never get logged otherwise)

## Step 2: File-sweep delegate

### Default flow

Call `file-sweep` with no special flags. The sweep runs all six tasks. Return the summary section to ship-it-friday.

### When file-sweep fails

If a task within file-sweep fails (e.g., backup rotation hits a permissions error), file-sweep logs the failure and returns the partial summary. Ship-it-friday includes a one-line note:

```
File sweep: 5 of 6 tasks complete. Backup rotation failed (permission error).
See full log for details.
```

The user fixes the permission issue offline; the close-out continues.

### When file-sweep would run inside family floor

If the current time is inside a floor block, family-floor fires a conflict. Ship-it-friday offers: "File sweep can wait. Continue with remaining steps and file-sweep on Saturday morning?"

Default behavior: run file-sweep now if outside floor; defer to next available non-floor time if inside.

## Step 3: Week recap

### Default flow

Ask: "What shipped this week? Drop a short list."

The user lists 3-15 items. The skill captures them.

### Inferring from data

If the user wants minimal input, the skill can infer some items:

- New decision-logger entries (Step 1 output)
- Cal.com bookings held this week (via Cal MCP if connected)
- CRM stage transitions (HubSpot or Sheet)
- Files in `content/` modified this week (via file-sweep activity)
- Newsletter sends this week (MailerLite MCP if connected)

Inferred items get a `[auto-detected]` tag in the log so the user can confirm or correct.

### What gets recapped (categories)

- Content shipped (essays, social, video, newsletter)
- Sales activity (calls, proposals, decisions)
- Client delivery (sessions, resources, milestones)
- Operational moves (system changes, integrations, automations)
- Personal / family (only if the user opts in, otherwise skip)

### When nothing shipped

If the user lists zero items, do not pad. Capture in the log:

```
## What shipped this week
Nothing shipped publicly. The week was internal (planning / cleanup / recovery).
```

Then Step 7's closing question shifts to: "What was the internal work that did not produce a public ship, and was it worth the protected time it cost?"

## Step 4: Family-floor compliance pull

### Default flow

Call `family-floor`. The skill returns:

- This week's override count (trailing 7 days)
- Last 30 days' override count
- Sunday override count (trailing 60 days)
- Date night override count (if partner-owned blocks exist)
- Pattern flag status (yes / no)

Capture all five in the log.

### When pattern flag has tripped

If pattern flag is yes, surface loudly. The closing reflection (Step 7) defaults to the family-floor question:

> "Pattern in overrides. What changed in your life that the floor has not caught up to?"

This overrides other gap-driven questions.

### When the floor has not been updated since assessment

If the user has not updated CLAUDE.md > Values > Protected Time in 90+ days, prompt once:

```
Family floor was last updated 124 days ago. Confirm still accurate
or update before the next sweep.
```

Do not block the close-out. Surface the prompt and continue.

## Step 5: Revenue-mapper on next week

### Default flow

Ask: "Drop next week's plan, 5-10 items. Include calls, content blocks, deep work, deliveries."

The user provides the list. Call `revenue-mapper`. Skill tags each item. Skill computes the mix. Skill returns the floor compliance check.

Capture all three in the log:

- The plan with tags
- The mix (percentages)
- The floor compliance flag

### When user has not planned next week

If the user says "I have not planned yet," prompt:

```
Three options:
1. Plan now (10 minutes). Drop 5-10 items.
2. Pull from open prospects / next-action queue (skill suggests based on CRM).
3. Defer to Monday morning's weekly-brief.

Pick.
```

If they pick 3, capture in the log:

```
## Next week plan
Deferred to Monday weekly-brief.
```

The close-out continues but the floor compliance check is skipped.

### When the plan is below floor

The revenue-mapper output already includes the floor warning. Ship-it-friday includes the warning in the close-out summary:

```
Mix: $$$ 25% · $$ 30% · $ 20% · distraction 25%
Floor: 55% (below Early Operator floor of 65%)

flag: Below floor. Step 7 will revisit.
```

The closing reflection (Step 7) defaults to the floor-low question.

### When the plan is heavily $$$ (>50%)

A heavy $$$ week is unusual and is sometimes the "feast-then-famine" pattern (delivering on current revenue, ignoring leverage). The skill surfaces:

```
Mix: $$$ 55% · $$ 10% · $ 20% · distraction 15%
Note: $$$ is high, $$ is low. Feast-then-famine pattern. Sustainable
this week, but at this $$ rate, what is the pipeline 6 weeks out?
```

## Step 6: Monthly variants

### Last Friday detection

Compute: "Is today the last Friday of the calendar month?"

Algorithm:

1. Today's day of week is Friday.
2. Today + 7 days is in the next calendar month.

If both true, today is the last Friday. Run finance-log monthly variant.

### First Friday detection

1. Today's day of week is Friday.
2. Today's day-of-month is between 1 and 7 inclusive.

If both true, today is the first Friday. Run crm-hygiene full scan.

### Both apply simultaneously

Rare but possible at fiscal-quarter edges. Default: run finance-log this week, run crm-hygiene next week (alternate). User can override.

### Quarter-end detection

Additional check: if today is the last Friday of a quarter-ending month (Mar, Jun, Sep, Dec), surface quarter-level questions in the closing reflection:

> "Quarter close. What was the bet you made 12 weeks ago, and what did it return?"

### Year-end detection

Additional check: if today is the last Friday of December, surface year-level questions:

> "Year close. What pattern from this year did you not see clearly until the end? What is the first move for that pattern in January?"

## Step 7: Closing reflection

### Gap detection algorithm

After Steps 1-6 complete, scan the captured outputs for gaps:

1. **$$$ floor breach** → revenue-mapper output shows below-floor mix
2. **Family-floor pattern flag** → family-floor returned pattern flag = yes
3. **Stale drafts piling** → file-sweep returned 4+ stale drafts
4. **Pipeline shrinking** → if weekly-brief data is available, compare to previous 2 weeks
5. **Stage misfires** → if crm-hygiene ran (first Friday), check for unresolved misfires
6. **Zero sales activity** → week recap returned no calls / no outreach / no proposals
7. **Strong week** → no gaps detected (this is also a state to acknowledge)

Pick the highest-priority gap. Use `references/closing-question-bank.md` for the matching question.

### When multiple gaps detected

Default: pick the one closest to the user's worst-case (from CLAUDE.md > Risk + Comfort > worst_case). If the user's worst case is "missing rent," gap related to revenue / pipeline wins. If the user's worst case is "losing the marriage to overwork," gap related to family-floor wins.

### When no gaps detected

Use the "strong week, no gaps" question:

> "What is the one thing that, if it shipped next week, would make this week feel worth the floor breaks?"

The skill does not skip the closing reflection when there are no gaps. The reflection exists every week.

## Failure handling

### A delegated skill is unavailable

If `family-floor`, `revenue-mapper`, or `decision-logger` is not installed or not callable, ship-it-friday surfaces the gap:

```
revenue-mapper not available. Step 5 cannot run automatically.
Two paths:
1. Skip the floor compliance check. Plan next week without tagging.
2. Install revenue-mapper now (already in default Always-on skills set).

Pick.
```

The skill does not crash; it surfaces the gap and offers a recovery path.

### A delegated skill errors mid-run

If a delegated skill errors (e.g., file-sweep hits permission error), ship-it-friday captures the partial output and continues:

```
Step 2 (file-sweep): partial complete. Backup rotation skipped (perm error).
Continuing close-out.
```

The error does not halt the ritual. The user fixes the underlying issue offline.

### The user abandons mid-ritual

If the user starts ship-it-friday and walks away before Step 7, the partial output stays in a draft log: `reports/friday-close-2026-W21.draft.md`. Next time the user runs ship-it-friday, the skill detects the draft and asks: "Resume from Step N or restart?"

This prevents lost work for users with interrupted Fridays.

## Re-running mid-week

If the user runs `/ship-it-friday` on a Wednesday and confirms intentionally, the skill runs with one adjustment:

- Step 5 (next week plan) becomes "rest-of-week plan" (Wed-Fri).
- Other steps run normally.
- Log file is named `reports/midweek-close-YYYY-MM-DD.md` instead of `friday-close-YYYY-WW.md`.

The user retains the Friday close-out as a separate ritual.

## Sequencing rules

The seven steps are NOT independent. Some depend on prior steps.

- Step 3 (week recap) benefits from Step 1 (decision-logger) output.
- Step 5 (next week plan) benefits from Step 4 (family-floor): knowing the floor before planning.
- Step 6 (monthly variants) is independent of Steps 1-5.
- Step 7 (closing reflection) depends on all prior steps.

Do not parallelize Steps 1-7. Run them in order.

## Edge case: user only wants the question

Some users use ship-it-friday lightly: "just give me the question."

In that case, the skill runs Steps 1-6 silently in the background (no chat output), computes the closing reflection, and outputs only the question + a one-line summary of the gap that produced it.

Light mode opt-in via CLAUDE.md > Skills > ship-it-friday > light_mode = true.

The full log is still written to disk. The chat output is the question only.

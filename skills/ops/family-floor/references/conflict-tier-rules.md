# Conflict Tier Rules

How to classify a proposed time against a stated floor block. Four tiers. Apply in order.

## Hard conflict

**Definition.** Proposed time is fully inside the floor block. Start time >= floor start AND end time <= floor end.

**Examples (floor: M-F 4-7pm, no work):**

- Wed 4:30-5:00pm → hard (30 min inside)
- Thu 5:00-6:30pm → hard (90 min inside)
- Tue 4:00-7:00pm → hard (exactly the full block)

**Response.** Three-option surface, lead with move, list override second, drop third.

## Edge conflict

**Definition.** Proposed time touches the floor block by 30 minutes or less, on either side. Start within 30 min before floor start, OR end within 30 min after floor end. Some of the meeting bleeds into the floor.

**Examples (floor: M-F 4-7pm, no work):**

- Wed 3:45-4:30pm → edge (30 min after floor start)
- Tue 6:45-7:30pm → edge (15 min before floor end)
- Thu 3:30-4:15pm → edge (15 min after floor start)

**Why edge matters.** Edge conflicts erode floors faster than hard conflicts because they feel "almost fine." The user mentally tells themselves "the meeting was scheduled for 3:45, it just ran over." Surface edges as conflicts so the user makes a real decision, not a drift.

**Response.** Three-option surface. Default suggestion when moving: shift the meeting back so the end time clears the floor by 15 minutes minimum (decompression buffer).

## Adjacent conflict

**Definition.** Proposed time ends within 30 minutes of floor start, OR starts within 30 minutes of floor end. The meeting itself does not overlap the floor, but the transition risk is high.

**Examples (floor: M-F 4-7pm, no work):**

- Wed 3:30-3:55pm → adjacent (ends 5 min before floor)
- Tue 7:15-7:45pm → adjacent (starts 15 min after floor)
- Mon 3:00-3:50pm → adjacent (ends 10 min before floor)

**Why adjacent matters.** Adjacent meetings are how the floor gets eaten one transition at a time. A call that "ends at 3:55pm" runs over to 4:05pm. The user is then 5 minutes late to pickup, 10 minutes mentally distracted at dinner, and 30 minutes into work-mode through the start of the floor.

**Response.** Mention once. Do not surface the full three-option ritual. The user knows their pattern; trust them.

> "[family-floor] Adjacent conflict noted. Meeting ends 5 min before the floor. Be ready to hard-stop. Want me to add a 5-min cushion event?"

## Clear

**Definition.** No overlap, no adjacency. Proposed time has a minimum 30-minute buffer to any floor block.

**Response.** Stay silent. Do not announce that the time is clear. The user did not ask.

## Special cases

### Multi-day blocks

For full-day blocks (Sunday all day, Sabbath), apply hard conflict to ANY proposed time within the block, regardless of duration.

### Block-of-blocks (e.g., "weekends off")

If the floor reads "weekends off" without specific times, treat as Saturday 12:00am to Sunday 11:59pm, hard conflict for any proposed time inside.

But: surface a one-time prompt to the user: "Your floor reads 'weekends off.' Can we make this specific? When does the weekend start and end?" Rewrite in CLAUDE.md once specified.

### Partner-owned blocks

For blocks marked `partner-owned` (date night, partner's birthday week), bump tier up one level. Edge conflicts become hard. Adjacent conflicts become edge.

The reasoning: partner-owned blocks have the longest tail when broken because the partner notices and remembers.

### Recurring vs one-time blocks

If a block recurs weekly (e.g., "Thursday yoga"), treat as full hard conflict for any overlap.

If a block is one-time (e.g., "Saturday Oct 5, family wedding"), still hard conflict, but allow the user to override without it counting toward the 30-day override pattern. One-time blocks are not the pattern.

### Cross-timezone meetings

If the user is in PT and the prospect is in ET, the proposed time gets converted to the user's timezone before testing against the floor. The floor is in the user's clock.

### All-day events with no specific time

If the proposed event is "all day" (e.g., "ship the newsletter Sunday"), and Sunday is a floor block, hard conflict. The skill does not assume "all day" means "at midnight."

## Worked examples

### Example 1: Discovery call

Proposed: Discovery call with prospect, Wed 4:30-5:00pm PT.
Floor: M-F 4-7pm (family time, no work).
Conversion: PT, matches floor timezone.
Test: Wed 4:30pm is inside floor start (4pm). Wed 5:00pm is inside floor end (7pm).
Tier: Hard conflict (30 min inside the block).

Output: Three-option surface.

### Example 2: Newsletter publish slot

Proposed: Publish Sunday newsletter at 7:00am.
Floor: Sunday all day, no exceptions.
Test: Inside the block.
Tier: Hard conflict (full block).

Output: Three-option surface. Suggest moving publish to Saturday afternoon (Saturday is not in floor) or Monday morning.

### Example 3: Cold call sprint

Proposed: 45-minute cold call sprint, Thu 3:45-4:30pm PT.
Floor: M-F 4-7pm.
Test: Starts before floor (3:45pm), ends 30 min inside floor (4:30pm).
Tier: Edge conflict (30 min after floor start).

Output: Three-option surface. Suggest sprinting 3:00-3:45pm to clear.

### Example 4: Sales call right before pickup

Proposed: Sales call, Wed 3:30-3:55pm PT.
Floor: M-F 4-7pm.
Test: Ends 5 minutes before floor start.
Tier: Adjacent conflict (ends 5 min before floor).

Output: Mention once. "Adjacent. Want a 5-min cushion event after?"

### Example 5: Saturday morning workout call

Proposed: Networking call, Saturday 9:00-9:30am.
Floor: Saturday until 11am (recovery + gym).
Conversion: Inside block.
Tier: Hard conflict.

Output: Three-option surface. Suggest Saturday 11:30am or any weekday morning.

### Example 6: Partner-owned date night edge

Proposed: Quick call with prospect, Friday 5:45-6:15pm PT.
Floor: Friday 6:00pm-11:00pm (date night, partner-owned).
Test: Ends 15 min after floor start (edge).
Tier: Edge → bumped to Hard because partner-owned.

Output: Three-option surface.

## Defaults when timezone is missing

If a proposed time has no timezone and the user's CLAUDE.md does not specify, assume the user's timezone from any inferable source (Cal.com profile, prior conversation context). If still ambiguous, ask before testing.

## Defaults when floor block format is non-standard

If a CLAUDE.md block reads in a non-standard format ("the hour before bedtime"), do not guess. Ask the user to specify in clock time, write the answer back to CLAUDE.md, then test.

The floor must be parseable to be enforceable. Vague is the enemy.

# Worked Example: Explicit `/family-floor` Call

The user runs `/family-floor` on a Tuesday afternoon to check status.

## User input

```
/family-floor
```

## CLAUDE.md state (excerpt)

```
## Values + Non-Negotiables

**Protected time (Family Floor):**
- M-F 4:30pm to 8pm: family time, no work
- Saturday until 11am: slow morning, no work
- Sunday all day: no work, no exceptions

Partner: Sarah
Partner-owned blocks:
- Friday 6:30pm-10pm: date night (partner-owned)
```

## Skill output

```
FAMILY FLOOR
============
Block 1: M-F 4:30pm to 8pm        [family time, no work]
Block 2: Saturday until 11am       [slow morning, no work]
Block 3: Sunday all day            [no work, no exceptions]
Block 4: Friday 6:30pm to 10pm     [date night: partner-owned, Sarah]

This week (M-F + weekend):
  Available work-hours: 41
  Protected hours:      52
  Overrides logged:     1
    - Wed 4:30-5:15pm (closed [their company] deal, Sarah notified, made up Sat morning)

Last 30 days:
  Overrides logged:     3
  Sunday overrides:     0
  Date night overrides: 0
  Pattern flag:         No

One question:
What is making the 4:30-5pm window the recurring override spot?
```

## What this output models

1. **Specificity over softness.** The blocks are quoted exactly from CLAUDE.md with the clock times and labels. No paraphrasing.

2. **The mirror, not the verdict.** The override count is presented as data, not failure. 3 overrides in 30 days is below the pattern-flag threshold of 4. Surface the number, do not editorialize.

3. **Partner attribution.** The Friday date night is tagged partner-owned with Sarah's name. This is what makes a partner-shared floor sticky.

4. **The transition cost is visible.** The single override this week (Wed 4:30-5:15pm) carries its full context: deal name, partner notification, makeup plan. Future-Claude reading this can see the override was a logged decision, not a drift.

5. **One question, not five.** The skill closes with one open question tied to the data ("4:30-5pm window is the recurring override spot"). It does not list 5 questions or suggest 3 changes. The user sits with one.

## Alternate output: zero overrides

If the user had 0 overrides in 30 days:

```
FAMILY FLOOR
============
Block 1: M-F 4:30pm to 8pm        [family time, no work]
Block 2: Saturday until 11am       [slow morning, no work]
Block 3: Sunday all day            [no work, no exceptions]
Block 4: Friday 6:30pm to 10pm     [date night: partner-owned, Sarah]

This week: 41 work-hours available, 52 protected, 0 overrides.
Last 30 days: 0 overrides.

Floor held. Nothing to renegotiate.
```

Short. No padding. No congratulations. The floor held; the data shows it.

## Alternate output: pattern flag tripped

If the user had 5 overrides in 30 days, including 2 Sundays:

```
FAMILY FLOOR
============
Block 1: M-F 4:30pm to 8pm        [family time, no work]
Block 2: Saturday until 11am       [slow morning, no work]
Block 3: Sunday all day            [no work, no exceptions]
Block 4: Friday 6:30pm to 10pm     [date night: partner-owned, Sarah]

This week:
  Available work-hours: 41
  Protected hours:      52
  Overrides logged:     2
    - Sun 8-10am (newsletter ship: Sarah not consulted)
    - Wed 4:30-5:30pm (sales call: Sarah notified, made up Thu morning)

Last 30 days:
  Overrides logged:     5
  Sunday overrides:     2
  Date night overrides: 0

PATTERN FLAG: 5 overrides in 30 days.
PATTERN FLAG: 2 Sunday overrides in 60 days.

The floor you wrote is not the floor you are living. Three options:
1. Rewrite the floor to match your current life.
2. Renew commitment to the original floor.
3. Sit with the gap and answer: what changed.

Pick one. Not picking is picking option 2 by default.
```

## What changes between the three outputs

The skill returns the same structure every time. The content of the "Last 30 days" block determines the closing. Three patterns:

- **Zero overrides:** "Floor held. Nothing to renegotiate."
- **Below threshold (1-3 overrides):** One open question tied to the most-frequent override window.
- **Pattern flag tripped (4+ overrides, or 2+ Sundays in 60 days, or any date night override):** The three-option pattern frame.

The user always gets the data first, the frame second. The skill does not lead with the frame.

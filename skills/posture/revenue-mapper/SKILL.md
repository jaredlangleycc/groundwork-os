---
name: revenue-mapper
description: This skill should be used when the user describes activities, tasks, projects, or weekly plans, and any time the user asks "what should I work on", "what's my week looking like", "is this worth doing", "is this revenue-adjacent". It tags every activity with a money-impact label ($$$, $$, $, distraction) so the user can see their actual time mix at a glance. Active for every NightShiftOS user always.
version: 0.1.0
---

# Revenue Mapper

The money lens. Every activity gets a tag. No motion happens without it being seen for what it is.

Solopreneurs die two ways: no revenue, or all admin no revenue. Revenue-mapper makes you choose explicitly.

## When this skill triggers

- Any time the user describes a task, plan, or project
- "What should I work on this week?"
- "Is X worth doing?"
- "Help me prioritize"
- "Map this week"
- Within `/weekly-brief` (always)
- Within `/morning-brief` (always)

## The tagging system

Four tags. Use exactly these. No invented categories.

### $$$, Direct revenue

Activities that produce money this week or this month.

Examples:
- Sales calls (discovery, proposal, close)
- Sending proposals
- Closing deals
- Delivering paid client work
- Invoicing + payment collection
- Renewing existing clients

### $$, Leverage to revenue

Activities that create future direct-revenue opportunities. 1-3 month payoff.

Examples:
- Outreach (cold email, LinkedIn DMs, podcast pitches)
- Content that drives qualified leads (LinkedIn posts, newsletter, blog)
- Follow-ups on stale prospects
- Speaking gigs / conferences with ICP audience
- Strategic partnerships, intro requests
- Case study creation from won deals

### $, Necessary admin

Activities that keep the business alive but don't generate revenue.

Examples:
- Bookkeeping, expense logging
- Tax prep, accountant calls
- Tool maintenance (CRM hygiene, calendar cleanup)
- Banking, contracts, legal
- Filing receipts
- Renewing subscriptions

### – (em-dash, but use the word "distraction"), Distraction

Activities that feel productive but aren't.

Examples:
- Logo iterations (you already have one)
- Tool-shopping (you have tools)
- Optimization theater (tweaking your bio for the 5th time)
- "Research" on competitors that doesn't change behavior
- Endless content planning without shipping
- New courses, books, podcasts you don't have time to apply
- Reorganizing your file system

## How to apply tags

When the user lists tasks or describes their week, tag each item explicitly:

```
This week's plan:
- Call with Jordan (renewal discussion)          [$$$]
- Draft proposal for [their company]                  [$$$]
- 5 LinkedIn DMs to new manager ICPs            [$$]
- Newsletter issue 4                            [$$]
- Update HubSpot stages on 12 stale deals       [$]
- Research project management tools             [distraction]
```

If a task is ambiguous, ask the user to clarify. Don't guess.

## The weekly mix

After tagging, compute the rough hours mix:

```
Revenue mix this week:
$$$ : 12 hrs (40%)
$$  : 8 hrs (27%)
$    : 4 hrs (13%)
distraction : 6 hrs (20%)

Direct + leverage = 67%. Floor is 60%. ✓
```

The floor is **60% combined ($$$ + $$)**. Below that, surface the gap.

When below floor:

> "Your direct + leverage time is 45% this week. You're under your 60% floor. The 'research project management tools' block is 6 hours of distraction. Cut or downgrade?"

Don't moralize. State the math. Let the user decide.

## Stage-aware floors

Adjust the floor by stage (from CLAUDE.md):

| Stage | Floor ($$$ + $$) |
|---|---|
| Pre-Rev Builder | 70% (need leverage time aggressively) |
| Early Operator | 65% |
| Stable Solo | 55% |
| Scaling Solo | 50% (more admin is unavoidable at this stage) |

## Anti-patterns to flag

### Too much $$$, no $$

```
$$$ : 30 hrs
$$  : 2 hrs
```

You're delivering on current revenue but not creating future revenue. This is the "feast-then-famine" pattern. Flag: "You're burning current pipeline with no replenishment. What's the $$ activity you're avoiding?"

### Too much $$, no $$$

```
$$$ : 4 hrs
$$  : 24 hrs
```

You're creating future opportunities but not closing current ones. Flag: "You're top-of-funnel rich, bottom-of-funnel light. Which 3 prospects could you close this week instead of post 12 more times?"

### Distraction camouflaged as $$

The most common pattern. "Building my brand" can be $$ or distraction depending on what specifically.

- Posting on LinkedIn = $$ if it drives leads, distraction if you don't track or pitch.
- Designing a logo = $$ only if you don't have one, distraction otherwise.
- Newsletter = $$ if subscribers convert, distraction if 0 subscribers after 3 months.

When in doubt, ask: "How does this turn into money? When?"

If the user can't answer, it's distraction. Tag it.

## Multi-week patterns

If `/weekly-brief` activates, compare to previous weeks. Watch for:

- Distraction creep (week-over-week distraction growth)
- $$$ collapse (revenue activity dropping for >2 weeks)
- $$ disappearance (no future-revenue work for 2+ weeks)
- Admin bloat ($ growing past 20%)

Surface multi-week patterns in the brief.

## How to argue with the tag

The user can override a tag. Sometimes "research" really is leverage (you're entering a new market). Sometimes "newsletter" really is distraction (12 issues, 0 subs).

When the user pushes back: "Why is this distraction?"

Respond with the question: "What's the money path from this activity to revenue, and how long?"

If they can name it: re-tag.
If they can't: keep the tag, let them override.

## What revenue-mapper does NOT do

- Does not tell the user to stop doing $ or distraction work entirely. Some admin is required. Some "distractions" feed creative or recovery time.
- Does not flatten everything to revenue. Personal life, family time, recovery, these don't get tagged. They're not on the spreadsheet.
- Does not tag protected time (family floor). That's outside the system.
- Does not auto-replace activities. The user makes the call.

## Working with other skills

- `weekly-brief`: calls revenue-mapper on every brief
- `business-coach`: references revenue-mapper output when challenging gaps
- `risk-gauge`: checks revenue mix before approving expansion moves
- `decision-logger`: logs the user's rationale when they override a tag

## Output format

When called explicitly, output:

```
REVENUE MAP
═══════════
$$$ : <items, with hours>
$$  : <items, with hours>
$    : <items, with hours>
distraction : <items, with hours>

Mix: $$$ N% · $$ N% · $ N% · distraction N%
Floor ($$$ + $$): N% [✓ above / ✗ below {stage_floor}%]

Pattern flags:
- [any of the anti-patterns above, if present]

Suggested moves:
- [1-3 concrete swaps]
```

End with the question: "What do you want to change, if anything?"

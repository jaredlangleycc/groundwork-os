---
name: weekly-brief
description: This skill should be used when the user runs "/weekly-brief", "/monday-brief", "/daily-brief", says "give me the weekly pulse", "what's my week looking like", "Monday brief", "weekly check-in", "pipeline check", or asks for a periodic business pulse. Adapts to the user's stack, uses HubSpot if connected, falls back to Google Sheets if not, falls back to manual prompts if neither. Produces a 1-page brief with pipeline, content, finance, and a tagged week plan.
version: 0.1.0
---

# Weekly Brief

The repeat-use anchor of NightShiftOS. The first command a new user runs after `/customize-from-assessment`. The Monday-morning ritual that keeps the OS active.

This skill produces a 1-page brief covering:
1. Pipeline (deals, prospects, stages)
2. Content (what shipped, what's queued)
3. Finance (revenue MTD, burn, runway)
4. Week ahead (tagged with revenue-mapper)
5. One question to sit with

## When this skill triggers

- `/weekly-brief`
- `/monday-brief`
- `/daily-brief`
- "Give me the weekly pulse"
- "What's my week looking like"
- "Pipeline check"
- Monday mornings by default (if cron is configured)

## The 1-page brief format

```
GROUNDWORK BRIEF, <date>
Profile: <Stage · Coach · Risk archetypes from CLAUDE.md>

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
PIPELINE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
<Deals by stage, count and $ value>
<Stale flags (>14 days no movement)>
<New since last brief>

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
CONTENT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Shipped last 7d: <list>
Queued next 7d: <list>
Gap: <if cadence is off, name it>

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
FINANCE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Revenue MTD: $<X>
Burn MTD: $<Y>
Runway at current burn: <Z> months

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
WEEK AHEAD
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[run revenue-mapper on the user's stated tasks]

Mix: $$$ N% · $$ N% · $ N% · distraction N%
Floor ($$$ + $$): N% [✓ / ✗ vs {stage_floor}%]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
THE QUESTION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
<1 open question tied to the gaps surfaced above>
```

## Data sources (in priority order)

The skill adapts to whatever the user has configured. Read from CLAUDE.md Stack section to know which sources are available.

### Pipeline data

**Priority 1: HubSpot** (if user has `crm: HubSpot` in stack)
- Use HubSpot MCP tools if available
- Query deals across all pipelines
- Filter by stage, last activity date, owner

**Priority 2: Google Sheet** (if user has `crm: Google Sheet` in stack)
- Read the CRM sheet (sheet ID stored in CLAUDE.md)
- Use templates/crm-sheet.csv schema as expected columns

**Priority 3: Manual prompt**
- Ask the user: "Drop your top 5 active prospects with current stage."
- Don't fabricate pipeline data.

### Content data

**Priority 1: Connected scheduler** (Blotato, Buffer, Typefully, MailerLite for newsletter)
- Pull queue from connected tools where MCPs exist

**Priority 2: Manual prompt**
- Ask the user: "What content shipped last 7d? What's queued?"
- Use the answer.

### Finance data

**Priority 1: finance-log.csv** (if user has `finance: finance-log.csv` or similar)
- Read the CSV
- Sum revenue MTD, burn MTD, compute runway

**Priority 2: Manual prompt**
- Ask the user: "Revenue MTD? Burn MTD?"

### Calendar data

**Priority 1: Cal.com / Google Calendar / Outlook** (whichever is in stack)
- Pull this week's events
- Identify revenue-producing blocks (sales calls, client sessions, paid work)

**Priority 2: Manual prompt**
- Ask the user: "Top 3 calendar blocks this week?"

## Stale-prospect logic

Flag deals/prospects with no movement >14 days. List by:

- Stage (so the user sees the friction point)
- Days stale (most stale first)
- Suggested next move (cold restart, qualify-out, or skip)

Don't auto-draft follow-ups in the brief. Suggest the user run `/follow-up-tracker` for that.

## Family-floor integration

When showing the week ahead:

1. Read protected blocks from CLAUDE.md > Family Floor
2. Compute total work-available hours this week (168 - sleep - floor blocks)
3. Show as `Available: X hrs this week`
4. Flag if planned tasks total exceeds available hours

> "Your week has 32 work-available hours (after family floor). Planned tasks sum to 47 hours. Cut, defer, or override the floor?"

## The Question (closing)

End every brief with one open question. Tie it to the largest gap surfaced.

Examples:

- If pipeline is thin: "What's the outreach you've been avoiding?"
- If content is dark: "What's the post you'd write if your network wasn't watching?"
- If revenue is flat: "What's the deal you'd take but shouldn't, and the deal you wouldn't take but should?"
- If distraction time is high: "Which 'distraction' is actually the rest you're not allowing yourself?"

Don't ask multiple questions. Don't soften it. The user needs the friction.

## Cadence variants

### `/daily-brief`

Lighter version. Only:
- Today's calendar
- Today's top 1-3 tasks (tagged)
- 1 stale prospect to address today

Run Mon-Fri only. Skip weekends (family-floor).

### `/weekly-brief`

Full version above. Default Mondays.

### `/monthly-brief`

Adds finance check-in:
- Revenue trend (3-month view)
- Burn trend
- Stale subscriptions (cancel candidates)
- Pricing review prompt
- Goal-progress check vs 90-day target

## Anti-patterns to refuse

### Don't pad the brief

If pipeline is empty, say "Pipeline empty. That's the situation." Don't add fluff.

### Don't fabricate

If a data source isn't available and the user doesn't provide manually, leave that section blank with `[no data, connect or provide manually]`. Don't make up numbers.

### Don't moralize

The brief shows the facts. The coach (business-coach skill) does the framing. Keep them separate.

### Don't suggest more than 3 changes

The brief is a snapshot, not a prescription. If you suggest changes at all, limit to 3, and frame them as questions ("Move the Thursday call into Wed? Drop the Friday LI post?"). The user decides.

## Time-saving heuristics

If the user runs `/weekly-brief` and nothing has changed since last brief:

- Show the brief but flag: "No movement since last Monday. The same gaps. Want to coach on why?"

If pipeline shrinks for 2+ briefs in a row:

- Surface explicitly: "Pipeline shrinking 2 weeks running. Pattern flag. Want to talk through why?"

## What weekly-brief does NOT do

- Does not auto-action anything (no auto-sent emails, auto-created tasks, etc.)
- Does not generate content (use content-strategy skill)
- Does not draft outreach (use outreach-drafter or follow-up-tracker)
- Does not log decisions (use decision-logger)
- Does not modify the user's CLAUDE.md

Brief produces information. Other skills produce action.

## Working with other skills

- Pulls from: `revenue-mapper`, `family-floor`, `finance-log`
- Surfaces gaps to: `business-coach`, `follow-up-tracker`, `decision-logger`
- Suggests follow-ups via: `outreach-drafter`, `content-strategy`

## File output

By default, the brief is shown in chat only. If the user has a `reports/` directory in their working dir, also write to:

```
reports/weekly-brief-YYYY-WW.md
```

So they can scroll back through prior briefs. Format: same as chat output, with metadata header (date, profile snapshot).

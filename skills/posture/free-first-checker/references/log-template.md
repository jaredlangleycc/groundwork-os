# Free-First Attempts Log Template

Exact format for entries in `decisions/free-first-attempts.md`. Each function gets one entry. Re-test when 90 days old or when usage changes.

## File header

```
# Free-First Attempts Log

The log of every free path tested before climbing the boring-stack ladder. Each entry shows the function, the free attempt, the specific break point, and the climb (if any) that was justified.

Re-test entries over 90 days old. Update when usage profile changes.
```

## Entry template

```
## YYYY-MM-DD: <function name>

**Trigger.** <What prompted the check. "Considering switch from X to Y" or "Hit limit on free tier" or "business-coach recommended paid tool">

**Free path tried.** <Exact tool and tier, with link>
- Scope: <free tier limits at time of test>
- Setup time: <hours to install / configure>

**Test window.** YYYY-MM-DD to YYYY-MM-DD (N days)

**Usage during test.** <Real numbers from the period. "Tracked 18 contacts, sent 4 broadcasts, ran 2 automations">

**Outcome.**
- What worked: <bullets>
- What did not: <bullets>

**Break point.** <The exact limitation that justifies climbing. Be specific. "Hit 1,002 subscribers" not "scale issues". "Cal.com Free only allows 1 event type, need 3 (intro / clarity / strategy)" not "need more flexibility">

**Climb decision.**
- Tool chosen: <name and tier>
- Monthly cost: <$N/mo, annualized $X>
- Why this rung and not the next one up: <reason>

**Next review.** YYYY-MM-DD (30 days after climb)

**Override note.** <Optional. If the user climbed despite the free path being adequate, the reason. e.g., "Speed of setup more valuable than the $X savings at current revenue.">
```

## Worked entry example

Use this format. Match the level of specificity shown.

```
## 2026-05-18: CRM (contact management + pipeline tracking)

**Trigger.** Cal.com webhook auto-write needed at scale. Google Sheet manual updates slipping past 60 active contacts. business-coach flagged stale-stage updates as a $ -> distraction risk.

**Free path tried.** Google Sheet "the example coaching business CRM" with 20-column schema.
- Scope: Unlimited rows, manual entry, no automation
- Setup time: 2 hours initial schema build

**Test window.** 2026-04-26 to 2026-05-18 (22 days)

**Usage during test.** Tracked 67 contacts, logged 12 Cal bookings manually after each happened, ran 1 weekly review per Friday.

**Outcome.**
- What worked: Schema clean, viz in Gemini canvas downstream worked well, zero cost, fully under control
- What did not: Manual writes after Cal bookings consumed ~15 min/day. Stage updates slipped 2-3 days behind reality. Hot-lead notification emails required cross-referencing two tools

**Break point.** Manual write after Cal booking = 15 min/day = $375/mo at $100/hr opportunity cost. HubSpot Free + webhook + Zapier-style trigger removes this cost entirely.

**Climb decision.**
- Tool chosen: HubSpot Starter ($20/mo)
- Why not free tier: Starter unlocks 2 pipelines (Organic + Accelerator), and Marketing automations. Free tier blocks both.
- Why not Calculated-tier "Marketing Hub Professional" at $XXX/mo: Not needed. Starter does the job.

**Next review.** 2026-06-18 (verify the 2 pipelines are actually being used, verify automations are firing)

**Override note.** n/a
```

## Anti-patterns in log entries

Each of these is a sign the entry is not real and should be rewritten.

### Vague break points

Bad: "Mailchimp was clunky"
Good: "Mailchimp Free dropped automations in 2022 vendor change. Cannot do drip sequences on free tier as of 2026-04-05 test"

Bad: "CRM didn't scale"
Good: "Google Sheet broke at 60+ contacts because manual writes after Cal bookings = 15 min/day, slipping past acceptable"

### Missing test windows

If the entry has no test dates or the window is under 14 days, mark the entry as `provisional` and re-run the test.

### "Just felt right" climbs

If the climb reason is "I prefer the UI" or "everyone uses it" without a specific break point, the climb is style preference. Log the override note plainly. The user can still climb. The log keeps the user honest about why.

### Tool stacking

If the user climbs to a paid tool but does not deprecate the free tool, flag it. Stack creep is the most common failure pattern for Low-Burn archetypes. Add a "Deprecation" line:

```
**Deprecation.** Free tool retained for: <specific reason or "no reason, decommission">
```

If no reason exists, decommission.

## How to use

When the free-first-checker fires:

1. Open `decisions/free-first-attempts.md`
2. Search for an entry matching the function
3. If exists and current: log the climb (or no-climb) decision under the entry
4. If absent or stale: create a new entry using this template

When `boring-stack` recommends a climb, the log entry is the gate. No log entry = no climb recommendation.

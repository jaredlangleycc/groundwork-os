---
name: free-first-checker
description: This skill should be used when any other NightShiftOS skill is about to recommend a paid tool, paid course, paid contractor, or paid service. Also triggers when the user asks "should I use X" or "should I buy Y" and X or Y costs money. Blocks the paid recommendation until a 2-week free attempt has been documented as broken. Maintains a log of free attempts so the boring-stack ladder can be climbed honestly. Active for every NightShiftOS user always.
version: 0.1.0
---

# Free-First Checker

The boring-stack ladder rule: free tier first. Climb only when the rung below breaks. Free-first-checker is the rung-break verifier.

Working-parent solopreneurs lose more to stack creep than to bad strategy. A $30/mo subscription does not feel like a problem. Eight of them is $240/mo, which is more than most early-stage businesses can sustain. This skill keeps the climb honest.

## When this skill triggers

Fire whenever:

- Any other skill is about to recommend a paid tool (CRM, email tool, scheduler, design tool, analytics, SaaS subscription)
- The user asks "should I buy X" or "should I subscribe to Y"
- The user proposes upgrading a free tier to a paid tier
- The user asks about a tool they already pay for but want to switch from
- `business-coach` is about to suggest a contractor or agency
- `risk-gauge` flags a move that requires paid spend
- `boring-stack` recommends climbing to a higher rung

Do not fire when:

- The user is buying a one-off tangible business asset (laptop, microphone, ring light) that has no recurring cost
- The user is paying for something explicitly required by law (state filing fees, business license, insurance)
- The paid path has already been validated in a previous free-first-check log entry within the last 90 days

## The free-first attempt log

Maintain a log at `decisions/free-first-attempts.md` in the user's project. Each entry documents:

```
## YYYY-MM-DD: <function or problem>

**Free path tried:** <specific tool or method, free tier scope>
**Duration:** <how long the user gave it, minimum 2 weeks>
**Outcome:** <what worked, what did not>
**Specific break point:** <the exact limitation that made the free path inadequate>
**Climb decision:** <paid tool chosen, monthly cost, why this specific climb>
**Next review:** <30 days out, to verify the climb was worth it>
```

If no log entry exists for the function in question, the paid recommendation is blocked until one is created.

## The check sequence

When fired, run this sequence.

### Step 1: Classify the function

What problem is the user trying to solve? Be specific:

- "I need a CRM" becomes function `contact management + pipeline tracking`
- "I need email marketing" becomes function `list email broadcasts + automation`
- "I need a website" becomes function `public-facing single-page site`
- "I need a designer" becomes function `one logo + brand color palette`

Generic categories trigger generic spending. Specific functions admit specific free paths.

### Step 2: Check the log

Read `decisions/free-first-attempts.md`. Does an entry exist for this function?

**If yes and the entry is under 90 days old:** the free path has been documented as broken. Continue to the paid recommendation. Log the climb decision under the existing entry.

**If yes but over 90 days old:** ask the user "your last free-first attempt for [function] was [date]. Has anything changed in your needs or in the free tools available? Revalidate or proceed?"

**If no entry exists:** the paid recommendation is blocked. Continue to Step 3.

### Step 3: Propose the free path

For the function in question, propose the leanest free path. Use `references/free-paths-by-function.md` as the lookup.

Sample free paths:

- CRM via Google Sheet with 12 columns. Free forever.
- Email broadcasts via MailerLite Free (up to 1,000 subscribers, 12,000 emails/mo).
- Scheduler via Cal.com Free (1 event type, unlimited bookings).
- Single-page website via Carrd Free or Cloudflare Pages with hand-coded HTML.
- Bookkeeping via Wave Free (genuinely free forever, no trial expiration).
- File storage via Google Drive Free (15GB across Drive + Gmail + Photos).
- Analytics via Cloudflare Web Analytics Free or Plausible self-hosted.
- Design (logo, color palette) via Canva Free or DIY in Figma Free.
- Cold email via manual Gmail (up to ~50/day before deliverability issues).

The free path must be tried for **at least 2 weeks** at meaningful volume. "I tried Wave once" does not count. "I used Wave for 2 weeks tracking 12 transactions and the bank-feed integration broke for my credit union" counts.

### Step 4: Set the test window

State the test parameters explicitly:

- Start date
- End date (minimum 14 days out, longer for slower-cycle functions)
- What "success" looks like (the free path is adequate)
- What "break" looks like (specific limitation that justifies climbing)

For the example coaching business example, when Jared considered moving from MailerLite Free to ConvertKit:

```
TEST WINDOW
═══════════
Function: email marketing automation
Free path: MailerLite Free, current
Test start: 2026-04-05
Test end: 2026-04-19 (14 days)

Success: MailerLite handles current automation needs (lead-gen assessment nurture, 5 emails over 14 days)
Break point: ML cannot do <specific thing user needs>
```

### Step 5: Run the test (user's job, not Claude's)

Claude does not run the test. The user runs the test. Claude reminds them at the end of the window:

> "Your free-first window for [function] ended [date]. What broke? What worked?"

The user answers. The skill writes the log entry.

### Step 6: Make the climb decision

If the free path was adequate: paid recommendation is rejected. Log entry shows "free path adequate, no climb needed."

If the free path broke at a specific limitation: paid recommendation is allowed for the specific limitation. Climb to the **lowest rung that fixes the specific break**. The recommended tier the SaaS company promotes is usually one rung higher than needed.

Sample climb decisions:

- "MailerLite Free hit the 1,000 subscriber cap" leads to MailerLite Growing ($10/mo for 500 more), not ConvertKit Creator at $25/mo
- "Cal.com Free only allows 1 event type, I need 3" leads to Cal.com Team at $12/mo, not Calendly at $16/mo or HubSpot Meetings at $50/mo
- "Google Sheet CRM breaks at 200 contacts because manual updates are slipping" leads to HubSpot Free (still free, adds the missing automation), without climbing to HubSpot Starter at $20/mo

The cheapest climb is almost always the right climb at this stage.

### Step 7: Schedule the next review

Set a 30-day check-in. After 30 days on the paid tier, the user revisits:

- Is the paid feature being used?
- Is the original break point fixed?
- Is there a cheaper rung that would have worked?

If the answer to any of these is no, downgrade or switch.

## Anti-patterns to refuse

### "Just recommend the best tool"

The skill refuses to skip the check. There is no "best tool" without a documented free attempt at the user's specific use case.

If the user pushes back: "I trust you, just tell me." Respond: "The trust costs you $300/mo over the next year if I'm wrong. The 2-week test costs you 2 weeks of running what you already have. Take the test."

### "Everyone uses X"

Popularity is not the test. Many solopreneurs pay $50/mo for ConvertKit because that's what their favorite creator uses. The free path may serve their actual usage perfectly. Run the test.

### Trial-as-test

A 14-day free trial of a paid product is NOT a free-first attempt. The trial is engineered to make you upgrade. The free-first attempt is the genuinely free path (free tier of the same product or a different free product) for at least 14 days.

### Climbing to the recommended tier

SaaS companies recommend the middle tier because that's their margin tier. The free-first-checker climbs to the **lowest rung that fixes the break**. This is by design.

### Skipping the log

If the user says "I already tried it, it didn't work," ask for the date and the specific break. If they cannot name it, the test was not run. Run it now.

## Stage-aware adjustments

### Pre-Rev Builder

Every paid recommendation triggers the check. No exceptions. At pre-revenue, every $20/mo subscription is runway burn.

Default free path duration: 30 days, not 14. The pre-rev builder has time to test. The cost of an unnecessary subscription is higher than the value of speed.

### Early Operator (under $5K)

Triggers as defined. 14-day window default. Climbs allowed when the free path breaks at a specific limitation. Total monthly stack target: under $50/mo.

For the example coaching business: max_tool_spend_monthly is $50, current stack is $42/mo (HubSpot Free, MailerLite Free, Cal.com Free, Cloudflare Pages free). Any addition triggers the checker.

### Stable Solo ($5K to $25K)

Triggers as defined. Window can be shorter if the function is time-sensitive (need a scheduler this week because you have 5 calls booked). Climbs allowed more freely. Total monthly stack target: under $200/mo.

### Scaling Solo ($25K+)

The check still fires, but the user can override with "I value speed over savings." Log the override with stated reason. Total monthly stack: user-defined, but the checker still flags overlapping subscriptions.

## Working with other skills

- Imports from: `customize-from-assessment` (free_first commitment level, max_tool_spend_monthly)
- Hands off to: `boring-stack` for the actual rung recommendation when a climb is justified
- Hands off to: `risk-gauge` when the climb is above the user's tool spend cap
- Hands off to: `decision-logger` when the climb decision is made
- Calibrates with: `business-coach` (coach posture wraps the check)

## Output format

When triggered, output:

```
[free-first-check] Before recommending [paid tool], let's verify the free path.

FUNCTION: <specific>
LOG ENTRY EXISTS: <yes / no / stale (over 90 days)>

PROPOSED FREE PATH: <tool/method, scope, why this is adequate to test>
TEST WINDOW: <start date> to <end date> (<N> days)
SUCCESS LOOKS LIKE: <criterion>
BREAK LOOKS LIKE: <specific limitation>

Run the test. Come back at <end date> with what broke.
```

If the log entry exists and is current:

```
[free-first-check] Log entry from <date> shows free path broken at <limitation>.

Cleared for paid path. Handing to boring-stack for the cheapest climb.
```

## Edge cases

**The user is mid-emergency.** "I have a call in 3 hours and my scheduler is broken." Allow a 24-hour bypass. Log the bypass with reason. Run the proper check within 7 days.

**The free tier was recently downgraded.** Calendly stripped multi-event-types from its free tier in 2024. If a free path has been removed by the vendor, document it and look for an alternative free path (Cal.com Free is the cleanest example here).

**The "free" path requires significant time investment.** Self-hosting Plausible is "free" in dollars but costs hours of setup and maintenance. Compute the effective monthly cost at the user's stated hourly value. If self-hosting costs 4 hours/mo and the user's value is $100/hr, that's $400/mo of effective cost. Cloudflare Web Analytics is free and zero-setup. Pick the genuinely cheaper path.

**Bundled "free" with a paid product.** Some paid products bundle features the user could get free elsewhere. Do not count bundled features as justification for the paid product. Each function gets evaluated independently.

**Lifetime deals and one-time purchases.** AppSumo-style lifetime deals look like a way to escape recurring spend. Treat them as one-time spends over $500 with a long payback period. Run the gauge. Many lifetime deals are for tools the user does not need yet.

**Family discount or promo pricing.** "It's $9/mo for the first 3 months, then $29/mo." Calculate the annualized cost, not the promo price. The free-first check evaluates the steady-state, not the trial.

**Existing subscription overruns.** If the user is already paying for a tool above the cap (legacy decision from before the OS was installed), surface it during the next free-first check. Suggest the descent path. Do not silently allow stale overruns.

## The log as memory

The free-first-attempts log is more than a justification document. Over 12 months, it becomes the user's institutional memory about what works at their scale. Patterns surface:

- "Every time I climbed to a $25/mo email tool, I came back to MailerLite Free within 6 months. The free tier was always enough."
- "The Cal.com Free tier broke at 2 event types every time. The $12/mo climb was always justified."
- "Self-hosting cost me 4-6 hours per month every time I tried it. Stop trying."

These patterns are the kind of insight the user cannot easily get from blog posts or peer recommendations. They are specific to the user's stage and usage. The log builds that specificity over time.

## Working with the user's spouse or partner

For Bootstrap-Strict and Low-Burn archetypes, the partner often has implicit veto on tool spend over a threshold. If the proposed climb is over the user's threshold and the partner has not been consulted, surface it:

> "[Free-first] You're cleared to climb. Has [partner] been part of the spend conversation, or does this stay in-business?"

Some users keep all business spend in-business by mutual agreement. Others involve the partner above certain thresholds. Respect the user's convention. The skill surfaces, the user decides.

## Additional Resources

### Reference files

- **`references/free-paths-by-function.md`** covers comprehensive lookup of free tools for each common solopreneur function, with scope and limitations
- **`references/log-template.md`** covers exact template for free-first-attempts log entries

### Example files

- **`examples/example-log.md`** covers real free-first log entries from the example coaching business covering CRM, email, scheduler, and finance

# Paid vs Free Decision Tree

The full decision tree for whether to spend ad dollars at all. Run before designing any campaign. Most solopreneurs end the tree at "stay free."

## Top-of-tree question

**Q: Has the user generated ANY paying revenue from organic in the last 90 days?**

- No → STAY FREE. Refuse paid entirely. Route to `offer-design` + `content-strategy`.
- Yes → continue.

## Branch 1: Offer + ICP validation

**Q1.1: Is the offer locked (price + scope + ICP)?**

- No → STAY FREE. Route to `offer-design`.
- Yes → continue.

**Q1.2: Has the ICP been validated with at least 3 paying customers?**

- No → STAY FREE. The ICP hypothesis isn't proven; ads will burn budget on the wrong audience.
- Yes → continue.

## Branch 2: Organic traction

**Q2.1: Has the user's organic content driven a conversion (signup, booking, purchase) in the last 90 days?**

- No → STAY FREE. Without organic signal, paid is guessing.
- Yes → continue.

**Q2.2: Is there a specific top-performing organic post or piece (clearly above baseline) in the last 90 days?**

- No → STAY FREE. Without a top-performer to model on, ad creative has no foundation.
- Yes → name it. This is the asset to amplify.

## Branch 3: Funnel readiness

**Q3.1: Does the user have a lead magnet with a landing page?**

- No → STAY FREE. Build the lead magnet first via `offer-design` + `copywriting`.
- Yes → continue.

**Q3.2: Is the landing page conversion rate above 5% organically?**

- No → STAY FREE. Fix the LP first; ads won't fix a broken page.
- Yes → continue.

**Q3.3: Is there a lifecycle email sequence catching new signups?**

- No → BUILD FIRST. Route to `email-sequence`. Without nurture, signups don't convert.
- Yes → continue.

**Q3.4: Is conversion tracking installed (UTM + pixel + conversion events)?**

- No → BUILD FIRST. Route to `analytics-tracking`.
- Yes → continue.

## Branch 4: Stage gate

**Q4.1: What's the user's stage?**

- Pre-Rev Builder → STAY FREE. Refuse paid entirely.
- Early Operator → continue with $5/day pilot cap.
- Stable Solo → continue with $20 to $50/day pilot allowance.
- Scaling Solo → continue with full scope.

## Branch 5: Risk archetype gate

**Q5.1: What's the user's risk archetype?**

- Bootstrap-Strict → STAY FREE. Refuse paid by default. Document override with warning if user explicitly requests.
- Low-Burn → continue, cap at 5% of monthly revenue.
- Calculated → continue, cap at 5% of monthly revenue (default).
- Aggressive → continue, no soft cap (still gated by validation).

## Branch 6: Family-floor + revenue mix

**Q6.1: Does the user have 1 to 2 hours/week of time available for ad management?**

- No → STAY FREE OR hire help (Scaling Solo only).
- Yes → continue.

**Q6.2: Is the user's revenue mix at or above their stage's $$$ + $$ floor?**

- No (below floor) → STAY FREE. Don't add complexity when fundamentals are off-floor.
- Yes → continue.

## Branch 7: Budget readiness

**Q7.1: Does the user have a budget they can sustain for 90 days?**

- No → STAY FREE. Pilots run 14 days minimum; scaling runs 30+; the user needs runway.
- Yes → continue.

**Q7.2: Is the budget within the stage + risk cap?**

- No → REDUCE BUDGET to the cap.
- Yes → continue.

## Branch 8: Last validation

**Q8.1: Has the user already tried the free equivalent of this campaign?**

- No → ROUTE TO FREE EQUIVALENT. (Examples in `paid-ads` SKILL.md.)
- Yes (and the free path is at capacity OR not converting at adequate rate) → PROCEED WITH PAID.

**Q8.2: Is the user's primary motivation for going paid "I want this to happen faster" rather than "I've maxed out organic"?**

- "Faster" → push back: "What's the cost of waiting 60 to 90 days for organic compounding?"
- "Maxed out organic" → proceed.

## Endpoints

### Endpoint A: STAY FREE

Recommend the free equivalent. Route to the relevant skill (`content-strategy`, `cold-email`, `outreach-drafter`, `email-sequence`, `social-content`).

Document the gap that closed the tree. Tell the user: "We can revisit paid in 30 to 90 days when [gap] is resolved."

### Endpoint B: PROCEED WITH PAID

Move into the campaign design (per `paid-ads` SKILL.md > Output format).

Set timeline:
- Day 1: Set up tracking + creative
- Day 2-14: Pilot at $5/day
- Day 14: First decision gate
- Day 15-44: Scale or hold or kill

Define kill + win criteria explicitly.

### Endpoint C: BUILD FIRST

Route to the build skill (`offer-design`, `email-sequence`, `analytics-tracking`, etc.) Defer paid until the build is done.

## Common decision-tree exits

### Exit at Q2.1 (no organic conversion)

Most common. Most solopreneurs ask about paid ads while organic is still untested. Refuse paid, route to `content-strategy` and `cold-email`.

### Exit at Q3.2 (LP conversion under 5%)

Second most common. The user has organic engagement but no working LP. Refuse paid, route to `copywriting` to rebuild the LP first.

### Exit at Q4.1 (Pre-Rev)

Hard refuse. Pre-Rev users should be in `offer-design` + `icp-discovery`, not ads.

### Exit at Q5.1 (Bootstrap-Strict)

Refuse by default. Document the user's stated archetype. Offer override path with warning.

### Exit at Q7.1 (no sustained budget)

Refuse. Pilots need at least $70 over 14 days. Without that, the user can't get directional signal.

### Exit at Q8.2 ("faster")

Coach moment. Speed-of-revenue isn't the right frame at Early Operator. Compounding is. Push back, route to `business-coach`.

## Re-entry timeline

If the tree exited, set a re-test date. Common cadences:

- Exit at Q2.1 (no organic): re-test in 60 days after `content-strategy` cycle
- Exit at Q3.2 (LP conversion): re-test in 14 to 30 days after LP rework
- Exit at Q4.1 (Pre-Rev): re-test after first 3 paying customers
- Exit at Q5.1 (Bootstrap-Strict): re-test annually OR on user-initiated archetype change
- Exit at Q7.1 (budget): re-test when revenue grows to support the budget

Don't get into a loop of "let me ask about paid again in 2 weeks." The user is asking the wrong question if they're chasing paid as the answer.

## How to communicate the exit

When refusing paid, the user often pushes back. Hold the line politely:

> "The gate isn't about whether paid 'could work.' The gate is about whether paid is the right move with your stage and current funnel. Spending money on a broken funnel doesn't speed up your business; it speeds up the loss.
>
> Here's the free path: [specific recommendation]. That gets you to the gate in [X weeks]. Then we revisit paid."

The user retains the right to override. If they override, log it and proceed with explicit warnings:

> "Logged: you overrode the [stage / archetype / budget] gate. Capping recommendations at conservative defaults. We'll review at day 14 with no judgment if we kill it."

## When the tree changes

The tree is updated when:

- The user moves between stages
- The user explicitly changes risk archetype
- The user's funnel matures (LP conversion above 5%, lead magnet validated)
- The user revisits the assessment

Update CLAUDE.md and re-run the tree on the next paid question.

# Budget Caps by Stage and Risk

Detailed matrix of budget caps with examples. Apply both the stage cap and the risk cap. Use the LOWER of the two.

## The matrix

| Stage \ Risk | Bootstrap-Strict | Low-Burn | Calculated | Aggressive |
|---|---|---|---|---|
| Pre-Rev Builder | $0 | $0 | $0 | $0 |
| Early Operator | $0 (refuse) | $5/day pilot | $5/day pilot | $20/day pilot |
| Stable Solo | $0 (refuse) | $20/day | $50/day | $150/day |
| Scaling Solo | $0 (refuse) | $50/day | $250/day | No soft cap |

These are CAPS, not recommendations. Start at the floor of each row, not the cap.

## The 5% rule overlay

For Low-Burn and Calculated archetypes, paid ad spend should not exceed 5% of monthly revenue for the first 12 months of paid testing.

For Aggressive archetypes, the 5% rule is advisory, not enforced.

For Bootstrap-Strict, the rule doesn't apply (no paid).

| MRR | Low-Burn max | Calculated max | Aggressive max |
|---|---|---|---|
| $0 | $0 | $0 | $0 |
| $2,000 | $100/mo | $100/mo | $200/mo (10%) |
| $5,000 | $250/mo | $250/mo | $500/mo (10%) |
| $10,000 | $500/mo | $500/mo | $1,500/mo (15%) |
| $25,000 | $1,250/mo | $1,250/mo | $5,000/mo (20%) |
| $50,000 | $2,500/mo | $2,500/mo | $15,000/mo (30%) |

## Use the lower of stage cap and 5% rule

Example: Stable Solo at $8K MRR, Calculated archetype.

- Stage cap: $50/day = $1,500/mo
- 5% rule: $400/mo
- Use LOWER: $400/mo = ~$13/day

The user spends $13/day, not $50/day.

## Pilot vs scaling cap difference

Pilots use a portion of the cap. Scaling uses the full cap.

### Pilot (first 14 days)

- 25% of monthly cap, spread over 14 days
- For $400/mo cap: pilot is $100 over 14 days = $7/day

### Scaling (post-pilot validation)

- Up to 100% of monthly cap
- Scale up by 25 to 50% per week max to avoid algorithm reset

## Examples by user profile

### Profile A: the example coaching business (current, May 2026)

- Stage: Stable Solo (transitioning from Early Operator at $5K MRR)
- Risk: Low-Burn (per assessment, chose burnout as worst case, family-floor is sacred)
- MRR: $5,000

**Calculation:**

- Stage cap: $20/day = $600/mo
- 5% rule: $250/mo
- Use LOWER: $250/mo = ~$8/day

**Recommendation:**

- Pilot at $5/day for 14 days = $70 total
- If pilot succeeds, scale to $8/day for 30 days = $240/mo
- Stay under the 5% rule throughout first 12 months
- Re-evaluate cap at the next assessment retake

### Profile B: Indie SaaS founder, Aggressive

- Stage: Stable Solo
- Risk: Aggressive
- MRR: $15,000

**Calculation:**

- Stage cap: $150/day = $4,500/mo
- 5% rule: not enforced for Aggressive ($2,250/mo at 15%)
- Use stage cap: $4,500/mo

**Recommendation:**

- Pilot at $20/day for 14 days = $280
- Scale to $50/day if pilot wins
- Push to $150/day at month 3 if scaling validates
- Watch CAC vs LTV ratio closely

### Profile C: Coach with corporate clients, Calculated

- Stage: Early Operator
- Risk: Calculated
- MRR: $3,000

**Calculation:**

- Stage cap: $5/day pilot
- 5% rule: $150/mo = $5/day
- Caps align: $5/day

**Recommendation:**

- Pilot at $5/day for 14 days = $70 total
- If pilot succeeds, hold at $5/day until MRR grows
- Re-evaluate at $5K MRR (Stable Solo transition)

### Profile D: Real estate solopreneur, Low-Burn

- Stage: Early Operator
- Risk: Low-Burn
- MRR: $4,500

**Calculation:**

- Stage cap: $5/day pilot
- 5% rule: $225/mo = $7/day
- Use LOWER: $5/day

**Recommendation:**

- Pilot at $5/day for 14 days
- Geographic targeting (local market only)
- Don't expand budget until MRR stabilizes at Stable Solo level

### Profile E: New SaaS founder, Bootstrap-Strict

- Stage: Early Operator
- Risk: Bootstrap-Strict
- MRR: $1,200

**Calculation:**

- Stage cap: $0 (Bootstrap-Strict refuses paid at any stage)
- 5% rule: not enforced (refused)

**Recommendation:**

- REFUSE PAID
- Route to `content-strategy` + `cold-email` for organic + outbound free paths
- Re-evaluate if user changes risk archetype

## How to communicate budget caps to users

Don't moralize about the cap. State the math.

> "Your stage caps you at $X/day. Your 5% rule caps you at $Y/day. Lower of the two is $Z/day. That's the budget we work with for this campaign. Below that floor (where we're starting at $5/day for the pilot), we get directional signal. Above $Z/day before validation, we burn money testing what could have been tested for less."

Let the user decide. Some users will override. Log it.

## Cap exception cases

Sometimes the cap doesn't make sense. Document the exceptions:

### Exception 1: Brand-keyword defense

If competitors are bidding on the user's brand name, defending costs 2 to 5% of revenue and is non-optional. Allow even at Bootstrap-Strict if revenue is being actively poached.

### Exception 2: Time-sensitive event

If the user has a real event (conference talk, product launch with limited availability, seasonal window), allow short-term budget exception up to 2x the cap for 7 to 14 days. Document the exception with end date.

### Exception 3: Retargeting only

Retargeting (warm audience) has higher conversion rate and can be more efficient than cold. Some users can run retargeting-only campaigns at smaller budgets ($3 to $5/day) outside the regular pilot framework.

### Exception 4: Lookalike testing for an established audience

If the user has 1000+ paying customers, lookalike audience testing can run smaller budgets ($3 to $5/day for cohort discovery) outside the main pilot.

## How caps change over time

Caps update when:

- The user moves between stages (annual or quarter review)
- The user revises risk archetype (re-take assessment)
- The user's MRR grows (5% rule updates monthly)
- The user explicitly overrides (logged)

Update CLAUDE.md and re-run the budget calculation on next paid question.

## Common cap mistakes

### Treating the cap as the recommendation

Don't recommend $50/day to a Stable Solo user just because the cap allows it. Recommend $5 to $15/day pilot, then scale.

### Ignoring the 5% rule for Calculated users

Calculated users without the 5% rule blow through revenue on tests. The rule exists because pilots fail often.

### Allowing Bootstrap-Strict to "try" paid

A "try" violates the archetype the user opted into. Hold the line. Offer override with explicit warning.

### Scaling too fast

Even if the cap allows $50/day, jumping from $5/day pilot to $50/day in week 2 trips the platform's learning phase. Scale by 25 to 50% per week max.

### Forgetting the production + time cost

Ad spend is one cost. Production + management time is another. A $5/day pilot still costs 1 to 2 hours/week of user time. At $100/hr opportunity cost, that's $400 to $XXX/month in time. The full cost of paid is ad spend + time. Surface it.

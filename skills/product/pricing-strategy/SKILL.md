---
name: pricing-strategy
description: This skill should be used when the user asks "should I raise prices", "what should I charge", "price test", "tier design", "money-back guarantee", "how much should this cost", "am I underpriced", "premium pricing", "my prices feel low", "I am getting too many price objections", "is my pricing scaring buyers away", or has marked pricing decisions in the assessment. Stage-gated. Pre-Rev should NOT touch pricing-strategy until the first offer is locked via offer-design. Risk-gauge integration is mandatory because raising prices is an expansion move that may conflict with stated risk comfort. Pairs with offer-design (sets price within the offer container), icp-discovery (validates willingness to pay), and positioning (signals the right price band).
version: 0.1.0
---

# Pricing Strategy

The skill that turns "I charge $X because that feels right" into a price grounded in market research, willingness to pay, unit economics, and the user's risk profile. Pricing is operational: it decides who buys, how much they pay, and whether the seller stays solvent.

Pricing is also the most common founder anxiety. Most solo founders are underpriced by 30-60% because they price from fear instead of from data. This skill closes that gap.

## When this skill triggers

Direct invocations:

- "Should I raise prices"
- "What should I charge"
- "Price test"
- "Tier design"
- "Money-back guarantee"
- "How much should this cost"
- "Am I underpriced"
- "Premium pricing"
- "My prices feel low"
- "I am getting too many price objections"
- "Is my pricing scaring buyers away"
- "Should I offer a discount"
- "How do I price a new tier"

Automatic invocations:

- After `offer-design` locks the offer container and price is the next decision
- After `icp-discovery` reveals willingness-to-pay data from interviews
- Quarterly review trigger (every 90 days, validate current pricing against market)

NOT for: designing the offer container (use `offer-design` first). NOT for: building the pricing page (use `copywriting` after price locks). NOT for: writing the proposal (use `proposal-writer` after price locks).

## Stage gate: when NOT to run pricing-strategy

Pricing-strategy is gated. Pre-Rev Builders should NOT run this skill until:

1. The offer container is locked via `offer-design`
2. The ICP is defined via `icp-discovery`
3. The positioning is locked via `positioning`

Without those three, pricing decisions are guesses. Pricing optimizes a price within an offer for an ICP positioned against an alternative. If any of the inputs are missing, the price decision is premature.

If the user invokes pricing-strategy without those three locked, route them:

> "Pricing decisions need an offer, ICP, and positioning to anchor against. Run /offer-design (the container), /icp-discovery (the buyer), and /positioning (the differentiator) first. Then I can help you price."

For users who already have an offer running (any stage above Pre-Rev), pricing-strategy is fair game.

## The pricing decision framework (5 inputs)

A price is the answer to 5 questions. Work through each.

### Input 1: Willingness to pay (WTP)

From `icp-discovery` customer interviews. What did 5-10 buyers say they would pay for this outcome?

If interview data does not exist, the user is guessing. Force them to do 3-5 quick "price-test interviews" before pricing:

> "Pick 3 people who match the ICP. Ask them: 'If I built X to solve Y, what would you expect to pay?' Note the range. That is your starting band."

Common WTP patterns:
- Anchor at 10-20% of perceived value created (a $50K-impact outcome supports $5-10K pricing)
- Anchor at 5x the cost of the cheapest comparable alternative (a $99 course supports $500-1,000 cohort pricing)
- Anchor at 50-80% of the highest-priced comparable alternative (against $25K executive coaching, this means $12-20K)

The WTP band is a research output. Treat it as a constraint, not a goal.

### Input 2: Unit economics

The seller's side of the math. The price must cover delivery cost AND produce profit margin.

Calculate:
- **Delivery hours per engagement:** sessions + prep + admin + async support
- **Per-engagement direct cost:** any software / contractor / tooling cost specific to this engagement
- **Capacity ceiling:** max concurrent engagements at the user's hours-per-week

Example (the example coaching business Foundation):
- Delivery: 12 calls × 60 min + 30 min prep × 12 + admin = ~26 hours per engagement over 90 days
- Direct cost: ~$50 (Zoom share, document hosting)
- Capacity: 4-5 active engagements at any time (at 12-15 hrs/wk in business)

At $X,XXX / 26 hours = ~$92/hr blended. At 4 active engagements × 12 weeks: $9,600 of MRR equivalent. Margin: very high (low overhead).

The math must work at the price. If it does not, either raise price, trim scope, or accept lower margin.

### Input 3: Comparable market pricing

What do similar offers cost in the market today?

Build a quick comparison sheet. 5-10 alternatives, organized by:

- Direct competitors (other solo coaches with similar positioning)
- Indirect competitors (executive coaching firms, courses, books)
- Substitute solutions (internal company training, peer mentorship, hiring a senior)

For each, capture:
- Price + structure
- Scope (duration, deliverables)
- Positioning (who they serve)

This becomes the "anchor map." Your price lands somewhere on this map. Pick the anchor deliberately.

Anchoring strategies:
- **Premium anchor:** price at the high end of the comparable range. Signals quality and selectivity. Risk: longer sales cycle, fewer leads convert.
- **Mid-market anchor:** price at the median. Safest position. Risk: indistinguishable from competition.
- **Value anchor:** price below the median but above the low-end "junior" tier. Risk: buyers may perceive junior.
- **Disruption anchor:** dramatically below comparable. Risk: looks like a deal-too-good-to-be-true OR commoditizes the offer.

Most Pre-Rev to Stable Solo founders should anchor at "mid-market" or "value." Premium anchoring requires substantial track record + positioning sharpness.

### Input 4: The seller's risk profile

Pricing decisions interact with the user's risk comfort from `risk-gauge`.

If the user has marked themselves as:
- **Low-burn** / **Bootstrap-Strict:** prefer pricing that fills capacity quickly. Higher volume, lower margin acceptable. Avoid pricing that produces 6+ month dry spells.
- **Calculated:** balance volume and margin. Price moves are tested with small experiments (e.g., next 5 prospects at +20%).
- **Aggressive:** price for max margin. Accept 30-50% close rate drop in exchange for higher per-engagement revenue.

Raising prices is an expansion move. Check the risk-gauge before recommending a 25%+ increase. If the user's runway is tight or stated risk is low, smaller incremental tests (10-15%) are appropriate.

### Input 5: The user's stated revenue goal

From `CLAUDE.md > Goals` or `assessment Section 9`.

Calculate: at the current close rate, current pipeline volume, and current price, does the user reach the stated goal?

- If yes, hold pricing steady. Focus elsewhere.
- If no, the gap is either:
  - Pipeline volume too low (route to `outreach-drafter`, `content-strategy`, marketing skills)
  - Close rate too low (route to `discovery-call-prep`, `proposal-writer`, sales skills)
  - Price too low for the volume the user can sustain (this skill applies)

Often the answer is: increase the price by 20-30% and accept a 10-15% close-rate drop. Net revenue goes UP, capacity used goes DOWN. Win-win for solo capacity-constrained sellers.

## The pricing decision

After all 5 inputs are gathered, recommend a price. Three options:

### Option A: Hold current pricing

When:
- Close rate is healthy (above 30% on qualified leads)
- Pipeline is full
- User is at or approaching capacity
- Revenue goal is on track
- No specific reason to test a change

Recommendation:
> "Hold current pricing for the next 90 days. Revisit after 5 more closed engagements or after the next quarterly review."

### Option B: Incremental test (+10-25%)

When:
- Close rate is high (above 50% on qualified leads): buyers are not pushing back on price
- Pipeline has room
- User has tested the offer with 3+ paid engagements
- WTP research suggests room at the top

Recommendation:
> "Test +15% with the next 5 prospects. Track close rate. If close rate stays above 30%, lock the new price. If it drops below 25%, roll back."

### Option C: Material reprice (+25-50%+ or restructure)

When:
- User is significantly underpriced vs. market AND WTP data
- Positioning has moved (new credibility, new outcome data, new testimonials)
- User wants to reduce capacity load (fewer-but-better clients)
- Pricing is causing operational problems (too many clients to deliver well)

Recommendation:
> "Move from $X to $Y, effective for new engagements after [date]. Honor existing clients at old price. Communicate to existing prospects in pipeline within 2 weeks."

## Pricing tiers (when to have more than one)

Many founders rush to build tiered pricing before validating a single tier. Push back.

### Pre-Rev: ONE tier

No tiers. One offer at one price. Validate first.

### Early Operator: ONE tier or ONE + ladder

Either keep one offer OR introduce a SECOND offer at a different scope (not "Bronze / Silver / Gold", fundamentally different scope).

Example (the example coaching business at Early Operator):
- Primary: The flagship offer, $X,XXX, 90 days
- Secondary: Ongoing Coaching, $250-350/mo, post-Foundation

Two offers serving two stages. Not tiers of the same thing.

### Stable Solo: 2-3 tiers possible

If the user has validated demand for both scope-up (premium) and scope-down (entry-level), tier design becomes appropriate. Each tier follows the `offer-design` 6-part rules. Each tier must serve a meaningfully different buyer or moment.

### Scaling Solo: Full tier ladder

Entry / mid / premium ladder. Each tier has its own positioning + price + scope. Each tier is its own offer-design output.

### Anti-pattern: Bronze / Silver / Gold tiers

Three tiers of the same thing (same scope, more time, more access) usually trick buyers into picking middle. The "decoy effect" is real but cheap. It works at first, then erodes trust as buyers realize Silver and Gold are arbitrarily padded versions of Bronze.

If the user wants tiers, force differentiation:
- Different scope (1:1 vs. group vs. self-paced)
- Different duration (90 days vs. 6 months vs. annual)
- Different buyer (manager vs. director vs. VP)

Not arbitrary "more access for more money" tiers.

## Money-back guarantees and pricing

Money-back guarantees increase close rate without increasing refund rate (for ICP-fit buyers). They are mostly free upside.

### When to add a guarantee

- 1:1 coaching, cohort coaching, retainer engagements: 30-day money-back is standard
- Productized services: milestone-based guarantee (refund if seller misses deadline)
- Courses: 7-30 day money-back, no questions asked
- High-ticket ($5K+): consider conditional guarantees ("complete X work, attend Y sessions; if no value, refund")

### When NOT to add a guarantee

- Productized deliverable where work happens upfront in week 1 (refund risk is high)
- Group cohorts where one refund disrupts the cohort dynamic (cap at first 2 sessions)
- Buyers known to be refund-seekers (ban from the offer)

### Refund rate to expect

For ICP-fit buyers with a clear offer:
- 1:1 coaching: 0-5% refund rate
- Cohort coaching: 5-10% refund rate
- Courses: 5-15% refund rate
- Productized services: 1-3% refund rate

If actual refund rate exceeds these bands, the offer is misfit (ICP wrong, positioning wrong, or scope vague).

## Pricing communication on the website

Two schools of thought:

### Show price publicly (recommended for most stages)

Pros:
- Buyers pre-qualify themselves
- Reduces unqualified discovery call volume
- Builds trust (seller respects buyer's time)
- Forces seller to commit to a price (no scope-creep negotiating)

Cons:
- Some buyers price-shop without reading positioning
- Competitors see your price

For 90% of solo coaches, agencies, and service businesses: show the price.

### Hide price ("discuss on call")

Valid when:
- Price genuinely varies based on scope (true custom engagements)
- The sales motion requires high-trust 1:1 conversation
- The market expects opaque pricing (enterprise sales, executive recruiting, fund managers)

Invalid when:
- The seller is hiding because they do not know what to charge (route to pricing-strategy)
- The seller wants to negotiate based on buyer's perceived ability to pay (this erodes trust)
- The seller has shame about the price (this signals you are underpriced)

If hiding price, state the price band on the website ("Engagements start at $25,000") to anchor expectations and filter unfit buyers.

## Pricing communication on discovery calls

The price reveal is operational. Two patterns:

### Pattern A: State price early (recommended for transparent pricing)

In the first 10 minutes of discovery, name the price.

> "The flagship offer is $X,XXX over 90 days. Either pay-in-full or three monthly payments of $800. 30-day money-back guarantee. Before we go deeper, does that price band work for your situation?"

This filters wasted calls. Buyers either:
- Say yes, continue to scope discussion
- Say no, end the call early (saves both parties time)
- Push back on price, surface objections immediately (better than at the proposal stage)

### Pattern B: Diagnose then propose price (for custom pricing)

In custom-scoped engagements:
- Spend first 20 minutes diagnosing the buyer's situation
- Confirm the buyer's problem fits the seller's offer
- Then propose a price band based on the diagnosis
- Send formal proposal within 48 hours

For most solo founders, Pattern A is operationally simpler and produces better results.

## Stage-aware pricing recommendations

### Pre-Rev Builder

- Do not over-engineer pricing pre-revenue
- Pick a price that anchors at mid-market for comparable offers
- Use 30-day money-back to de-risk for buyers
- Test with the first 3 paying clients before changing
- One offer at one price (no tiers)

### Early Operator (<$5K MRR)

- Validate the v0.1.0 price against actual close rate
- If close rate is above 50%, the price is too low: test +15-25%
- If close rate is below 20%, either price is too high OR positioning / ICP / offer is misfit (rerun those first)
- Hold for 90 days after any price change
- Consider adding ONE secondary offer (the Ongoing Coaching pattern at Langley)

### Stable Solo ($5-25K MRR)

- Pricing is mature. Quarterly review for adjustments.
- Consider tier design if demand exists at different price bands
- Refund rate should be under 5% for 1:1 coaching, under 10% for cohorts
- Track close rate per channel (cold outreach vs. inbound vs. referral): pricing may need to differ per channel
- Build the second offer if you have not (entry-level OR premium, not both at once)

### Scaling Solo ($25K+ MRR)

- Full pricing ladder makes sense
- Consider value-based pricing (% of buyer outcome) for premium tier
- Track lifetime value per ICP segment
- Consider raising prices annually as a default (capture inflation + accumulated credibility)

## Working with other skills

- **Imports from:** `icp-discovery` (WTP data), `offer-design` (the container being priced), `positioning` (the price-band signal), `risk-gauge` (the user's expansion comfort), `saas-metrics-coach` (unit economics analysis if SaaS)
- **Hands off to:** `copywriting` (pricing page), `proposal-writer` (custom proposals at the locked price), `cold-email` and `outreach-drafter` (price-aware messaging)
- **Updates:** `CLAUDE.md > Offer + ICP` section, `docs/pricing.md`
- **Triggered by:** quarterly review, post-`offer-design`, post-`icp-discovery` refresh

## Anti-patterns to refuse

### "Just tell me what to charge"

Push back. Pricing without inputs (WTP, comparable market, unit econ, risk profile, goal) is guessing.

> "I can guess, but the guess might be wrong by 50% in either direction. Let me walk you through the 5 inputs. It takes 30 minutes and the price will be defensible."

### "Match my competitor"

Push back. Matching pricing on price-only competes on commodity.

> "If you price-match, you compete on the dimension competitors are best at. Better: pick a price that fits your positioning, scope, and capacity. The competitor's price is a reference, not a target."

### "Raise prices by 10x because [course guru] said to"

Push back. Course-guru pricing advice is for the course guru's customers, not yours.

> "Pricing depends on your ICP's WTP, your unit econ, your positioning. A 10x price move without those inputs is a 10x close-rate collapse. Let's start with +15-25% and test."

### "I do not want to put my real price; I want to negotiate"

Push back. Negotiation-based pricing erodes trust and slows the sales cycle.

> "Discount-from-list-price negotiation signals the list price is fake. If you are willing to take 80%, the real price is 80%. State the real price and stop negotiating."

### Underpricing because the founder feels junior

This is the most common pricing failure for first-time entrepreneurs. The founder prices from imposter-syndrome, not data.

Counter-frame:
> "Your willingness to pay research shows buyers expect to pay $3-5K. You are charging $1,200. You are leaving $2-4K per engagement on the table because of your feeling, not their feeling. Move to $X,XXX and test."

### Raising prices without communicating

If raising prices, communicate clearly:
- New prospects: effective immediately
- Active proposals: honor for 30 days
- Existing clients: grandfathered at old price for current engagement, new price applies to renewal

Silent price increases destroy referral relationships.

## Common traps

### Pricing for the dream buyer vs. the real buyer

If the user prices for the buyer they wish they had ("a CEO at a Series B funded company") instead of the buyer they have ("a solo coach at $3K/mo"), the pricing will not match the actual close rate.

Force: price for the buyer in your pipeline today. Move pricing up as the actual buyer profile shifts.

### Tiered pricing that "anchors high"

The classic Russell Brunson trap: build three tiers where the highest tier is unaffordable, the lowest tier is undersold, and the middle tier is "the obvious choice."

This works for first-time buyers but erodes trust as buyers realize the high tier was a decoy.

Better: design tiers that genuinely serve different buyers. Buyer A wants the entry tier. Buyer B wants the premium. Both are legitimate offers.

### Discount-as-default

Some founders default to "$X,XXX, but I can do $1,500 if you sign today." This signals:
- The price was inflated
- The seller is desperate
- The buyer should always negotiate

Stop. State the price. Stand on it. If you discount, do it for a specific reason (new market test, mission-aligned non-profit) and document the reason.

### Pricing changes without operational change

If the user raises prices but does not change scope, positioning, or quality, buyers will notice. Price increases should pair with one of:
- Tighter scope (less for the same money? No, more for the same money OR same for more money)
- New deliverable added (a workbook, a 30-day check-in, a lead-gen assessment access)
- New positioning frame (testimonial credibility, new outcome data)
- New tier (an entry option for budget buyers)

Standalone price increases work briefly but erode trust if there is no operational change.

### Forgetting the family floor in pricing math

If the new price requires more delivery hours per engagement to justify (e.g., adding 24/7 support to justify a price increase), check the family floor.

> "The new price requires you to add 24/7 async support. Your family floor is M-F 4-7pm protected. The 24/7 commitment will eat that. Either price differently or scope differently. The family floor is the floor."

## Pricing versioning

Each pricing decision has a version. Save to `docs/pricing.md` with:

```markdown
# Pricing: [Offer Name]
v1.0
Effective: [YYYY-MM-DD]
Source: pricing-strategy decision, [date]

## Current pricing

- [Tier 1]: $[X]
- [Tier 2]: $[Y] (if applicable)

## Effective date for changes

- New prospects: [date]
- Active proposals: honored until [date]
- Existing clients: grandfathered

## Inputs (for reference)

- WTP band from icp-discovery interviews: $[range]
- Unit econ: $[X] / engagement, [Y] hours, [Z] margin
- Comparable market range: $[low] to $[high]
- Risk profile: [Low-Burn / Calculated / Aggressive]
- Revenue goal: $[X] in [N] days

## Decision rationale

[1-2 paragraphs: why this price now]

## Next review

[YYYY-MM-DD]
```

## Additional Resources

### Reference files

- **`references/wtp-research-templates.md`**: scripts and email templates for running quick willingness-to-pay research with 3-5 ICP-fit interviewees. Free-tier methods (LinkedIn DM, email, peer ask) before paid research.
- **`references/pricing-anchors-by-stage.md`**: pricing-band reference table for common business models at each NightShiftOS stage (Pre-Rev to Scaling Solo). Includes the "junior trap" price band to avoid and the "premium ceiling" price band to test against.

### Example files

- **`examples/example-pricing.md`**: full pricing decision log for The flagship offer ($X,XXX). Shows the 5 inputs at decision time, the comparable market analysis (executive coaching, courses, internal training, doing nothing), and the rationale for the locked price. Real-world reference for solo 1:1 coaching pricing.

### Related skills

- `skills/product/offer-design/SKILL.md`: must lock before pricing decisions; pricing exists within the offer container
- `skills/product/icp-discovery/SKILL.md`: provides willingness-to-pay data
- `skills/product/positioning/SKILL.md`: informs the price band (premium positioning → premium price)
- `skills/posture/risk-gauge/SKILL.md`: validates price changes against stated risk comfort
- `skills/posture/free-first-checker/SKILL.md`: validates if pricing optimization should happen before free-tier optimization
- `skills/coach/saas-metrics-coach/SKILL.md`: unit economics analysis for SaaS / subscription pricing
- `skills/marketing/copywriting/SKILL.md`: writes the pricing page after pricing locks
- `skills/sales/proposal-writer/SKILL.md`: uses locked pricing in custom proposals

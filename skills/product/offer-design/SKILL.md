---
name: offer-design
description: This skill should be used when the user asks to "design my offer", "package my service", "what should I sell", "offer design", "scope my engagement", "build my package", "structure my service", "design my product", "how do I price this engagement", "I keep saying yes to scope creep", or has marked first-offer creation as a goal in the assessment. Builds a complete offer package: deliverable, scope, price band, timeline, guarantee, and what is explicitly NOT included. Pre-Rev priority. Pairs with icp-discovery (the buyer), positioning (the differentiator), and pricing-strategy (the number). Stage-aware: Pre-Rev locks v1; Stable Solo iterates v2; Scaling Solo splits into a product ladder.
version: 0.1.0
---

# Offer Design

The skill that turns "I do coaching" into a package a buyer can say yes to. An offer is more than a price. It is the contract between what the buyer wants and what the seller can deliver inside a real container of time, scope, and money.

Bad offers overpromise (12 months of unlimited access for $500) or underpromise (a vague "consulting engagement" with no timeline) or are unsellable because they ask the buyer to figure out scope themselves. Good offers fit on a single page, can be quoted in one sentence, and survive 30 days of real client work without the founder regretting the math.

## When this skill triggers

- "Design my offer"
- "Package my service"
- "What should I sell"
- "Scope my engagement"
- "Build my package"
- "Structure my service"
- "How do I price this engagement"
- "I keep saying yes to scope creep"
- "My clients keep asking for more"
- "I do not know what to charge"
- Auto-activated when assessment Section 6 (Offer + ICP) is incomplete or contains vague offer language
- Auto-activated when assessment Goal Section 9 contains "first offer", "first paying client", "launch", "package my service"

NOT for: pricing the offer (use `pricing-strategy` after offer locks). NOT for: positioning (use `positioning` first). NOT for: writing the sales page (use `copywriting` after offer locks). NOT for: building the proposal document (use `proposal-writer` after offer locks).

## What an offer is

An offer is a 6-part package. All 6 parts must be specific. Missing any part creates scope ambiguity, which kills close rate and creates client regret.

### The 6 parts of an offer

1. **Deliverable.** What the buyer receives.
2. **Scope.** What is included AND what is explicitly NOT included.
3. **Timeline.** When work starts, milestones, and end date.
4. **Price + structure.** Total price, payment terms, refund policy.
5. **Guarantee.** What the seller promises and what happens if it does not happen.
6. **The "not for you" line.** Who should NOT buy this offer.

Missing any of the 6 = offer is incomplete. The skill walks through each part in order.

## The offer-design process (6 parts, coach-mode)

Run each part as a separate question. Lock before moving on. Do not let the user jump to price (Part 4) before scope (Part 2) is locked.

### Part 1: The deliverable

> "What does the buyer literally receive when they buy this? Not 'value.' Not 'transformation.' What lands in their inbox, on their calendar, in their hands?"

Push back on:
- "Transformation"
- "Confidence"
- "Clarity"
- "Results"
- "An experience"
- "Access to me"

These are outcomes or feelings. The deliverable is the operational artifact a buyer can point to.

Acceptable:
- "12 weekly 60-min coaching calls (Zoom), recorded, with shared notes doc"
- "A 30-page playbook PDF + 6 weekly Q&A calls + Slack access for 90 days"
- "A redesigned website (10 pages) + 90 days of conversion testing + monthly report"
- "Quarterly 90-min strategy sessions + monthly 30-min check-ins + 48hr async email support"
- "A 4-week cohort: 4 live teardown sessions + Slack community + workbook"

The deliverable answers "what arrives." It should be quotable in 1-2 sentences.

Lock the deliverable.

### Part 2: The scope

> "What is included? What is explicitly NOT included? Where does the engagement end?"

Two lists. Both required.

#### Included list

Everything the buyer gets. Be specific.

Example (the example coaching business Foundation):

Included:
- 12 weekly 60-min coaching calls (Zoom), recorded
- Shared Foundation document built collaboratively over 90 days
- Async email/text support (response within 24 business hours)
- Pre-session reflection form before each call
- 30-day post-engagement check-in call
- Access to the example coaching business lead-gen assessment assessment

#### Not included list

What the buyer does NOT get. Be explicit.

Example:

Not included:
- Weekend or evening sessions (Family Floor: M-F, 9am-3pm PT only)
- Travel to client offices (remote-only delivery)
- Group / team coaching for the buyer's reports (separate offer)
- Recruiting or hiring support (out of scope)
- Marketing or sales lead-gen advice (out of scope)
- Therapy or mental health treatment (recommend qualified professional if needed)

The not-included list is the scope-creep firewall. Every line on it prevents a future "but I thought this included..." conversation.

Lock the scope.

### Part 3: The timeline

> "When does work start, what are the milestones, and when does it end?"

Three sub-parts:

#### Start

- Specific kickoff trigger (signed agreement + first payment received → calendar invite for kickoff call within 5 business days)

#### Milestones

- Week 1: Kickoff + intake
- Week 4 / Week 8: Mid-engagement review
- Week 12: Wrap-up + Foundation handoff
- Week 16: 30-day post-engagement check-in

#### End

- Specific end date (90 days from kickoff)
- What happens at end (Foundation document handed off, no auto-renew, optional Ongoing Coaching at $250-$350/mo for grads)

The timeline must be operationally specific. "Ongoing engagement" is not a timeline. "Up to 1 year" is not a timeline (it is an upper bound with no commitment).

Lock the timeline.

### Part 4: The price + structure

This part hands off to `pricing-strategy` for the actual number. But the structure decisions live in offer-design:

#### Price band (rough, refined by pricing-strategy)

- Single price (e.g., $X,XXX) vs. range ("starts at $X,XXX")
- Anchor decision: low / mid / high in the comparable market

#### Payment structure

- One-time vs. recurring
- Pay-in-full discount (if any)
- Installment options (and any interest / surcharge)
- Currency (USD default for US-based; specify if otherwise)

#### Payment terms

- Net days from invoice (Net 0 / Net 7 / Net 30)
- Late payment policy (suspended access after N days)
- Refund policy (see Part 5)

Example (the example coaching business Foundation):

```
PRICE: $X,XXX total
STRUCTURE: Pay-in-full ($X,XXX) OR 3 monthly installments ($800 × 3, no surcharge)
PAYMENT TERMS: Net 0 (due at kickoff), Stripe or ACH
REFUND POLICY: 30-day money-back guarantee (see Part 5)
```

Lock the price + structure (route to `pricing-strategy` for the number itself if not yet locked).

### Part 5: The guarantee

> "What do you promise? And what happens if you do not deliver?"

A guarantee is operational. It tells the buyer they can de-risk the decision.

Three guarantee types:

#### Performance guarantee

The seller commits to a specific outcome. Money back if outcome does not happen.

Example: "30% reduction in Meta CPA in 90 days, or full refund."

Operational risk: if the outcome depends on the buyer's actions, this guarantee is hard to enforce with honesty.

#### Time-based money-back

Buyer can request refund within N days for any reason.

Example: "30-day money-back guarantee, no questions asked."

This is the most buyer-friendly. Lowest seller risk if the buyer is genuinely ICP-fit (they will not refund work they value).

#### Effort guarantee

Seller commits to specific delivery (number of calls, hours, deliverables). If the seller fails to deliver, refund. If the buyer fails to engage, no refund.

Example: "If I miss more than one weekly call without 48-hour notice, the engagement ends with full refund of unused weeks."

#### No guarantee

Some offers do not have one. State explicitly: "No refund. Engagement is fixed-scope and pre-paid."

This is honest but reduces close rate. Use sparingly (e.g., one-time deliverables like a productized service where work happens upfront).

For 1:1 coaching and service businesses at Pre-Rev to Stable Solo: a 30-day money-back guarantee almost always increases close rate without meaningful refund risk. Use it.

Lock the guarantee.

### Part 6: The "not for you" line

> "Who should NOT buy this offer?"

This is the operational application of the anti-ICP from `icp-discovery`. State it in the offer document so the wrong buyer self-selects out.

Example (the example coaching business Foundation):

```
THIS IS NOT FOR YOU IF:
- You are looking for a thinking partner without a specific role to improve in
- You are a VP / Director / C-suite with 5+ years of leadership experience (the flagship offer is built for first-time managers)
- You want unlimited 24/7 access (the engagement runs weekly, with async support during business hours only)
- You are unwilling to do the pre-session reflection work between calls
- You are looking for a course or framework you can consume passively (this is a practice, not a curriculum)
```

The not-for-you line operates as a forcing function. It reduces close rate on bad-fit buyers. It increases close rate on good-fit buyers (who appreciate the seller's clarity).

Lock the not-for-you line.

## The offer one-pager output

After all 6 parts lock, compose into a one-pager. This is the document the user sends to prospects, includes in the proposal, and uses as the spec on the pricing page.

Save to `docs/offer-<offer-name>.md`. Standard template:

```markdown
# [Offer Name]
v1.0
Locked: [YYYY-MM-DD]

## The pitch (1 sentence)

[The full positioning statement, or a derived 1-sentence version of what this offer is]

## What you get (deliverable)

- [Item 1]
- [Item 2]
- [Item 3]
- [Item 4]
- [Item 5]

## Included

- [Specific item with detail]
- [Specific item with detail]
- [Specific item with detail]

## Not included

- [Specific item]
- [Specific item]
- [Specific item]

## Timeline

- **Start:** [trigger + first action]
- **Milestones:** [list]
- **End:** [specific date or trigger]
- **Post:** [what happens after end]

## Investment

- **Price:** [total]
- **Structure:** [single payment / installments]
- **Payment terms:** [Net days, method]

## Guarantee

[Guarantee text]

## This is not for you if

- [Anti-fit reason 1]
- [Anti-fit reason 2]
- [Anti-fit reason 3]

## Next step

[CTA: Book a call / Sign agreement / Pay invoice]
```

## The 30-day reality test

After designing the offer, run this test before going live:

1. **Can you deliver this offer 5 times in parallel without burning out?**
   If no, scope is too generous. Trim.

2. **Does the math work at your stated hour count?**
   Calculate: (Hours per engagement / week) × (Active engagements at any time) ≤ (Hours per week available for client delivery).
   For Langley at 12-15 hrs/wk in business: 1 hour/wk per client × 5 active = 5 hrs/wk delivery + 5-7 hrs/wk biz dev + 2-3 hrs/wk admin. Works.

3. **Does the offer survive scope creep from a friendly client who wants more?**
   The not-included list is the test. If the user cannot say no to a friendly ask, the not-included list is too vague.

4. **Could a prospect quote your offer back to you in 1 sentence after one call?**
   If no, the offer is too complex or the not-included list is missing.

5. **Does the price + scope match the buyer's willingness to pay (from icp-discovery)?**
   If price is 2-3x WTP, the offer will not close. If price is 0.5x WTP, the offer is leaving money on the table and signaling junior.

If all 5 tests pass, the offer is live. If any fail, revisit the relevant part.

## Stage-aware adjustments

### Pre-Rev Builder

This is the foundational skill at Pre-Rev. Without an offer, there is nothing to sell. Without scope, every sales conversation drifts.

Required depth:
- All 6 parts answered
- Save as v0.1.0 first offer
- Lock for 30 days, then iterate based on first 3-5 paid engagements

Common Pre-Rev failures:
- Designing 3 offers before the first paid engagement (decision paralysis)
- Designing an offer for a buyer who has not been validated (back to `icp-discovery`)
- Pricing without anchoring to market (back to `pricing-strategy`)
- Not-included list is too vague ("scope creep killer" rule)

Force: pick ONE offer, ship it, learn from the first 3 paying clients.

### Early Operator (<$5K MRR)

User has 1-5 customers using v0.1.0 of the offer. Iterate to v1.0 based on real data.

Required depth:
- All 6 parts validated against actual delivery
- Scope adjustments based on what scope-creep showed up in delivery
- Pricing adjusted based on close rate (route to `pricing-strategy`)
- Guarantee tested (did anyone refund? was the guarantee operational?)

### Stable Solo ($5-25K MRR)

User has 10-30+ engagements. Offer is mature. May benefit from a second tier.

Required depth:
- v1.0 of primary offer is locked and operationally proven
- Consider a SECOND offer:
  - Lighter / faster version (entry-level)
  - Heavier / longer version (premium)
  - Group version (cohort-based for scale)

At this stage, two offers is the right depth. Three or more splits the founder's attention and dilutes both.

### Scaling Solo ($25K+ MRR)

Offer ladder design. The user can sustain multiple price points and durations.

Required depth:
- Primary offer (mid-tier, default sale)
- Entry offer (low-tier, top-of-funnel)
- Premium offer (high-tier, retention or expansion sale)
- Anti-offer (explicit refusal, e.g., "We do not do hourly consulting")

The ladder lets the buyer enter at their comfort and graduate up. Each offer in the ladder follows the 6-part design.

## Working with other skills

- **Imports from:** `icp-discovery` (the buyer), `positioning` (the differentiator), `pricing-strategy` (the price band)
- **Hands off to:** `copywriting` (sales page), `proposal-writer` (custom proposals derived from the offer one-pager), `cold-email` and `outreach-drafter` (offer-aware messaging)
- **Updates:** `CLAUDE.md > Offer + ICP` section, `docs/offer-<name>.md`
- **Re-runs:** every 90 days, or after first 5 engagements, or when scope creep becomes a pattern

## Anti-patterns to refuse

### "Let's just do a custom proposal for each client"

Push back. Custom proposals are an early-stage trap. They:
- Slow down the sales cycle (3-7 day proposal turnaround)
- Confuse the buyer (no anchor to compare against)
- Create operational chaos (every engagement is different)
- Prevent the user from learning what scope works

Force: build 1-3 productized offers. Custom proposals can be variants, not the default.

### "I do not want to put a price publicly"

Sometimes valid (high-trust, complex sales). Usually a hedge.

Push:
> "Hiding price signals you do not know what you are worth, or you do not trust the buyer to decide. What is the reason to hide?"

If the reason is "I want to qualify the buyer first," route them to a discovery call with a clear price band stated in the booking form. If the reason is "I do not know the right price yet," route to `pricing-strategy`.

### "I want to offer everything that any client might need"

Push back. Unlimited offers are unsellable and undeliverable.

> "An offer is a container. Containers have boundaries. What is the smallest box that delivers the outcome reliably?"

### "I do not want to commit to a timeline"

Push back. No timeline = no offer.

> "If the engagement could last 1 day or 1 year, the buyer has no reference for the price. Pick a timeline. We can adjust later based on real data."

### Offer that overpromises on the user's hours

If the math does not work (e.g., 4 hours of weekly delivery per client × 8 clients = 32 hrs/wk, when the user has 15 hrs/wk total), refuse.

> "At 4 hours per client per week and 15 hours per week total, you can serve 3 clients max. The offer needs to fit your hour budget."

Either trim the deliverable, raise the price (fewer clients at higher price), or revisit the user's hours-per-week (back to `family-floor`).

### Offer that is just a course in disguise

If the user describes a "coaching engagement" that is a self-paced video course they sell at coaching prices, push back. The buyer is paying for accountability and customization, not the videos.

> "Is this a course or a coaching engagement? If it is a course, price it at course prices and call it a course. If it is coaching, the engagement needs live touchpoints."

## Common traps

### Scope creep killer: vague "support" lines

"Email support" is too vague. Specify: "Email support, response within 24 business hours, capped at 3 threads per week, business hours only (M-F 9am-3pm PT)."

The specificity is what prevents the 2am text on a Saturday.

### Bonus stacking (the Russell Brunson trap)

Some offer-design playbooks recommend stacking "bonuses" to inflate perceived value. This is a marketing trick that erodes trust.

If the user proposes 5 bonuses worth "$10,000" stacked on a $497 offer, refuse.

> "Bonus stacking signals scarcity-marketing. It also creates delivery obligations. Pick what is core. Drop the rest. The offer should hold up without inflated bonuses."

### Tiers that are not meaningfully different

If the user designs "Bronze / Silver / Gold" tiers where Silver and Gold are the same except for an extra call, refuse.

> "Tiers should reflect different scopes for different buyers. Not three flavors of the same thing. Either there is a real reason to have three tiers, or there is one offer."

### The "starter offer" trap

Some users try to build a low-priced "starter offer" to get buyers in the door, intending to upsell.

This works in productized services (e.g., $99 audit → $5K engagement) but breaks in coaching (the low-priced "intro coaching" is the same delivery as the real coaching). Be honest about what the offer is.

### Forgetting the post-end transition

What happens after the 90 days? Auto-renew? Optional renewal? No follow-on?

If not specified, the buyer asks. If the answer is improvised, it is undersold or oversold.

State explicitly. Example: "After 90 days, optional Ongoing Coaching at $250/mo for grads. Not auto-renewed. Separate decision."

### Pricing-by-comparison without market research

If the user prices by guessing what competitors charge, the price will be wrong. Route to `pricing-strategy` for real market research and willingness-to-pay analysis.

## Offer versioning

Each offer has a version. Update when:

- Scope changes (added or removed deliverables)
- Price changes (track separately in `pricing-strategy`)
- Timeline changes (engagement length, payment structure)
- Guarantee changes
- Anti-fit list grows

Save versions to `docs/offer-archive/<offer>-v<N>-<date>.md`. Track what changed and why.

## Additional Resources

### Reference files

- **`references/offer-onepager-template.md`**: the markdown template for the offer one-pager, ready to populate from the 6 parts. Includes formatting hints for sales-page conversion, proposal use, and pricing-page use.
- **`references/offer-types-by-business-model.md`**: guide to offer design across business models (1:1 coaching, group cohorts, productized services, agencies, course-based, hybrid). Shows how the 6 parts adapt per model.

### Example files

- **`examples/example-offer.md`**: fully populated offer one-pager for the example coaching business's flagship engagement ($X,XXX, 90 days, 30-day money-back). Real-world example for solo 1:1 coaching at Early Operator stage.

### Related skills

- `skills/product/icp-discovery/SKILL.md`: defines the buyer the offer is built for
- `skills/product/positioning/SKILL.md`: provides the differentiator the offer expresses
- `skills/product/pricing-strategy/SKILL.md`: sets the specific price for Part 4
- `skills/sales/proposal-writer/SKILL.md`: uses the offer one-pager as the basis for proposals
- `skills/marketing/copywriting/SKILL.md`: uses the offer to write the pricing page and landing page
- `skills/ops/family-floor/SKILL.md`: validates that the offer's delivery hours respect protected time

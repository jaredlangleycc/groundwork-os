---
name: positioning
description: This skill should be used when the user asks for "positioning", "position my offer", "how am I different", "positioning statement", "vs my competitors", "what makes me different", "my elevator pitch", "what do I tell people I do", "I sound like everyone else", or has marked positioning-clarity as a goal in the assessment. Produces a single locked positioning statement in the form "[I/We] help [ICP] [outcome] by [approach], unlike [alternative] which [shortcoming]." Forces specificity over abstraction. Pre-Rev priority skill. Hands off to brand-strategist for positioning-into-brand work, copywriting for headline application, and outreach-drafter for sales application.
version: 0.1.0
---

# Positioning

The skill that turns "I help businesses grow" into a positioning statement so specific that the right buyer self-selects in and the wrong buyer self-selects out. Positioning is not branding. It is not copywriting. It is the operational answer to "what do you do and why are you the right choice."

A bad positioning statement protects the founder from picking. A good positioning statement is uncomfortable because it commits to a specific buyer, a specific outcome, and a specific contrast with the alternatives.

## When this skill triggers

- "Help me position my offer"
- "What's my positioning"
- "How am I different from competitors"
- "Positioning statement"
- "Elevator pitch"
- "What do I tell people I do"
- "I sound like everyone else"
- "I need a clearer pitch"
- "Why should they pick me"
- Auto-activated when assessment Section 6 (Offer + ICP) is filled with vague positioning language
- Auto-activated when assessment Goal Section 9 contains "positioning", "differentiation", "stand out", "premium"

NOT for: customer research (use `icp-discovery` first). NOT for: visual brand identity (use `brand-strategist`). NOT for: headline copywriting (use `copywriting` after positioning locks). NOT for: pricing decisions (use `pricing-strategy` after positioning locks).

## The positioning formula

Every positioning statement follows this structure:

```
[I/We] help [specific ICP]
[achieve specific outcome]
by [specific approach],
unlike [common alternative]
which [shortcoming].
```

Five parts. All five must be specific. If any of the five is generic, the positioning is broken.

### Example: good positioning

> "I help frontline sales managers in their first 18 months at B2B SaaS companies (50-500 employees) build the leadership confidence to coach their team and hit their own number, through a 90-day coaching engagement, unlike traditional executive coaching that runs 12+ months at C-suite price points and treats family and career as separate problems."

### Example: bad positioning

> "I help businesses grow through innovative coaching solutions."

The bad version has zero of the five parts. It is a placeholder.

## The 5-part build (coach-mode, one part at a time)

Run each part as a separate question. Lock before moving on. Do not let the user write a full statement until each part is locked individually.

### Part 1: The ICP

> "Who specifically? Not 'business owners.' Specify by role, stage, size, situation. If you ran `icp-discovery`, paste that here."

If the user has run `icp-discovery`, pull the ICP from `docs/icp.md`. If not, route them there first.

Push back on:
- "Small business owners"
- "Entrepreneurs"
- "Founders"
- "Companies that need [X]"
- "Anyone who [Y]"

These are markets. They are too broad to operate as an ICP.

Acceptable:
- "First-time sales managers at B2B SaaS, 50-500 employees, under 18 months in role"
- "Solo coaches with 1-5 active clients trying to break $5K/mo"
- "Restaurant operators with 1-3 locations, family-owned, US Northeast"

Lock the ICP phrase exactly as it will appear in the statement. Often 15-25 words.

### Part 2: The outcome

> "What specific change happens for them? Not 'better results.' Specific outcome, in their language."

Push back on:
- "Better results"
- "Growth"
- "Success"
- "Transformation"
- "Improved [anything]"
- "Optimized [anything]"
- "Unlocking potential"
- "Becoming the best version of themselves"

These are aspirational mush.

Acceptable:
- "Hit their team quota and their own number in the first 6 months"
- "Close their first $10K month within 90 days"
- "Reduce kitchen waste by 30% without firing anyone"
- "Get 30 minutes of focused time back per day"

The outcome must be:
1. Measurable (the user can describe what success looks like)
2. Time-bound (90 days, 6 months, by year-end)
3. In the buyer's language (pulled from `icp-discovery` interviews)

Lock the outcome phrase. Often 10-20 words.

### Part 3: The approach

> "How do you produce that outcome? Not 'using my unique methodology.' What is the actual mechanism?"

Push back on:
- "Proprietary methodology"
- "Unique framework"
- "Holistic approach"
- "Data-driven process"
- "Custom solution"
- "Bespoke engagement"

These are all empty signals.

Acceptable:
- "A 90-day coaching engagement with weekly 1:1s and async support"
- "A 6-week implementation sprint that ships the system you can run yourself"
- "Quarterly strategy days plus monthly check-ins, capped at 8 clients per quarter"
- "Fixed-scope DIY playbooks with email-based support"

The approach must be:
1. Time-bound (length of engagement / cadence)
2. Specific in delivery (what the buyer experiences in practice)
3. Honest about scope (no overpromising)

Lock the approach phrase. Often 10-20 words.

### Part 4: The alternative

> "What do they do today instead of buying from you? Be specific."

Push back on:
- "Other coaches"
- "Other agencies"
- "Other consultants"
- "Generic solutions"
- "DIY"

Push for:
- A named category (executive coaching, marketing agencies, online courses, DIY books, internal training, doing nothing)
- The most common alternative the user's actual buyers compare them against

Acceptable:
- "Traditional executive coaching"
- "Self-paced online courses (e.g., Sales Hacker bootcamps, Pavilion CMM)"
- "Internal company training programs"
- "Doing nothing and hoping the team figures it out"
- "Switching jobs instead of fixing the role"

Lock the alternative. Often 3-8 words.

### Part 5: The shortcoming

> "What is the alternative bad at, that you are good at? Be honest. Not 'they are bad and we are good.'"

Push back on:
- "They are generic and we are personalized"
- "They are expensive and we are affordable"
- "They are slow and we are fast"

These are inverted claims about yourself. A real shortcoming names something the alternative does poorly.

Push for:
- A specific gap in the alternative's offering
- Honest acknowledgement of what the alternative does well

Acceptable:
- "Runs 12+ months at C-suite price points and treats family and career as separate problems"
- "Gives you frameworks but no accountability or weekly practice"
- "Optimizes for the company at the expense of the leader's life"
- "Costs $50K+ per engagement and is designed for executives, not first-line managers"

The shortcoming must be:
1. Specific (not "generic")
2. Verifiable (a buyer could check)
3. Honest (not strawmanning the alternative)

Lock the shortcoming. Often 10-25 words.

## The lock and compose

Once all 5 parts lock individually, compose them into the full positioning statement and read it aloud.

Test the composed statement:

1. **Does the right buyer self-select in?** If a target ICP reads this, do they say "yes, that is me"?
2. **Does the wrong buyer self-select out?** If a non-ICP reads this, do they say "not for me" and stop?
3. **Is every word load-bearing?** If you delete any word, does the meaning change? If no, cut.
4. **Could a competitor say the same thing?** If yes, the positioning is not differentiated enough.

If all 4 tests pass, lock the positioning statement.

## The positioning brief output

Save the locked statement to `docs/positioning.md` with this structure:

```markdown
# Positioning: [Business Name]

v1.0
Locked: [YYYY-MM-DD]
Source: icp-discovery v[N] + customer interviews

---

## The statement

[I/We] help [ICP] [outcome] by [approach], unlike [alternative] which [shortcoming].

## Parts (for reference)

- **ICP:** [Part 1, locked]
- **Outcome:** [Part 2, locked]
- **Approach:** [Part 3, locked]
- **Alternative:** [Part 4, locked]
- **Shortcoming:** [Part 5, locked]

## Self-selection test

Right buyer reaction: [predicted reaction]
Wrong buyer reaction: [predicted reaction]

## Operational applications

This positioning statement informs:

- Website headline + subhead
- LinkedIn bio
- Pitch deck slide 1
- Cold email opening line
- Discovery call positioning script
- Proposal cover page
- Conference talk introduction

## Update triggers

Re-run this skill when:
- The ICP changes (icp-discovery re-runs)
- The offer changes substantially (offer-design re-runs)
- A competitor enters the space with similar positioning
- Close rate drops without clear cause
```

## The positioning condensation (shorter forms)

The full 5-part statement is the source of truth. From it, derive shorter forms for different surfaces:

### 1-line bio (60-80 chars)

Strip to ICP + outcome. Drop approach + alternative + shortcoming.

> "Coaching for first-time sales managers in B2B SaaS, 90 days to confidence."

### Hero headline (6-12 words)

Lead with the contrarian truth or specific outcome. Skip the formula.

> "Winning on paper isn't the whole story."

> "Stop reacting. Start leading on purpose."

### Cold email opening (1 sentence)

ICP + buying trigger.

> "Most B2B SaaS sales managers I work with hit the same wall in their first 18 months."

### Pitch deck slide 1

The full 5-part statement, formatted with line breaks.

### Discovery call positioning (verbal)

Compress to 15-20 seconds.

> "I work with frontline sales managers in their first 18 months at B2B SaaS companies. Most of them are missing quota because the skills that got them promoted as a rep are the wrong skills for the manager job. I run a 90-day coaching engagement so they can build a system they can run without me. Unlike executive coaching that runs a year and starts at $50K, this is 90 days for $X,XXX with a 30-day money-back guarantee."

## Stage-aware adjustments

### Pre-Rev Builder

Positioning is hypothesis. The user has not closed customers yet. Their positioning will likely shift after the first 3-5 paid engagements.

Required depth:
- All 5 parts answered
- Save as v0.1.0 hypothesis
- Lock for 90 days, then revisit
- Use the hypothesis to start outreach; treat the next 5 discovery calls as positioning research

Common Pre-Rev failure: trying to lock perfect positioning before talking to a buyer. Force a hypothesis. Test it on the next 5 calls. Iterate.

### Early Operator (<$5K MRR)

Positioning grounded in real customer data. The user has 1-5 customers. Positioning v1.0 emerges.

Required depth:
- All 5 parts grounded in actual customer language
- Tested against last 10 discovery calls
- Self-selection test confirmed (real buyers said "that's me", real non-buyers said "not for me")

### Stable Solo ($5-25K MRR)

Positioning refinement. Possible sub-segmentation.

Required depth:
- All 5 parts validated against $10K+ in revenue from this positioning
- Sub-segment analysis: is there a tighter ICP within the ICP that pays more or closes faster?
- Decision: tighten the positioning to the higher-value sub-segment, or stay broad and lose margin

### Scaling Solo ($25K+ MRR)

Positioning maturity. Possibly two ICPs and two positioning statements.

Required depth:
- Two positioning statements (if two ICPs)
- Each tested against $25K+ revenue separately
- Operational consistency across surfaces (website, deck, outreach, proposal)

## Working with other skills

- **Imports from:** `icp-discovery` (the ICP definition is Part 1)
- **Hands off to:** `brand-strategist` (uses positioning as the foundation of brand identity), `copywriting` (uses positioning to write headlines and CTAs), `outreach-drafter` (uses positioning for cold email and LinkedIn), `proposal-writer` (uses positioning on the cover page), `discovery-call-prep` (uses verbal positioning script)
- **Updates:** `CLAUDE.md > Brand State` section (Voice archetype), `docs/positioning.md`
- **Re-runs:** quarterly, or after ICP shift, or after market shift

## Anti-patterns to refuse

### "I help everyone who needs my service"

Push back. Universal positioning is no positioning.

> "Everyone is not a buyer. The exercise is to commit to one buyer so the right ones recognize themselves. We can expand later. We cannot recover from looking generic now."

### Borrowing positioning from a successful competitor

> "We want to be the [bigger brand] of [smaller niche]" usually means the user has not done their own positioning work. Push back.

> "Picking 'the X of Y' borrows positioning. What is true about YOU that isn't true about them?"

### Positioning with "premium" / "world-class" / "leading"

These adjectives are not positioning. They are vague trust signals.

> "Premium" is not a position; it is a price band. What specifically do you do that earns the premium? Position from that."

### Skipping the alternative + shortcoming (parts 4 + 5)

Some users want to write only the positive ("I help X achieve Y by Z"). Refuse.

> "The alternative + shortcoming is half the value. Without it, you sound like every other [category] in the market. Name the alternative and the gap honestly. That is your differentiator."

### Strawmanning the alternative

If the user writes "unlike [alternative] which sucks and is bad," push back. Strawman positioning is dishonest and weak.

> "[Alternative] is not actually bad at what they do. They are bad at one specific thing relevant to your ICP. Name that specific thing."

### Positioning that the user cannot sustain

If positioning commits the user to delivery they cannot operationally provide (24/7 support, lifetime access, weekly 1:1s for the price of a course), push back.

> "Can you actually deliver this for the price you charge with your hour count? If no, the positioning will break when a client tests it."

## Common traps

### Positioning that is too clever

"We are the Tesla of B2B coaching" tries to position by reference. The reference is opaque. Push for plain language.

### Positioning that hides the price

If positioning says "premium" without naming the price, it is signal-only. State the price band in the approach or alternative parts. Buyers respect transparency.

### Positioning that mismatches the brand voice

If positioning sounds like a McKinsey report but the brand voice is Operator + Friend, the positioning will not survive the homepage. Calibrate language to the voice profile.

### Multiple positioning statements floating in different surfaces

The user's website says one thing, LinkedIn says another, the deck says a third. Lock ONE source of truth in `docs/positioning.md`. Every surface inherits from it.

### Positioning that is "true forever"

Markets shift. Competitors enter. Pricing tiers move. Positioning has a half-life.

Add the update trigger section to the brief. Quarterly review. Re-run when triggered.

### Positioning that the user cannot say out loud

If the user wrote the positioning but cannot say it in a discovery call without choking, it is too clever or too academic. Rewrite for the spoken form.

The test: read the statement aloud. If it sounds awkward, simplify until it sounds like the user talks.

## Positioning vs. tagline vs. mission

Three different artifacts. Do not conflate.

- **Positioning statement:** Operational answer to "what do you do and why are you the right choice." 1 sentence. Source of truth. Lives in `docs/positioning.md`.
- **Tagline:** 3-8 words. Memorable. Lives in the website header and email signature. Derived from positioning but not equal to it.
- **Mission:** Why the work exists. Internal motivator. Lives in `brand-strategist` brief. Rarely customer-facing.

This skill produces the positioning statement only. If the user asks for a tagline, route to `copywriting` (after positioning locks). If they ask for a mission, route to `brand-strategist`.

## Additional Resources

### Reference files

- **`references/positioning-formula-deep-dive.md`**: extended walkthrough of the 5-part formula with 12 worked examples across different industries (B2B SaaS, agencies, coaching, e-commerce, services). Shows good vs. bad for each part.
- **`references/competitor-positioning-audit.md`**: guide to mapping the positioning of the user's top 5 competitors so the "alternative" and "shortcoming" parts can be specific and accurate. Includes a free-tier research workflow.

### Example files

- **`examples/example-positioning.md`**: fully populated positioning brief for the example coaching business. Shows the 5 parts, the composed statement, condensed forms (bio, headline, cold email opening), and the update history from v0.1.0 hypothesis through v1.0 lock.

### Related skills

- `skills/product/icp-discovery/SKILL.md`: produces the ICP definition that becomes Part 1
- `skills/product/offer-design/SKILL.md`: uses the positioning to scope the deliverable
- `skills/product/pricing-strategy/SKILL.md`: uses the positioning to set the price band
- `skills/brand/brand-strategist/SKILL.md`: uses positioning as the foundation of brand identity
- `skills/marketing/copywriting/SKILL.md`: derives headlines, subheads, and CTAs from positioning
- `skills/sales/outreach-drafter/SKILL.md`: derives cold email and LinkedIn from positioning

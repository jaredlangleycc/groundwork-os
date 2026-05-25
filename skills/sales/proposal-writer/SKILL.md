---
name: proposal-writer
description: This skill should be used when the user asks to "write a proposal for X", "draft a proposal", "proposal for [prospect]", "send Y a proposal", "build a SOW", "scope of work", "write up the engagement for X", or wants a formal proposal for a high-ticket engagement. Template-driven but customized per prospect. Pricing locked to user's offer. Voice-scanned. Distinct from copywriting (marketing pages) and email-sequence (lifecycle emails).
version: 0.1.0
---

# Proposal Writer

Formal proposal for high-ticket engagements ($1K+ typical). Different from a cold email or a one-pager: a proposal is the document the prospect reads when they're deciding to invest. Wrong proposal format = stalled deals at the Proposal Sent stage.

The skill produces a branded markdown or HTML proposal that pulls the user's pricing rules (locked in CLAUDE.md), the engagement scope (from the discovery call), and the user's voice. It outputs in two formats: editable markdown (for review) and PDF-ready HTML (for sending).

This is NOT a generic SaaS proposal template. It's shaped for solo coaching, consulting, services, and other high-trust offers. For SaaS pricing pages, use `copywriting` skill instead.

## When this skill triggers

- "Write a proposal for [prospect]"
- "Draft proposal for [name]"
- "Send [prospect] a proposal"
- "Proposal for flagship engagement with [name]"
- "Build a SOW for [project]"
- "Scope of work for [client]"
- "Write up the engagement for [prospect]"
- "I need a proposal by [day]"

NOT for: ongoing client deliverables (use a different skill), marketing copy (use copywriting), email pitches (use outreach-drafter), one-pagers (use copywriting).

## Pre-flight (run before drafting)

### Check 1: Discovery call already happened

The proposal is built on the discovery. If no discovery call has happened, refuse to draft and route to:
- `discovery-call-prep` to prep the discovery
- `outreach-drafter` to schedule the discovery

A proposal without discovery = generic pitch document. Will not close.

### Check 2: Pricing rules loaded

Read pricing from CLAUDE.md. Critical: NEVER deviate from the locked offer pricing without explicit user confirmation. If user asks to draft proposal at a different price than the locked rate, flag:

> "Locked Foundation price is $X,XXX. You're asking me to draft at $1,800. Confirm this is intentional, AND explain the scope adjustment so the proposal reads coherently."

### Check 3: Scope is specific

Need to know:
- Engagement length (90 days, 6 months, custom)
- Number of sessions / hours / deliverables
- What's included
- What's NOT included
- Start date / kickoff
- Payment terms (upfront, monthly, milestone)

If any of these is vague, route the user back to a scoping call with the prospect. Vague scope = scope creep + proposal disputes.

### Check 4: Prospect-specific context loaded

From the discovery call:
- Prospect name, role, company
- The specific pain they named (in their words)
- The specific outcome they want (in their words)
- Who else is involved in the decision (boss, partner, finance)
- Their timeline (when they want to start, when they need results)

The proposal personalizes around these. Generic = stalls.

## The 7-section proposal structure

### Section 1: Cover (1 page)

```
[PROSPECT FIRST NAME]'s [ENGAGEMENT NAME] Proposal

Prepared for: [Full name, role, company]
Prepared by: [User name, business]
Date: [today]

Decision deadline: [Specific date, 14 days from send]
```

The decision deadline is important. It creates a natural urgency without manufactured pressure. Most proposals stall because no deadline = no decision-forcing function.

### Section 2: Why we're here (1 paragraph)

Restate the prospect's pain in THEIR words from the discovery call. This is the proof you listened.

Template:
> "On [date] you described the challenge as: '[quote them, 1-2 sentences].' The underlying pattern, based on the conversation: [1 sentence interpretation]. This proposal is built to address that."

Length: 80-120 words. The prospect should read this and think "yes, that's what I said."

### Section 3: The engagement (1-2 pages)

This is the substance. What you'll do, how, when.

#### Scope (4-7 bullets)
What's included. Specific.

Example for Langley flagship offer:
- 12 weekly 60-min coaching sessions over 90 days
- 1 hour of async coaching access per week (Voxer or email)
- Custom Three Pillars roadmap delivered at week 2
- Mid-engagement strategic review at week 6
- Final integration document at week 12

Bullets should be CONCRETE. "Strategic guidance" is too vague. "12 weekly 60-min sessions" is concrete.

#### Outcomes (3-5 bullets)
What the prospect can expect by end of engagement.

CRITICAL: Outcomes are PROBABLE, not guaranteed. Use language like:
- "Most clients see..."
- "By week 6, you'll typically..."
- "By engagement end, you'll have..."

NEVER promise:
- "You will [outcome]" (no qualifier)
- "Guaranteed [result]"
- Specific numerical outcomes that depend on the prospect ("$500K in new revenue")

#### What's not included
The negative scope. This prevents scope creep later.

Example:
- This engagement does NOT include: team coaching (priced separately at $X), 24/7 emergency access, deliverable rework outside of agreed scope.

### Section 4: Investment (1 page)

The pricing section. Format depends on offer structure.

#### Single-price model (default for Langley Foundation)

```
INVESTMENT

Foundation Engagement: $X,XXX

Payment options:
- Paid in full: $X,XXX (saves $0)
- 3-month plan: $800 per month × 3 months

30-day money-back guarantee. If you decide the engagement is not the right
fit for any reason in the first 30 days, full refund.
```

#### Tiered model (when applicable)

If the user offers 2-3 tiers (Core, Standard, Premium), structure as cards. Reference `copywriting` skill for tier-card pattern.

#### Hourly / project hybrid

If the engagement is a hybrid (set retainer + hourly overage), make the boundary explicit:

```
Retainer: $X per month
Includes: Y hours of work + Z deliverables
Overage: $A per hour beyond the retainer
```

### Section 5: How we start (1 paragraph + bullet)

Specific next-step pattern:

```
HOW WE START

1. You sign this proposal and send the first payment by [decision deadline].
2. I send the kickoff document and book the first 2 sessions.
3. Kickoff session within 7 days of payment received.
```

The numbered list makes the next steps concrete. The decision deadline anchors timing.

### Section 6: About me / About this work (optional, half page)

For prospects who need credibility reinforcement. Skip for prospects who already know you well.

Include:
- 2-3 sentence story about why you do this work
- 2-3 sentence credential statement
- 1-2 client outcomes (named clients if approved, anonymized if not)

NOT a resume. NOT a list of every project. Enough to confirm the prospect's decision.

### Section 7: FAQ + Decision aid (1 page)

Standard FAQ items the prospect will have:

- **What if I want to extend the engagement?** [Pricing + process]
- **What if it's not working at month 1?** [30-day refund + how to invoke]
- **Can I bring my [partner / boss / team] into a session?** [Yes / No / depends + price if yes]
- **How do I cancel a session?** [Notice period + reschedule policy]
- **What happens after 90 days?** [Ongoing options + pricing]

Customize the FAQ to surface the specific objections this prospect raised during discovery.

End the FAQ with a decision aid:

```
TO DECIDE:

If yes: Sign below and send first payment by [decision deadline].
If you have questions: Reply to my email and we'll book a 30-min call.
If no: Reply with one sentence on why. Helps me improve future proposals.
```

The 3-option close is critical. It gives the prospect explicit permission to say no, which paradoxically lifts close rate (no = clarity, easier next steps for both sides).

## Voice-rules integration

Every section passes through voice-rules:

- Strip em dashes (use commas, periods, parens, rewrite)
- Strip "X, not Y" antipattern (rewrite affirmatively)
- Strip hedge words: just, really, basically, actually, simply, literally, honestly, frankly
- Strip AI tells
- Mirror the user's voice samples (rhythm, sentence length, word choice)

Show "VOICE CHECK: clean" or list rewrites before showing the full proposal.

## The pricing rule (NEVER deviate without explicit confirmation)

Pricing is locked at the offer level (in CLAUDE.md). Default the example coaching business:
- flagship offer: $X,XXX (90-day engagement)
- Ongoing: $250/mo (grads) or $350/mo (non-grads)
- Speaking: custom-quoted

If user asks to draft at a different price, surface the deviation explicitly:

```
PRICING DEVIATION FLAGGED

Locked: $X,XXX
Requested: $1,800
Difference: -25%

If this is a scope adjustment, the proposal needs to reflect what's LESS,
not a discounted same scope. Same-scope discount = signals price was
inflated to begin with.

Confirm:
- Is this a one-time exception (e.g., family-rate, peer-rate, charity)?
- Is this a scope-down (e.g., 60 days instead of 90)?
- Is this a phased payment (e.g., $1,200 now + $1,200 at day 45)?

Tell me which and I'll draft the right framing.
```

Don't draft the deviation without the user explicitly answering. Generic discounts = false signals to the prospect about your real pricing.

## Anti-patterns to refuse

### "Add a 'limited time offer' urgency line"

Refuse. Manufactured urgency on a high-ticket proposal = pressure tactic = damages trust. The decision deadline (already built in) is enough.

### "Promise specific revenue results"

Refuse. "You will close $500K in pipeline" is a guarantee. Skill produces likelihoods ("most clients see..."), not promises.

### "Include 10 case studies"

Refuse. 1-2 specific outcomes max. More = looks insecure, like you're trying to justify the price.

### "Make it look more expensive / corporate"

Push back. The format that closes the user's deals is the format the user has been using. If they want to overhaul the format, route to `copywriting` for a redesign session, not a one-off proposal.

### "Use a generic services proposal template I found online"

Refuse. Generic templates have a tell. The prospect will know they were one of 50 people who got this exact document. Customization is the work.

### "Don't include the 'what's not included' section"

Push back. Negative scope is what prevents scope creep + future disputes. The prospect SHOULD know what's not in the engagement. Withholding that = setting up a fight later.

### "Skip the FAQ section"

Push back. The FAQ surfaces the prospect's objections proactively. Without it, the objections live in their head and stall the proposal. With it, they're addressed before they kill the deal.

## Coach-mode integration

Before drafting, the skill runs through coach-mode questions:

1. "What did the prospect specifically say they want? In their words."
2. "What's the actual scope you're proposing? Be specific about hours, sessions, deliverables."
3. "What's the price, and what's the rationale tied to value?"
4. "What's the 30-day refund or guarantee clause?"
5. "What's the decision deadline you want on this proposal?"

If the user can't answer question 1 in 2 sentences, route them back to a follow-up call with the prospect to clarify. A proposal built on assumed pain = stalls.

## Format output

After all checks pass and the proposal is drafted, output:

**Option A: Markdown for review**
```
PROPOSAL: [Engagement name] for [Prospect first name]
Length: N words
Pages (estimated): N

[Full proposal text in markdown]

---
VOICE CHECK: [result]
PRICING CHECK: [match to CLAUDE.md offer, OR deviation flagged]
PERSONALIZATION CHECK: [N prospect-specific phrases, listed]
DECISION DEADLINE: [date, N days from send]

Locked, or rework?
```

**Option B: PDF-ready HTML (after locked)**

The user can ask "build the PDF" or "send the HTML version" after locking. The skill generates a single-file HTML proposal with:
- Inline CSS matching user's brand (pull from CLAUDE.md Brand section)
- Embedded fonts (or web-safe alternatives if no font CDN)
- Print-friendly (so user can print-to-PDF via Chrome headless or similar)
- Sized for 8.5x11 pages with proper page-breaks

Output path: `client-experience/<prospect-slug>-proposal-YYYY-MM-DD.html` and matching `.md`.

For the example coaching business specifically: pull brand colors (teal #0A1F20, gold #D4A96A, cream #F2EDE6) and fonts (Archivo Black headlines, Manrope body) from CLAUDE.md.

## Stage-aware adjustments

### Pre-Rev Builder

- Proposals are rare at this stage.
- When they happen, lean on simpler structure (Cover + Engagement + Investment + How we start). Skip Sections 6-7 if the prospect already knows you.
- Pricing might still be in flux. Reference `pricing-strategy` if user is uncertain about the number.

### Early Operator

- Proposals are 2-4 per month.
- Use full 7-section structure.
- The skill is at peak value here. Most deals close or fail on proposal quality.

### Stable Solo

- Proposals are 4-10 per month.
- Many engagements are now extensions / renewals (not first-time). Shorter format for renewals.
- Add a "What we did last time" section for renewals.

### Scaling Solo

- Proposals are 10+ per month.
- Template-heavy. The skill becomes about which-template-when.
- Add team / sub-contractor sections if engagements involve more than the user.

## Working with other skills

- Imports: `voice-rules` (always), `business-coach` (for discovery-call recall), `pricing-strategy` (if pricing is in flux)
- Reads from: `client-experience/00-package-spec.md` (or equivalent offer-spec file), discovery call notes (file system), CRM (HubSpot MCP)
- Hands off to: `follow-up-tracker` (for proposal stalls + A/B/C close pattern), `close-mechanics` (for objection handling), `decision-logger` (to log the proposal sent + outcome)
- Pairs with: `copywriting` (for proposal format design changes), `email-sequence` (for proposal cover-email + post-send nurture)

## Family floor protection

A proposal takes 60-120 minutes to draft well. Block accordingly. NEVER inside family-floor hours.

Default suggested slot: morning, 9-11am or 10-12pm. Not afternoon (energy + family-floor proximity).

## Additional Resources

### Reference files

- **`references/proposal-format-by-offer-type.md`**: format variations for coaching, consulting, services, fractional, retainer, and project-based engagements
- **`references/objection-preemption-bank.md`**: 20+ proactive FAQ items organized by objection type (price, timing, fit, scope, refund)

### Example files

- **`examples/example-proposal-template.md`**: full flagship-offer proposal template for the example coaching business, voice-scanned, ready to customize per prospect
- **`examples/example-proposal.md`**: Alex-specific instantiation showing how the template adapts to a real prospect

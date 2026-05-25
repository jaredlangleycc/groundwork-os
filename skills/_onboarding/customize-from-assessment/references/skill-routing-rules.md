# Skill Routing Rules

How customize-from-assessment decides which skills to activate based on the parsed profile.

## Goal: lean active set, not all 43 skills

Active skills load into context. More skills = more context burn = slower, blurrier responses. The OS prefers ~15-25 active skills tuned to the user's stage and goals.

## Always-on (7 skills)

These activate for every user regardless of stage:

- `business-coach`: posture default
- `voice-rules` (the user's generated one)
- `revenue-mapper`: money lens
- `risk-gauge`: comfort check
- `free-first-checker`: tool spend gate
- `family-floor`: protected time enforcement
- `weekly-brief`: repeat-use anchor

## Stage routing

### Pre-Rev Builder (no revenue yet)

Priority: figure out what you sell, to whom, for how much. Brand and copy second.

**Add:**
- `offer-design`: what's the offer, structure, deliverable
- `positioning`: how it's different from alternatives
- `icp-discovery`: who actually buys
- `brand-strategist`: identity primer (only if Section 3 = starting_fresh)
- `copywriting`: first landing page, first outreach scripts

**Skip:**
- `paid-ads`, `seo-audit`, `ai-seo`, `analytics-tracking` (no traffic to measure)
- `pricing-strategy` (deferred until first close)
- `crm-hygiene` (no contacts to hygiene)

### Early Operator (<$5K MRR)

Priority: build repeatable channels. Outreach + content + follow-up.

**Add:**
- `outreach-drafter`: LinkedIn + email
- `cold-email`: sequences
- `follow-up-tracker`: stale-prospect nudges
- `content-strategy`: weekly cadence
- `pricing-strategy`: first price test, not first-ever

**Skip:**
- `proposal-writer` (lean on simple intro emails)
- `paid-ads` (organic until you can't)

### Stable Solo ($5-25K MRR)

Priority: pipeline rigor, content compounding, light automation.

**Add:**
- `pipeline-review`: weekly deal-stage audit
- `email-sequence`: nurture + lifecycle
- `paid-ads`: small budget test if free channels are working
- `ai-seo`: get cited by ChatGPT/Perplexity
- `crm-hygiene`: clean up the contacts you have

### Scaling Solo ($25K+ MRR)

Priority: efficiency, decision quality, optionality.

**Add:**
- `close-mechanics`: objection handling, deal psychology
- `proposal-writer`: formal proposals
- `analytics-tracking`: conversion data, not vanity
- `seo-audit`: technical SEO if traffic is meaningful
- `decision-logger`: bigger decisions need a paper trail

## Goal-based add-ons

After stage routing, parse the 90-day goal text for keywords. Add these on top of stage set.

### "launch" / "first paying client" / "first sale"

- `offer-design`, `copywriting`, `outreach-drafter`, `pricing-strategy`

### "more clients" / "fill pipeline" / "more leads"

- `outreach-drafter`, `cold-email`, `content-strategy`, `follow-up-tracker`, `paid-ads` (only if stage >= Early Operator)

### "raise price" / "premium" / "charge more"

- `pricing-strategy`, `positioning`, `proposal-writer`

### "brand" / "rebrand" / "new identity"

- `brand-strategist`, `brand-guidelines`, `content-humanizer`

### "ship content" / "newsletter" / "blog" / "podcast"

- `content-strategy`, `newsletter-broadcast`, `social-content`, `content-humanizer`

### "automate" / "systems" / "less admin"

- `crm-hygiene`, `ship-it-friday`, `file-sweep`, `boring-stack`

### "SEO" / "rank" / "search"

- `seo-audit`, `ai-seo`, `content-strategy`

### "delegate" / "hire" / "VA"

- Caution flag: check risk-gauge before activating. Many solopreneurs hire too early.
- If risk-gauge clears: `crm-hygiene`, `decision-logger`, `boring-stack`

## Risk-gauge interactions

Risk archetype modifies activations:

- **Bootstrap-Strict**: no `paid-ads` activation regardless of stage/goals. User must explicitly request.
- **Low-Burn**: `paid-ads` deferred to budget under $200/mo only.
- **Aggressive**: all skills available, no gating.

## Coach archetype interactions

Coach archetype modifies the `business-coach` skill's tone but doesn't gate other skills:

- **Challenger**: `challenge` skill activates by default
- **Steady-Hand**: `decision-logger` activates earlier (Stable Solo instead of Scaling Solo)
- **Drill-Sergeant**: `hard-call` activates by default
- **Reflective**: `self-improve` activates by default

## Active skills cap

If total activations exceed 25, drop the lowest-priority goal-driven skills first, then stage skills, never always-on.

Print to user: "Activated 23 skills. Dropped: [list]. To activate later, run `/activate-skill <name>`."

## Output format in CLAUDE.md

```markdown
## Active Skills (managed by /customize-from-assessment)

**Always-on (7):**
- business-coach, voice-rules, revenue-mapper, risk-gauge, free-first-checker, family-floor, weekly-brief

**Stage-active (5):**
- outreach-drafter, cold-email, follow-up-tracker, content-strategy, pricing-strategy

**Goal-active (4):**
- offer-design, copywriting, paid-ads (Bootstrap-Strict: REQUEST-ONLY), positioning

Total active: 16 of 42
```

---
name: paid-ads
description: This skill should be used when the user asks "should I run ads", "paid ads", "run ads", "Meta ads strategy", "LinkedIn ads", "ad spend", "ad budget", "set up paid", "scale with paid", or wants to design or evaluate a paid campaign strategy. Stage-gated. Bootstrap-Strict refuses paid by default. Free path documented first. Distinct from ad-creative (the asset production) and copywriting (page copy).
version: 0.1.0
---

# Paid Ads

The strategy and budget layer for paid advertising. This skill decides whether the user should run ads at all, on which platform, at what budget, and what conversion event. Ad creative production happens downstream in `ad-creative`.

The default answer for most solopreneurs is "not yet." This skill enforces the free-first path and gates paid behind specific validation criteria.

## When this skill triggers

- "Should I run ads"
- "Help me set up Meta ads"
- "LinkedIn ad strategy"
- "How much should I spend on paid"
- "Scale my lead gen with paid"
- "Run an ad campaign"
- "Paid amplification"

NOT for: writing the ad creative itself (use `ad-creative`), organic content (use `social-content`), email sends (use `newsletter-broadcast` or `email-sequence`).

## The free-first gate

Refuse to design a paid campaign unless ALL of these are true:

| Validation criterion | What to check |
|---|---|
| Offer is locked | Price + scope + ICP defined in `offer-design` |
| Organic traction exists | Has a piece of organic content driven a conversion in last 90 days? |
| Lead magnet works | Landing page converts at 5%+ organically |
| Tracking is set up | UTM convention defined + conversion event installed |
| Funnel exists | Lead → nurture → offer is wired (see `email-sequence`) |
| Stage permits | Per stage gate below |
| Risk archetype permits | Bootstrap-Strict refused by default |
| Budget is named | User has stated a budget cap they can sustain for 90 days |

If ANY of these fails, refuse paid. Route the user to fix the gap.

For example: if the lead magnet doesn't convert organically at 5%, paid will burn money testing what's broken. Fix the LP first.

## Stage gate

| Stage | Paid allowed? | Default budget cap |
|---|---|---|
| Pre-Rev Builder | No | $0 |
| Early Operator | Pilot only, $5/day, with override warning | $5/day pilot |
| Stable Solo | Yes, after free-first gate | $20 to $50/day |
| Scaling Solo | Yes, full scope | $100/day+ |

The Pre-Rev refusal is firm. The Early Operator pilot is for testing one specific hypothesis with minimum spend.

## Risk archetype gate

| Risk archetype | Paid allowed? | Notes |
|---|---|---|
| Bootstrap-Strict | No, refuse | Free-first principle hard-locked |
| Low-Burn | Yes, capped at 5% of revenue | Conservative scaling |
| Calculated | Yes, standard | Per stage cap |
| Aggressive | Yes, no soft cap | But still gated by validation |

Bootstrap-Strict users can override, but Claude must log the override and warn explicitly: "You've opted into paid against your stated risk archetype. Capping recommendations at the Low-Burn defaults."

## Platform selection

Pick ONE platform for the pilot. Multi-platform is for Scaling Solo only.

### Meta (Facebook + Instagram)

**Pick when:**
- ICP is B2C (consumers, prosumers)
- ICP is real estate, ecom, coaches with B2C audience
- Strong visual brand
- Lower-priced offer ($0 to $500 first-purchase typical)
- Want broader audience exploration

**Avoid when:**
- ICP is enterprise B2B
- Offer is high-ticket without warm-audience proof
- User has no visual brand assets

**CPM range (2026):**
- B2C: $5 to $15
- B2B SaaS: $15 to $40
- Coaching: $15 to $40

### LinkedIn

**Pick when:**
- ICP is B2B (sales managers, VPs, founders, decision-makers)
- High-ticket offer ($1K to $50K range)
- Want precise targeting (job title, company size, industry)
- ICP is not on Meta during work hours

**Avoid when:**
- ICP is sub-$50K decision-maker (LinkedIn audience skews up-market)
- Budget is under $25/day (LinkedIn floor)
- No warm audience available

**CPM range (2026):**
- General B2B: $25 to $80
- Senior decision-makers: $40 to $120
- Tech / enterprise: $40 to $150

### Google Ads (search)

**Pick when:**
- ICP searches for the user's solution by name or category
- Bottom-of-funnel intent ("hire a [niche] coach", "outsourced bookkeeping for [industry]")
- Local geographic targeting (real estate, home services)
- Brand-keyword defense (competitors bidding on user's name)

**Avoid when:**
- ICP doesn't search for the category yet (early-stage offer)
- Budget under $20/day for search ads in competitive categories
- No conversion event installed

**Costs:** highly variable by keyword. $1 to $20+ per click depending on category.

### Default platform recommendations by ICP

| ICP type | Default platform | Rationale |
|---|---|---|
| B2B SaaS sales managers | LinkedIn | Precise targeting + warm-audience retargeting after lead-gen assessment |
| B2B SaaS founders | LinkedIn + X | LinkedIn for B2B, X for personal-brand-led founders |
| Coaches (corporate) | LinkedIn | Audience overlap |
| Coaches (B2C) | Meta + Instagram | Visual + B2C audience |
| Real estate (local) | Meta + Google Local | Geographic targeting |
| DTC brand | Meta + TikTok | B2C visual + viral |
| Indie SaaS dev | X (limited) + Google | Audience overlap + intent search |
| Online course creator (B2C) | Meta + TikTok | Visual + price point |
| Online course creator (B2B) | LinkedIn | Audience + price point |

## Budget structure

### Pilot stage (Early Operator OR Stable Solo entry to paid)

- **Test budget:** $5/day for 14 days = $70 total
- **Hypothesis:** Can paid amplify the user's top organic post?
- **Conversion event:** Lead magnet signup (lowest commitment)
- **Variants:** 1 baseline only (skip variant testing until pilot confirms)
- **Decision gate:** if CPL is within 1.5x of organic-attributed cost, proceed to scaling. If 3x or worse, kill and re-think.

### Scaling stage (Stable Solo, post-pilot)

- **Budget:** $20 to $50/day for 30 to 60 days
- **Hypothesis:** Can the validated creative scale at higher budget without breaking?
- **Variants:** 3 (per `ad-creative` variant rules)
- **Conversion event:** Same as pilot OR step up to booking
- **Decision gate:** at 60 days, evaluate CAC vs LTV. If CAC under 30% of LTV, scale. If CAC over 60% of LTV, kill.

### Expansion stage (Scaling Solo)

- **Budget:** $100+/day
- **Hypothesis:** Multi-platform OR multi-audience scaling
- **Variants:** Full A/B/C testing per platform
- **Conversion event:** Multiple (lead, booking, purchase)
- **Decision gate:** Ongoing weekly review

## The 5% rule

For Low-Burn and Calculated archetypes, paid ad spend should not exceed 5% of monthly revenue for the first 12 months of paid testing.

| MRR | Max ad spend (5% rule) |
|---|---|
| $0 | $0 (Pre-Rev refused) |
| $2,000 | $100/month |
| $5,000 | $250/month |
| $10,000 | $500/month |
| $25,000 | $1,250/month |
| $50,000 | $2,500/month |

This is the cap, not the recommendation. Most solopreneurs should spend less than the cap until they hit Scaling Solo.

Aggressive risk archetypes can exceed 5%. Bootstrap-Strict cannot exceed 0%.

## Conversion event hierarchy

Pick the conversion event based on funnel maturity:

1. **Lead magnet signup**, lowest cost, lowest commitment, easiest to convert. Default for cold traffic.
2. **Newsletter signup**, slightly higher commitment, harder to convert, but qualifies the reader.
3. **Free consultation booking**, high commitment, harder to convert, but qualified leads.
4. **Free trial / demo signup**, for product-led businesses.
5. **Direct purchase**, highest commitment, requires very warm audience. Only after the funnel above is validated.

Match conversion event to audience temperature:

- Cold audience → lead magnet
- Warm audience (lead-gen assessment completers, newsletter subscribers) → booking
- Hot audience (engaged with multiple pieces) → direct offer

Don't pitch a $X,XXX coaching offer to a cold audience. They won't convert. the lead-gen assessment is the right cold-traffic offer.

## The pilot framework

Every first paid campaign follows the same pilot framework.

### Step 1: Identify the validated organic asset

Look at the user's last 90 days of organic content. Identify the ONE piece that:

- Drove the most engagement
- Drove inbound conversations or signups
- Has a clear hook + body + CTA

This is the asset to amplify.

If no such asset exists, refuse the campaign. The user hasn't validated organic.

### Step 2: Replicate the asset as an ad

Use `ad-creative` to produce 1 variant that closely matches the organic asset's hook + body + CTA + visual style. Don't innovate. Replicate.

### Step 3: Run at $5/day for 14 days

- Single audience (Custom Audience modeled on the user's existing list + 1% lookalike)
- Single creative
- Single conversion event (lead magnet)
- Tracking installed

### Step 4: Evaluate at day 14

| Outcome | Action |
|---|---|
| CPL is 50% to 100% of organic-attributed CPL | Strong winner. Scale to $20/day for next 30 days. |
| CPL is 100% to 200% of organic-attributed CPL | Marginal. Hold at $5/day, test one variant. |
| CPL is over 200% of organic-attributed CPL | Kill. Re-think creative or audience. |

### Step 5: Decide to scale, hold, or kill

If scaling: route to `ad-creative` for variant production. Bump budget to $20/day. Plan for 30-day validation at higher budget before further scale.

If holding: continue at $5/day, test variants. Hold for another 14 days.

If killing: stop spend. Document what was learned. Re-test in 60 days OR return to organic.

## The free path documented

For every paid recommendation, document the equivalent free path explicitly. Per NightShiftOS Principle 2 (free-first).

| Paid play | Free equivalent |
|---|---|
| Meta retargeting of website visitors | Manual outreach to engaged commenters on top organic posts |
| LinkedIn ad targeting Sales Managers | DM 20 to 50 prospects/week with lead-gen assessment link |
| Lead magnet promotion via Meta | Organic post weekly mentioning the lead magnet, 1 line in newsletter sign-off |
| Boost top organic posts on LinkedIn | Comment + share + repost the post to keep it surfacing |
| Google Search ads on brand terms | Strong SEO + AI-SEO for brand-name queries |

If the user can do the free path in their available hours and it's working, paid is distraction. Don't run ads to save time the user has.

## Anti-patterns to refuse

### "Just run $1000 across 10 audiences"

Refuse. Split-budget pilots produce zero signal. Run $5/day on 1 audience first.

### "Use AI to write 20 ad variants"

Refuse to ship 20 variants. 3 maximum (per `ad-creative`).

### "Boost this organic post"

Allowed only if the post drove a conversion organically. Boosting a vanity post wastes budget.

### "Set it and forget it"

Refuse to recommend a campaign without weekly check-ins. Ad creative fatigues. Audiences saturate. Unmonitored ads break.

### "Target everyone"

Refuse broad-audience targeting at solopreneur budget levels. Narrow to the ICP. The wider the audience, the higher the CPL.

### "Run during a launch sale"

Be cautious. Launch campaigns spike CAC. Better: warm the audience over 14 to 30 days, then promote during launch. Don't expect cold conversion in launch week.

### Spending into a broken funnel

If the LP has a 1% conversion rate organically, ads won't fix it. Fix the funnel first.

## Stage-aware adjustments

### Pre-Rev Builder

REFUSE all paid. Focus on offer + ICP validation + organic content.

### Early Operator

- Pilot at $5/day allowed after free-first gate validation
- Single platform
- Lead magnet conversion only
- 14-day pilot
- Kill criteria strict (CPL >2x baseline = kill)

### Stable Solo

- Pilot + scaling allowed
- One primary platform + experimentation slot for second
- Lead magnet OR booking conversion
- 30 to 60 day cycles
- Budget per 5% rule cap

### Scaling Solo

- Multi-platform allowed
- Lead + booking + purchase conversion events
- Aggressive scaling allowed if CAC < 30% of LTV
- Possible to hire performance marketer at this stage

## Family-floor integration

- Ad strategy and review: 1 hour/week max for Early/Stable
- Ad strategy review for Scaling Solo: 2 hours/week max
- Production: per `ad-creative` time budget

If ads are eating more than 1 to 2 hours/week of the user's time, paid is becoming distraction. Hand off to a contractor or pause.

## Revenue tag

- Validated paid ads: $$ (direct revenue if converting, leverage if building audience)
- Pilot paid ads: $$ (treated as leverage; pilots are exploration)
- Unvalidated paid (no organic baseline): distraction. Refuse.

## Working with other skills

- Imports: `voice-rules` (ad copy through this skill via `ad-creative`), `revenue-mapper` (budget cap by stage and risk), `risk-gauge` (archetype gate), `free-first-checker` (mandatory before any paid recommendation), `family-floor` (time allocation)
- Pairs with: `ad-creative` (the asset layer), `analytics-tracking` (UTM + pixel + conversion event), `email-sequence` (the nurture layer that catches leads), `content-strategy` (the organic spine that validates what to amplify)

## Output format

When designing a campaign, output:

```
PAID AD STRATEGY, {campaign name}

GATE CHECK:
- Offer locked: yes/no
- Organic traction: yes/no, named asset
- LP conversion: X% organically
- Tracking installed: yes/no
- Funnel exists: yes/no
- Stage permits: {stage}
- Risk permits: {archetype}
- Budget named: {amount} for {duration}

FREE PATH ALTERNATIVE:
- {description of equivalent free path}
- {time cost vs ad cost comparison}
- Recommend paid OR free: {Claude's read}

CAMPAIGN STRUCTURE (if paid recommended):
- Platform: {Meta / LinkedIn / Google / TikTok}
- Audience: {cohort + size}
- Conversion event: {lead / booking / purchase}
- Budget: ${X}/day for {Y} days
- Variants: {count}, via `ad-creative`
- Tracking: {UTM convention + pixel events}

PILOT TIMELINE:
- Days 1-14: pilot at $5/day, 1 variant
- Day 14 decision gate: scale / hold / kill per CPL vs organic baseline

KILL CRITERIA:
- CPL >2x organic-attributed CPL
- CTR <0.4% on Meta or <0.3% on LinkedIn
- Frequency >4

WIN CRITERIA:
- CPL <1x organic
- Conversion rate >5% on LP

REVENUE TAG: $$ (leverage during pilot, direct after validation)

NEXT STEP:
- Confirm gate check items
- Route to `ad-creative` for variant production
- Set up tracking via `analytics-tracking`
- Family-floor check on time commitment
```

End with: "Lock the strategy, or rework which part?"

## Additional Resources

### Reference files

- **`references/paid-vs-free-decision-tree.md`**, full decision tree for whether to spend ad dollars at all
- **`references/budget-caps-by-stage-and-risk.md`**, detailed matrix of budget caps with examples
- **`references/platform-pick-rules.md`**, extended platform selection logic by ICP + offer + stage

### Example files

- **`examples/early-operator-meta-pilot.md`**, full Early Operator pilot strategy: $5/day Meta pilot for lead-gen assessment, with kill/win criteria and timeline
- **`examples/stable-solo-linkedin-scale.md`**, full Stable Solo LinkedIn campaign: $25/day retargeting for The flagship offer, scaling plan over 60 days

# Early Operator Meta Pilot (Worked Example)

A full pilot strategy for a $5/day Meta campaign promoting the lead-gen assessment lead magnet. Early Operator stage, Low-Burn archetype. Use as the reference for first-paid-campaign design.

## Profile

- **User:** Jared Langley
- **Stage:** Early Operator transitioning to Stable Solo ($5K MRR, growth trajectory)
- **Risk:** Low-Burn
- **Offer being amplified:** lead-gen assessment (free lead magnet at [your-domain].com/quiz)
- **End goal of campaign:** new lead-gen assessment completions → MailerLite nurture → free intro call bookings

## Gate check

| Criterion | Status |
|---|---|
| Offer locked | ✓ Yes, Foundation at $X,XXX locked April 28, 2026 |
| ICP validated with 3+ paying customers | ✓ Sam, Jordan, Riley all paying customers, ICP B2B SaaS sales mgrs validated |
| Organic traction in last 90 days | ✓ lead-gen assessment has been driving ~10-20 signups/month organically |
| Top-performing organic post | ✓ "Three reactive triggers" essay drove 12K LinkedIn impressions, 47 comments, 24 DMs |
| LP conversion above 5% | ✓ lead-gen assessment LP converts at ~12% on direct traffic |
| Email sequence in place | ✓ 5-email welcome series at MailerLite ID 183891490746926897 |
| Tracking installed | ✓ Meta Pixel + UTM convention + LCC_TRACK('Lead') firing on submit |
| Funnel exists | ✓ LP → ML → free intro call via Cal.com → HubSpot deal creation |
| Stage permits | ✓ Early Operator allows $5/day pilot |
| Risk permits | ✓ Low-Burn allows pilot at stage cap |
| Budget named | ✓ $70 over 14 days for pilot |
| Family-floor check | ✓ Ad management 30 min/week, fits in Friday afternoon block |

GATE PASSED. Proceed with pilot design.

## Budget calculation

- Stage cap (Early Operator): $5/day
- 5% rule (Low-Burn at $5K MRR): $250/mo = $8/day
- Use LOWER: $5/day

Pilot total: $5/day × 14 days = **$70 total spend**

## Campaign structure

- **Campaign name:** vibe-check-meta-w22-pilot
- **Objective:** Conversions (Lead)
- **Platform:** Meta (Facebook + Instagram feed placement)
- **Audience:**
  - Primary: Custom Audience, Meta engagers (FB page + IG account) in last 365 days
  - Lookalike: 1% lookalike of lead-gen assessment completers (need 100+ source, currently 350)
  - Geo: US + CA + UK + AU
  - Age: 28 to 45 (skew toward new manager cohort)
  - Interests (narrow): "Sales management", "B2B sales", "SaaS", "Leadership development"
- **Conversion event:** Lead (Meta Pixel) fired on lead-gen assessment form submission
- **Creative:** 1 variant only (baseline from `ad-creative`, modeled on "Three reactive triggers" essay)
- **Bid strategy:** Lowest cost (let Meta optimize)
- **Budget:** $5/day, daily budget (not lifetime)
- **Duration:** 14 days

## Tracking validation

Before launch:

- [x] Meta Pixel installed on jaredlangley.cc (Pixel ID 1384300468613244, verified May 21, 2026)
- [x] Pixel firing Lead event on lead-gen assessment form submission
- [x] UTM parameters on destination URL:
  `?utm_source=meta&utm_medium=cpc&utm_campaign=vibe-check-w22&utm_content=A-baseline`
- [x] MailerLite tags new subscribers with `utm_source=meta` field
- [x] HubSpot tracking script firing on landing page (contact-tied attribution)
- [x] Cal.com booking webhook → HubSpot deal creation tested

## Pilot timeline

### Days 1 to 3: Setup + initial spend

- Day 1: Campaign launched, creative live, Pixel verified firing
- Day 2: Monitor frequency (cap at 4), CPC (benchmark $1-3 for B2B SaaS coaching), no optimization moves
- Day 3: Initial impression volume estimate (~1000-1500 impressions, ~5 to 15 clicks)

### Days 4 to 7: First decision gate

- Day 4: CPL calculation. Compare to organic-attributed CPL.
  - Organic-attributed CPL: lead-gen assessment signup × cost of content production ÷ time. Rough estimate: $5 to $15/signup organically.
  - Paid CPL target: under $20 acceptable, under $10 strong, over $30 kill.
- Day 5: Watch frequency. If over 3 at this point, audience saturating.
- Day 7: Final CPL read for week 1. Decision: continue or kill.

### Days 8 to 14: Second decision gate

- Day 8: If week 1 CPL is acceptable, continue with no changes.
- Day 10: Check frequency, CTR trend.
- Day 14: Final CPL read for pilot. Decision: scale, hold, or kill.

## Kill criteria

Kill the campaign IMMEDIATELY if any of these:

- Day 3+: CPL is $40+ (8x baseline) AND no signs of recovery
- Day 7+: CTR is under 0.4%
- Day 7+: Frequency is over 4
- Day 10+: Conversion rate on LP from paid traffic is under 5% (LP isn't matching paid traffic)
- Pixel stops firing (technical issue)

If killed, document the kill in CLAUDE.md and re-route to organic.

## Win criteria

Promote to scaling if all of these hold by day 14:

- CPL is under $15 (within 1.5x of organic baseline)
- CTR is over 1%
- Frequency is under 4
- LP conversion rate on paid traffic is over 5%
- Variant has earned at least 4500 impressions (significance floor)

If win criteria met, route to `ad-creative` for Variant B production. Bump budget to $10/day for next 30 days. Plan for $20/day at month 2 if continued validation.

## Hold criteria

Hold the campaign at $5/day (don't scale, don't kill) if:

- CPL is between $15 and $30
- CTR is between 0.5% and 1%
- Frequency is between 3 and 4
- Mixed signals

Hold for another 14 days. Re-evaluate at day 28.

## Voice + creative reminder

The variant copy is produced by `ad-creative`. See `examples/vibe-check-meta-static-set.md` for the full creative spec.

VOICE CHECK: clean (creative pre-approved per `ad-creative` skill).

## Family-floor check

- Production: ~1 hour total (already done as part of `ad-creative` work)
- Daily monitoring: 2 to 5 minutes per day
- Weekly review: 30 minutes, Friday afternoon block
- Decision gates: 15 minutes at day 7 and day 14

Total time for 14-day pilot: ~3 to 4 hours. Within available bandwidth.

## Revenue tag

- Pilot phase: $$ (leverage, exploration)
- If pilot succeeds and converts to scale: $$ continues for first 30 days, then $$$ when LTV becomes calculable

## What happens if the pilot wins

Day 14 win → 30-day scaling phase at $10/day:

- Same creative
- Same audience
- Continue tracking + monitoring
- Goal: 90 lead-gen assessment signups in 30 days at <$10 CPL
- Decision at day 44: continue scaling to $20/day or maintain $10/day

If scaling phase wins → 60-day expansion at $20/day:

- Introduce 1 variant (Variant B from `ad-creative` spec)
- Test secondary audience cohort
- Goal: validate paid as ongoing channel at $250/mo+
- Decision at day 104: incorporate into ongoing marketing budget

## What happens if the pilot loses

Day 14 kill → return to organic:

- Document learnings (what didn't work, hypotheses for next attempt)
- Wait 60 days before re-testing paid
- During the 60 days, double down on organic content + cold-email outbound
- Re-evaluate paid at next assessment retake

If pilot is marginal (hold criteria) → another 14 days at $5/day:

- No scaling
- Test variant in week 3 (variant B copy holding visual)
- Decision at day 28: scale, hold, or kill

## Communication to user

When this pilot launches, the user gets:

```
VIBE CHECK META PILOT, LAUNCHED

Budget: $5/day for 14 days = $70 total
Platform: Meta feed
Audience: Custom + 1% Lookalike, narrowed to ICP signals
Creative: 1 variant (modeled on "Three reactive triggers" essay)
Tracking: Pixel + UTM + ML + HubSpot, all verified

DAILY: 2-5 min check on frequency + CPC
WEEKLY REVIEW: Friday 4 pm, 30 min

DECISION GATE DAY 7:
- CPL <$15 = continue
- CPL $15-$30 = hold
- CPL >$30 = kill

DECISION GATE DAY 14:
- CPL <$15 = scale to $10/day
- CPL $15-$30 = another 14 days at $5/day
- CPL >$30 = kill

I'll check in on Friday at the weekly review block. If anything goes off-rails earlier, you'll see the alert in the dashboard.
```

## Post-pilot debrief template

At day 14, regardless of outcome:

```
PILOT DEBRIEF, vibe-check-meta-w22

Spend: $X actual
Impressions: Y
Clicks: Z
CPL: $W
Conversions: V
LP conversion rate (paid traffic): U%
Best-performing hour/day: ...
Worst-performing hour/day: ...

Outcome: scale / hold / kill

Learnings:
- What worked: ...
- What didn't: ...
- What surprised: ...

Next step: ...
```

Log to memory + CLAUDE.md.

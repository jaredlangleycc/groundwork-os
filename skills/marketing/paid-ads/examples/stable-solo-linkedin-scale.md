# Stable Solo LinkedIn Scale (Worked Example)

A full scaling-phase strategy for $25/day LinkedIn retargeting promoting The flagship offer. Stable Solo stage, post-pilot validation. Use as the reference for second-stage paid campaign design.

## Profile

- **User:** Jared Langley (hypothetical 6-month-forward state)
- **Stage:** Stable Solo ($10K MRR, growth trajectory)
- **Risk:** Low-Burn (unchanged)
- **Offer being amplified:** The flagship offer ($X,XXX / 90-day coaching)
- **End goal of campaign:** free intro call bookings → Foundation enrollment

## Gate check

| Criterion | Status |
|---|---|
| Offer locked | ✓ Foundation locked April 28, 2026 |
| ICP validated with 3+ paying customers | ✓ Now at 8 paying customers |
| Organic traction in last 90 days | ✓ lead-gen assessment at 60+ signups/month organically + paid |
| Top-performing organic asset | ✓ "Three reactive triggers" TikTok hit 94K views, 18% completion |
| LP conversion above 5% | ✓ Foundation LP at 8% conversion to free intro call |
| Email sequence in place | ✓ Welcome + nurture sequences active |
| Tracking installed | ✓ LinkedIn Insight Tag + UTM + HubSpot + Cal.com webhook |
| Funnel exists | ✓ LP → lead-gen assessment → ML → Cal.com → HubSpot deal |
| Stage permits | ✓ Stable Solo allows $20-50/day |
| Risk permits | ✓ Low-Burn at $10K MRR allows $500/mo = ~$16/day with 5% rule cap |
| Budget named | ✓ $25/day proposed... |
| Family-floor check | ✓ Ad management 1 hour/week, Friday afternoon |

GATE STATUS: ALMOST PASSED. The proposed $25/day exceeds the 5% rule cap of $16/day at $10K MRR for Low-Burn.

**Revision:** drop to $15/day OR document override.

User's response (hypothetical): "Hold at $15/day, I want to respect the 5% rule."

REVISED BUDGET: $15/day for 60 days = $900 total spend over 2 months.

## Campaign structure

- **Campaign name:** foundation-linkedin-q3-retarget
- **Objective:** Conversions (Lead, Cal.com booking)
- **Platform:** LinkedIn (feed placement, video)
- **Audience:**
  - Primary: Matched Audience, uploaded list of lead-gen assessment completers (currently ~500)
  - Secondary: 1% Matched Audience of flagship-offer clients (8 source, may not generate audience yet)
  - Geo: US + CA + UK + AU
- **Conversion event:** "Book free intro call" (Insight Tag fires on Cal.com confirmation page)
- **Creative:** 3 variants (per `ad-creative` spec, A baseline creator-led video, B testimonial cold-open, C branded card animation)
- **Bid strategy:** Maximum delivery (let LinkedIn optimize)
- **Budget:** $15/day daily budget
- **Duration:** 60 days initially

## Tracking validation

- [x] LinkedIn Insight Tag installed on jaredlangley.cc/foundation
- [x] Insight Tag firing on Cal.com booking confirmation page (separate JS install on cal.com booking widget)
- [x] UTM parameters on each variant's URL
- [x] HubSpot tracking script firing
- [x] Cal.com webhook → CF Pages Function /api/cal-booking writes to HubSpot deal pipeline `2282177230` (Accelerator Funnel), stage `clarity_booked`

## Scaling timeline

### Week 1 (Day 1-7): Variant A + B head-to-head

- Variants A and B run at ~$7/day each = $14/day total
- Audience: Custom (lead-gen assessment completers)
- Conversion: free intro call booking
- Decision Day 7:
  - A and B at parity → continue both
  - One clearly winning → kill the other, scale winner
  - Both losing (CPL >$200) → re-creative

### Week 2 (Day 8-14): Variant testing + audience expansion

- Continue winning creative
- Add Variant C (branded card) at $5/day
- Test 1% Lookalike audience as secondary cohort
- Decision Day 14:
  - Variant C ROI on production cost
  - Lookalike vs Custom Audience CPL comparison

### Weeks 3-4 (Day 15-28): Lock and scale

- Single winning creative
- Scale budget from $15/day to $20/day if CPL is acceptable
- Note: $20/day exceeds 5% rule. Pause for user decision: revert to $15/day OR document override.
- Geographic split test (US-only vs full geo)

### Weeks 5-8 (Day 29-56): Continued validation

- Hold winning structure
- Monitor frequency (cap at 4)
- Refresh creative around day 35 (5-week fatigue)
- Track CAC vs LTV

### Week 9 (Day 57-60): Decision gate

- Total spend at $15/day for 60 days: $900
- Foundation deals closed from this campaign (target: 2-3 at $X,XXX each = $4,800-$7,200 revenue)
- CAC: ~$300-450 per Foundation sale
- LTV: $X,XXX single-purchase + ~$250/mo Ongoing Coaching for grads = $X,XXX + ($250 × 12) = ~$5,400
- CAC/LTV ratio: ~6-8% (excellent)

If ratio under 30%, continue. If over 60%, kill or re-think.

## Kill criteria

Kill IMMEDIATELY if:

- Day 14+: CPL is over $200 (1 Foundation sale ÷ 2 = $1,200 break-even at 50% LP conversion)
- Day 14+: 0 bookings after 5,000 impressions per variant
- Frequency over 4 with no creative refresh
- Insight Tag stops firing

Kill at day 30+ if:

- 0 deals closed (Foundation purchases, not just bookings)
- Bookings are coming but all are off-ICP (no-shows or unqualified)

## Win criteria

Continue scaling if at day 30:

- 2+ Foundation deals closed
- CPL under $150
- LP conversion (paid traffic) over 5%
- Frequency under 4

Promote to $20/day after Low-Burn 5% rule discussion with user.

## Voice + creative reminder

3 variants pre-approved per `ad-creative` (see `examples/example-linkedin-video-set.md`).

VOICE CHECK on all 3: clean.

## Family-floor check

- Production: handled in `ad-creative` work (~6 hours total across 3 variants)
- Daily monitoring: 5-10 min per day
- Weekly review: 1 hour Friday afternoon
- Decision gates: 30 min at days 7, 14, 28, 56

Total time for 60-day campaign: ~25-30 hours. Across 2 months, ~3.5 hrs/week. At edge of family-floor budget; monitor.

## Revenue tag

- Direct ($$$) if Foundation sales are closing
- Leverage ($$) during cold-acquisition phase
- This campaign is borderline, depends on close rate

## What happens if the campaign wins (60-day evaluation)

- Continue at $15/day for next quarter
- Consider scaling to $20/day with user buy-in on 5% rule discussion
- Introduce second platform (Meta retargeting for lead-gen assessment completers as secondary)
- Document learnings: which audience + creative + offer combo converts at lowest CAC

## What happens if the campaign loses

- Document kill reasons in CLAUDE.md
- Return budget to organic content production
- Pause LinkedIn ads for 90 days
- Re-evaluate: is The flagship offer the right offer for paid traffic, or only for warm referrals?
- Possibly: pivot to lead-gen assessment lead-magnet paid acquisition only, treat Foundation as 100% inbound from there

## Communication to user

When this campaign launches:

```
FOUNDATION LINKEDIN SCALE, LAUNCHED

Budget: $15/day for 60 days = $900 total
Platform: LinkedIn (matched audience: lead-gen assessment completers)
Creative: 3 variants (creator-led baseline + testimonial + branded card)
Tracking: Insight Tag + UTM + HubSpot + Cal.com webhook, verified

WEEKLY REVIEW: Friday 4 pm, 1 hour
DAILY: 5-10 min check on frequency + CPC + new bookings

DECISION GATES:
- Day 7: A vs B variant winner
- Day 14: Add C, expand audience cohort
- Day 28: Lock + maybe scale
- Day 60: Continue / kill / re-strategize

CAC TARGET: under $150 per booking
LTV TARGET: $X,XXX+ per closed Foundation sale
TARGET RATIO: CAC/LTV under 30%

I'll surface the day-7 read in the weekly brief on Friday.
```

## Post-campaign debrief template

At day 60:

```
CAMPAIGN DEBRIEF, foundation-linkedin-q3-retarget

Spend: $X actual
Total impressions: Y
Total bookings: Z
Total Foundation sales: V
CAC: $W per closed deal
LTV (estimated): $U per closed deal
CAC/LTV ratio: T%

Winning variant: ...
Best-performing audience: ...
Best-performing day/hour: ...

Outcome: continue / pause / kill

Learnings:
- What worked: ...
- What didn't: ...
- What's the next campaign hypothesis: ...

Next step: ...
```

Log to memory + CLAUDE.md.

## Stage transition note

If the campaign succeeds at Stable Solo and the user's MRR grows past $25K, this campaign migrates to the Scaling Solo budget allowance:

- Up to $250/day per 5% rule (Calculated archetype) or $50/day (Low-Burn)
- Multi-platform: add Meta retargeting layer
- Variant pool: 5 active variants at any time
- Possible: hire performance marketer to manage at $1500-3000/mo retainer

The progression is: pilot → scale → diversify, with each stage gated by validation.

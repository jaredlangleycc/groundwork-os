# Monthly Attribution Review Output (Worked Example)

A full monthly attribution review for the example coaching business, May 2026. Shows the pattern of pulling data, computing channel performance, and producing a decision output.

## Review settings

- **Period:** May 1 to May 31, 2026 (31 days)
- **Stage:** Early Operator transitioning to Stable Solo
- **Tools queried:** MailerLite, HubSpot, Cal.com, Cloudflare Web Analytics
- **Time spent:** 30 minutes

## Data pulled

### MailerLite: new subscribers (last 30 days)

Subscribers added in May, grouped by utm_source:

| utm_source | Subscribers added | % of total |
|---|---|---|
| linkedin | 47 | 38% |
| direct | 28 | 23% |
| threads | 19 | 15% |
| meta | 12 | 10% (cpc) |
| google (organic) | 7 | 6% |
| referral | 5 | 4% |
| (blank / unknown) | 4 | 3% |
| **Total** | **122** | **100%** |

### HubSpot: deals created (last 30 days)

Deals created in May, grouped by stage at end-of-month:

| Stage | Count |
|---|---|
| Lead (Organic Funnel) | 18 |
| Discovery Booked (Organic) | 6 |
| Discovery Held (Organic) | 4 |
| Proposal Sent (Organic) | 1 |
| Research Booked (Accelerator) | 12 |
| Research Held (Accelerator) | 5 |
| Clarity Booked (Accelerator) | 4 |
| Clarity Held (Accelerator) | 2 |
| Strategy Booked (Accelerator) | 1 |

### HubSpot: deals closed-won (last 30 days)

| Source (first touch) | Deal value | Notes |
|---|---|---|
| LinkedIn personal | $X,XXX | Foundation, Sam's referral funnel |
| Direct | $X,XXX | Old Substack reader, took lead-gen assessment direct |
| Referral (Sam intro) | $X,XXX | Sam's colleague |

Total revenue closed in May: **$7,200**

### HubSpot: deals lost (last 30 days)

| Source (first touch) | Loss reason |
|---|---|
| LinkedIn personal | Timing (will revisit in 90 days) |
| Meta (cpc) | Price (referred to lead-gen assessment + nurture only) |

### Cal.com: bookings (last 30 days)

| Slug | Count | Show rate |
|---|---|---|
| intro-call | 8 | 88% (1 no-show) |
| user-interview | 12 | 92% (1 no-show) |
| clarity-session | 4 | 100% |
| strategy-session | 1 | 100% |
| **Total** | **25** | **92%** |

### Cloudflare Web Analytics: top pages

| Page | Pageviews (30d) |
|---|---|
| / (homepage) | 4,127 |
| /vibe-check | 1,843 |
| /blog/three-reactive-triggers | 1,212 |
| /blog/leadership-coaching-for-new-managers | 892 |
| /about | 678 |
| /foundation | 412 |
| /blog/grounding-comes-first | 387 |

### Cloudflare Web Analytics: top referrers

| Referrer | Pageviews (30d) |
|---|---|
| Direct | 3,201 |
| LinkedIn | 2,847 |
| Threads | 1,124 |
| Google | 692 |
| Instagram | 487 |
| Meta (ad clicks) | 312 |
| Other | 488 |

## Computed insights

### Insight 1: LinkedIn is the highest-value channel

- 38% of new subscribers
- Drove $X,XXX closed deal (out of $7,200 total)
- High-quality (1.0% invite-to-book conversion on outbound, see memory `reference_ca-outbound-baseline.md`)

**Decision:** Continue LinkedIn personal at 2 posts/week. No change.

### Insight 2: Direct traffic is bigger than expected

- 23% of subscribers
- 1 of 3 closed deals
- "Direct" = no UTM, likely typed URL or old bookmark

**Decision:** Direct traffic is mostly previous Substack readers + referrals. Build referral-ask into Foundation graduation flow. Track this signal next month.

### Insight 3: Threads drives volume but no revenue

- 15% of subscribers
- 0 closed deals
- 0 calls booked from Threads attribution

**Diagnosis:** Threads audience may be peers (other coaches, sales people interested in the content but not in coaching) rather than ICP (sales managers in transition).

**Decision:** Continue Threads at 5/week cadence (low production cost via spine), but don't increase. If next month also shows 0 revenue from Threads, re-think pillar mix on Threads specifically.

### Insight 4: Meta paid pilot produced 1 booked call, 0 close

- 12 subscribers via Meta paid
- 2 bookings on Cal.com from those subscribers
- 1 of 2 was a no-show, 1 didn't move to clarity-session

**Diagnosis:** Pilot was $5/day × 14 days. CPL ~$5.83 (which is acceptable for a lead-gen assessment), but the bookings didn't qualify.

**Decision:** Pilot data is borderline. Continue another 14 days at $5/day with audience refinement (narrow to "newly promoted sales manager" interests vs general "sales management"). Re-evaluate end of June.

### Insight 5: Referrals are tiny but high-value

- 5 subscribers
- 1 closed deal ($X,XXX)
- 20% conversion rate from subscriber to paying client

**Decision:** Build referral ask into:
- Foundation week 12 (last session)
- lead-gen assessment welcome email 5 (P.S.)
- Sam, Jordan, Riley testimonial pages (when added)

### Insight 6: Three reactive triggers essay is the highest-trafficked content

- 1,212 page views (out of 4,127 homepage, so 30% of homepage traffic flowed to this essay)
- LinkedIn drove most of this (about 60%)
- lead-gen assessment conversion from this page: ~14% (above 12% homepage baseline)

**Decision:** Promote this essay more aggressively in Meta paid retargeting + LinkedIn paid retargeting (when activated).

## Decisions output

```
MAY 2026 ATTRIBUTION REVIEW, DECISIONS

CHANNEL ALLOCATION (no major shifts):
- LinkedIn personal: continue 2/week, primary channel
- Direct: continue current (no specific action; old audience)
- Threads: continue 5/week, but pillar mix review if 0 revenue continues
- Meta paid: continue 14 more days with audience refinement
- Google organic: continue SEO + AI SEO investments
- Referrals: build referral asks into Foundation grad + lead-gen assessment welcome

CONTENT FOCUS:
- Three reactive triggers essay is the top performer
- Promote in paid retargeting layer (Stable Solo expansion)
- Build 2-3 more essays in similar shape (Performance pillar + Wholeness pillar)

PRICING / OFFER NOTES:
- 1 deal lost to price (Meta paid traffic). Pattern to watch.
- All 3 closed deals from "warmer" channels (LinkedIn, direct, referral)
- Cold paid not yet validated for Foundation directly. lead-gen assessment is the right cold offer.

TIME ALLOCATION (next 30 days):
- LinkedIn personal: 4 hrs/week (essay derivative + 1 real-time post)
- Threads: included in spine
- IG + LinkedIn co: included in spine
- TikTok: 30 min/week (script + post)
- Meta paid management: 30 min/week
- Total content + paid mgmt: ~6 hrs/week (within Stable Solo budget)

NEXT REVIEW: First Friday of June (June 6, 2026)
```

## Comparison to April 2026

May 2026 vs April 2026:

| Metric | April | May | Delta |
|---|---|---|---|
| New subscribers | 89 | 122 | +37% |
| Deals closed | 1 ($X,XXX) | 3 ($7,200) | +200% |
| Bookings created | 14 | 25 | +79% |
| Cloudflare pageviews | ~3,800 | ~10,600 | +179% |
| LinkedIn % of subs | 32% | 38% | +6pp |

Patterns:
- Traffic growing fast (new manager essay launch + lead-gen assessment paid pilot)
- LinkedIn share of subs increasing (good)
- Conversion rate stable at ~20% (signups to booking)
- Close rate up (better qualification + nurture sequence working)

## What this review does NOT cover

- Individual content piece performance (covered in `content-strategy` weekly review)
- SEO ranking changes (covered in `seo-audit` quarterly)
- AI citation rate (covered in `ai-seo` > citation monitoring quarterly)
- Email open rates per send (covered in `newsletter-broadcast` weekly)

This is the cross-channel revenue view. Other reviews dig deeper into specific channels.

## How to run this for a different month

1. Pull the same data fields, same time window (30 days)
2. Compute the same insights (channel performance, top content, etc.)
3. Write decisions in the same format
4. Compare to prior month's review

Save each month's output to `reports/monthly-attribution-review-YYYY-MM.md` for trend tracking.

## When the review produces a "kill channel" decision

If a channel has been "0 revenue" for 3 consecutive months despite content effort:

1. Don't kill on month 1 (variance)
2. Don't kill on month 2 (pattern emerging but not confirmed)
3. Consider killing on month 3 (3-month signal)

Before killing, ask: is the channel content quality matching the user's other channels? Is the channel ICP-aligned? Is the channel time-of-day right?

If yes to all and still 0 revenue: kill or significantly de-prioritize.

If no to any: fix the issue first before killing the channel.

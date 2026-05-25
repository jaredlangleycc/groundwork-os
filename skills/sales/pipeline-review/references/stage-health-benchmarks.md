# Stage Health Benchmarks

Healthy velocity, conversion, and volume ranges per pipeline stage. These are starting benchmarks. Calibrate against your own historical data once you have 3+ months of pipeline history.

## How to read these tables

Three metrics per stage:

- **Velocity**: average days a deal spends at this stage before progressing to the next stage (or closing won/lost)
- **Conversion**: percentage of deals that entered this stage and progressed forward (vs. got stuck or moved to lost)
- **Volume**: the bloat threshold. Above this count, the stage is bottlenecking pipeline.

Volume thresholds assume a solo operator with 10-15 hrs/week on the business. Scale up for larger teams.

## Standard 5-stage pipeline (default)

### Lead

| Metric | Healthy | Concerning | Broken |
|---|---|---|---|
| Velocity | 7-14 days | 14-30 days | 30+ days |
| Conversion to Discovery Booked | 30-50% | 20-30% | <20% |
| Volume | 5-30 deals | 30-50 deals | 50+ deals |

**Pattern: too many Leads, low conversion to Discovery Booked.**
Root cause: outreach is generic, ICP is wrong, or follow-up cadence is broken.

**Pattern: very few Leads.**
Root cause: not enough new outreach. Top of funnel starved.

**Pattern: Leads converting fast (under 7 days) but not at high rate.**
Root cause: you're attracting tire-kickers who book quickly then ghost. Tighten ICP or harden the offer.

### Discovery Booked

| Metric | Healthy | Concerning | Broken |
|---|---|---|---|
| Velocity | 0-7 days | 7-14 days | 14+ days |
| Conversion to Discovery Held (show rate) | 70-85% | 50-70% | <50% |
| Volume | 1-5 deals | 5-10 deals | 10+ deals |

**Pattern: show rate below 70%.**
Root cause: discovery is booked far out (over 7 days), prospects ghost. Move discovery sooner. Use confirm-email pattern from `follow-up-tracker`.

**Pattern: discovery booked very fast but show rate low.**
Root cause: prospects book on impulse, lose interest, ghost. Add a pre-call asset (assessment, video) to lock commitment.

### Discovery Held

| Metric | Healthy | Concerning | Broken |
|---|---|---|---|
| Velocity | 7-14 days | 14-28 days | 28+ days |
| Conversion to Proposal Sent | 30-50% | 20-30% | <20% |
| Volume | 3-10 deals | 10-20 deals | 20+ deals |

**Pattern: high volume of Discovery Held with low conversion to Proposal.**
Root cause #1: User owes proposals that aren't getting written. Cross-ref with `follow-up-tracker` "On You" list.
Root cause #2: Discovery calls aren't earning the right to propose. Calls are too "informational." User isn't qualifying or surfacing real pain.

**Pattern: Discovery Held velocity over 21 days.**
Root cause: User is procrastinating on proposals OR prospects are stalling. Push for the next step on the call itself ("when can we get on the calendar for the proposal walk-through").

**Pattern: very few Discovery Held conversations.**
Either Lead conversion is broken (look upstream), or discovery calls are happening but not being logged. CRM hygiene issue.

### Proposal Sent

| Metric | Healthy | Concerning | Broken |
|---|---|---|---|
| Velocity | 7-21 days | 21-35 days | 35+ days |
| Conversion to Verbal Yes / Closed Won | 30-50% | 20-30% | <20% |
| Volume | 2-5 deals | 5-10 deals | 10+ deals |

**Pattern: low conversion from Proposal to close.**
Root cause #1: Proposal format is generic. Worth running `/proposal-writer` audit.
Root cause #2: Price is too high for the perceived value. Worth running `/pricing-strategy` or `/positioning`.
Root cause #3: Discovery didn't actually qualify. User is sending proposals to people who weren't going to buy.

**Pattern: proposals stalling past 21 days.**
Root cause: User isn't running the A/B/C close pattern. Stale proposals = not closed = false pipeline. Use `follow-up-tracker` PS1 template.

**Pattern: proposals closing fast (under 7 days) but at lower price.**
Root cause: User is closing by discounting. Audit avg deal size trend over 3 months.

### Verbal Yes

| Metric | Healthy | Concerning | Broken |
|---|---|---|---|
| Velocity | 0-7 days | 7-14 days | 14+ days |
| Conversion to Closed Won | 90%+ | 75-90% | <75% |
| Volume | 0-3 deals | 3-5 deals | 5+ deals |

**Pattern: Verbal Yes stalling past 7 days.**
Root cause: Logistics friction (contract complexity, payment process). Streamline the signing path. Send invoice with the verbal-yes email, not days later.

**Pattern: Verbal Yes converting below 75%.**
Root cause: User is taking verbal yeses too literally. Some "verbal yes" was actually a "soft maybe." Tighten what counts as verbal.

## Adjusted benchmarks for high-ticket coaching ($2K+)

Velocity stretches at the front, conversion compresses. Use these:

| Stage | Velocity | Conversion |
|---|---|---|
| Lead | 14-30 days | 25-40% |
| Discovery Booked | 0-14 days | 70-85% |
| Discovery Held (now often "research call") | 14-28 days | 40-60% to next stage |
| free intro call (mid-stage) | 0-14 days | 50-70% |
| strategy call | 0-14 days | 60-80% |
| Proposal Sent | 7-21 days | 50-70% |
| Verbal Yes | 0-7 days | 90%+ |

The 3-call funnel (Research → free intro call → strategy call) trades raw velocity for higher per-stage conversion. Total cycle: 6-10 weeks from cold to close.

## Adjusted benchmarks for transactional / low-ticket ($500-1500)

Velocity compresses, conversion compresses.

| Stage | Velocity | Conversion |
|---|---|---|
| Lead | 3-7 days | 40-60% |
| Discovery Booked | 0-3 days | 80-90% |
| Discovery Held | 0-7 days | 50-70% to proposal |
| Proposal Sent | 3-10 days | 40-60% |
| Verbal Yes | 0-3 days | 95%+ |

Total cycle: 1-3 weeks. Volume compensates for lower per-deal size.

## How to calibrate against your own data

After 3 months of pipeline data, compute your actuals:

1. Pull every deal that closed (won or lost) in the last 90 days.
2. For each, log: time at each stage, conversion at each stage.
3. Calculate per-stage averages and conversion rates.
4. Compare to the table above. If your numbers are within 25% of the benchmark, you're at standard. Outside that, investigate why.

The point is not to match the table. The point is to know your own numbers and spot drift over time.

## Volume bloat signals

A bloated stage is a stage with too many deals relative to your weekly throughput.

Math: if your conversion rate at a stage is 30% and your weekly throughput at that stage is 2 deals progressing, then >7 deals at that stage = bloat (you can't move them all).

Volume bloat is the leading indicator of stage drift. When a stage starts bloating, the avg time-in-stage goes up, then conversion drops, then revenue drops 30-60 days later.

Catch bloat early. The pipeline-review skill flags bloat in the Stage Health section.

## Conversion bottleneck math

The lowest conversion stage in your pipeline = your bottleneck.

If your stages convert: 40% Lead → 80% Discovery Booked → 30% Discovery Held → 40% Proposal → 90% Verbal, then your bottleneck is Discovery Held (30%).

Improving Discovery Held conversion from 30% to 45% has more revenue impact than improving Lead conversion from 40% to 50%, because Discovery Held is later in the funnel (the deals are already qualified).

Find your lowest-conversion stage. That's where to spend the next 30 days of skill development effort.

## Velocity vs revenue tradeoff

Faster velocity = more deals through the funnel = more revenue.
Slower velocity = more time per prospect = potentially higher close rate + larger deal size.

There's no universal right answer. The high-ticket coaching pattern slows velocity intentionally (longer discovery, more conversations). The transactional product pattern speeds velocity (qualification by automation, less hand-holding).

Match the velocity to the offer. If you're running high-ticket velocity on a transactional offer (or vice versa), the funnel will leak.

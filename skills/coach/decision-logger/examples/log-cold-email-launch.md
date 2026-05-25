---
date: 2026-05-18
slug: launch-cold-email-channel-v1
type: channel
status: active
revisit_date: 2026-07-15
related_decisions: document-li-outbound-baseline, climb-crm-hubspot-starter
related_skills: challenge, risk-gauge, free-first-checker
---

# Launch Cold Email Channel v1

## Decision

Launch a cold email outreach channel targeting frontline sales managers under 18 months in role at B2B SaaS companies 50-500 employees. Sequence: 3 angles (A: Promoted into a Mess, B: First-Time Manager Crash, C: Founder Path) x 4 touches (D0/D3/D7/D14). Volume target: 300-500 sends per week. Primary CTA: research call. Fallback CTA: lead-gen assessment.

Launch date: Mon June 15, 2026, after 4-week inbox warmup beginning May 18, 2026.

## Context

LinkedIn manual outbound produced 5 booked meetings from 495 invites over 3 weeks (Apr 24 - May 14), establishing a 1% invite-to-book baseline. Volume cap on LI manual outbound is approximately 165 invites per week. To scale meetings to 2-3 per week (the pipeline target), a second outbound channel is required.

Coaching Accelerator program recommended cold email as the cheapest second channel. Existing infrastructure: HubSpot Starter (just climbed from Free), MailerLite Free, no cold-email tooling yet.

## Alternatives considered

- **Option A: Scale paid advertising on LinkedIn.** Sponsored Content at $500/mo over 3 months ($1,500 total). Rejected because 10x over max_tool_spend_monthly cap of $50, no defined kill signal, family-floor concerns from ad management time.

- **Option B: Continue manual LI outbound at maximum.** Sustainable but capped at 5 meetings/wk, falls short of pipeline target. Would also require zero variation in the work pattern, increasing burnout risk.

- **Option C: Hire a sales-enablement agency at $X,XXX/mo.** Rejected because 48x over cap, 3-month minimum contract is 3 months of household-expense-equivalent risk, voice mismatch concern.

- **Option D (chosen): Launch cold email channel v1.** Initial cost $0 (manual sends through existing Gmail and warmup tooling), planned climb to Instantly Starter at $37/mo + Workspace inboxes $18/mo after warmup completes. Total monthly cost post-launch: ~$55/mo, within Calculated archetype range if the cap is updated.

## Expected outcome

By 30 days post-launch (July 15):
- 1,200-2,000 cold emails sent
- Reply rate at or above 4% (warm range for ICP at this scale)
- 8-12 qualified meetings booked
- 2-4 deals in early-stage pipeline

By 60 days post-launch (August 15):
- 2,400-4,000 cumulative sends
- 1-2 closed deals at $X,XXX each ($X,XXX-$4,800 revenue)
- 16-24 cumulative qualified meetings

By 90 days post-launch (September 15):
- Repeatable pipeline at 2-3 booked qualified calls per week
- Channel ROI positive (cumulative revenue exceeds cumulative spend + opportunity cost)
- Decision: continue, scale, or end

## Kill signal

**Primary:** If at 30 days post-launch (July 15), zero qualified meetings have been booked, pause the channel and reassess.

**Secondary:** If at any point in the first 90 days, reply rate drops below 1% sustained for 2 weeks, pause and run subject-line voice-scan + ICP filter review.

**Tertiary:** If cold email inbox management slips into family-floor blocks for 2 consecutive weeks, pause the channel until management time is rebuilt into protected morning slots (M-W-F 8-9am only).

## Reasoning

The 1% known rate from LI manual outbound establishes a forecast. At 300-500 sends/wk at 1% conversion (cold email under-performs LI by ~50%, so realistic conversion is 0.5%), the math is 1.5-2.5 meetings/wk on top of the LI baseline.

Pre-mortem session surfaced 7 realistic failure modes (inbox deliverability, AI-tell drift, founder angle mismatch, concurrent ad obscured signal, undefined kill signal, family-floor erosion, follow-up consistency). 7 mitigations chosen:

1. Extend warmup to 4-6 weeks (originally planned 4, willing to extend to 6 if deliverability signals weak)
2. Kill signal defined upfront (above)
3. Weekly subject-line voice-scan, rewrite if reply rate drops below 4%
4. ICP filter locked: <18mo + B2B SaaS + 50-500 employees only
5. One angle at a time for 30 days each, then mix
6. Inbox management slot: M-W-F 8-9am only, not evenings
7. Run cold email OR paid ads, not both, for the first 90 days

Quote from session: "Manual LI outbound proved 1% invite-to-book at 495 invites. That's a known rate. To scale meetings to 2-3/wk, I need a second channel. Cold email is the cheapest second channel."

## What I am avoiding

I am avoiding admitting that this channel will require evening or weekend hours during the warmup period, even with the M-W-F 8-9am management slot defined. I am betting that the warmup phase will be light enough to fit in mornings, and that the post-launch monitoring will fit in the slot. If it does not, I will need to reduce volume or kill the channel before family-floor breaks.

## Revisit checklist

When this decision is revisited on 2026-07-15, check:

- [ ] Were 1,200+ cold emails sent in the first 30 days?
- [ ] Did reply rate hit 4% or above?
- [ ] Was the 4-week warmup adequate, or did deliverability signal weakness?
- [ ] Did inbox management stay in the M-W-F 8-9am slot?
- [ ] How many qualified meetings booked?
- [ ] Did the kill signal fire? If so, what was done?
- [ ] What did this decision teach me about second-channel launches?

## Tags

#channel-cold-email #outreach #early-operator #challenge #risk-gauge

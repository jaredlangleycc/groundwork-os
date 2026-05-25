# Free-First Attempts Log - the example coaching business

Worked example of the free-first log for an Early Operator. Use as template for what a real, populated log looks like.

## 2026-04-05: Email marketing automation

**Trigger.** lead-gen assessment launching, need 5-email nurture sequence. business-coach recommended testing tooling before paying.

**Free path tried.** MailerLite Free.
- Scope: 1,000 subscribers, 12,000 emails/mo, unlimited automations on free tier (verified 2026-04-05)
- Setup time: 3 hours (account setup, domain verification, custom fields, 1 automation)

**Test window.** 2026-04-05 to 2026-04-19 (14 days)

**Usage during test.** Built lead-gen assessment 5-email nurture automation, 8 subscribers added during window from soft-launch.

**Outcome.**
- What worked: Automation built and activated cleanly. Custom fields supported pillar scoring. Branded sender from hello@jaredlangley.cc verified.
- What did not: Nothing within the 14-day window. Hit no caps.

**Break point.** None at time of test. Sub count 8 of 1,000.

**Climb decision.** No climb. Free path adequate.

**Next review.** 2026-06-05 (60 days, check sub count and automation usage)

**Override note.** n/a

---

## 2026-04-26: Cold outreach to ICP

**Trigger.** Coaching Accelerator program suggested tooling.

**Free path tried.** Manual LinkedIn DMs + Gmail follow-up + Google Sheet tracking.
- Scope: ~50 LI invites per week (LinkedIn rate cap), ~50 cold emails per day (Gmail deliverability cap)
- Setup time: 1 hour (sheet schema + LinkedIn search setup)

**Test window.** 2026-04-26 to 2026-05-14 (18 days, run as 3 weeks)

**Usage during test.** Sent 495 LI invites across 3 weeks (~165/wk). 5 meetings booked. 1% invite-to-book rate.

**Outcome.**
- What worked: Genuine 1:1 contact, no spam-filter risk, voice intact, scheduling clean via Cal.com
- What did not: 165/wk is the max sustainable manual volume. Ceiling is roughly 5 meetings/wk = 20/mo at 1% conversion.

**Break point.** Volume cap. To reach pipeline target of 2-3 meetings/wk, manual outbound is at capacity. Additional volume would require either second outbound channel or automation.

**Climb decision.** Plan to climb to Instantly Starter ($37/mo) AFTER:
1. Secondary domain `jaredlangley.co` purchased ($10/yr one-time)
2. 3 Google Workspace inboxes provisioned ($18/mo)
3. 4-week inbox warmup completed
- Launch target Mon June 15, 2026

**Why this rung and not the next one up.** Instantly Starter handles up to 5,000 sends/mo. Smartlead at similar price tier offers similar capability. Outreach at $100/mo is overkill at this volume.

**Next review.** 2026-07-15 (30 days after launch, verify ROI)

**Override note.** n/a

---

## 2026-05-18: CRM + pipeline tracking

**Trigger.** Cal.com webhook auto-write needed at scale. Google Sheet manual updates slipping past 60 active contacts.

**Free path tried.** Google Sheet "the example coaching business CRM" with 20-column schema, supported by Cal webhook into Google Apps Script.
- Scope: Unlimited rows, manual entry, basic automation via Apps Script
- Setup time: 4 hours initial schema + Apps Script + service account auth

**Test window.** 2026-04-26 to 2026-05-18 (22 days)

**Usage during test.** 67 contacts tracked, 12 Cal bookings logged manually after each happened, 1 weekly Friday review per week.

**Outcome.**
- What worked: Schema clean, Gemini canvas viz downstream excellent, zero cost, full control over data
- What did not: Manual writes after Cal bookings consumed ~15 min/day. Stage updates slipped 2-3 days. Hot-lead notification emails required cross-referencing.

**Break point.** Manual write after Cal booking = 15 min/day = ~$375/mo at $100/hr opportunity cost. Apps Script auth refresh broke twice during window. The need is auto-write on webhook receipt, not the manual write.

**Climb decision.**
- Tool chosen: HubSpot Starter ($20/mo)
- Why this rung: Unlocks 2 pipelines (Organic + Accelerator funnels) + Marketing automations + Service Key for Cloudflare Worker dual-write. Free tier blocks pipelines.
- Why not Marketing Hub Pro at $XXX/mo: Not needed at this stage. The Starter SKU does everything required.

**Next review.** 2026-06-18 (30 days after climb, verify 2 pipelines actually used, verify webhook automations firing)

**Override note.** n/a

**Deprecation.** Google Sheet retained for Gemini canvas visualization downstream. HubSpot is now source of truth for contacts + deals.

---

## 2026-05-22: Discovery form for SIL family project (Avery OS)

**Trigger.** Need form to collect 8 sections of discovery answers, send via email push.

**Free path tried.** Hand-coded HTML form at `private/<slug>.html` posting to Cloudflare Pages Function via `navigator.sendBeacon`.
- Scope: Unlimited submissions, hosted free on existing CF Pages
- Setup time: 2 hours

**Test window.** 2026-05-22 (single day - urgent test for one user)

**Usage during test.** 1 submission from intended recipient, beacon POST landed cleanly, email delivered to hello@ with Outlook Form-Fill rule applied.

**Outcome.**
- What worked: Beacon delivery reliable, mobile-friendly form, no SaaS lock-in
- What did not: n/a

**Break point.** None.

**Climb decision.** No climb. Hand-coded form is more honest for a family project (no CRM enrollment, no MailerLite, no HubSpot dual-write).

**Next review.** n/a (one-off use case)

**Override note.** n/a

---

## Patterns this log surfaces

Reading these 4 entries reveals patterns the user might miss:

1. **Free path adequate in 50% of tested functions.** Email and discovery-form did not need a climb. The default narrative ("you need real tools") is wrong half the time.

2. **The climbs that did happen had specific break points.** Outbound = volume cap. CRM = manual-write cost. Both are real, both have a number attached. Neither was "felt cramped."

3. **Each climb went to the lowest rung that fixed the break.** Not the recommended tier. Instantly Starter not Outreach. HubSpot Starter not Marketing Hub Pro.

4. **Total monthly stack post-climbs: $42/mo** (HubSpot $20 + planned Instantly $37 + Workspace inboxes $18 = $75/mo, but inboxes serve dual purpose for personal email so the marginal business cost is $20 + $37 + $0 = $57/mo, still under cap of $200 if cap had been raised, well within updated Calculated archetype range).

Stack creep avoided. Climbs justified. Log honest.

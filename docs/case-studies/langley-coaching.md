# Case Study: Langley Coaching

> **Consent disclosure:** This case study is opt-in. Jared Langley is the OS author and consents to his own business being shared as the reference implementation. Specific client names are anonymized to protect prospects and clients who did not consent to public exposure. Numbers and structure are real.

The OS that NightShiftOS is extracted from. This is what running it looks like in practice for one working-parent solopreneur.

---

**Who:** Jared Langley, leadership coach, founder of Langley Coaching.
**Stage:** Early Operator (<$5K MRR transitioning to Stable Solo)
**ICP:** Frontline sales managers <18 months in role, B2B SaaS 50-500 employees
**Offer:** 90-day coaching engagement, $2,400 (or $800/mo × 3, 30-day refund)
**Floor:** Family time M-F 4-7pm, no work Sundays
**Coach archetype:** Challenger
**Risk archetype:** Low-Burn

---

## The stack (free-first, climbing slowly)

| Function | Tool | Cost / mo |
|---|---|---|
| Website + hosting | Cloudflare Pages | $0 |
| Email | Microsoft 365 Business Basic | $6 |
| CRM | HubSpot Starter | $20 (started on Free + Google Sheet) |
| Email marketing | MailerLite Free | $0 |
| Scheduling | Cal.com Free | $0 |
| Finance log | CSV in Google Sheet | $0 |
| Social scheduling | Buffer Free / Typefully | $0 / $15 |
| Domain | Cloudflare Registrar | ~$1 |
| **Total** | | **~$42 / mo** |

Climbed: Sheets to HubSpot Free to HubSpot Starter when contact count hit 50.

Refused so far: Webflow ($$), Notion paid tier ($$), agency-recommended tools, "scaling" automation tools before there's volume to automate.

---

## The funnel

### Top of funnel (free, public)

- **Lead-gen assessment** — 12-question quiz, scored across 3 pillars, gated for email after scoring
- **Blog** — weekly essay, nurture sequence on signup
- **Social** — LinkedIn personal + brand page, Threads, IG (60% evergreen, 40% timely)

### Mid-funnel (warming)

- **MailerLite nurture** — 5-email sequence over 14 days, then 21-day no-booking recovery
- **Newsletter** — weekly broadcast

### Bottom of funnel (sales)

- **Discovery call** (30 min, Cal.com) for organic-funnel leads
- **Research call → free intro call → strategy call → close** for cold-outbound leads (3-call accelerator funnel)
- **Flagship 90-day engagement** at $2,400

---

## The week (running the OS)

### Monday 7am: daily brief

Cron-fired. Pulls HubSpot deals + Cal bookings + new email signups + CRM sheet sanity check. Writes 1-pager. iMessages compact version to phone.

### Monday morning: weekly brief

Pipeline, content shipped/queued, finance MTD, week ahead with revenue-mapper tags, one question.

### Tue-Thu: client delivery + outreach

Client sessions in the morning, outreach + content in the afternoon, family floor 4-7pm.

### Friday: file sweep + decision log

Inbox sort, backup rotation, decisions logged, content for next week queued.

### Sunday: essay ship workflow

10-step Sunday Essay Ship procedure. Duplicate template, generate OG card, wire schema, update sitemap + RSS + blog grid, deploy via wrangler, queue social spine, draft newsletter, send.

---

## What the principles look like in practice

### Free-first

When evaluating a paid prospect-data tool, first tested the platform's free contact discovery, then a free tier of a competitor via existing tenant access, THEN considered the paid option. Documented free path before climbing.

### Revenue-mapped

Every weekly brief tags activities. Recent week example:

```
$$$ : Active prospect clarity-call prep + delivery (4 hrs)
$$  : 5 LI DMs to new manager ICPs (1.5 hrs)
$$  : Newsletter issue (3 hrs)
$    : HubSpot stage cleanup on 12 stale deals (1 hr)
distraction : Researching a new analytics tool (2 hrs), flagged, dropped
```

### Risk-gauged

Cold email channel v1 designed and scoped, but launch deferred until next paycheck because: secondary domain + 3 inboxes + sending platform = ~$65/mo + 4-week warmup. Max tool spend honored.

### Coach not consultant

Most prospecting decisions go through coach loop. Example: when deciding whether to cancel a scheduling tool that wasn't getting used, the question "what would change if you cancelled and used the free tier?" surfaced that cancellation didn't actually block any cadence. So cancelled.

### Family-floor first

Calendar block "Dad Floor" set as recurring M-F 4-7pm OOF in M365 with iOS push reminder. No call scheduling tools allow booking during it. Period.

### Boring stack ladder

Climbed HubSpot Free to Starter when contact count hit 50 and email-sending domain authorization became worth $20/mo. Did NOT climb to Marketing Hub (Phase 2 deferred) until traffic justifies it.

---

## What the OS prevents

### Tool sprawl

Every new tool requires documented free-path attempt. Blocked: Notion paid (Google Doc works), Linear (GitHub Issues works), Webflow (Cloudflare Pages works).

### Distraction creep

When the temptation to redesign the site for the 4th time appeared, revenue-mapper tagged it distraction. Time went to follow-ups instead.

### Over-promising to keep clients

"Don't lie to clients to keep them" is in the values list. When a misfit prospect appeared (would've paid but wrong ICP), the coach-mode loop surfaced that taking the deal would burn future positioning. Declined.

### Burnout drift

Family-floor caught 3 separate attempts to schedule into 4-7pm M-F over the past quarter. All moved.

---

## The numbers (shareable subset)

- Stack burn: ~$42/mo
- Content cadence: 1 essay/wk, 10-12 social posts/wk
- Pipeline: 50+ contacts at HubSpot Starter
- Conversion (LI outbound baseline): 1% invite-to-book, 4% positive reply
- Current paying client count: 5 (mix of flagship + ongoing)

---

## What's worth stealing

If you're a 1-person business considering this OS:

1. **Run the assessment first.** The customize step is what makes the OS feel like yours, not a generic shell.

2. **Honor the family-floor non-negotiably.** Every other principle compounds from this one. Without it you'll burn out and lose the long game.

3. **Climb the stack ladder slowly.** Sheets + free tiers can carry you to $5K MRR. Don't pay for problems you don't have yet.

4. **Run weekly-brief on Monday before opening any other app.** It sets the lens for the week.

5. **Trust coach-mode.** It's slower than getting a generic answer. It's faster across a year because you stop overriding generic advice that didn't fit.

---

*Modeled, extracted, generalized, packaged. Now yours.*

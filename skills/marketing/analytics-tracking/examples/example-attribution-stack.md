# Langley Attribution Stack, May 2026 (Worked Example)

The full attribution stack live for jaredlangley.cc as of May 23, 2026. Use as the reference architecture for the NightShiftOS default stack.

## Stack overview

| Layer | Tool | Status |
|---|---|---|
| Site analytics | Cloudflare Web Analytics | Live, no cookies |
| Email + lead capture | MailerLite Free | Live, 1000-sub cap |
| CRM + contact attribution | HubSpot Starter | Live |
| Forms backend | CF Pages Functions (_worker.js) | Live, 4 endpoints |
| Booking attribution | Cal.com webhook → CF Function | Live, slug-based stage routing |
| Hot-lead notifications | Resend → hello@jaredlangley.cc | Live |
| Backup CRM | Google Sheet via service account | Live |
| Meta Pixel | Scaffolded, ACTIVE since May 21, 2026 | Live |
| LinkedIn Insight Tag | Scaffolded, ACTIVE since May 21, 2026 | Live |
| HubSpot tracking script | Live since May 19, 2026 | Live |

Total monthly cost: $20 (HubSpot Starter) + $0 everything else.

## Layer 1: Cloudflare Web Analytics

**Setup:** Enabled in Cloudflare dashboard for the langleycc Pages project. Beacon auto-injects on every page.

**What it tracks:**
- Page views by URL
- Top referrers (LinkedIn, Threads, IG, direct, Google search, etc.)
- Top pages
- Visitor count (aggregate)
- Geo (country)
- Device type

**Where to read:** Cloudflare dashboard > Analytics & Logs > Web Analytics.

**Cadence:** Friday 4 pm, 5 minutes per the weekly check ritual.

**Why it's the default:** privacy-first, no cookies, no banner needed for most jurisdictions, free.

## Layer 2: MailerLite (Free tier)

**Account:** hello@jaredlangley.cc

**Group structure:**

- Contact Form Leads (id `183891361927760523`)
- lead-gen assessment subscribers (id `183891421635282046`)
- Assessment Leads (id `183891373384141462`)
- Booked Calls (id `186380195558589965`)
- Booked Pre-Research Group (id pending; for pre-call nurture)

**Custom fields (10 attribution + 5 product):**

Attribution:
- utm_source
- utm_medium
- utm_campaign
- utm_content
- utm_term
- gclid (Google Ads click ID)
- fbclid (Meta click ID)
- referrer_url
- landing_page
- first_touch_at

Product:
- vibe_check_score
- vibe_check_archetype
- vibe_check_quietest_pillar
- vibe_check_submitted_at
- booked_calls_count

**Automations active:**
- lead-gen assessment Welcome Series (id `183891490746926897`), 5 emails over 14 days
- 21-day no-booking recovery (id `185799912354482056`), drafted, not yet activated

## Layer 3: HubSpot Starter

**Account:** 246228969, ownerId Jared = 92506843, region NA2

**Custom contact properties (6):**
- pillar_focus
- funnel_source (enum: Organic, Outbound, Referral, etc.)
- outbound_source (enum: Cold Email, LinkedIn DM, etc.)
- vibe_check_score
- vibe_check_submitted_at
- booked_calls_count

**Custom deal properties (2):**
- pillar_focus
- loss_reason

**Pipelines (2):**
- Organic Funnel (`default`), Lead / Discovery Booked / Discovery Held / Proposal Sent
- Accelerator Funnel (`2282177230`), Research Booked / Research Held / Free Coaching Booked / Free Coaching Held / Strategy Booked / Strategy Held / Proposal Sent

Stage IDs documented in memory `reference_hubspot-stage-pipeline-ids.md`.

**Service Key:** `Cloudflare Worker - langley-site` (id 39959924), scopes: contacts r/w + deals r/w. Token in CF Pages env var `HUBSPOT_ACCESS_TOKEN`.

**Tracking script:** `//js-na2.hs-scripts.com/246228969.js` injected on 15 HTML pages (12 public + 3 private). Site-wide page view attribution to contacts.

**Integrations:** Cal.com + Microsoft Teams + Outlook + Outlook Calendar.

## Layer 4: attribution.js + form handler (CF Pages Functions)

**Client-side capture:**

`langley-site/js/attribution.js` (loaded on every page) captures:
- First-touch UTMs to localStorage (set once, never overwritten)
- Last-touch UTMs to sessionStorage (overwritten each visit)
- Injects hidden inputs into every form with first-touch values

**Server-side write:**

`_worker.js` routes 4 endpoints:

1. `/api/contact` (contact form) → MailerLite Contact Form Leads + HubSpot Contact creation
2. `/api/vibe-check` (lead-gen assessment submission) → MailerLite lead-gen assessment subscribers + HubSpot Contact with vibe_check_* fields
3. `/api/submit` (private assessment form) → MailerLite Assessment Leads + HubSpot Contact + notification email
4. `/api/cal-booking` (Cal.com webhook) → HubSpot Deal creation in correct pipeline + MailerLite Booked Calls + notification email

All 4 endpoints write the 10 attribution fields to MailerLite + HubSpot.

**Notification:** Resend sends hot-lead alert to hello@ within 60 seconds of any conversion.

## Layer 5: Cal.com webhook (per-slug routing)

**Webhook URL:** https://jaredlangley.cc/api/cal-booking

**Triggers:** BOOKING_CREATED, RESCHEDULED, CANCELLED, MEETING_ENDED

**Slug-based stage routing** (in `_worker.js`):

```javascript
const STAGE_BY_SLUG_BOOKED = {
  'intro-call': 'discovery_booked',
  'user-interview': 'interview_booked',
  'clarity-session': 'clarity_booked',
  'strategy-session': 'strategy_booked'
};

const STAGE_BY_SLUG_HELD = {
  'intro-call': 'discovery_held',
  'user-interview': 'interview_held',
  'clarity-session': 'clarity_held',
  'strategy-session': 'strategy_held'
};

const CLIENT_SESSION_SLUGS = ['coaching-session']; // notify-only, no CRM write
```

**Pipeline routing:**
- `intro-call` → Organic Funnel
- `user-interview`, `clarity-session`, `strategy-session` → Accelerator Funnel

## Layer 6: Pixel scaffolds (ACTIVE since May 21, 2026)

`langley-site/js/site-tags.js`:

```javascript
const META_PIXEL_ID = '1384300468613244';
const LINKEDIN_PARTNER_ID = '9387988';

window.LCC_TRACK = function(event, params) {
  if (window.fbq) {
    window.fbq('track', event, params || {});
  }
  if (window.lintrk) {
    window.lintrk('track', { conversion_id: LINKEDIN_LEAD_CONVERSION_ID });
  }
};

// Pixel snippets here, no-op if IDs were empty.
```

Fires `LCC_TRACK('Lead')` on form submission for lead-gen assessment + Contact + Assessment.

Both pixels verified live in Meta Test Events + LinkedIn Insight Tag Helper.

## Weekly check (Friday 4 pm, 5 minutes)

Checklist:

- [ ] Cloudflare Web Analytics: top 5 pages + top 5 sources + week-over-week visitor delta
- [ ] MailerLite reports: subscribers added this week + utm_source breakdown
- [ ] HubSpot: deals created this week + stage progression
- [ ] Cal.com: bookings created this week + show-up rate

Time: 5 minutes. Output: 1-paragraph weekly summary in CLAUDE.md or weekly brief.

## Monthly attribution review (first Friday, 30 minutes)

Process:

1. **Pull MailerLite subscriber list** (last 30 days), group by utm_source. Tally count per source.

2. **Pull HubSpot deals closed** (last 30 days), trace contact's first_touch_at. Tally revenue per source.

3. **Compute insight:** which channel drives most subs? Which drives most revenue? Often different.

4. **Decision:** where to allocate next month's content time + ad budget.

Output (example):

| Source | Subs (30d) | Bookings (30d) | Deals closed (30d) | Revenue (30d) |
|---|---|---|---|---|
| linkedin | 38 | 7 | 1 | $X,XXX |
| direct | 22 | 4 | 1 | $X,XXX |
| threads | 16 | 1 | 0 | $0 |
| meta | 10 | 2 | 0 | $0 |
| google (organic) | 8 | 1 | 0 | $0 |
| referral | 4 | 2 | 1 | $X,XXX |

Insight:
- LinkedIn drives the most subs AND revenue
- Direct is second on both
- Threads drives subs but no revenue (audience may be peers, not ICP)
- Meta paid produced 0 deals this month (re-think targeting)
- Referrals: small but high-converting (each referral = ~25% close rate)

Decision: double down on LinkedIn organic. Continue Meta pilot for 14 more days. Build referral ask into Foundation graduation.

## Privacy disclosure

`privacy.html` updated May 20, 2026 to disclose HubSpot cookies (`hubspotutk`, `__hssc`). Updated May 21 to disclose Meta Pixel + LinkedIn Insight Tag now-active state.

## What this stack does NOT include

- Google Analytics 4 (deferred until Stable Solo if Cloudflare proves insufficient)
- Google Tag Manager (deferred until 10+ tracking scripts)
- Heat maps / Microsoft Clarity (deferred until specific LP diagnosis needed)
- Cohort analysis tools (manual via Sheet for now)
- Multi-touch attribution (first + last touch covers solopreneur needs)
- Lead scoring (HubSpot Starter doesn't include; Marketing Hub does)

## Stack evolution path

When Jared crosses $25K MRR (Scaling Solo transition):

- Activate HubSpot Marketing Hub (~$80/mo step up from Starter $20)
- Add lead scoring via HubSpot Marketing Hub
- Possibly add GA4 free for cohort visualization
- Possibly add Microsoft Clarity for LP heatmaps

When list hits 1000 (any time):

- Decide MailerLite Free → MailerLite Starter ($30/mo) OR migrate to Kit Creator ($29/mo at 1000 to 3000 subs)

When daily traffic hits 500/day:

- Re-evaluate Cloudflare Analytics vs Plausible for richer privacy-first reporting

These upgrades are NOT urgent. The current stack supports Stable Solo cleanly.

## Documentation references

- `_worker.js`, the full Cloudflare Pages Function source
- `js/attribution.js`, UTM capture client-side
- `js/site-tags.js`, pixel scaffolds + LCC_TRACK
- `privacy.html`, disclosure page
- CLAUDE.md > "Forms" + "Email Setup" + "Business tool stack" sections, operating reference
- Memory `reference_hubspot-stage-pipeline-ids.md`, HubSpot pipeline + stage IDs
- Memory `project_hubspot-phase4-worker-may19.md`, Phase 4 worker dual-write history
- Memory `reference_pixels-scaffold-pattern.md`, pixel scaffold pattern

This stack is the reference architecture other NightShiftOS users adapt to their specifics.

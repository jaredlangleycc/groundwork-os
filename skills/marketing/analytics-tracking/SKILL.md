---
name: analytics-tracking
description: This skill should be used when the user asks to "set up analytics", "UTM tracking", "conversion tracking", "attribution", "where are my leads coming from", "track conversions", "analytics setup", "tag my links", "GA4 setup", "Cloudflare analytics", "Plausible setup", or wants to wire measurement for their marketing. Free tools first (CF Web Analytics, GA4 free, MailerLite reports). Privacy-respecting (no Meta Pixel or LinkedIn Insight Tag by default). Stage-aware.
version: 0.1.0
---

# Analytics Tracking

The measurement layer for everything else. UTM design, conversion tracking, attribution. Without it, the user can't tell which content drives revenue, which channel is working, or whether paid ads are profitable.

The trap: setting up Google Analytics, never reading it. This skill installs only the tracking the user will actually use, and gives them the 5-minute weekly check.

## When this skill triggers

- "Set up analytics"
- "UTM tracking"
- "Where are my leads coming from"
- "Track conversions"
- "Conversion event"
- "Attribution"
- "Tag my links"
- "Why don't I know which content works"

NOT for: SEO performance tracking (use `seo-audit`), AI citation tracking (use `ai-seo` > citation monitoring), content strategy decisions (use `content-strategy`).

## The diagnostic before setting up

Coach-mode. One question at a time.

1. "What's the conversion event you most want to track?" (signup, booking, purchase, something else)
2. "What tools do you currently have installed?" (GA4, Cloudflare Analytics, Plausible, Fathom, MailerLite reports, HubSpot)
3. "Where do you currently look to answer 'is this working?'" (and how often)
4. "What's the question you can't answer right now?"
5. "What's your privacy stance? (no third-party trackers / OK with privacy-respecting / OK with all major platforms)"

If the user says "I want to know everything," push back. The 90% solution is 3 to 5 events tracked well. Tracking 50 events means tracking none.

## The 3 layers

Solopreneur analytics has 3 layers. Don't add more without a specific reason.

### Layer 1: Site analytics (page views, sources, basic engagement)

What it tracks:
- Page views by URL
- Top pages
- Sources (referrer, search, direct, social)
- Visitor count

Free tools:
- **Cloudflare Web Analytics** (privacy-first, no cookies, free on any plan) is the default
- **Plausible** (privacy-first, $9/mo paid; has a free EU-hosted self-host option)
- **Fathom** (privacy-first, $14/mo)
- **GA4 free** (full-featured but privacy-heavy)

For NightShiftOS default: **Cloudflare Web Analytics**. Free, no cookie banner needed in most jurisdictions, integrates with Cloudflare Pages.

### Layer 2: Conversion event tracking (signups, bookings, purchases)

What it tracks:
- Form submissions
- Booking confirmations
- Purchase completions

Free tools:
- **Cloudflare Pages Function** writes to MailerLite + HubSpot + Google Sheet on form submit (the Langley pattern)
- **MailerLite Webhooks** fire on subscriber add
- **HubSpot tracking script** (free on HubSpot Free or Starter) ties page views to contacts
- **Cal.com webhooks** fire on booking creation

These are wired into the user's site, not bolted on via a tag manager.

### Layer 3: UTM + source attribution

What it tracks:
- Which channel + campaign + content drove the conversion
- First-touch vs last-touch attribution

Implementation:
- UTM parameters on every outbound link from social, ads, newsletter
- JavaScript in the site captures UTM at landing
- Attribution data flows to MailerLite custom fields + HubSpot deal properties + Google Sheet column

Free, no tools required beyond the site code.

## The UTM convention

Every outbound link the user posts should carry UTM parameters. Without them, attribution is impossible.

### The 5 UTM parameters

| Parameter | What it captures | Required? |
|---|---|---|
| utm_source | Where the traffic came from (linkedin, threads, meta, newsletter) | Required |
| utm_medium | The type of traffic (social, cpc, email, organic) | Required |
| utm_campaign | The campaign name (vibe-check-w22, foundation-launch) | Required |
| utm_content | The variant within the campaign (post-1, variant-A, hero-button) | Optional but recommended |
| utm_term | The keyword (mostly paid search) | Optional |

### Example UTMs

For a LinkedIn personal post linking to lead-gen assessment:

```
https://[your-domain].com/quiz?utm_source=linkedin&utm_medium=social&utm_campaign=vibe-check-organic&utm_content=post-3-reactive-triggers
```

For a Meta paid ad linking to lead-gen assessment:

```
https://[your-domain].com/quiz?utm_source=meta&utm_medium=cpc&utm_campaign=vibe-check-w22&utm_content=A-baseline
```

For a newsletter CTA linking to lead-gen assessment:

```
https://[your-domain].com/quiz?utm_source=mailerlite&utm_medium=email&utm_campaign=sunday-issue-2026-w21&utm_content=cta-footer
```

### Convention table for NightShiftOS users

| Channel | utm_source | utm_medium |
|---|---|---|
| LinkedIn personal | linkedin | social |
| LinkedIn company | linkedin | social-company |
| Threads | threads | social |
| Instagram (organic) | instagram | social |
| Instagram (paid) | instagram | cpc |
| TikTok | tiktok | social |
| Newsletter | mailerlite (or kit, beehiiv) | email |
| Cold email | gmail (or via Instantly) | cold-email |
| Meta paid | meta | cpc |
| LinkedIn paid | linkedin | cpc |
| Google paid | google | cpc |
| Google organic | google | organic (often auto-detected) |
| Other site (referral) | {domain} | referral |
| Direct (URL typed) | (empty, auto-detected) | direct |

### Campaign naming convention

`{topic-or-offer}-{stage-or-week}`

Examples:
- vibe-check-organic
- vibe-check-w22 (week 22 of the year)
- foundation-launch-q3
- groundwork-essay-3-reactive-triggers

Use ISO week numbers OR descriptive slugs. Be consistent.

### Content naming convention

Identifies the specific variant or post:

- post-3-reactive-triggers (a specific post)
- A-baseline (variant A in an ad test)
- cta-footer (the footer CTA in a newsletter)
- bio-link (the link in the social bio)

## Attribution capture (the Langley pattern)

Each visitor's UTMs are captured to localStorage on landing. On form submit, those values write to the user's CRM + ESP.

### Implementation

#### attribution.js (in site)

```javascript
// langley-site/js/attribution.js
(function() {
  const params = new URLSearchParams(window.location.search);
  const utmKeys = ['utm_source', 'utm_medium', 'utm_campaign', 'utm_content', 'utm_term'];

  // First-touch (set once, never overwritten)
  if (!localStorage.getItem('attribution_first_touch')) {
    const firstTouch = {};
    utmKeys.forEach(key => {
      if (params.get(key)) firstTouch[key] = params.get(key);
    });
    firstTouch.referrer_url = document.referrer || '';
    firstTouch.landing_page = window.location.pathname;
    firstTouch.first_touch_at = new Date().toISOString();
    localStorage.setItem('attribution_first_touch', JSON.stringify(firstTouch));
  }

  // Last-touch (overwritten on each visit with UTMs)
  const utmsThisVisit = {};
  utmKeys.forEach(key => {
    if (params.get(key)) utmsThisVisit[key] = params.get(key);
  });
  if (Object.keys(utmsThisVisit).length > 0) {
    sessionStorage.setItem('attribution_last_touch', JSON.stringify(utmsThisVisit));
  }

  // Inject hidden inputs into every form on the page
  function injectHiddenInputs() {
    const forms = document.querySelectorAll('form');
    const firstTouch = JSON.parse(localStorage.getItem('attribution_first_touch') || '{}');
    forms.forEach(form => {
      Object.entries(firstTouch).forEach(([key, value]) => {
        if (!form.querySelector(`input[name="${key}"]`)) {
          const input = document.createElement('input');
          input.type = 'hidden';
          input.name = key;
          input.value = value;
          form.appendChild(input);
        }
      });
    });
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', injectHiddenInputs);
  } else {
    injectHiddenInputs();
  }
})();
```

Load on every page in `<head>`.

#### Worker integration

When the form submits, the worker (CF Pages Function) reads the hidden inputs and writes them to MailerLite custom fields + HubSpot deal properties + Google Sheet attribution columns.

See Langley `_worker.js` for the full implementation.

#### MailerLite custom fields

Create the 10 attribution custom fields in MailerLite (one-time setup):

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

Per-subscriber attribution becomes queryable.

## Stage-aware tracking

### Pre-Rev Builder

- Cloudflare Web Analytics only
- No UTM convention enforcement
- Don't track conversions; there are none yet

### Early Operator

- Cloudflare Web Analytics + MailerLite reports
- UTM convention enforced on all outbound links (manual discipline)
- Conversion tracking via form-submit handlers
- Weekly 5-minute glance: top pages + top sources + signup count

### Stable Solo

- Layers 1 + 2 + 3 all active
- HubSpot tracking script if using HubSpot CRM
- Cal.com webhook → conversion tracking
- Monthly attribution review: which channel drove the most revenue

### Scaling Solo

- All above + cohort analysis
- Possibly GA4 free (for cohort + funnel features) if Cloudflare Analytics is insufficient
- Possibly behavior-triggered automations (e.g. signup from LinkedIn → different nurture than signup from Threads)
- Attribution model decision: first-touch vs last-touch vs multi-touch

## Free path

| Need | Free tool | When to upgrade |
|---|---|---|
| Site analytics | Cloudflare Web Analytics (free, privacy-first) | Plausible $9/mo only if user needs additional features and wants paid privacy-first |
| Conversion tracking | Worker + form handler (no third-party tool) | HubSpot Marketing Hub if user is on HubSpot + wants behavior triggers |
| UTM capture | Custom JavaScript (free, ~50 lines) | Stays free always |
| Email engagement | MailerLite / Kit / Beehiiv free tier reports | Paid tier when audience over 1000 |
| Newsletter signup attribution | UTM + custom field per subscriber | Free always |
| Calendar booking attribution | Cal.com webhook + worker writing to CRM | Free always |
| Multi-channel funnel view | Combine Cloudflare Analytics + MailerLite reports manually | GA4 free if user needs single dashboard |
| Cohort retention | Manual via spreadsheet | GA4 free for automated cohorts |
| Heat maps / scroll tracking | None (skip at solopreneur stage) | Microsoft Clarity (free) only when LP conversion needs deep diagnosis |

Bootstrap-Strict + Pre-Rev users stay 100% free.

## Privacy-respecting defaults

Default for NightShiftOS:

- Cloudflare Web Analytics (no cookies, no PII)
- MailerLite (necessary for email service)
- HubSpot tracking script (necessary if HubSpot is the CRM, disclosed in privacy policy)
- Meta Pixel OFF by default, scaffolded for when paid is justified
- LinkedIn Insight Tag OFF by default, scaffolded for when paid is justified
- Google Tag Manager OFF (often overkill; direct script integration is cleaner)
- Heat maps OFF (overkill at solopreneur stage)

Privacy policy must disclose every tracker actually in use. See Langley `privacy.html` for the disclosure pattern.

## Pixel scaffold pattern (for paid ads later)

Even if not running paid yet, install pixel scaffolds that no-op until IDs are filled in. Langley pattern in `js/site-tags.js`:

```javascript
// langley-site/js/site-tags.js
window.LCC_TRACK = function(event) {
  // Meta Pixel
  if (window.fbq && META_PIXEL_ID) {
    window.fbq('track', event);
  }
  // LinkedIn Insight Tag
  if (window.lintrk && LINKEDIN_PARTNER_ID) {
    window.lintrk('track', { conversion_id: LINKEDIN_CONVERSION_ID });
  }
};

const META_PIXEL_ID = ''; // paste when activating
const LINKEDIN_PARTNER_ID = ''; // paste when activating

// Pixel snippet here, no-op if ID is empty
```

When the user starts paid ads, paste the IDs and the trackers activate. Until then, no third-party scripts load.

## The 5-minute weekly check

The whole point of analytics is to inform decisions. Without a regular check, the data sits unused.

### Weekly check ritual (Friday afternoon, 5 minutes)

1. **Cloudflare Web Analytics:** top 5 pages + top 5 sources + total visitors (compared to prior week)
2. **MailerLite reports:** subscribers added this week + which UTM source brought them
3. **HubSpot (if using):** deals created this week + stage progression
4. **Cal.com:** bookings created this week + show-up rate

Output: 1 paragraph summary at the top of the user's weekly journal or shared with `weekly-brief` skill.

### Monthly attribution review (first Friday of the month, 30 minutes)

1. Pull last 30 days of new subscribers from MailerLite, group by utm_source
2. Pull deals closed in last 30 days from HubSpot, trace first_touch_at and utm_source
3. Compute: which channel drove the most subscribers? Which channel drove the most revenue? Often different.
4. Decision: where to spend more time, less time, or no change

This is the killer attribution insight. Most solopreneurs find one channel drives 70% of subscribers and a different channel drives 70% of revenue. Optimize for the latter.

## Anti-patterns to refuse

### "Install GTM and we'll figure it out later"

Refuse. GTM is for enterprise sites with 20+ tags. Solopreneur sites have 3 to 5 trackers, installed directly in HTML.

### "Track everything"

Refuse. 3 to 5 events tracked well. Beyond that, the user won't read the data.

### "Use 12 analytics tools"

Refuse. One site analytics tool + one ESP report + one CRM = three sources of truth. More creates confusion.

### "Implement multi-touch attribution"

Refuse for solopreneurs. First-touch + last-touch + manual judgment is the right model. Multi-touch attribution requires enterprise data volume.

### Skipping UTMs because "they look ugly"

Refuse. Without UTMs, attribution is impossible. Use a URL shortener (Bitly, Switchy) if visual hygiene matters.

### Installing Meta Pixel before running paid

Refuse. No reason to load third-party scripts before they're needed. Privacy + page speed both improve.

### Trusting referrer alone

Referrer is unreliable (HTTPS-to-HTTP stripped, social apps strip referrer). Always use explicit UTMs.

## Common questions

### "Why isn't my GA4 number matching my MailerLite number?"

Different definitions of "visit" and "user." GA4 dedupes by cookie; MailerLite tracks email opens by pixel. Numbers will differ by 10 to 30%. Pick one as canonical for revenue attribution (MailerLite or HubSpot).

### "How long does attribution data take to be reliable?"

For meaningful patterns: 30 days. For statistical confidence: 90 days. Don't make channel-killing decisions on 7 days of data.

### "What about iOS 14+ tracking gaps?"

Real but mitigatable. For paid (Meta especially), use Conversions API. For organic, UTMs work fine.

## Family-floor + revenue tag

- Tracking setup: $$ (leverage; foundational)
- Weekly check: 5 min/week = $$ (informs decisions)
- Monthly attribution review: 30 min/month = $$
- Daily data-checking: distraction. Refuse.

If the user is checking Cloudflare Analytics or HubSpot more than 2x/day, the data isn't informing action; it's anxiety theater. Pull back.

## Working with other skills

- Imports: `voice-rules` (privacy policy + tracking disclosures), `paid-ads` (pixel scaffold activates when paid runs), `email-sequence` (UTMs feed ESP custom fields)
- Pairs with: `content-strategy` (which content drives conversion), `seo-audit` (Search Console data), `ai-seo` (citation monitoring is a separate measurement)
- Powers: every decision made by `weekly-brief`, `business-coach` (when surfacing revenue-mix patterns), `revenue-mapper` (attribution feeds the $$$ tag)

## Output format

When setting up tracking, output:

```
ANALYTICS TRACKING SETUP, {date}

CURRENT STATE:
- Layer 1 (site analytics): {tool / status}
- Layer 2 (conversion events): {events tracked, where written to}
- Layer 3 (UTM + attribution): {convention, capture script, write-through}

CHANGES PROPOSED:
1. {item}: {what to ship, time estimate}
2. {item}: {what to ship, time estimate}

WEEKLY CHECK RITUAL:
- Friday 4 pm, 5 minutes
- Check: top pages, top sources, new subs, new bookings

MONTHLY ATTRIBUTION REVIEW:
- First Friday of month, 30 minutes
- Output: which channel drives most subs vs most revenue

PRIVACY DISCLOSURES NEEDED:
- {list of trackers to disclose in privacy.html}

REVENUE TAG: $$
FAMILY-FLOOR: {clear / conflict}
TIME TO SHIP: {hours}
```

End with: "Lock the setup, or rework?"

## Additional Resources

### Reference files

- **`references/utm-convention-by-channel.md`**, full UTM naming convention with examples for every channel, voice-aligned
- **`references/conversion-event-spec.md`**, which events to track per stage, where to write them, what counts as a conversion
- **`references/privacy-respecting-stack.md`**, the recommended privacy-respecting stack (Cloudflare + MailerLite + HubSpot) with disclosure templates

### Example files

- **`examples/example-attribution-stack.md`**, the full Langley attribution stack: attribution.js, worker, ML custom fields, HubSpot props, weekly check ritual
- **`examples/monthly-attribution-review-output.md`**, example monthly attribution review showing channel performance + decision output

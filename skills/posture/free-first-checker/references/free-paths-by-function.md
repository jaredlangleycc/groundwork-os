# Free Paths By Function

Comprehensive lookup of free tools for common solopreneur functions, with scope and limitations. Use to propose the leanest free path before any paid recommendation.

Updated 2026. Verify the free tier still exists at time of recommendation. SaaS vendors strip free tiers without warning (Calendly 2024, Mailchimp 2022, Notion 2023).

## Customer relationship management

**Function:** contact tracking, pipeline stages, follow-up reminders.

| Free path | Scope | Limit / break point |
|---|---|---|
| Google Sheet with 12-column schema | Unlimited contacts, manual entry | No automation. Manual updates slip past ~150-200 active contacts. |
| HubSpot Free CRM | 1M contacts, basic deal pipeline, 1 user | Marketing features locked behind paid tiers. Email send limit. |
| Airtable Free | 1,200 records, 1,000 API calls/mo | Hits limit fast at any volume. |
| Notion database | Unlimited records on free personal plan | Slow at scale, no native pipeline view. |

**Default recommendation:** Google Sheet first, HubSpot Free second when sheet maintenance becomes the bottleneck.

**Real example.** the example coaching business ran Google Sheet CRM Apr-May 2026, climbed to HubSpot Starter ($20/mo) May 18, 2026 only after the sheet broke at the specific need for Cal.com webhook auto-write at 60+ contacts. Even then, the sheet was retained for Gemini canvas viz.

## Email marketing

**Function:** broadcast emails to a list, automated sequences, signup forms.

| Free path | Scope | Limit / break point |
|---|---|---|
| MailerLite Free | 1,000 subscribers, 12,000 emails/mo, basic automations | Sub cap. Some advanced automations gated. |
| Buttondown Free | 100 subscribers, no automations | Sub cap tight. |
| Substack Free | Unlimited subs, no automations, publish + newsletter | Cannot do segmentation or tagged automations. |
| Beehiiv Free | 2,500 subs, no automations | Cap above MailerLite but no automations. |

**Default recommendation:** MailerLite Free for most coaching / service businesses. Substack for pure newsletter / writer plays.

## Scheduling

**Function:** prospect or client books a call without back-and-forth.

| Free path | Scope | Limit / break point |
|---|---|---|
| Cal.com Free | 1 event type, unlimited bookings, calendar integration | 1 event type cap. No team scheduling. |
| Google Calendar appointment slots | Free with Google Workspace personal | No buffer time, no booking questions, manual setup |
| Calendly Free (post-2024 changes) | 1 event type, basic | Heavily neutered free tier, Cal.com is better. |

**Default recommendation:** Cal.com Free. Climbs to Cal.com Team ($12/mo) only when 2+ event types are needed.

## Website hosting

**Function:** public-facing single page or simple site.

| Free path | Scope | Limit / break point |
|---|---|---|
| Cloudflare Pages | Unlimited static sites, custom domain, generous bandwidth | Custom domain requires DNS, hand-coded HTML or static framework |
| Carrd Free | 3 sites, basic forms, ".carrd.co" subdomain | No custom domain on free, limited blocks |
| Netlify Free | Unlimited static sites, 100GB bandwidth | Build minutes capped |
| GitHub Pages | Free with GitHub account | Repo must be public on free tier |
| Notion Public Pages | Unlimited, no custom domain on free | URL is "notion.so/..." |

**Default recommendation:** Cloudflare Pages for anyone who can write HTML or use a static site generator. Carrd Free for pure non-technical users.

## Finance and bookkeeping

**Function:** track income and expenses, generate invoices, prepare for tax filing.

| Free path | Scope | Limit / break point |
|---|---|---|
| Wave Free | Unlimited invoices, accounting, receipt scanning | Payroll and payment processing cost extra. Bank-feed flaky for some institutions. |
| Google Sheet finance log | Manual entry, custom categories | No invoicing, no automation. |
| Paper notebook | Manual | The OG free path. Adequate under 20 transactions/mo. |

**Default recommendation:** Wave Free or Google Sheet finance log. The the example coaching business `finance-log.csv` pattern works for early-stage solopreneurs.

## Analytics

**Function:** measure site traffic, conversions, source attribution.

| Free path | Scope | Limit / break point |
|---|---|---|
| Cloudflare Web Analytics | Free with CF Pages, lightweight, privacy-first | No funnel reports, no event tracking beyond pageviews |
| Plausible self-hosted | Genuinely free in dollars | Costs setup hours and ongoing maintenance |
| Google Analytics 4 | Free forever | Privacy concerns, complex UI, requires consent banner in EU |
| Umami self-hosted | Free in dollars | Same hosting cost as Plausible |

**Default recommendation:** Cloudflare Web Analytics when the site is already on CF Pages. Plausible self-hosted only if user has Docker + DevOps muscle.

## Design

**Function:** logo, color palette, social graphics, simple brand assets.

| Free path | Scope | Limit / break point |
|---|---|---|
| Canva Free | Templates, basic editing, brand kit (limited) | Premium templates and brand-kit features gated. Export quality OK. |
| Figma Free | Unlimited personal files, plugins | Team collaboration gated. Steep learning curve. |
| GIMP | Open-source image editing | Photoshop-like complexity for simple tasks |
| Excalidraw | Sketches, simple diagrams | Not for polished brand work |
| Coolors.co | Color palette generator | Just the palette tool, not full design |

**Default recommendation:** Canva Free for solopreneurs without design background. Figma Free for technical users.

## Cold outreach

**Function:** cold email or LinkedIn DM sequences to prospects.

| Free path | Scope | Limit / break point |
|---|---|---|
| Manual Gmail | Up to ~50 sends/day before deliverability issues | No tracking, no sequences, manual follow-ups |
| LinkedIn manual DMs | Free with LinkedIn account, ~50 invites/wk | No automation, requires direct human effort |
| Apollo Free | 50 free email credits/mo | Hard cap, but free leads |

**Default recommendation:** Manual Gmail + Google Sheet tracking for under 100 prospects/wk. Climb to Instantly or Smartlead only after the manual path has broken at a specific limit.

## File storage and collaboration

**Function:** store project files, share with clients, collaborate.

| Free path | Scope | Limit / break point |
|---|---|---|
| Google Drive Free | 15GB across Drive + Gmail + Photos | Storage cap |
| iCloud Free | 5GB | Tighter cap |
| Dropbox Free | 2GB | Tightest cap |
| Microsoft OneDrive Personal | 5GB free | Cap, but bundled with Microsoft account |

**Default recommendation:** Google Drive Free for most users. Climb when the 15GB cap actually breaks (typically 12-18 months in for solopreneurs storing photos and PDFs).

## Communications

**Function:** team chat, client chat, video calls.

| Free path | Scope | Limit / break point |
|---|---|---|
| Zoom Free | 40-min meetings, unlimited 1:1 | 40-min cap on group calls |
| Google Meet Free | 60 min, unlimited 1:1 | Time cap on group |
| Microsoft Teams Free | 60 min, 100 participants | Time cap |
| WhatsApp Business Free | Unlimited 1:1 messaging | No team features |
| Discord Free | Voice + text servers | More for community than client work |

**Default recommendation:** Google Meet for solopreneurs with Google Workspace. Microsoft Teams if the user is on M365. Zoom for one-off client preference.

## Automation and integrations

**Function:** connect tools, automate repetitive tasks.

| Free path | Scope | Limit / break point |
|---|---|---|
| Zapier Free | 100 tasks/mo, 5 zaps | Hard cap |
| Make.com Free | 1,000 ops/mo, 2 active scenarios | More generous than Zapier free |
| n8n self-hosted | Genuinely free | Setup and maintenance cost |
| Native integrations | Most modern SaaS have native connections | Limited scope, only what vendors built |

**Default recommendation:** Native integrations first. Make.com Free for cross-tool flows that native integrations cannot cover.

## When the free path is genuinely inadequate

A few functions where the free path is rarely sufficient past pre-revenue stage:

- **Domain registration.** No free path. Pay $10-15/yr for a domain. Logged as one-time, not subscription.
- **Business email with custom domain.** Free email forwarding via Cloudflare exists, but real mailboxes typically require Google Workspace ($6/mo) or Microsoft 365 Business Basic ($6/mo).
- **Payment processing.** Stripe is free to set up but takes 2.9% + $0.30 per transaction. No free path exists.
- **Legal documents at scale.** Templates are free, attorney review is paid. Free path is "use the template until something specific requires review."

For these functions, the climb is the default and the gauge is whether to add features above the baseline.

## How to use this lookup

When the free-first-checker fires:

1. Find the function in this document
2. Pick the leanest free path from the table
3. Set the test window
4. Document the test in `decisions/free-first-attempts.md`
5. Run the test (user's job)
6. If broken, climb to the lowest rung that fixes the specific break

This document is updated when the user discovers a new free path or when a vendor strips a free tier. Bump the "Updated YYYY" line at the top.

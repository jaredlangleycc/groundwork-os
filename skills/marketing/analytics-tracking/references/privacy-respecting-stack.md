# Privacy-Respecting Stack

The recommended NightShiftOS analytics stack. Lightweight. Free. Privacy-first by default. Disclosure templates included.

## The 3-tool stack

| Tool | Purpose | Cost | Privacy posture |
|---|---|---|---|
| Cloudflare Web Analytics | Site analytics | Free | No cookies, no PII, privacy-first |
| MailerLite (or Kit, Beehiiv) | Email + lead capture | Free up to 1000 subs | Industry-standard, discloses in policy |
| HubSpot Free or Starter | CRM + contact attribution | Free or $20/mo | Industry-standard, cookies via tracking script |

This is the minimum viable stack. Almost any solopreneur business can run on these three tools through Stable Solo.

## Why these defaults

### Cloudflare Web Analytics

Privacy-first analytics that doesn't use cookies. Doesn't fingerprint visitors. Doesn't show individual user activity.

What it does track:
- Page views by URL
- Top sources (referrer, search engine, social platform)
- Top pages by visits
- Visitor count (aggregate, not individual)
- Geo (country-level, not city)
- Device type (mobile/desktop/tablet)

What it doesn't track:
- Individual user behavior
- Cookies
- Personal data
- Cross-site tracking

Cookie banner: not required in most jurisdictions (US, UK, most EU per GDPR exemption for strictly anonymous analytics).

Setup: enable in Cloudflare dashboard > Analytics & Logs > Web Analytics. One toggle. Free on any plan.

### MailerLite Free

Email subscriber management. Necessary for any business that captures emails. Disclosed in privacy policy as a subprocessor.

Stores: email address, names, custom fields (incl. attribution).

Cookie banner: not directly required (signups are explicit consent). Privacy policy should disclose MailerLite as the email processor.

Free tier: up to 1000 subscribers, 12,000 emails/month. Generous.

### HubSpot Free or Starter

CRM for contact + deal management. Disclosed in privacy policy if using the tracking script.

Stores: contacts, deals, page-view attribution (via tracking script), email engagement.

Cookie banner: HubSpot tracking script uses cookies (`hubspotutk`, `__hssc`). Privacy policy MUST disclose. Cookie banner recommended for EU/UK traffic if HubSpot script is loaded.

Free tier: basic CRM. Starter ($20/mo) adds marketing automations + 2 pipelines.

## What's off by default

### Meta Pixel

Off until paid ads run. When activated:
- Cookies set (`_fbp`)
- Cross-site tracking enabled (Facebook attribution)
- Must disclose in privacy policy
- Cookie banner required in EU/UK

### LinkedIn Insight Tag

Off until LinkedIn paid ads run. When activated:
- Cookies set
- Cross-site tracking
- Must disclose
- Cookie banner required in EU/UK

### Google Analytics 4

Off by default for NightShiftOS. Cloudflare Web Analytics covers solopreneur needs.

Reasons to activate (Stable Solo+):
- Multi-touch attribution
- Cohort analysis
- Behavior-flow visualization
- Free, but privacy-heavy (cookies, user tracking)

If activated: GDPR-compliant config (`anonymize_ip`, no demographic data, no advertising features) AND cookie banner AND privacy policy disclosure.

### Google Tag Manager

Off by default. Overkill for solopreneur.

Reasons to activate (Scaling Solo only):
- Managing 10+ tracking scripts
- Frequently changing tracking config
- Team of multiple people managing tracking

Most NightShiftOS users will never need GTM.

### Heatmaps (Hotjar, Mouseflow, etc.)

Off by default. Privacy-invasive.

Reasons to activate (Scaling Solo):
- Specific LP conversion diagnosis where standard analytics shows a gap

Recommend Microsoft Clarity (free, less invasive than Hotjar) if heatmap is needed.

## Privacy policy template

A starting template for the privacy policy that the user can customize. Should be reviewed by a real lawyer for the user's jurisdiction.

```markdown
# Privacy Policy

Last updated: {date}

## What information is collected

When you visit {domain}, we collect:

- **Anonymous traffic data** via Cloudflare Web Analytics. This includes the pages you visit, the country you visit from, and the referring website. No cookies are set for this purpose. No personal data is collected.

- **Information you provide via forms.** When you complete the lead-gen assessment, sign up for the newsletter, or use our contact form, we collect:
  - Your email address (required)
  - Your first name (optional, if you provide it)
  - The URL you came from + UTM parameters (for attribution)
  - Your responses to the form questions

- **Cookies via HubSpot.** We use HubSpot to manage our customer relationships. When you submit a form, HubSpot sets two cookies (`hubspotutk` and `__hssc`) that allow us to tie your subsequent visits to your contact record. You can opt out via cookie settings.

- **Cookies via Meta Pixel and LinkedIn Insight Tag** (if applicable). When we run paid ads on Meta or LinkedIn, these platforms set cookies on your device to attribute ad performance. You can opt out via your Meta or LinkedIn ad preferences. Not always active. Active when paid ads campaigns are running.

## How we use the information

- To deliver the lead magnet, course, or service you requested
- To send you email content via MailerLite (you can unsubscribe at any time)
- To respond to inquiries
- To improve our content and offer
- To run paid ads campaigns (Meta + LinkedIn) when applicable

We do NOT:

- Sell your data
- Share your data with third parties beyond the subprocessors listed below
- Send unsolicited marketing to people who haven't opted in

## Subprocessors

Third-party services that process your data:

- **Cloudflare:** site hosting, web analytics
- **MailerLite:** email marketing, subscriber management
- **HubSpot:** CRM, deal management
- **Cal.com:** appointment booking
- **Microsoft 365:** email (hello@{domain})
- **Resend:** transactional email notifications

When paid ads run:
- **Meta:** ad attribution and retargeting
- **LinkedIn:** ad attribution and retargeting

## Your rights

You can:

- **Access** the data we hold about you (email hello@{domain})
- **Correct** any incorrect data
- **Delete** your data (we'll remove you from MailerLite + HubSpot)
- **Object** to processing for marketing purposes (unsubscribe link in every email)
- **Withdraw consent** at any time
- **Port your data** (we'll export your records on request)

## How to contact us

Email: hello@{domain}

## Changes to this policy

We'll update this page when we change our practices. The "last updated" date at the top reflects the most recent change.
```

## Cookie banner (when needed)

Required when:
- HubSpot tracking script is loaded AND user has EU/UK traffic
- Meta Pixel or LinkedIn Insight Tag is loaded
- GA4 is loaded with default config

Recommended free options:
- Cookiebot (free for small sites)
- Cookieyes (free tier)
- Self-hosted simple banner (no third-party)

Cookie banner template (self-hosted, lightweight):

```html
<div id="cookie-banner" style="position: fixed; bottom: 0; ...">
  <p>We use cookies to attribute marketing and improve your experience.
     <a href="/privacy">Learn more</a>.</p>
  <button onclick="acceptCookies()">Accept</button>
  <button onclick="rejectCookies()">Reject non-essential</button>
</div>
```

When user clicks "Accept": load HubSpot script, Meta Pixel, etc.
When user clicks "Reject": load only essential (Cloudflare Web Analytics + necessary functional cookies).

For Pre-Rev and Early Operator users with little traffic, the cookie banner is often skipped. Document the choice + revisit at Stable Solo with audience size.

## Disclosure when activating paid

When the user activates Meta Pixel or LinkedIn Insight Tag:

1. Update privacy policy to disclose the new tracker
2. Update cookie banner (or add one if missing)
3. Set "last updated" date on privacy policy
4. If list-uploading to Meta or LinkedIn for matched audiences: comply with custom-audience terms (notify users that you may use their email for ad targeting)

## Privacy red flags to refuse

### "Don't disclose in the policy, no one reads it"

Refuse. Disclosure is legal requirement in GDPR/UK GDPR/CCPA jurisdictions. Also: when a user reads it, fakery erodes trust. Disclose.

### "Use a free heat-map tool everywhere"

Refuse without specific diagnostic need. Heat maps record user interactions = highly invasive. Microsoft Clarity is the least bad option but still requires explicit consent.

### "Buy email lists and add to MailerLite"

Refuse. Violates MailerLite's TOS. Violates CAN-SPAM. Violates GDPR. Hurts deliverability.

### "Fingerprint visitors via canvas/audio API"

Refuse. Sneaky tracking is the opposite of privacy-respecting. Bad PR risk if discovered.

### "Don't have a privacy policy"

Refuse. Required in nearly every jurisdiction if collecting any form data. Even a minimal policy is better than none.

## Stage-aware privacy posture

### Pre-Rev Builder

- Cloudflare Web Analytics only (no cookies, no banner needed)
- MailerLite for signups (disclose if added)
- Minimal privacy policy
- Total trackers: 1 (Cloudflare, no cookies)

### Early Operator

- Add HubSpot Free tracking script (cookies, disclose)
- Add cookie banner if EU/UK traffic
- Full privacy policy
- Total trackers: 3 (Cloudflare, MailerLite, HubSpot)

### Stable Solo

- Same as Early Operator
- Pixel scaffolds installed but inactive until paid runs
- Total trackers: 3 to 5 (depending on paid status)

### Scaling Solo

- All above
- Possibly GA4 free for funnel diagnosis
- Possibly Microsoft Clarity for LP diagnosis
- Total trackers: 5 to 7 (still curated, still privacy-first)

## How to communicate the stack to users

When recommending this stack:

> "We're starting with three tools: Cloudflare Web Analytics (free, privacy-first, no cookies), MailerLite (your existing email tool), and HubSpot (CRM, free or $20/mo). These three give you 90% of what you need. We add Meta Pixel + LinkedIn Insight Tag scaffolds without activating them, so when you're ready for paid, you flip them on with one config change. Privacy policy needs updating to disclose what's in use."

End with: "Lock the stack, or want to swap one tool?"

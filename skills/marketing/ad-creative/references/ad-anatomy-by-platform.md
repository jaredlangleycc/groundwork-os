# Ad Anatomy by Platform

Full spec sheet for Meta and LinkedIn ad formats. Character limits, image sizes, CTA presets. Use as the source of truth when laying out creative.

## Meta (Facebook + Instagram)

### Single image ad, feed placement

- **Primary text:** 125 characters before "see more" clip. Hard cap 2200.
- **Headline:** 27 characters before truncation. Hard cap 40.
- **Description:** 30 characters before truncation. Hard cap 25 visible on mobile.
- **Image size:** 1080x1080 (square), 1080x1350 (portrait, more feed real estate), 1200x628 (landscape, lower CTR generally)
- **Aspect ratio:** 1:1 or 4:5 for best mobile
- **Text-on-image:** allowed, no longer 20% rule, but text-heavy ads under-perform
- **File format:** JPG or PNG, under 30 MB

### Single image ad, Story / Reels placement

- **Vertical:** 1080x1920 (9:16)
- **Safe zone:** keep text within center 80% (avoid bottom 250px reserved for CTA UI)
- **Caption / text overlay:** 6 to 12 words
- **Brand sticker:** OK, sparing

### Carousel ad

- **Number of cards:** 2 to 10
- **Each card:** image + headline (27 chars) + description (30 chars)
- **Primary text:** caps the whole carousel, 125 chars before clip
- **Card image:** 1080x1080 (1:1)
- **Best use cases:** multi-offer, sequence, before/after, framework explanation

### Video ad

- **Length feed:** 15 to 30 seconds optimal
- **Length Stories/Reels:** 5 to 15 seconds
- **Aspect ratio:** 1:1 (feed), 4:5 (feed portrait), 9:16 (Stories/Reels)
- **File format:** MP4, MOV
- **Captions:** burned-in mandatory (sound off default)
- **File size:** under 4 GB

### CTA buttons (Meta presets)

Pick one per ad:

- Apply Now
- Book Now
- Contact Us
- Download
- Get Offer
- Get Quote
- Learn More
- Listen Now
- Order Now
- Play Game
- Request Time
- See Menu
- Send Message
- Shop Now
- Sign Up
- Subscribe
- Watch More

Most-used for solopreneur lead magnets: **Sign Up** or **Get Offer**.

For bookings: **Book Now** or **Request Time**.

For purchases: **Shop Now** or **Order Now**.

## LinkedIn

### Single image ad

- **Intro text:** 150 characters before truncation. Hard cap 600.
- **Headline:** 70 characters max, 50 ideal.
- **Description:** 100 characters max (only shown on desktop, sometimes hidden on mobile).
- **Image:** 1200x627 (1.91:1) or 1200x1200 (1:1, taking more feed real estate)
- **Text-on-image:** allowed, brand-aligned conventions

### Document ad (lead-gen, gated content)

- **File:** PDF, PPT, DOC
- **Pages:** 2 to 12 ideal (LinkedIn shows up to 100 but engagement drops off cliff after page 12)
- **Lead form:** native, pre-filled with user's LinkedIn data
- **Best for:** gated reports, frameworks, free templates, ebooks

### Video ad

- **Length:** 15 to 30 seconds ideal (LinkedIn shortened recommendation in 2025)
- **Aspect ratio:** 1:1 (1200x1200) or 16:9 (1920x1080) or 9:16 (1080x1920 for portrait)
- **Captions:** burned-in mandatory
- **File format:** MP4
- **File size:** under 200 MB

### Carousel ad

- **Cards:** 2 to 10
- **Each card:** image (1080x1080) + headline (45 chars max)
- **Intro text:** 150 chars before clip
- **Best use:** framework explanations, multi-step processes

### Conversation ad (LinkedIn Messaging)

- **Format:** in-message, choose-your-own path
- **Max characters per message:** 8000
- **Buttons per message:** up to 5
- **Best for:** B2B service offers, demo scheduling
- **Cost:** higher CPL, often higher quality leads

### CTA buttons (LinkedIn presets)

- Apply Now
- Download
- View Quote
- Learn More
- Register
- Request Demo
- Sign Up
- Subscribe
- Visit Website

For lead magnets: **Sign Up** or **Download**.

For bookings/demos: **Request Demo** or **Register**.

## Format selection by goal

| Goal | Meta best format | LinkedIn best format |
|---|---|---|
| Lead magnet signup | Single image or short video | Single image or document ad |
| Calendar booking | Video (creator-led) | Conversation ad or single image |
| Newsletter signup | Single image | Single image |
| Product purchase | Carousel or video | Single image |
| Awareness / brand | Reels / Stories | Single image or short video |
| Long-form content | Carousel | Document ad |

## Targeting basics

### Meta

- **Custom audiences:** website visitors (Pixel), email upload, engagement on Facebook/IG
- **Lookalike:** 1% lookalike of customers (paying) is the strongest signal
- **Interest targeting:** narrow but useful for cold campaigns
- **Geographic:** city-level for local services, country/state for SaaS

### LinkedIn

- **Job title:** narrow targeting, often best for B2B
- **Company size:** crucial for SaaS (50 to 500 employees, e.g.)
- **Industry:** strong filter
- **Job function:** broader than job title, useful for adjacent ICPs
- **Seniority:** Director, VP, C-suite filtering
- **Matched audiences:** website visitors, email upload, account targeting

LinkedIn's audience targeting is more precise but more expensive. Meta's is broader but cheaper per impression.

## Tracking integration

### Meta Pixel

- Install on landing pages
- Fire Lead event on form submit
- Fire Purchase event on order completion
- Use Conversions API (CAPI) for iOS 14+ tracking accuracy

### LinkedIn Insight Tag

- Install on landing pages
- Fire conversion events for Lead and Purchase
- Use offline conversion API if uploading from CRM

UTM parameters always layer on top of pixel tracking. See `analytics-tracking` for the UTM convention.

## Budget conventions

### Meta CPM (cost per 1000 impressions) ranges in 2026

- B2C: $5 to $15 CPM
- B2B SaaS: $15 to $40 CPM
- Real estate (local): $8 to $20 CPM
- Coaching / consulting: $15 to $40 CPM

### LinkedIn CPM ranges in 2026

- General B2B: $25 to $80 CPM
- Senior decision-makers (Director+): $40 to $120 CPM
- Tech / enterprise: $40 to $150 CPM

LinkedIn costs 2 to 4x Meta on CPM. The conversion rate is often higher, so CPL can be comparable.

### Daily budget minimums

- Meta: $1/day technically, $5/day practically
- LinkedIn: $10/day minimum, $25/day practical floor

### Pilot test budgets (per `paid-ads`)

- Early Operator: $5/day for 14 days = $70 test
- Stable Solo: $20 to $50/day for 14 to 30 days = $280 to $1500 test
- Scaling Solo: $100/day+ for 30+ days

Don't pilot under $5/day on Meta or $10/day on LinkedIn. Statistical significance requires impression volume.

## Common spec mistakes

### Headline too long for mobile

- Meta: 27-character truncation. "How to Stop Reactive Leadership in 90 Days" gets clipped. Use "Stop Reactive Leadership" (24 chars).
- LinkedIn: 70 max, 50 ideal. "Most New Sales Managers Get This Wrong" (39 chars) works.

### Image text overflow

- 100% text-on-image looks like banner ad spam
- Aim for 30 to 60% visual + 40 to 70% text
- Ensure text is readable at 50% zoom on a phone

### Wrong aspect ratio for placement

- Feed-shaped image in Stories placement = letterboxed, dead space
- Stories-shaped video in feed = small, scroll-past
- Pick the placement, then design for that aspect

### Captioned-only video

- Auto-captions are unreliable
- Always burn captions in (Premiere, Descript, or in-tool)
- Subtitles in a custom font that matches brand

## Refresh cadence

- Static ad creative fatigue: 2 to 4 weeks at moderate budget
- Video ad creative fatigue: 3 to 6 weeks
- Refresh signal: CPC up 30%+ or CTR down 40%+ from week 1

Don't refresh just because. Refresh on data.

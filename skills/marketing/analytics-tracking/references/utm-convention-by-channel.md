# UTM Convention by Channel

Full UTM naming convention with examples for every channel. Voice-aligned (lowercase, hyphenated, specific). Apply consistently across all marketing.

## Universal rules

- All values lowercase
- Hyphens, not underscores or spaces
- Specific, not generic
- Consistent across time (don't change `utm_source=li` to `utm_source=linkedin` mid-quarter)
- 30 characters max per value (URL ugly otherwise)

## Channel table (full)

### Organic social

| Channel | utm_source | utm_medium | Example utm_campaign | Example utm_content |
|---|---|---|---|---|
| LinkedIn personal | linkedin | social | vibe-check-organic | post-2026-w22-mon |
| LinkedIn company page | linkedin | social-company | foundation-launch | carousel-3-pillars |
| Threads | threads | social | grounding-essay | chain-2026-w22-1of5 |
| Instagram (feed) | instagram | social | three-triggers | carousel-tuesday |
| Instagram (Stories) | instagram | social-stories | foundation-launch | story-2026-05-20 |
| Instagram (Reels) | instagram | social-reels | three-triggers | reel-thu-evening |
| TikTok | tiktok | social | three-triggers | cinematic-thu |
| Facebook page | facebook | social | foundation-launch | post-2026-w22 |
| X (Twitter) | x | social | grounding-essay | thread-2026-w22 |
| YouTube (organic) | youtube | social | foundation-launch | shorts-2026-05-20 |
| Bio link (Linktree, Stan, native) | bio | social | bio-vibe-check | linktree-link-1 |

### Email

| Channel | utm_source | utm_medium | Example utm_campaign | Example utm_content |
|---|---|---|---|---|
| Newsletter weekly | mailerlite | email | sunday-issue-2026-w22 | cta-footer |
| Welcome series | mailerlite | email | welcome-vibe-check | email-3-of-5 |
| Re-engagement | mailerlite | email | reengagement-w22 | email-1-of-3 |
| Win-back | mailerlite | email | winback-q2-2026 | email-1-of-2 |
| Onboarding (post-purchase) | mailerlite | email | foundation-onboarding | email-1-day-0 |
| Cold email | gmail | cold-email | flm-icp-may-2026 | seq-a-touch-1 |
| Cold email (via tool) | instantly | cold-email | flm-icp-may-2026 | seq-a-touch-1 |

### Paid ads

| Channel | utm_source | utm_medium | Example utm_campaign | Example utm_content |
|---|---|---|---|---|
| Meta paid | meta | cpc | vibe-check-w22 | A-baseline |
| Meta paid retargeting | meta | cpc-retarget | foundation-q3-2026 | testimonial-mary |
| Instagram paid | meta | cpc-ig | vibe-check-w22 | story-9x16 |
| LinkedIn paid | linkedin | cpc | foundation-q3-2026 | video-creator-led |
| LinkedIn Sponsored InMail | linkedin | inmail | foundation-q3-2026 | message-v1 |
| Google Search ads | google | cpc | brand-defense-q3 | exact-langley-coaching |
| Google Display ads | google | display | vibe-check-q3 | banner-1200x628 |
| YouTube ads | youtube | cpc-video | foundation-q3-2026 | 6sec-bumper |
| TikTok ads | tiktok | cpc | vibe-check-q3 | spark-ad-version-1 |
| Pinterest ads | pinterest | cpc | foundation-q3-2026 | promoted-pin-1 |
| X ads | x | cpc | foundation-q3-2026 | promoted-tweet |

### Earned + partnership

| Channel | utm_source | utm_medium | Example utm_campaign | Example utm_content |
|---|---|---|---|---|
| Podcast appearance | podcast-{name} | podcast | guest-show-name-2026 | episode-link-1 |
| Guest post | guest-{site} | referral | guest-post-2026-05 | inline-link |
| Newsletter sponsorship | sponsor-{newsletter} | sponsorship | foundation-launch | logo-placement |
| Affiliate / referral partner | partner-{name} | referral | partner-name-q3 | partner-link |
| Conference / event | event-{name} | event | event-name-2026 | swag-qr-code |
| Webinar (jointly hosted) | webinar-{partner} | webinar | partner-webinar-2026 | thank-you-page-cta |

### Owned but not on-site

| Channel | utm_source | utm_medium | Example utm_campaign | Example utm_content |
|---|---|---|---|---|
| Bio link from any platform | bio-{platform} | bio | always-on | linktree-vibe-check |
| Email signature | signature | email-sig | always-on | sig-vibe-check |
| Calendar booking page | cal-booking | direct | always-on | confirmation-page |
| Calendar event description | cal-event | direct | foundation-onboarding | session-1-resource |
| QR code (printed) | qr-{location} | offline | event-name-2026 | business-card |

### Auto-detected (don't set)

These are auto-detected by analytics tools. Don't manually set them.

- Direct traffic (URL typed, bookmarked), appears as "direct/none"
- Organic Google search, "google/organic" auto-detected
- Organic Bing search, "bing/organic" auto-detected
- Organic AI search citations, "perplexity/referral", "chat.openai.com/referral" auto-detected

If you DO want to track a specific AI engine citation, use a manual UTM in the cited URL. But don't try to manipulate AI engines into using specific UTMs.

## Campaign naming patterns

Use one of three patterns consistently:

### Pattern A: {topic}-{week}

For evergreen content with week-based testing:

- vibe-check-w22
- grounding-essay-w19
- three-triggers-w22

### Pattern B: {topic}-{quarter}

For longer campaigns:

- vibe-check-q3-2026
- foundation-launch-q3-2026

### Pattern C: {topic}-{descriptive}

For named campaigns:

- foundation-launch (no time component if it's the only one)
- new-manager-essay-promo
- ron-davis-testimonial-spotlight

Don't mix patterns. Pick one and use it across the year.

## Content naming patterns

The utm_content parameter identifies the specific creative or post.

### For social posts

- post-{day-of-week}
- post-{specific-date}
- chain-{week}-{post-number}

Examples:
- post-mon-2026-05-20
- chain-w22-3-of-5

### For ads

- {variant-letter}-{variable-tested}

Examples:
- A-baseline
- B-hook-counterintuitive
- C-visual-portrait

### For emails

- email-{number}-of-{total}
- cta-{location}

Examples:
- email-3-of-5
- cta-footer
- cta-hero
- cta-p-s

### For pages with multiple CTAs

- cta-{location-or-purpose}

Examples:
- cta-nav-button
- cta-hero
- cta-sticky-bottom
- cta-footer
- cta-popup-modal

## URL shortener interaction

UTMs in shortened URLs (Bitly, Switchy, Cuttly): the short URL still passes the destination URL with UTMs intact.

For bio links (Linktree, Stan): each link destination should have its own UTM (utm_source=bio, utm_content=<which link>).

For traditional URL shorteners (Bitly): shorten the FULL URL including UTM parameters.

For native social URL shorteners (Twitter/X t.co, LinkedIn lnkd.in): these are automatic. UTMs survive.

## Voice-rule check on UTM values

UTM values appear in analytics dashboards forever. Apply voice scan:

- No em-dashes (URL-encoded characters are an eyesore)
- Lowercase ASCII only
- No special characters except hyphens
- Descriptive but concise (under 30 characters)

Bad: `utm_content=this-is-the-amazing-new-manager-essay-that-just-shipped-today`
Good: `utm_content=new-manager-essay-w20`

## When to break the convention

Almost never. Conventions matter precisely because they accumulate.

The one valid exception: third-party platforms that auto-generate UTMs (some ad platforms do this). When the platform appends UTMs you can't fully control, document what they look like in CLAUDE.md.

## Audit your existing UTMs

Quarterly, pull all unique utm_source values from MailerLite custom fields + HubSpot deal properties:

- Are they consistent? (No `linkedin` AND `linked-in` AND `li` for the same channel.)
- Are they specific? (No `social` as utm_source when you mean Instagram specifically.)
- Are they aligned with this convention?

Fix anything off-pattern by:
1. Updating the convention if reality has drifted
2. Or updating future links to match the convention

Don't try to rewrite historical UTMs in MailerLite/HubSpot. Just be consistent going forward.

## Common UTM mistakes

### Misusing utm_medium

Wrong: `utm_medium=newsletter` (newsletter is a campaign, not a medium)
Right: `utm_medium=email&utm_campaign=newsletter-issue-22`

Wrong: `utm_medium=facebook` (Facebook is a source, not a medium)
Right: `utm_source=facebook&utm_medium=social`

### Spaces in URLs

Wrong: `utm_campaign=vibe check w22`
Right: `utm_campaign=vibe-check-w22`

### Caps inconsistency

Wrong: `utm_source=LinkedIn` and `utm_source=linkedin` for same channel
Right: `utm_source=linkedin` consistently

### Date in YYYY-MM-DD vs MMDDYY

Wrong: mixing `20260520` and `2026-05-20`
Right: pick one (`2026-w22` for week, `2026-05-20` for date, never both)

### Forgetting utm_content

When testing 3 ad variants but using only `utm_campaign=vibe-check-w22` with no `utm_content`, attribution can't tell which variant drove the conversion. Always set utm_content when running variant tests.

### Brand-name in utm_source

Wrong: `utm_source=langley-coaching-newsletter`
Right: `utm_source=mailerlite&utm_campaign=newsletter-issue-22`

Brand is implicit. Source is the channel.

## Compatibility with analytics tools

These conventions work in:

- Cloudflare Web Analytics (auto-parses UTMs as sources)
- Google Analytics 4 (handles UTMs natively)
- MailerLite custom fields (write to via worker)
- HubSpot custom properties (writes to via API)
- Plausible (handles UTMs)
- Fathom (handles UTMs)

If using a tool that doesn't handle UTMs (rare in 2026), wrap the URL in a redirect that captures the UTM server-side.

## Reference card

When ambiguous, fall back to:

- utm_source = WHERE the click came from (the channel)
- utm_medium = HOW the click came (organic/paid/email/etc.)
- utm_campaign = WHY you ran the campaign (the topic or offer)
- utm_content = WHICH version specifically (variant or piece)
- utm_term = WHAT keyword (paid search only)

Keep this card pinned. Most UTM bugs are confusion about source vs medium.

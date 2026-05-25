# Platform Pick Rules

Extended platform selection logic. Use as the deeper map when the SKILL.md quick-pick doesn't fit the user's exact situation.

## The three platforms

For solopreneur stage businesses, three platforms cover 95% of cases:

- **Meta (Facebook + Instagram):** broad reach, lower cost, B2C-leaning
- **LinkedIn:** precise B2B targeting, higher cost, decision-maker reach
- **Google Ads (search):** intent-driven, mid-cost, depends on keyword

X, TikTok ads, Pinterest, Reddit, Quora, niche platforms are situational and considered only at Scaling Solo.

## Decision criteria

Apply in order. The first criterion that resolves clearly determines the platform.

### Criterion 1: ICP locus

Where does the user's ICP spend their decision-making time?

| ICP | Likely platform |
|---|---|
| B2B SaaS sales managers | LinkedIn |
| B2B SaaS founders | LinkedIn + X |
| Corporate executive coach buyers | LinkedIn |
| B2C life/parenting coach buyers | Meta (IG primary) |
| Real estate (local) | Meta (FB groups) + Google local |
| DTC brand customer | Meta + TikTok |
| Etsy / handmade shoppers | Meta + Pinterest + Etsy ads |
| Indie SaaS prospect | X + Google + niche newsletters |
| Course buyers (B2B skills) | LinkedIn |
| Course buyers (B2C skills) | Meta + YouTube ads |
| Healthcare / wellness B2C | Meta + Google |
| Functional medicine practitioner clients | Meta |
| Fitness coaching B2C | Meta + TikTok |

When ICP locus clearly maps to one platform, the decision is made. Skip to budget.

### Criterion 2: Offer price point

Higher-ticket offers need warmer audiences. Platform selection adjusts accordingly.

| Offer price | Cold audience platform | Warm audience platform |
|---|---|---|
| Free (lead magnet) | All platforms | Retargeting only |
| $0 to $50 | Meta + TikTok (B2C) | All |
| $50 to $500 | Meta + Google | LinkedIn + retarget |
| $500 to $5,000 | Limited cold; mostly retarget | LinkedIn + Meta retarget |
| $5,000 to $50,000 | LinkedIn only, with strong proof | LinkedIn + outbound |
| $50,000+ | Outbound + content + LinkedIn ABM | LinkedIn ABM only |

For a $X,XXX coaching offer (Langley Foundation), cold Meta won't convert. Use LinkedIn retargeting on warm lead-gen assessment completers.

### Criterion 3: Audience targeting precision

How specific is the user's ICP?

- **Very precise** (job title + company size + industry): LinkedIn wins
- **Demographic + interest** (age + location + interests): Meta wins
- **Search intent** (user searches for the solution): Google wins
- **Behavioral** (user does X online): Meta (custom audiences)

For B2B SaaS sales managers at companies under 500 employees, LinkedIn's job-title targeting is unmatched. Meta cannot match this precision.

### Criterion 4: Visual brand readiness

Does the user have brand-aligned visual assets?

- **Strong visual brand:** Meta + IG win
- **Text-led brand:** LinkedIn + Google win
- **Mixed:** match platform to assets available

For the example coaching business with cream + teal + gold + Archivo Black brand, both Meta and LinkedIn can be served with quote cards and creator-led portraits.

### Criterion 5: Geographic targeting

- **Hyper-local (city / zip code):** Meta + Google Local + Nextdoor (limited ads)
- **Multi-state / national:** All platforms
- **Multi-country:** LinkedIn + Meta (Google ads geo-segmentation works too)

Real estate solopreneurs are hyper-local. Meta + Google Local wins.

## Platform-specific gotchas

### Meta gotchas

- iOS 14+ tracking gaps require Conversions API (CAPI) setup
- Algorithm penalizes "engagement bait" (like, comment, share asks)
- Carousel + video tend to outperform single image on cold
- Lookalike audiences need 100+ source customers minimum
- Custom audiences from email upload: 50%+ match rate is realistic, not 100%
- Restricted categories (employment, financial, healthcare) require special ad account permissions

### LinkedIn gotchas

- Minimum $10/day, practical floor $25/day
- Audience minimum of 300 in matched audiences
- Job-title targeting can be too narrow (try job-function for broader)
- Industry targeting is rough; combine with company-size for precision
- Conversion API integration is more limited than Meta
- Document ads have native lead forms that work well

### Google Ads gotchas

- Search ads work best for keywords with clear intent
- Display ads have low CTR (compare to Meta)
- YouTube ads work for B2C visual brands
- Local ads require Google Business Profile setup
- Quality Score matters; landing page relevance is heavily weighted
- Competition for branded terms is sometimes cheap, sometimes very expensive

## When to consider secondary platforms

### TikTok ads

Consider for:
- B2C consumer brands
- Younger ICP (under 40)
- Strong short-form video creator
- Founders willing to be on camera

Avoid for:
- B2B enterprise
- High-ticket offers
- Founders who refuse to be on camera

### X (Twitter) ads

Consider for:
- Indie SaaS / tech audience
- Founder-led personal brand
- Promotion of specific X content (tweets, threads)

Avoid for:
- B2C consumer
- Local businesses

### Pinterest ads

Consider for:
- DTC visual products
- Home, fashion, food, wedding niches
- Long planning cycles (wedding, home improvement)

Avoid for:
- B2B
- Service businesses

### Reddit / niche community ads

Consider for:
- Indie SaaS with active subreddit communities
- Niche hobby + B2C
- Authentic content that fits the community

Avoid for:
- Brand-led "polished" creative
- Anything that triggers community resistance

## The two-platform rule

At Stable Solo and below, run ONE platform at a time. Multi-platform splits attention and budget.

At Scaling Solo, two platforms maximum. Test the second after the first has validated.

Three+ platforms is enterprise territory. Skip.

## When to switch platforms

Switch platforms when:

- The pilot at $5/day for 14 days returned CPL >3x baseline on the current platform AND organic data suggests a different platform is the right home
- Audience saturation: frequency over 5 for 4+ weeks
- Platform policy change (e.g., new restricted category, account banned, ad approval rate dropping)
- Strategic re-targeting (e.g., moving from cold acquisition to warm retargeting requires different platform mix)

Don't switch because of a single bad week. Switch on patterns.

## Multi-platform planning (Scaling Solo only)

When running 2 platforms, structure:

- Platform 1 (primary): cold acquisition at full budget
- Platform 2 (secondary): warm retargeting OR specific audience cohort test

Example, the example coaching business at Scaling Solo:

- Primary: LinkedIn cold acquisition for lead-gen assessment lead magnet
- Secondary: Meta retargeting for lead-gen assessment completers, pushing free intro call

Don't run two cold acquisition campaigns on different platforms simultaneously. The audience overlap and budget split kill statistical significance.

## Platform pick output

When deciding platform, output:

```
PLATFORM RECOMMENDATION, {campaign goal}

User ICP: {ICP description}
User offer: {offer + price}
User stage: {stage}
User budget: ${X}/day

PRIMARY PLATFORM: {Meta / LinkedIn / Google}
- Rationale: {2-3 sentences on why this platform wins}
- Audience: {targeting summary}
- Floor budget for this platform: ${Y}/day

SECONDARY (if at Scaling Solo): {platform + purpose}

REJECTED PLATFORMS:
- {platform}: {1-sentence reason}
- {platform}: {1-sentence reason}

NEXT STEP: Route to `ad-creative` for variant production.
```

## When no platform fits

If no platform clearly fits, refuse paid. Common reasons:

- ICP isn't on any ad platform (very niche professional audiences)
- Budget below platform minimums
- Offer too high-ticket for cold paid OR too low for the platform's CPM
- Brand assets not ready

In these cases, route back to organic + outbound paths.

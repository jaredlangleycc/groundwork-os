# Brand Guidelines: the example coaching business

v0.1.0
Last updated: 2026-04-30
Owner: Jared Langley
Source: brand-strategist brief locked 2026-04-04

---

## 1. Brand identity snapshot

**Brand:** the example coaching business
**Positioning:** 90-day leadership coaching for frontline sales managers under 18 months in role at B2B SaaS companies (50-500 employees), unlike traditional executive coaching that runs 12+ months and treats the role as if family and career are separate problems.
**Promise:** You leave the 90 days with a Foundation document you can run without your coach. Money-back guarantee through day 30.
**Voice archetype:** Operator + Challenger
**ICP:** Frontline sales manager, under 18 months in role, B2B SaaS, 50-500 employees, mid-market deal size
**Not for:** Senior executives looking for a thinking partner. Aspirational coaching shoppers. People who do not have a real role to improve in.

---

## 2. Color palette

### Primary

| Name | Hex | RGB | Usage |
|---|---|---|---|
| Teal | #0A1F20 | 10, 31, 32 | Dark sections, hero bg, body text on cream |
| Gold | #D4A96A | 212, 169, 106 | CTAs, section labels, accents only |
| Cream | #F2EDE6 | 242, 237, 230 | Default page background |

### Secondary

| Name | Hex | RGB | Usage |
|---|---|---|---|
| Teal-mid | #103032 | 16, 48, 50 | Alternating section bg |
| Teal-deep | #184345 | 24, 67, 69 | Rare hover states |
| Gold-dark | #A87D3E | 168, 125, 62 | Hover and active gold |
| White | #FFFFFF | 255, 255, 255 | Cards on cream sections |

### Functional

| Use | Light bg value | Dark bg value |
|---|---|---|
| Body text | #0A1F20 | #F2EDE6 |
| Borders | rgba(10, 31, 32, 0.10) | rgba(255, 255, 255, 0.08) |
| Muted text | #8BA89A | #8BA89A |
| Links | #A87D3E | #D4A96A |

### Color usage rules

- Gold is for CTAs, section labels, and interactive highlights only. Never body text.
- Cream is the default page background. Teal rhythm breaks happen every 2-3 sections.
- Use rgba borders, never solid 1px lines.
- All dark sections must alternate with cream sections. Avoid three dark sections in a row.

### Accessibility

- Body text on cream (#0A1F20 on #F2EDE6) contrast ratio: 14.8:1, passes AAA
- Body text on teal (#F2EDE6 on #0A1F20) contrast ratio: 14.8:1, passes AAA
- Gold on teal (#D4A96A on #0A1F20) contrast ratio: 8.4:1, passes AAA for normal text
- Gold-dark on cream (#A87D3E on #F2EDE6) contrast ratio: 4.6:1, passes AA

---

## 3. Typography

### Headlines

**Font:** Archivo Black
**Source:** Google Fonts
**Weights used:** 900 only
**Rules:**
- Case: Always uppercase
- Letter-spacing: -0.03em
- H1 desktop: 64px
- H1 mobile: 40px
- H2 desktop: 40px
- H2 mobile: 28px
- H3 desktop: 28px
- H3 mobile: 22px

### Body

**Font:** Manrope
**Source:** Google Fonts
**Weights used:** 300-700 range
**Rules:**
- Body size: 16px desktop / 16px mobile
- Line-height: 1.7
- Paragraph spacing: 1.2em margin-bottom
- Sentence case for prose, title case only for proper nouns
- Weight 400 default. Weight 700 for emphasis. Weight 300 for captions.

### Display sizes

| Element | Desktop | Mobile |
|---|---|---|
| Hero headline | 64px | 40px |
| Section eyebrow | 14px | 12px |
| Section headline | 40px | 28px |
| Card headline | 24px | 20px |
| Body | 16px | 16px |
| Caption | 14px | 13px |

---

## 4. Logo + visual marks

### Wordmark

The current brand uses a wordmark, not a logo. Logo design deferred to Q4 2026.

- Text: "JARED LANGLEY" or "LANGLEY COACHING"
- Font: Archivo Black
- Color: #0A1F20 (teal) on light bg, #F2EDE6 (cream) on dark bg
- Case: Uppercase
- Letter-spacing: -0.03em

### Restrictions

- Never stretch, skew, or distort
- Never recolor outside the approved palette
- Never add drop shadows, glows, or filters
- Never combine with cursive script or rounded display fonts

### Favicon

- File: `langley-site/images/favicon.ico`
- Recipe: `scripts/gen-og-home-and-favicons.py`
- Sizes: 16x16, 32x32, 180x180, 192x192, 512x512
- Design: Gold "L" on dark teal background

---

## 5. Voice profile

> Source of truth: `skills/brand/voice-rules/SKILL.md`. This section is a snapshot.

**Archetype:** Operator + Challenger

**Tone profile:**
Warm:3 · Sharp:4 · Formal:1 · Casual:4 · Playful:2 · Serious:4 · Direct:5 · Punchy:4 · Plain:5 · Specific:5

### Banned phrases

Do not use these. Voice-scanned before every commit.

- circle back
- moving forward
- at the end of the day
- synergy
- leverage (as a verb)
- robust
- streamline
- seamlessly
- in today's fast-paced world
- it's important to note
- imagine if
- picture this
- let's dive in
- just (hedge form)
- really (hedge form)
- basically
- actually
- simply
- literally
- honestly
- frankly
- no fluff
- closing the loop
- to be honest
- great question

### Signature phrases

Use where natural.

- The flagship offer
- Presence. Performance. Wholeness.
- Trust the process
- Leadership for the whole person

### AI-tell guardrails

- **Em-dashes:** off (use commas, periods, parens, or rewrite)
- **"X, not Y" pattern:** off (rewrite affirmatively)
- **Hedge words:** flagged
- **Custom guardrails:**
  - No listicle openers
  - No first-person plural ("we") when sole proprietor
  - No emoji in site design, content, or signatures
  - No quote-only social content (must have author analysis)

### Tone calibration examples

**Headline tone:**
> "Winning on paper isn't the whole story."

**Body tone:**
> "I was winning by every measure and still felt unfulfilled. That's where this work started."

**CTA tone:**
> "Book a call."

---

## 6. Do / Don't grid

### Color usage

**DO:** Use gold (#D4A96A) for CTA buttons, section eyebrows, and interactive highlights only.
Why: Gold is the brand's attention-getter. Spreading it dilutes its function as a call.

**DON'T:** Use gold for body text, large background fills, or decorative flourishes.
Why: Gold body text fails contrast. Gold backgrounds compete with the photography and headlines.

### Typography

**DO:** Use Archivo Black uppercase with -0.03em letter-spacing for all headlines.
Why: The tight tracking is half the brand recognition. Archivo at default spacing reads as a different brand.

**DON'T:** Mix Archivo with cursive, script, or display fonts. Manrope is the only body partner.
Why: Two fonts. Stop optimizing.

### Photography / imagery

**DO:** Use the approved photo library (warm natural light, founder facing camera). 4:5 portrait or 16:9 landscape only.
Why: The photography is part of the brand. It is on the website hero. It is in the deck. It is on social.

**DON'T:** Use stock photo handshakes, generic office buildings, or watermarked images.
Why: Stock looks AI-generated and breaks the personal-brand promise.

### Iconography

**DO:** Use SVG line icons with gold stroke (#D4A96A) and 2px weight, or numbered labels (01, 02, 03) in Archivo Black.
Why: Numbered labels and minimal SVG match the operator archetype.

**DON'T:** Use emojis anywhere in the brand (site, content, social bios, email signatures, decks).
Why: Emojis are the strongest AI-generated-design tell in 2026.

### CTA copy

**DO:** Use specific active verbs that name the next action ("Book a call.", "Read the essay.", "Subscribe.")
Why: Specificity earns the click. Vague CTAs ("Learn more") signal you do not know what comes next.

**DON'T:** Use "Click here", "Learn more", "Find out more", or "Get started" as CTA copy.
Why: Vague verbs. The reader does not know what happens after the click.

### Voice + tone

**DO:** Lead with the contrarian truth or the specific outcome. "Most marketing agencies sell hours. We sell decisions."
Why: Operator + Challenger means saying the thing other coaches will not.

**DON'T:** Open with "In today's fast-paced business environment..." or any hedge preamble.
Why: AI tell. The reader skips to the next page.

### Spacing + layout

**DO:** Use 80px section padding on mobile, 120px on desktop. Cards have 14px border-radius. Buttons have 100px border-radius (pill shape).
Why: Generous spacing reads as confidence. Crammed sections read as panic.

**DON'T:** Use sharp corners on cards (the brand is rounded). Use 100% width images without container max-width.
Why: Sharp corners broke during the March 2026 redesign. Container max-width keeps long lines readable.

### Email signature

**DO:** Use a 3-line signature: Name + role + one link. Set in Manrope. No icons.
Why: Three lines is the right depth for cold outreach. Anything more reads as agency-spam.

**DON'T:** Add social icon strips, calendar booking embeds, or quote-of-the-day blocks.
Why: Visual noise. The reader is here for the message, not the signature.

### Social bio

**DO:** Lead with the promise ("Leadership for the whole person"), follow with one CTA ("Free assessment at [your-domain].com/quiz"). 160 chars max.
Why: A bio is a 3-second decision. Promise + CTA earns the follow.

**DON'T:** Use jargon stacks ("Helping leaders unlock their potential through transformative coaching") or emoji bullets.
Why: Generic. Every coach has this bio. Specificity wins.

### Pricing display

**DO:** State the price, the structure, and the refund. "$X,XXX. Pay monthly or upfront. 30-day money-back guarantee."
Why: Hiding price signals you have not earned the conversation about cost yet.

**DON'T:** Write "Investment: discuss on call" or "Pricing available upon request" on the website.
Why: Reader assumes the worst. Removes them from the funnel.

---

## 7. Asset inventory

| Asset | Format | Location | Notes |
|---|---|---|---|
| Favicon | ICO | langley-site/images/favicon.ico | Multi-size, gold L on teal |
| Apple touch icon | PNG | langley-site/images/apple-touch-icon.png | 180x180 |
| OG card (home) | PNG | langley-site/images/og-home.png | 1200x630 |
| OG card generator | Python | scripts/og-essay-card.py | CLI |
| Home + favicon generator | Python | scripts/gen-og-home-and-favicons.py | Run on rebrand |
| Headline font | Google Fonts | Archivo Black 900 | Hosted via fonts.googleapis.com |
| Body font | Google Fonts | Manrope 300-700 | Hosted via fonts.googleapis.com |
| Photography library | JPG | langley-site/images/photography/ | 9 founder portraits |
| Vibe Wave overlay tool | HTML | brand-assets/vibe-wave-overlay.html | Standalone social asset generator |
| Brand assets viewer | HTML | brand-assets/index.html | Internal preview |
| Email signature HTML | HTML | Desktop/sig.html | Outlook web paste-ready |
| Sig logo | PNG | langley-site/images/sig-logo.png | 200x200 |

---

## Updating these guidelines

These guidelines update when:

- The brand-strategist brief is re-run (full refresh)
- Voice-rules change (Section 5 re-syncs from `skills/brand/voice-rules/SKILL.md`)
- New brand assets ship (Section 7 grows)
- A do/don't pattern emerges from real shipping (Section 6 grows)
- Quarterly review surfaces stale references

Owner: Jared Langley
Quarterly review date: Q3 2026

# Foundation LinkedIn Video Set (Worked Example)

A full 3-variant LinkedIn video ad set for The flagship offer offer ($X,XXX coaching). Retargeting layer for warm lead-gen assessment audience. Stable Solo budget level.

## Campaign details

- **Campaign name:** foundation-linkedin-w26-retarget
- **Objective:** Calendar booking (free intro call via Cal.com)
- **Audience:** LinkedIn Custom Audience, lead-gen assessment completers (uploaded list) + 1% Matched Audience of flagship-offer clients
- **Geo:** US + CA + UK + AU
- **Placement:** LinkedIn feed (1:1 square video)
- **Budget:** $25/day total across variants (Stable Solo retargeting)
- **Variant rotation:** A and B head-to-head week 1; A vs C week 2 (if applicable)
- **Tracking:** LinkedIn Insight Tag + UTM parameters per variant + Cal.com webhook → HubSpot deal creation
- **Voice check:** all three variants clean

## Variant A, baseline (creator-led, direct address)

**Test variable:** baseline (top-performing organic video format)

**Modeled on:** May 24, 2026 TikTok "Three reactive triggers" (94K views, 18% completion at 75 seconds)

**Script (75 seconds):**

[0-3 sec, hook, on-camera direct address]

> "You took the lead-gen assessment. You saw which pillar was carrying the most weight."

[3-15 sec, frame]

> "Most people walk away with the diagnosis and stay stuck. The diagnosis is the start, not the answer."

[15-50 sec, beat, what changes in 90 days]

> "Over 90 days in The flagship offer, you stop reacting and start leading. Three pillars: Presence, Performance, Wholeness. Weekly sessions. One decision per session. One experiment per session.
>
> By week 12, the three or four moves that change your year are running. The reactive triggers don't disappear. They become catchable."

[50-70 sec, proof]

> "A client at Series D went from 60-hour weeks missing quota to 45-hour weeks hitting it. In 90 days. The work is structural, not motivational."

[70-75 sec, CTA]

> "Book a free intro call. The link's below."

**Intro text (LinkedIn primary text):**

You took the lead-gen assessment. You saw which pillar was carrying the most weight.

Most people walk away with the diagnosis and stay stuck. The flagship offer is the 90-day work that builds the answer.

Three pillars. Weekly sessions. One decision per session. By week 12, the three or four moves that change your year are running.

Book a free intro call below. 60 minutes, free, we work on one real thing.

**Headline:**
The flagship offer, 90 days, three pillars

**CTA:** Register

**Visual notes:**
- Jared on camera, soft natural light, brand-aligned background (warm wood, cream wall)
- Lower-third caption block: cream background, deep teal Manrope Bold text
- Captions burned in (2 to 5 words per frame, synced to speech)
- Brand "L" mark bottom-right (subtle, 60px)

**UTM:** `?utm_source=linkedin&utm_medium=video&utm_campaign=foundation-w26&utm_content=A-baseline`

**VOICE CHECK:** clean.

## Variant B, hook test (testimonial cold-open replaces direct address)

**Test variable:** hook only. Same body + CTA as Variant A.

**Script (75 seconds):**

[0-5 sec, cold-open testimonial via text-on-screen + voiceover]

> Text on screen: "I came in expecting tactics. I left with a different way of seeing my week., Sam, VP People, Series D"
>
> Voiceover (Jared): "This is what Sam said three months in."

[5-15 sec, frame]

> "She took the lead-gen assessment first. The diagnosis was Wholeness, lowest. The flagship offer was the structural work that followed."

[15-50 sec, beat, same as Variant A]

[50-70 sec, proof, slightly varied, names Sam]

> "Three months later, 45-hour weeks, hit number, sleeping again. The flagship offer is the work that builds the answer the lead-gen assessment started."

[70-75 sec, CTA]

> "Book a free intro call. The link's below."

**Intro text:** Same as Variant A.

**Headline:** Same as Variant A.

**CTA:** Same.

**Visual notes:**
- Cold-open: text on cream background, deep teal Manrope, Sam's full attribution below
- Sam's photo NOT shown (visual-system convention; testimonial is text-only)
- Rest of video: Jared on camera, same as Variant A

**UTM:** `?utm_source=linkedin&utm_medium=video&utm_campaign=foundation-w26&utm_content=B-hook-testimonial`

**VOICE CHECK:** clean.

## Variant C, format test (branded card animation replaces creator-led)

**Test variable:** format. Branded card-only video, no Jared on screen. Voiceover only.

**Script (60 seconds, tightened):**

[0-3 sec, hook, text-on-screen + voiceover]

> Text: "MOST OF THE TIME IT'S THE SECOND ONE."
> Voiceover: "Most of the time, the work that just showed up is the work you did."

[3-15 sec, frame, text card cycle]

> Card 1: "THE PROBLEM ISN'T TIME MANAGEMENT"
> Card 2: "THE PROBLEM IS THE PAUSE"

[15-40 sec, beat, text-only essay-style cards]

> Card 1: "The flagship offer. 90 days."
> Card 2: "Three pillars: Presence. Performance. Wholeness."
> Card 3: "Weekly sessions. One decision per session."
> Card 4: "By week 12, the three or four moves that change your year are running."

[40-55 sec, proof, testimonial card]

> Card: "60-hour weeks → 45-hour weeks. Hit number. Slept."
> Card 2: "  Series D Client, 90 days in"

[55-60 sec, CTA card]

> Card: "FREE COACHING SESSION"
> Card 2: "Link below."

**Intro text:** Same as Variant A.

**Headline:** Same as Variant A.

**CTA:** Same.

**Visual notes:**
- All text cards: cream background, deep teal Archivo Black for headlines, Manrope for body
- Card transitions: 3 to 5 second holds, subtle fade or slide
- Brand "L" mark bottom-right consistent
- Voiceover: Jared's voice (NOT AI-generated), recorded against the card timing

**UTM:** `?utm_source=linkedin&utm_medium=video&utm_campaign=foundation-w26&utm_content=C-format-branded-cards`

**VOICE CHECK:** clean.

## Launch plan

- **Total budget:** $25/day for week 1 (A and B head-to-head, ~$12/day each)
- **Run time:** 14 days minimum, 21 if data is borderline
- **Kill criteria per variant:**
  - CPL >$200 on a $200/qualified-call benchmark
  - Click-through rate under 0.5% (LinkedIn benchmark for retargeting)
  - Cal.com booking rate under 5% of clicks (LP conversion is broken)
- **Win criteria:**
  - CPL under $100 (50% of benchmark)
  - Booking rate over 10% of clicks

## Tracking validation

Before launch:

- [x] LinkedIn Insight Tag installed on jaredlangley.cc/foundation (and Cal.com booking page if hosted on subdomain)
- [x] Conversion event "Book free intro call" defined in LinkedIn Campaign Manager
- [x] UTM parameters on each variant's destination URL
- [x] Cal.com webhook → CF Pages Function /api/cal-booking writes to HubSpot deal in Accelerator Funnel pipeline
- [x] HubSpot tracking script firing on Foundation LP and confirmation page

## Voice notes per variant

### Variant A (creator-led baseline)

- "the work is structural, not motivational", uses "X, not Y" antipattern.
- Rewrite for voice: "the work is structural. Motivation is downstream."
- After rewrite: VOICE CHECK: clean.

### Variant B (testimonial hook)

- Sam's quote is her actual words (Approved May 2026 per testimonials-log).
- No em-dashes in the quote OR script.
- VOICE CHECK: clean.

### Variant C (branded cards)

- All card text passes voice-rules.
- "MOST OF THE TIME IT'S THE SECOND ONE", Langley signature line from "Three Reactive Triggers" essay.
- VOICE CHECK: clean.

## Production cost estimate

| Variant | Production time | Production cost |
|---|---|---|
| A (creator-led) | 2 to 4 hours (1 take + captions) | ~$50 (captions tool) |
| B (testimonial + creator) | 3 to 5 hours | ~$50 |
| C (branded cards only) | 4 to 6 hours (card design + voiceover + sync) | ~$100 (motion design) |

Total production cost: ~$200. Recovered within 2 to 3 booked Foundation calls.

## When this set would not ship

- lead-gen assessment audience under 500 retargetable (LinkedIn min audience for performance)
- Foundation has no recent organic conversion (no proof the offer converts on warm audience)
- Voice check fails on any variant after 2 rewrites (deeper issue, route to voice-rules update)
- Budget cap exceeded by Stable Solo strategy (route to `paid-ads` for re-validation)

## Post-test learning

Hypothesis to test:

- Is creator-led (Variant A) better than testimonial cold-open (Variant B) for warm audience?
- Does branded card format (Variant C) match or beat creator-led on cost (production + media)?

Expected outcome (best guess): Variant A (creator-led) wins on conversion rate, Variant C wins on production-efficiency-per-impression. Variant B is in the middle.

Don't decide before data lands. Watch the numbers.

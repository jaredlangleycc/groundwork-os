---
name: ad-creative
description: This skill should be used when the user asks to "write ad creative", "Meta ad", "LinkedIn ad", "ad variations", "paid creative", "ad copy", "headline variants", "creative for [campaign]", or wants any static creative + copy for paid Meta or LinkedIn ads. Stage-gated. Bootstrap-Strict and Pre-Rev cannot activate without explicit override. Distinct from paid-ads (campaign strategy + budgets) and copywriting (organic page copy).
version: 0.1.0
---

# Ad Creative

Static ad creative + copy for paid Meta (Facebook + Instagram) and LinkedIn. Headlines, body, CTAs, and visual direction. The skill produces 3 to 5 variants per campaign for A/B testing.

This skill assumes the user is at the right stage and risk profile to spend on paid. If not, refer to `paid-ads` to validate the strategy first, OR stay organic.

## When this skill triggers

- "Write ad creative for [campaign]"
- "Meta ad variations"
- "LinkedIn ad copy"
- "Need 5 ad headlines for [offer]"
- "Static creative for [lead magnet]"
- "Ad creative for lead-gen assessment campaign"

NOT for: paid strategy or budgets (use `paid-ads`), organic social posts (use `social-content`), page copy (use `copywriting`).

## The stage gate

Refuse to draft ad creative if any of these conditions hold:

| Condition | Refuse? |
|---|---|
| User stage is Pre-Rev Builder | YES, refuse |
| User risk archetype is Bootstrap-Strict | YES, refuse |
| User stage is Early Operator AND no validated organic conversion | YES, refuse with explanation |
| Offer has not been sold via organic in last 90 days | YES, refuse |
| Lead magnet has under 5% landing-page conversion organically | YES, refuse |
| No tracking infrastructure (UTM + conversion event) | YES, refuse until set up |

Refuse politely with the reason. Route to:

- `paid-ads` for strategy validation
- `content-strategy` for organic-first paths
- `analytics-tracking` for tracking setup

If the user explicitly overrides ("I know my stage, I want to test paid anyway"), proceed but flag: "Logged: you overrode the stage gate. Capping budget recommendation at $5/day pilot per `paid-ads`."

## The diagnostic before drafting

Coach-mode. Ask one at a time.

1. "What's the offer or asset being promoted?"
2. "Who is the audience (ICP + platform targeting)?"
3. "What is the conversion event (lead magnet signup, booking, purchase)?"
4. "What's the budget cap for this test?"
5. "What ad worked best organically in the last 90 days? (We'll model creative on that signal.)"

If the user can't answer 5 (no organic data), creative is a guess. Push back: "We need an organic signal before paid. Without it, we'll burn budget testing what could have been tested for free."

## The 3 to 5 variant rule

Each campaign gets 3 to 5 creative variants. Each tests a single variable:

| Variant | What changes | Hypothesis |
|---|---|---|
| Variant A (baseline) | The organic top performer | Confirms paid amplifies what works |
| Variant B | Headline change | Hook resonance |
| Variant C | Visual change | Image style or video vs static |
| Variant D | CTA change | Offer framing |
| Variant E (optional) | Audience targeting | ICP slice |

Don't test 12 variants. The user's budget can't support statistical significance across 12.

3 variants for stage-Early-Operator-and-up. 5 max for Stable Solo. Beyond 5 is enterprise territory.

## Per-platform format specs

### Meta (Facebook + Instagram)

**Static image ad:**

- Primary text: 125 characters before "see more" clip. Max 2200.
- Headline: 27 characters before truncation. Max 40.
- Description: 30 characters before truncation. Max 25 visible.
- Image: 1080x1080 (square) or 1080x1350 (portrait, takes more feed real estate)
- CTA button: pick from Meta's preset list (Learn More, Sign Up, Book Now, etc.)

**Carousel ad:**

- 2 to 10 cards
- Each card: image + headline + description
- Primary text caps the whole carousel
- Best for: multiple offers, step-by-step, before/after

**Video ad:**

- 15 to 30 seconds for feed
- 5 to 15 seconds for Stories / Reels
- 9:16 for Reels, 1:1 for feed, 4:5 for feed-portrait
- Captions burned in

### LinkedIn

**Single image ad:**

- Intro text: 150 characters before truncation. Max 600.
- Headline: 70 characters max, 50 ideal.
- Description: 100 characters
- Image: 1200x627 (1.91:1) or 1200x1200 (1:1)
- CTA button: preset (Learn More, Apply Now, Register, etc.)

**Document ad:**

- 2 to 12 page PDF/PPT/DOC
- Native lead form integration
- Best for: gated reports, frameworks, free templates

**Video ad:**

- 15 to 30 seconds
- 1200x1200 (1:1) or 1920x1080 (16:9)
- Captions burned in

## The creative anatomy

Every ad gets the same anatomy. Repeated across variants with one variable changed.

```
PRIMARY TEXT (Meta) or INTRO TEXT (LinkedIn)
2 to 4 sentences. Hook + frame + soft transition to CTA.

HEADLINE
6 to 12 words. The outcome or claim.

DESCRIPTION (where applicable)
1 sentence. Specifics or proof.

VISUAL
Brand-aligned. Text on image if static. Captions if video.

CTA BUTTON
One verb. Aligned with the conversion event.
```

### Primary text patterns that work

**Pattern 1: The specific moment + frame**

> Saturday morning. Coffee. Notebook. The hour I write best is the hour I almost trade for one more meeting every week.
>
> Most new sales managers do the same trade. the lead-gen assessment shows you which pillar this lives in.

**Pattern 2: The counterintuitive claim + proof**

> Most new sales managers think the problem is time management. It's not.
>
> Three reactive triggers run your week. The 12-question lead-gen assessment shows which pillar carries the cost.

**Pattern 3: The named case + transition**

> A client. B2B SaaS sales manager. 8 months in. Working 60-hour weeks. Missing quota the third quarter in a row.
>
> Three months later: 45-hour weeks, hit number, sleeping again. the lead-gen assessment is the diagnostic that started it.

**Pattern 4: The question + payoff**

> When did your week start being about other people?
>
> the lead-gen assessment is the 5-minute diagnostic on what part of your leadership is carrying the most weight.

### Headlines that work

**Outcome-driven:**

- "Stop reactive leadership"
- "Lead the whole person. Yourself included."
- "From reactive to intentional in 90 days"
- "Find the pillar carrying the weight"

**Specific question:**

- "Which pillar is carrying the most weight?"
- "What's your leadership archetype?"

**Direct ask:**

- "Take the 5-minute lead-gen assessment"
- "Diagnose your leadership in 12 questions"

Avoid:

- "Unlock your potential" (generic)
- "5 tips for new managers" (listicle, low-conversion)
- "Are you a great manager?" (closed question)

## Visual direction

### Static image conventions

- Brand palette (Langley: cream + teal + gold)
- Brand fonts (Archivo Black + Manrope)
- One focal element (a quote, a question, a stat)
- No stock-photo people unless they ARE the user (creator-led ads)
- No emoji in static creative

### Video conventions

- 5 to 8 seconds for the hook
- Captions burned in (most viewers watch muted)
- Brand color treatment
- Direct address (user on camera) for highest LinkedIn lift
- Branded card visuals (no subject face) for Meta retargeting

### What to refuse visually

- Stock-photo "diverse smiling team in office"
- Stock-photo "person at computer holding chin"
- Overlaid clip-art arrows pointing at faces
- Excessive text on image (Meta's old 20% rule is gone but text-heavy ads still under-perform)
- Anything that doesn't pass the squint test (legible at half size on a phone)

## The CTA button

Pick from the platform preset list. Choose the verb that matches the conversion event.

| Conversion event | Meta CTA | LinkedIn CTA |
|---|---|---|
| Lead magnet signup | Sign Up, Get Offer | Sign Up, Download |
| Calendar booking | Book Now | Register, Apply Now |
| Purchase | Shop Now, Buy Now | Shop Now |
| Read article | Learn More | Learn More |
| Free trial | Sign Up | Sign Up |

Skip "Click Here" and any vague CTA. Specific verbs outperform.

## Voice integration

Every line of ad copy goes through voice-rules.

- Strip em-dashes
- Strip banned phrases
- Refuse "X, not Y" antipattern
- Strip AI-tell openers
- Match archetype
- Inject signature phrases naturally

In ad creative, voice matters more than in any other format. Cold viewer + bad voice = scroll. Show "VOICE CHECK: clean" or "VOICE CHECK: N rewritten" before lock.

## Stage-aware adjustments

### Pre-Rev Builder

REFUSE. No ad creative until offer + organic lead magnet are validated.

### Bootstrap-Strict (any stage)

REFUSE. Free-first principle holds even at Scaling Solo for this archetype.

### Early Operator (revenue under $5K, organic validated)

- Allowed for low-budget pilots ($5/day cap)
- 3 variants only
- Static image preferred over video (production cost)
- Single platform pilot (Meta OR LinkedIn, not both)
- Conversion event must be a lead magnet (not a purchase or call)

### Stable Solo

- 3 to 5 variants
- Static + video allowed
- Single platform pilot expanded to multi-platform after 90 days organic validation per channel
- Lead magnet, booking, OR low-cost purchase
- Budget per `paid-ads` recommendation

### Scaling Solo

- 5 variants
- Static + video + carousel
- Multi-platform allowed
- Any conversion event
- Retargeting layer activated (warm audience gets different creative)

## Anti-patterns to refuse

### "Make me 10 headlines"

Refuse. 5 max. Beyond 5 the user can't test all of them statistically with realistic budget.

### "Use AI-generated stock photos"

Refuse if they look like AI-generated stock photos (which they will, in 2026). Use the user's actual brand assets or licensed real photos.

### "Mimic [competitor]'s ad"

Push back. Mimicking creates ads in the user's competitor's voice, not theirs. If a competitor pattern is working, identify WHY (offer, hook, audience) and adapt that, not the surface look.

### "Test 8 audiences with 1 creative"

Refuse. Audience tests need creative held constant. Creative tests need audience held constant. Test ONE thing at a time.

### Stock urgency

Refuse "Limited time!" "Only X spots left!" "Don't miss out!" unless the scarcity is real (and most isn't). Fake urgency erodes trust.

### Auto-translated international variants

If the user wants creative in a language they don't speak, refuse. Voice doesn't survive machine translation. Use human translators or skip the region.

## Free-first reminder

Before recommending ad creative, confirm the user has tested the same hook organically. If the organic post got 10x engagement vs baseline, the same hook is a good ad bet. If the organic post tanked, the ad will tank too.

Free amplifies what works. Free doesn't fix broken creative.

## Tracking integration

Every ad creative carries a tracking layer:

- UTM parameters in the landing URL (`utm_source=meta&utm_medium=cpc&utm_campaign=vibe-check-w22&utm_content=variant-a`)
- Conversion event pixel firing (Meta Pixel + LinkedIn Insight Tag)
- Lead form integration where applicable

See `analytics-tracking` for UTM + pixel setup.

If tracking isn't set up, refuse to launch ads. Untracked spend is distraction.

## Family-floor + revenue tag

- Ad creative production: $$
- Ad management ongoing: $ (necessary admin but eats time)
- Optimizing ads obsessively: distraction (often)

Cap weekly ad-management time at 1 hour for Early/Stable Solo. Beyond that the user is burning leverage.

## Working with other skills

- Imports: `voice-rules` (every line), `copywriting` (hook + CTA craft), `paid-ads` (strategy gate + budget caps), `analytics-tracking` (tracking layer)
- Distinct from: `social-content` (organic posts), `email-sequence` (lifecycle emails), `copywriting` (page copy)
- Pairs with: `paid-ads` (always; never run creative without strategy)

## Output format

When generating ad variants, output:

```
CAMPAIGN: {name}
PLATFORM: {Meta / LinkedIn}
PURPOSE: {conversion event}
AUDIENCE: {targeting summary}
BUDGET CAP: {per paid-ads recommendation}
TRACKING: {UTM + pixel confirmed yes/no}

VARIANT A (baseline, modeled on organic top performer)
- Primary text: {2-4 sentences}
- Headline: {6-12 words}
- Description: {1 sentence}
- CTA: {preset}
- Visual: {direction notes}
- VOICE CHECK: clean

VARIANT B (test: headline)
- (same fields, headline differs)

VARIANT C (test: visual)
- (same fields, visual differs)

NOTES:
- Hold {variable} constant across variants
- Run for {X days} or {Y impressions} before evaluating
- Kill criteria: {CAC threshold or click-through floor}
```

End with: "Locked, or rework a variant?"

## Additional Resources

### Reference files

- **`references/ad-anatomy-by-platform.md`**, full spec sheet for Meta and LinkedIn ad formats (character limits, image sizes, CTA presets)
- **`references/creative-variant-rules.md`**, single-variable testing structure, common test patterns, sample-size math
- **`references/visual-direction-guide.md`**, brand-aligned ad visual conventions, what to refuse, the squint test, asset sources

### Example files

- **`examples/vibe-check-meta-static-set.md`**, full 3-variant Meta static set for the lead-gen assessment lead magnet, with copy + visual direction + tracking
- **`examples/example-linkedin-video-set.md`**, full 3-variant LinkedIn video set for The flagship offer offer, scripts + visual direction + targeting

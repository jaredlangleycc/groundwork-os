# lead-gen assessment Meta Static Set (Worked Example)

A full 3-variant Meta static ad set for the lead-gen assessment lead magnet. Voice-scanned, ready to launch. Pilot stage (Early Operator).

## Campaign details

- **Campaign name:** vibe-check-meta-w22-pilot
- **Objective:** Lead magnet signup (form completion on [your-domain].com/quiz)
- **Audience:** Custom Audience, Meta + Instagram engagers in last 365 days + 1% Lookalike of lead-gen assessment completers
- **Geo:** US + CA + UK + AU
- **Placement:** Meta feed (1:1), single image
- **Budget:** $5/day total across variants (Early Operator pilot cap)
- **Variant rotation:** Even split, 7-day test
- **Tracking:** Meta Pixel + UTM parameters per variant + LCC_TRACK('Lead') on form submit
- **Voice check:** all three variants clean
- **Family-floor:** production happens Saturday morning, ads run autonomously

## Variant A, baseline (modeled on top-performing organic post)

**Modeled on:** May 12, 2026 LinkedIn personal post "Three reactive triggers..." (12K impressions, 184 reactions, 47 comments)

**Primary text:**

Most new sales managers think the problem is time management.

It's not.

Three reactive triggers run your week and you don't see them. the lead-gen assessment is the 12-question diagnostic that shows which pillar is carrying the cost.

5 minutes. Free. No fluff (replaced with "Real talk per voice rules") → "Direct."

5 minutes. Free. Direct.

**Headline:**
STOP REACTIVE LEADERSHIP

**Description:**
12 questions. One archetype. A starting point.

**Visual:** Quote card variant
- Background: cream (#F2EDE6)
- Headline text: "MOST OF THE TIME IT'S THE SECOND ONE." in Archivo Black, deep teal, uppercase
- Sub: "  Jared Langley" Manrope, gold
- Bottom of card: small "01" gold label + "langleycoaching" wordmark deep teal

**CTA:** Sign Up

**UTM:** `?utm_source=meta&utm_medium=cpc&utm_campaign=vibe-check-w22&utm_content=A-baseline`

**VOICE CHECK:** clean.

## Variant B, hook test (counterintuitive claim swapped for specific-moment hook)

**Test variable:** primary text hook only. Visual, headline, description, CTA held constant.

**Primary text:**

Saturday morning. Coffee. Notebook. The hour I write best is the hour I almost trade for one more meeting every week.

I caught myself doing it again.

the lead-gen assessment is the 12-question diagnostic on what part of your leadership is carrying the most weight.

5 minutes. Free. Direct.

**Headline:**
STOP REACTIVE LEADERSHIP

**Description:**
12 questions. One archetype. A starting point.

**Visual:** Quote card (same as Variant A)

**CTA:** Sign Up

**UTM:** `?utm_source=meta&utm_medium=cpc&utm_campaign=vibe-check-w22&utm_content=B-hook-moment`

**VOICE CHECK:** clean.

## Variant C, visual test (creator-led portrait replaces quote card)

**Test variable:** visual only. Primary text + headline + description + CTA held constant (using Variant A baseline copy).

**Primary text:**

Most new sales managers think the problem is time management.

It's not.

Three reactive triggers run your week and you don't see them. the lead-gen assessment is the 12-question diagnostic that shows which pillar is carrying the cost.

5 minutes. Free. Direct.

**Headline:**
STOP REACTIVE LEADERSHIP

**Description:**
12 questions. One archetype. A starting point.

**Visual:** Creator-led portrait
- Photo: Jared portrait (laughing, white sweater, gold chain, file `e43110bb547a1eaaac628ef7874da2b2.jpeg`)
- Brand frame: cream border, small gold "01" label top-right, "Jared Langley · ICF-trained" credential tag bottom
- No quote text overlaid (the portrait carries the visual)

**CTA:** Sign Up

**UTM:** `?utm_source=meta&utm_medium=cpc&utm_campaign=vibe-check-w22&utm_content=C-visual-portrait`

**VOICE CHECK:** clean.

## Launch plan

- **Total budget:** $5/day spread across 3 variants ($1.67/day each), BELOW SIGNIFICANCE FLOOR
- **REVISED:** Run Variant A only for first 7 days ($5/day) to establish baseline, then Variant B for days 8 to 14 (head-to-head against A's continued run, $5/day each = $10/day for week 2), then Variant C in week 3.
- **Run time:** 21 days total
- **Kill criteria per variant:**
  - CPL >3x baseline at day 4
  - CTR <0.4% at day 7
  - Frequency >4 at any point
- **Win criteria:**
  - CPL <50% of organic-attributed cost per signup
  - CTR >1% on Meta feed

## Tracking validation

Before launch:

- [x] Meta Pixel installed on jaredlangley.cc (verified in Pixel Helper)
- [x] Pixel firing Lead event on lead-gen assessment form submission (test: complete the form, verify Lead event in Events Manager)
- [x] UTM parameters on each variant's destination URL
- [x] HubSpot tracking script firing on the same page (contact-tied attribution)
- [x] MailerLite tagging new subscribers with `utm_campaign=vibe-check-w22` field

## Voice notes per variant

### Variant A (baseline)

- Original text had "no fluff" → replaced per banned phrase rule
- "X, not Y" check: "Most...think X. It's not." is the antipattern setup. The full text continues affirmatively ("Three reactive triggers run your week..."), so this passes.
- Em-dashes: 0
- Banned phrases (Langley list): 0 after rewrite

### Variant B (hook test)

- "I caught myself doing it again", Langley signature voice, kept
- Em-dashes: 0
- Voice archetype: operator with reflective frame, matches

### Variant C (visual test)

- Copy unchanged from Variant A
- "ICF-trained" credential phrasing matches Langley's voice rule (not "ICF-certified coach" which is a phrasing he's specifically refused)

## Post-launch monitoring

Day 1-3:

- [ ] Watch frequency (cap at 4)
- [ ] Watch CPC vs platform benchmark ($15-40 for B2B SaaS)
- [ ] No optimization moves yet

Day 4-7:

- [ ] Variant A CPL vs organic-attributed CPL
- [ ] If A is 3x over organic, kill and re-think before launching B
- [ ] If A is healthy, launch B head-to-head

Day 8-14:

- [ ] A vs B at parity? Run both another week.
- [ ] B winning? Promote B to baseline, kill A, prep Variant C launch.
- [ ] A winning? Skip B, launch C against A in week 3.

Day 15-21:

- [ ] Winner of A vs B (or A vs C) gets continued spend
- [ ] Other variants paused
- [ ] Refresh creative if winner shows fatigue by day 21

## Post-test outcomes (hypothetical for example purposes)

After 21 days at $5 to $10/day:

- Total spend: ~$160
- Total impressions: ~12,000 across variants
- Total lead-gen assessment signups: 24
- CPL: $6.67 (within Early Operator acceptable range for B2B SaaS)
- Winner: Variant B (specific-moment hook) at $4.80 CPL vs Variant A at $7.20

Decision: promote Variant B to baseline for week 4 expansion. Drop Variant C (creator-led portrait) until next test wave. Budget can scale to $15/day if `paid-ads` approves Stable Solo expansion.

## When this set would not ship

- lead-gen assessment landing page conversion below 5% organically → fix LP first
- No Pixel installed → set up tracking first
- User explicitly Pre-Rev → refuse entirely
- Risk archetype Bootstrap-Strict → refuse entirely
- No organic post had over 10x typical engagement → no baseline to model on, refuse

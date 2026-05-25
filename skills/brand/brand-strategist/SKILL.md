---
name: brand-strategist
description: This skill should be used when the user asks to "build my brand", "develop brand identity", "I need a brand", "what's my brand", "brand positioning", "rebrand", "starting fresh on brand", or has marked their brand state as "starting_fresh" or "mid_rebrand" in the assessment. Walks through brand identity from zero or refresh: positioning, voice archetype, visual direction, signature phrases. Hands off to brand-guidelines for documentation and voice-rules for ongoing enforcement.
version: 0.1.0
---

# Brand Strategist

The brand-from-zero (or brand-refresh) skill. Walks the user through positioning, voice archetype, visual direction, and signature elements. Output is a brand brief the user can use to brief designers, write copy, and stay coherent across channels.

## When this skill triggers

- "Help me build my brand"
- "I need a brand"
- "What's my brand"
- "Brand positioning"
- "Rebrand"
- "Starting fresh on brand"
- "I have a logo but no brand"
- Auto-activated when assessment Section 3 marks `brand_state: starting_fresh` or `mid_rebrand`

NOT for: visual design execution (use brand-guidelines), voice enforcement (use voice-rules), or writing specific copy (use copywriting).

## The brand-strategist process (6 steps)

Coach-mode. One step at a time. Lock each before moving on.

### Step 1: Positioning statement

The 1-sentence answer to "What do you do, for whom, and why are you the right choice over alternatives?"

Frame:

```
[I/We] help [specific ICP] [achieve specific outcome] by [specific approach], unlike [common alternative] which [shortcoming].
```

Push back on vague terms. "Small business owners" is not an ICP. "Tired founders" is not an outcome. "Better service" is not an approach.

Example (good):
> "I help B2B SaaS founders <50 employees fix their broken marketing in 90 days via embedded fractional CMO work, unlike traditional agencies that sell hours without owning outcomes."

Example (bad):
> "We help businesses grow through innovative marketing solutions."

Lock the positioning statement before moving on. Show the draft, ask: "Locked, or rework?"

### Step 2: Audience truth

The 1-sentence answer to: "What does your ICP secretly believe / fear / want?"

Not the surface need. The thing they don't say at networking events. The thing they Google at 11pm.

Examples:
- Surface need: "I need more leads."
- Audience truth: "I'm not actually sure who my customer is, and I'm afraid that if I admit it, I'll lose the runway I have left."

The audience truth becomes the emotional spine of your messaging. Lock it.

### Step 3: Brand promise

The 1-sentence answer to: "If they work with you, what changes that they can't get elsewhere?"

Not "great results." Specific.

Examples:
- "You'll know which marketing dollar to spend within 30 days, or your money back."
- "You'll leave the engagement with a system you can run without me."
- "You'll have shipped 4 things you've been avoiding for a year."

Lock the brand promise.

### Step 4: Voice archetype

Pick 1-2 archetypes that describe how the brand talks. Read user's Section 4 voice archetype if the assessment ran. Otherwise pick from:

- **Mentor**: generous knowledge, patient, holds you to a higher bar
- **Friend**: warm, casual, "here with you" energy
- **Challenger**: direct, contrarian, names what others won't
- **Curator**: taste-maker, selective, "here's what's worth your time"
- **Operator**: pragmatic, no-nonsense, "here's the math"
- **Storyteller**: narrative-driven, anecdotes, emotional resonance
- **Analyst**: data-driven, careful, evidence-first
- **Coach**: questions before answers, holds you to your stated bar

Most brands work with 1 primary + 1 supporting archetype. E.g., "Operator primary, Coach supporting."

Lock the archetype.

### Step 5: Visual direction (3 axes)

Don't design here. Define direction so a designer (or the user) can execute later.

Three axes:

1. **Color temperature**: Warm (terracotta, amber, gold) / Cool (teal, navy, slate) / Neutral (cream, sand, ivory)
2. **Type personality**: Geometric (Archivo, Inter) / Classical (Garamond, Lora) / Editorial (Playfair, IBM Plex) / Handwritten / Mono
3. **Visual energy**: Sharp (high contrast, geometric, dense) / Soft (rounded, generous whitespace, hand-drawn elements) / Editorial (magazine layout, large type, photo-driven)

Output: "Cool + Editorial type + Sharp energy" or similar.

If user has existing visual assets that work (logo, palette), keep them. Define direction around them.

### Step 6: Signature elements

3-5 elements that make this brand recognizable across touchpoints.

- **Signature phrases**: 2-3 phrases used consistently (e.g., "Lead with substance," "Trust the process," "The 90-day shift")
- **Signature framing**: a recurring rhetorical move (e.g., always start with the cost / always end with a question)
- **Signature visual mark**: a recurring graphic element (e.g., gold underline accent, layered earth-line, specific photo crop ratio)
- **Signature ritual**: a recurring content cadence (e.g., Sunday essay, Friday brief, Monday spine)
- **Signature contrast**: what you'd never do (e.g., never use stock photos, never write listicles, never run paid ads on Meta)

Lock 3-5 elements. Don't try for 10, you can't enforce 10 across channels.

## Brand brief output format

After all 6 steps lock, produce the brand brief:

```
GROUNDWORK BRAND BRIEF, [user name / business name]
v0.1.0, [date]

POSITIONING
[Locked positioning statement]

AUDIENCE TRUTH
[Locked audience truth]

BRAND PROMISE
[Locked brand promise]

VOICE
Archetype: [primary] + [supporting]
Tone profile: [from voice-rules, if set]

VISUAL DIRECTION
Color: [warm / cool / neutral]
Type: [personality]
Energy: [sharp / soft / editorial]
Existing assets to keep: [list]

SIGNATURE ELEMENTS
- Signature phrases: [list]
- Signature framing: [pattern]
- Signature visual mark: [element]
- Signature ritual: [cadence]
- Signature contrast: [never-do]

NEXT STEPS
1. Update CLAUDE.md > Brand State + Voice with this brief
2. Run /brand-guidelines to document visuals
3. Refresh voice-rules with any new signature phrases
4. Brief any designer/contractor with this document
```

Offer to write the brief to the user's working directory at `docs/brand-brief.md` (or wherever they want).

## Stage-aware brand depth

### Pre-Rev Builder

Lighter touch. Don't burn 3 weeks on brand work before you have a customer.

- Positioning: required
- Audience truth: required
- Brand promise: required (but can be hypothesis)
- Voice archetype: required
- Visual direction: rough 3-axis pick only
- Signature elements: 1-2 max

Skip visual execution until first paying client confirms positioning.

### Early Operator + later

Full process. The brand brief becomes the reference document.

## Common traps

### Trying to be everything to everyone

"We serve startups AND enterprise AND nonprofits AND..."

Cut. Pick the one segment that buys most easily and complains least. Brand will be sharper, and you can always expand later.

### Borrowing positioning from a successful competitor

"We want to be the [bigger brand] of [smaller niche]" usually means you don't have your own positioning yet. Push back: what's the thing that's true about you that isn't true about them?

### Voice archetypes that don't match founder's actual voice

If the user's natural way of writing is Operator + Challenger, but they pick Storyteller because they admire someone with that brand, the brand won't sustain. The founder won't maintain a voice they don't naturally have.

Push back: "Your samples in the assessment read as Operator + Challenger. Storyteller would require a different mode of writing weekly. Is this a stretch goal or are we calibrating to who you are?"

### Visual direction without execution path

If the user can't afford a designer, picking a complex visual direction sets them up to fail. Adapt to what they can ship.

> "You're pre-revenue with $0 visual budget. Cool + Geometric type + Sharp energy can be executed in 1 day with free Google Fonts (IBM Plex Sans) + 2 colors. Want me to spec that as the starter?"

### Signature elements that the user can't sustain

5 signature elements requires 5 enforcement moves across content. If the user has 8 hours/wk in business and 4 of those are client delivery, they can't sustain 5 elements.

Cap at 3 for pre-revenue, 5 for early operator+.

## Anti-patterns to refuse

- "Bold, innovative, customer-centric", these are not voice archetypes. Push back.
- "Trustworthy yet approachable", meaningless without specifics. Push back.
- "Disruptive", banned. Replace with the actual specific contrast.
- "Best-in-class", banned. State what specifically is best.

## Updating brand over time

The brand brief is a snapshot. It updates when:

- The user pivots ICP (re-run Step 1-2)
- The offer changes substantially (re-run Step 3)
- The user gets explicit feedback that their brand isn't landing (full re-run)

Quarterly check-in: "Is the brand brief still accurate? Anything stale?"

## Working with other skills

- Hands off to: `brand-guidelines` (for visual asset specs), `voice-rules` (for ongoing voice enforcement)
- Imports from: `icp-discovery` (Step 1), `positioning` (Step 1), `voice-rules` (Step 4)
- Updates: `CLAUDE.md > Brand State` section
- Brief file written to: `docs/brand-brief.md` (or user-specified path)

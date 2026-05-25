---
name: brand-guidelines
description: This skill should be used when the user asks to "document my brand", "build brand guidelines", "brand standards", "visual brand doc", "brand style guide", "brand book", "where do I write down my brand", "design system for my brand", or has just finished brand-strategist and needs the brief turned into a working guidelines document. Generates a stage-appropriate brand-guidelines.md (1-page sketch for Pre-Rev, full reference for Scaling Solo) covering colors, type, voice profile, logo usage, do/don't grid, and asset inventory. Imports from brand-strategist (brief), voice-rules (voice profile), and any existing assets the user already has.
version: 0.1.0
---

# Brand Guidelines

The documentation skill. Turns the brand-strategist brief into a working reference document that the user, contractors, designers, and future-self can use to keep the brand coherent. Stage-aware. Pre-Rev gets a 1-page sketch so they don't burn 3 weeks before a customer exists. Scaling Solo gets full guidelines because incoherence costs real money at that stage.

## When this skill triggers

- "Document my brand"
- "Build brand guidelines"
- "Brand standards"
- "Brand style guide"
- "Brand book"
- "Visual brand doc"
- "Design system"
- "Where do I write my brand down"
- Auto-activated after `brand-strategist` finishes and the user has a locked brief
- Auto-activated when the user briefs a new contractor or designer

NOT for: brand identity work from scratch (use `brand-strategist`), voice enforcement on every draft (use `voice-rules`), logo design execution (refer out to a designer with this doc as the brief).

## What guidelines do

Guidelines are operational. They turn brand decisions into:

1. **Decisions a designer can execute** without asking 12 questions
2. **A do/don't grid** the user can reference at 11pm when shipping a post
3. **A version-controlled snapshot** of "what the brand looks like as of [date]"
4. **A briefing document** for any contractor (VA, designer, developer, social manager)

Guidelines are NOT:

- A 40-page brand book that nobody reads
- A vanity document that signals "real business" without doing operational work
- A static artifact that never updates
- An excuse to delay shipping

## The guidelines build process (7 sections)

Work through each section in order. Show progress as you go. Lock each section before moving on. Pre-Rev users get truncated versions (noted inline). Stable Solo and Scaling Solo get full builds.

### Section 1: Brand identity snapshot

Top of the guidelines. The "what is this brand" answer in 30 seconds of reading.

Pull from the brand-strategist brief if available. If not, run a 3-question intake:

1. What's the positioning statement?
2. What's the brand promise?
3. What's the voice archetype?

Compose into a snapshot block:

```
BRAND: [Business name]
POSITIONING: [Locked positioning statement from brand-strategist]
PROMISE: [Locked brand promise]
VOICE ARCHETYPE: [Primary] + [Supporting]
ICP: [One ICP, specific]
NOT FOR: [Anti-ICP, optional but useful]
```

Lock this before continuing. The rest of the guidelines flow from these decisions. If positioning isn't locked, route to `positioning` skill first.

### Section 2: Color palette

Define the color system. Three layers:

**Layer 1: Primary colors (2-3 max).** The colors people remember the brand by. Used in logo, key CTAs, brand mark.

For each primary color, document:
- Name (e.g., "Teal," "Gold")
- Hex code
- RGB and CMYK values (for print)
- Usage rules (e.g., "Gold is for CTAs and section labels only")

**Layer 2: Secondary colors (2-4).** Supporting palette. Backgrounds, surfaces, text variations.

For each secondary color:
- Name
- Hex
- Usage rules

**Layer 3: Functional colors (3-5).** Black, white, neutrals, success/error states.

Example block (the example coaching business style):

```
PRIMARY
- Teal   #0A1F20   Dark sections, hero bg, primary brand color
- Gold   #D4A96A   CTAs, section labels, accents only
- Cream  #F2EDE6   Default page background

SECONDARY
- Teal-mid    #103032   Alternating section bg
- Teal-deep   #184345   Rare hover states
- Gold-dark   #A87D3E   Hover/active gold
- White       #FFFFFF   Cards on cream sections

FUNCTIONAL
- Body text       #0A1F20 on cream, #F2EDE6 on teal
- Borders         rgba(255,255,255,0.08) on dark
- Borders         rgba(10,31,32,0.10) on light
```

Pre-Rev variant: 1 primary + 1 accent + 1 background. That's it. Three colors total. Skip layers 2 and 3.

### Section 3: Typography system

Two fonts maximum. Headline + body. Mono only if the brand has code-adjacent positioning.

For each font:
- Name and source (Google Fonts, Adobe, local file)
- Weight range used (e.g., "Manrope 300-700")
- Display size, mobile size, body size
- Letter-spacing rules
- Case rules (e.g., "Archivo Black: always uppercase, -0.03em tracking")

Example block:

```
HEADLINES. Archivo Black
- Always uppercase
- Letter-spacing: -0.03em
- H1 desktop: 64px / mobile: 40px
- H2 desktop: 40px / mobile: 28px
- H3 desktop: 28px / mobile: 22px

BODY. Manrope
- Weight 400 default, 300-700 range
- Body size: 16px desktop / 16px mobile
- Line-height: 1.7
- Sentence case for body, title case only for proper nouns
```

Pre-Rev variant: pick one Google font for both headline and body. Use weight variations. Done. Stop optimizing.

### Section 4: Logo + visual marks

Document the logo and any signature visual elements (icon, monogram, recurring graphic device).

For each mark:
- File location (paths to SVG, PNG variants)
- Approved variants (full logo, mark only, monochrome)
- Minimum size
- Clear space rule (e.g., "padding = 1x the height of the logomark")
- What never to do (don't stretch, don't recolor outside palette, don't add effects)

If the user has no logo yet (Pre-Rev common case), use a wordmark spec instead:
- Font (from Section 3)
- Color (from Section 2)
- Tracking and weight

Example wordmark spec for a Pre-Rev brand:

```
WORDMARK (pre-logo)
- "[Business Name]"
- Archivo Black
- Color: Teal #0A1F20 on light bg, Cream #F2EDE6 on dark bg
- Letter-spacing: -0.03em
- All caps
- Use until logo is designed (Q2 2026)
```

Pre-Rev users: skip the logo section entirely. A wordmark in your headline font IS your logo until you have a customer.

### Section 5: Voice profile snapshot

Mirror what lives in `voice-rules` so the guidelines document is self-contained.

```
VOICE
Archetype: [Primary] + [Supporting]
Tone profile: [10 word-pair ratings, e.g., Warm:4 · Sharp:2 · Formal:1 · Casual:4 · Playful:3]

BANNED PHRASES (do not use)
- [phrase 1]
- [phrase 2]
- [phrase 3]

SIGNATURE PHRASES (use where natural)
- [phrase 1]
- [phrase 2]

AI-TELL GUARDRAILS
- Em-dashes: [off / on]
- "X, not Y" pattern: [off / on]
- Hedge words: [flagged / allowed]
- Custom: [user-defined]
```

This section is a snapshot. The source of truth lives in `skills/brand/voice-rules/SKILL.md`. Note that explicitly so future-Claude knows which file owns the voice profile.

### Section 6: Do/Don't grid

The operational heart of the guidelines. 6-10 paired examples that show good vs. bad applications.

Format each pair:

```
DO: [Specific application]
- Why it works: [1 sentence]

DON'T: [Specific anti-pattern]
- Why it breaks: [1 sentence]
```

Categories to cover (cap at 6-10 total pairs):

1. **Color usage**: DO: Gold for CTAs only. DON'T: Gold for body text.
2. **Type hierarchy**: DO: Archivo Black uppercase for h1. DON'T: Mix Archivo with cursive script.
3. **Photography**: DO: Warm natural light, founder facing camera. DON'T: Stock photo handshakes.
4. **Iconography**: DO: SVG outline icons, gold stroke. DON'T: Emoji.
5. **Spacing**: DO: 80px section padding mobile, 120px desktop. DON'T: Crammed sections.
6. **CTA copy**: DO: "Book a call." DON'T: "Learn more."
7. **Tone**: DO: "Most marketing agencies sell hours. We sell decisions." DON'T: "We're a results-driven marketing partner."
8. **Email signature**: DO: Name + role + one link. DON'T: 5-line signature block with social icons.
9. **Social bio**: DO: One promise + one CTA. DON'T: Jargon stack with emoji bullets.
10. **Pricing display**: DO: "$X,XXX. Pay monthly or upfront. 30-day refund." DON'T: "Investment: discuss on call."

Pre-Rev variant: 3 pairs minimum. Pick the categories that matter for whatever channel they ship on first (usually website + email).

### Section 7: Asset inventory

A simple table of where every brand asset lives. Future-Claude and the user need this.

```
| Asset | Format | Location |
|---|---|---|
| Logo (color, full) | SVG | brand-assets/logo-color.svg |
| Logo (mono dark) | SVG | brand-assets/logo-mono-dark.svg |
| Logo (mono light) | SVG | brand-assets/logo-mono-light.svg |
| Favicon | ICO | langley-site/images/favicon.ico |
| OG card template | PSD/PNG | brand-assets/og-template.psd |
| Brand fonts | TTF | ~/.local/fonts/ |
| Color palette | ASE | brand-assets/palette.ase |
| Photography | JPG | langley-site/images/photography/ |
```

If assets do not exist yet, list them as `TBD` with a target date.

## Output: docs/brand-guidelines.md

Compile all 7 sections into a single markdown file at `docs/brand-guidelines.md` (or wherever the user keeps documentation). Wrap with a header:

```
# Brand Guidelines: [Business Name]
v0.1.0, [Date]
Source: brand-strategist brief (locked [date])
```

Footer:

```
## Updating these guidelines

These guidelines update when:
- The brand-strategist brief is re-run (full refresh)
- Voice-rules change (Section 5 re-syncs)
- New brand assets ship (Section 7 updates)
- A do/don't pattern emerges from real shipping (Section 6 grows)

Owner: [User name]
Last updated: [Date]
```

Back up any existing `docs/brand-guidelines.md` to `docs/brand-guidelines-backup-<date>.md` before overwriting.

## Stage-aware adjustments

### Pre-Rev Builder

Output: 1-page sketch. ~400 words total.

Sections to include:
- Section 1: Brand identity snapshot (3 lines)
- Section 2: Color palette (3 colors)
- Section 3: Typography (1 font)
- Section 5: Voice profile snapshot (banned + signature lists only)
- Section 6: Do/Don't grid (3 pairs)

Skip Section 4 (logo) and Section 7 (inventory). Set a calendar reminder for first paying client signed: re-run brand-guidelines to expand to the full version.

Rationale: at Pre-Rev, every hour spent on brand guidelines is an hour not spent finding a customer. The 1-page sketch keeps the brand from drifting while you do the customer work that earns you the right to fuller guidelines.

### Early Operator (<$5K MRR)

Output: 5-6 sections. Skip Section 7 (asset inventory) if asset count is under 5.

Focus on the do/don't grid. Sections 5 and 6 do the most operational work at this stage because the user is shipping content and outreach daily.

### Stable Solo ($5-25K MRR)

Full 7-section build. The user is hiring contractors (designer, social manager, VA) and they need a briefing document.

### Scaling Solo ($25K+ MRR)

Full build plus:
- Section 8: **Brand application examples** (live screenshots of website hero, social post, email signature, pricing page, all annotated)
- Section 9: **Approval workflow** (who reviews brand work, what's the turnaround, where do drafts live)

At this stage, incoherence costs real money. Guidelines become the contract between the user and everyone shipping in their name.

## Working with other skills

- **Imports from:** `brand-strategist` (brief), `voice-rules` (voice profile), `positioning` (Section 1)
- **Writes to:** `docs/brand-guidelines.md`
- **Updates:** `CLAUDE.md > Brand State` section with link to guidelines
- **Briefs:** any contractor work. When the user spins up a designer or social manager task, point them at this document first.
- **Refreshes:** triggered when `brand-strategist` re-runs or when `voice-rules` changes substantially

## Anti-patterns to refuse

### "Build me a 40-page brand book"

Push back. The user does not have a 40-page-brand-book stage. Guidelines are operational. Ceremonial brand books at this stage waste time. Cap depth at the user's stage.

> "You're Early Operator. A 40-page brand book is signaling. The 5-section operational version is what actually works. Want me to draft that instead?"

### "Pick the brand for me"

If the user has not run `brand-strategist` and asks the guidelines skill to pick colors and fonts, route them back. Guidelines document decisions. They do not make decisions.

> "I document what brand-strategist locks. Run /brand-strategist first to lock the brief, then I'll turn it into guidelines."

### "Match [famous brand]"

The user wants their brand to feel like Notion / Apple / Stripe / Mailchimp. Push back.

> "Matching [big brand] is borrowing positioning. It's also expensive to execute at your stage. What's the thing that's true about you that isn't true about them?"

### Pre-Rev wants the full Scaling Solo version

> "Full guidelines take 4-6 hours to build and update. At Pre-Rev, the 1-page sketch is the right depth. Re-run after first paying client signed."

### Guidelines without a do/don't grid

Sections 1-5 are reference. Section 6 is where the document earns its keep. If the user wants to skip Section 6 to save time, refuse.

> "Without the do/don't grid, this becomes a vanity doc. Section 6 is the operational core. Want me to draft 3 pairs and we can expand from there?"

### Auto-updating from voice-rules without confirmation

If `voice-rules` updates, do not silently rewrite Section 5 in the guidelines. Surface the diff and ask: "Voice-rules added [phrase]. Update Section 5 of brand-guidelines? Yes/No."

## Common traps

### Guidelines that contradict the website

If the user's live site uses `#0B2122` for teal but the guidelines say `#0A1F20`, fix the divergence immediately. Run a grep across `langley-site/` (or equivalent) for any color values that do not match the guidelines. List discrepancies. Ask which is authoritative. Update the loser.

### Type system that requires fonts the user can't deploy

If the guidelines spec "Söhne" but the user is on Cloudflare Pages with no font license, the spec breaks on deploy. Validate every font choice against:
1. Is it free (Google Fonts, Adobe Fonts, IBM Plex, etc.)?
2. Can the user host it (TTF in repo, served from /fonts/)?
3. Does the license cover commercial use?

If any of those answer no, replace with a free equivalent.

### Do/Don't grid that is too generic

"DO: be on brand. DON'T: be off brand." is not a rule. Each do/don't pair must be specific enough that a contractor can apply it without asking.

Good: "DO: Use gold (#D4A96A) for CTA buttons only. DON'T: Use gold for body text or section backgrounds."

Bad: "DO: Use gold appropriately."

### Guidelines built once, never updated

Add the footer ("Updating these guidelines") and set a quarterly check-in. If the user is on `weekly-brief` cadence, add a quarterly slot: "Q[N] brand-guidelines refresh."

### Skipping Section 7 because "I'll add assets later"

The asset inventory IS the section that gets used the most operationally. Even if the only entries are TBDs with target dates, build it. Future-Claude needs to know where the logo SVG lives.

## Briefing a designer with this document

If the user is briefing a designer (logo, website refresh, social templates), the guidelines document is the brief. Add a cover sheet on top when sending:

```
# Designer Brief: [Project Name]
Date: [Date]
Scope: [What's being designed]
Deadline: [Target ship date]
Budget: [$X]
Files to produce: [Deliverables, formats, sizes]

See attached brand-guidelines.md for:
- Color palette (Section 2)
- Typography (Section 3)
- Logo usage (Section 4)
- Do/Don't grid (Section 6)

Questions / clarifications: [Contact info]
```

Save the brief at `docs/contractor-briefs/<date>-<project>.md`. Keep a record. Future projects reuse it.

## Updating guidelines

Quarterly check-in question: "Is the brand-guidelines document still accurate? Anything stale?"

Triggers for a real refresh (more than an inline edit):
- Brand-strategist re-runs (positioning change)
- Voice-rules changes substantially (new archetype, new banned phrases)
- The user pivots ICP (often invalidates color/type/voice direction)
- Visual rebrand (new logo, new palette)

Triggers for an inline edit:
- New asset added (update Section 7)
- New do/don't pattern noticed in real shipping (add to Section 6)
- New banned phrase appears in voice-rules (sync to Section 5)

## Additional Resources

### Reference files

- **`references/brand-guidelines-template.md`**: the full markdown template with all 7 sections pre-stubbed, ready to populate
- **`references/color-palette-builder.md`**: guide to picking a 3-layer color system from a brand-strategist brief, with accessibility contrast checks

### Example files

- **`examples/example-brand-guidelines.md`**: fully populated guidelines for the the example coaching business brand (cream/teal/gold, Archivo Black + Manrope, Operator + Challenger voice). Real-world reference.
- **`examples/guidelines-pre-rev-sketch.md`**: 1-page sketch version for a Pre-Rev Builder. Same brand foundation, truncated depth.

### Related skills

- `skills/brand/brand-strategist/SKILL.md`: runs first, produces the brief this skill documents
- `skills/brand/voice-rules/SKILL.md`: owns the voice profile that Section 5 mirrors
- `skills/brand/content-humanizer/SKILL.md`: enforces voice on shipped content; uses the same banned/signature phrases as Section 5
- `skills/product/positioning/SKILL.md`: owns the positioning statement that opens Section 1

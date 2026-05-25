# Brand Guidelines Template

Use this as the starting structure when generating `docs/brand-guidelines.md` for a user. Replace bracketed placeholders. Strip sections that do not apply to the user's stage (see SKILL.md > Stage-aware adjustments).

---

```markdown
# Brand Guidelines: [Business Name]

v0.1.0
Last updated: [YYYY-MM-DD]
Owner: [User name]
Source: brand-strategist brief locked [YYYY-MM-DD]

---

## 1. Brand identity snapshot

**Brand:** [Business name]
**Positioning:** [Locked positioning statement from brand-strategist]
**Promise:** [Locked brand promise]
**Voice archetype:** [Primary] + [Supporting]
**ICP:** [One ICP, specific]
**Not for:** [Anti-ICP, optional but useful]

---

## 2. Color palette

### Primary

| Name | Hex | RGB | Usage |
|---|---|---|---|
| [Color name] | #XXXXXX | r, g, b | [Where it appears] |
| [Color name] | #XXXXXX | r, g, b | [Where it appears] |

### Secondary

| Name | Hex | RGB | Usage |
|---|---|---|---|
| [Color name] | #XXXXXX | r, g, b | [Where it appears] |

### Functional

| Use | Light bg value | Dark bg value |
|---|---|---|
| Body text | #XXXXXX | #XXXXXX |
| Borders | rgba(...) | rgba(...) |
| Links | #XXXXXX | #XXXXXX |
| Error state | #XXXXXX | #XXXXXX |
| Success state | #XXXXXX | #XXXXXX |

### Color usage rules

- [Specific rule, e.g., "Gold is used for CTAs and section labels only. Never body text."]
- [Specific rule, e.g., "Cream is the default page background. Switch to teal for rhythm breaks every 2-3 sections."]
- [Specific rule, e.g., "Use rgba borders, never solid lines."]

### Accessibility

- All body text passes WCAG AA contrast at 4.5:1
- All large text passes WCAG AA at 3:1
- Color contrast checked with: [WebAIM Contrast Checker / Stark / etc.]

---

## 3. Typography

### Headlines

**Font:** [Font name]
**Source:** [Google Fonts / Adobe / local file path]
**Weights used:** [e.g., 900 only]
**Rules:**
- Case: [uppercase / sentence case / title case]
- Letter-spacing: [e.g., -0.03em]
- H1 desktop: [XXpx]
- H1 mobile: [XXpx]
- H2 desktop: [XXpx]
- H2 mobile: [XXpx]
- H3 desktop: [XXpx]
- H3 mobile: [XXpx]

### Body

**Font:** [Font name]
**Source:** [Google Fonts / Adobe / local file path]
**Weights used:** [e.g., 300-700]
**Rules:**
- Body size: [16px desktop / 16px mobile]
- Line-height: [e.g., 1.7]
- Paragraph spacing: [e.g., 1.2em margin-bottom]
- Sentence case for prose, title case only for proper nouns

### Display sizes

| Element | Desktop | Mobile |
|---|---|---|
| Hero headline | [XXpx] | [XXpx] |
| Section headline | [XXpx] | [XXpx] |
| Card headline | [XXpx] | [XXpx] |
| Body | [XXpx] | [XXpx] |
| Caption | [XXpx] | [XXpx] |

---

## 4. Logo + visual marks

### Primary logo

- **File:** [path to SVG]
- **Variants:** color full · monochrome dark · monochrome light · mark only
- **Minimum size:** [px or relative unit]
- **Clear space:** [rule, e.g., "padding = 1x logomark height on all sides"]

### Restrictions

- Never stretch, skew, or distort
- Never recolor outside the approved palette
- Never add drop shadows, glows, or filters
- Never place over busy photography without an underlying solid block

### Wordmark (alternate)

When the logo is not appropriate (small spaces, single-line headers), use the wordmark:

- Text: [Business name]
- Font: [Headline font]
- Color: [Hex on light, Hex on dark]
- Case: [uppercase / title case]
- Letter-spacing: [e.g., -0.03em]

### Favicon

- **File:** [path to .ico]
- **Sizes generated:** 16x16, 32x32, 180x180 (apple-touch-icon), 192x192 (PWA), 512x512 (PWA)
- **Recipe:** [path to generation script, if exists]

---

## 5. Voice profile

> Source of truth: `skills/brand/voice-rules/SKILL.md`. This section is a snapshot.

**Archetype:** [Primary] + [Supporting]

**Tone profile:**
[10 word-pair ratings, e.g., Warm:4 · Sharp:2 · Formal:1 · Casual:4 · Playful:3 · Serious:3 · Direct:5 · Punchy:4]

### Banned phrases

Do not use these. Pre-commit hook enforces.

- [phrase 1]
- [phrase 2]
- [phrase 3]
- [phrase 4]
- [phrase 5]

### Signature phrases

Use where natural. Do not force.

- [phrase 1]
- [phrase 2]
- [phrase 3]

### AI-tell guardrails

- **Em-dashes:** [off / on]
- **"X, not Y" pattern:** [off / on]
- **Hedge words** (just, really, basically, actually, simply, literally, honestly, frankly): [flagged / allowed]
- **Custom guardrails:** [user-defined patterns]

### Tone calibration examples

**Headline tone:**
> [Real example from the brand's site/content]

**Body tone:**
> [Real example from the brand's site/content]

**CTA tone:**
> [Real example, e.g., "Book a call." (specific, active verb)]

---

## 6. Do / Don't grid

### Color usage

**DO:** [Specific application]
Why: [1 sentence]

**DON'T:** [Specific anti-pattern]
Why: [1 sentence]

### Typography

**DO:** [Specific application]
Why: [1 sentence]

**DON'T:** [Specific anti-pattern]
Why: [1 sentence]

### Photography / imagery

**DO:** [Specific application]
Why: [1 sentence]

**DON'T:** [Specific anti-pattern]
Why: [1 sentence]

### Iconography

**DO:** [Specific application]
Why: [1 sentence]

**DON'T:** [Specific anti-pattern]
Why: [1 sentence]

### CTA copy

**DO:** [Specific application]
Why: [1 sentence]

**DON'T:** [Specific anti-pattern]
Why: [1 sentence]

### Voice + tone

**DO:** [Specific application]
Why: [1 sentence]

**DON'T:** [Specific anti-pattern]
Why: [1 sentence]

### Spacing + layout

**DO:** [Specific application]
Why: [1 sentence]

**DON'T:** [Specific anti-pattern]
Why: [1 sentence]

### Email signature

**DO:** [Specific application]
Why: [1 sentence]

**DON'T:** [Specific anti-pattern]
Why: [1 sentence]

### Social bio

**DO:** [Specific application]
Why: [1 sentence]

**DON'T:** [Specific anti-pattern]
Why: [1 sentence]

### Pricing display

**DO:** [Specific application]
Why: [1 sentence]

**DON'T:** [Specific anti-pattern]
Why: [1 sentence]

---

## 7. Asset inventory

| Asset | Format | Location | Notes |
|---|---|---|---|
| Logo (color, full) | SVG | [path] | |
| Logo (mono dark) | SVG | [path] | |
| Logo (mono light) | SVG | [path] | |
| Favicon | ICO | [path] | Multi-size |
| Apple touch icon | PNG | [path] | 180x180 |
| OG card template | PSD/PNG | [path] | 1200x630 |
| OG card generator | Python | [path] | CLI script |
| Brand fonts (headline) | TTF | [path] | License OK |
| Brand fonts (body) | TTF | [path] | License OK |
| Color palette | ASE | [path] | Adobe Swatch Exchange |
| Photography library | JPG/PNG | [path] | Photographer credits in EXIF |
| Email signature HTML | HTML | [path] | |
| Social templates | PSD/Figma | [path] | |

---

## Updating these guidelines

These guidelines update when:

- The brand-strategist brief is re-run (full refresh)
- Voice-rules change (Section 5 re-syncs from the source skill)
- New brand assets ship (Section 7 grows)
- A do/don't pattern emerges from real shipping (Section 6 grows)
- Quarterly review surfaces stale references

Owner: [User name]
Quarterly review date: [next quarter]
```

---

## Notes on populating this template

1. **Replace every bracket.** If a bracket cannot be filled, escalate. Do not ship guidelines with `[TBD]` in production sections.

2. **Use the user's real values.** Pull from their brand-strategist brief, their live website, their existing assets. Do not invent hex codes.

3. **Strip sections per stage.** Pre-Rev users get sections 1, 2, 3, 5, 6 only. See SKILL.md > Stage-aware adjustments.

4. **Lock then write.** Confirm each section before writing. The guidelines document should never surprise the user when they read it back.

5. **Validate against live assets.** Before saving, grep the user's repo for any color hex codes or font names that contradict what you just wrote. Surface discrepancies. Ask which is authoritative.

6. **Back up the previous version.** If `docs/brand-guidelines.md` already exists, copy it to `docs/brand-guidelines-backup-<YYYY-MM-DD>.md` before overwriting.

# Integration with voice-rules.md

How `voice-from-samples` output merges into the existing `voice-rules.md` skill file. The goal: layer sample-derived findings on top of assessment-derived voice, without erasing either signal.

## Read order

When `voice-from-samples` runs:

1. Open `skills/brand/voice-rules/SKILL.md`
2. Parse the existing populated values (archetype, tone, banned phrases, signature phrases) — these were set by `customize-from-assessment`
3. Run the extraction (see `voice-analysis-framework.md`)
4. Build the merged output (see structure below)
5. Write back to `voice-rules/SKILL.md`

If `voice-rules/SKILL.md` is still in template state (unfilled `{{ARCHETYPE}}` placeholders), populate from samples only — there is no assessment input to merge with.

## Merge structure

`voice-rules.md` gets a new section added (or updated) after the existing `## TONE PROFILE` section. Keep all existing sections — just append the new one.

```markdown
## Voice from samples (extracted YYYY-MM-DD)

**Source:** N chunks of user's real writing, ranked M+ on "on" scale.
**Analysis run:** [date, samples-from-date-range]

### Sentence patterns
- **Mean sentence length:** X words [sample-derived, takes precedence]
- **Distribution:** % short, % long
- **Fragment use:** [yes/no, frequency]

### Signature moves
[3-5 patterns with exemplar quotes]

### Vocabulary
**Recurring (use these freely):**
- [phrase 1]
- [phrase 2]
- ...

**Conspicuously absent (do not introduce):**
- [phrase 1]
- ...

### Voice archetype (sample-derived)
**Primary:** [archetype]. Exemplar: "[quote]"
**Secondary:** [archetype, optional]

### Gold-standard exemplars
Use these 3-5 sentences from the user's actual writing as the highest-fidelity reference when producing copy:

1. "[exemplar sentence 1]"
2. "[exemplar sentence 2]"
3. "[exemplar sentence 3]"

## Mismatches between assessment-stated and sample-derived voice
[If any mismatches surfaced, list them here with neutral framing.]

- Assessment said X. Samples show Y. Resolution: [user's call — defaults to sample-derived takes precedence]
```

## Banned phrases merge

The skill may surface new banned-phrase candidates from samples. Merge into the existing `## BANNED PHRASES` section:

1. Keep all existing banned phrases (from assessment or prior runs)
2. Add new candidates with `[auto-detected from samples, confirm or remove]` tag
3. If user confirms, remove the tag on next run
4. If user rejects, delete the entry

Example after merge:

```markdown
## BANNED PHRASES

- circle back  [assessment-derived]
- synergy  [assessment-derived]
- moving forward  [auto-detected from samples, confirm or remove]
- it's worth noting  [auto-detected from samples, confirm or remove]
- — (em-dash)  [auto-detected from samples, confirm or remove]
```

## Conflict resolution

When sample-derived and assessment-derived values conflict, default rule: **sample-derived takes precedence**, but document both visibly so the user can override.

| Conflict | Default resolution |
|---|---|
| Assessment says archetype = "mentor", samples = "operator" | Use "operator (sample-derived)" as primary, note "mentor (aspirational, assessment-stated)" |
| Assessment says tone is "punchy" (5/5), samples show mean 28 words | Note the gap explicitly: "Stated as punchy, writing runs long. Aspirational." |
| Assessment lists "circle back" as banned, samples contain it | Either rewrite samples or remove the ban — surface the contradiction to user |

## Re-running the skill

If `voice-from-samples` has been run before, look for the existing `## Voice from samples (extracted ...)` section. Replace it entirely with the new extraction (do not stack multiple historical extractions). Older extractions can be archived to `voice-rules-history/` if the user wants a paper trail.

The "Gold-standard exemplars" subsection gets refreshed too — newer samples replace older exemplars when they're higher-quality.

## How voice-rules uses the merged output

When `voice-rules` runs to check a draft, it now has two layers of signal:

1. **Assessment-derived voice** (archetype, tone, stated banned phrases) — the user's *intended* voice
2. **Sample-derived voice** (sentence patterns, signature moves, exemplars, auto-detected banned phrases) — the user's *actual* voice

The check sequence:

1. Reject any draft containing a banned phrase (either source)
2. Score sentence-length distribution against sample-derived mean — flag drafts that diverge significantly
3. Compare the draft's archetype fit (Claude infers) against sample-derived archetype — flag mismatches
4. Suggest rewrites using the gold-standard exemplars as voice anchors

This makes voice-rules considerably stronger than relying on assessment input alone.

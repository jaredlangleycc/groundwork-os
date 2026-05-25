---
name: voice-from-samples
description: This skill should be used when the user runs "/capture-voice", "capture my voice", "learn my style", "voice from writing", "analyze my writing", or "what does my voice sound like". It collects 3-5 chunks of the user's real writing (emails, posts, drafts, journal entries) and extracts the voice patterns Claude should match when producing copy on their behalf. Output supplements (does not erase) the assessment-derived voice in voice-rules.md.
version: 0.1.0
---

# Voice From Samples

The voice-capture exercise. Assessment Section 4 asks the user to *describe* their voice. This skill *extracts* their voice from real writing. Higher fidelity. Survives self-report bias.

## Why this matters

Most people misdescribe their own voice. They say "punchy" when their average sentence is 32 words. They say "warm" when their writing is technical. They say "casual" when they hedge every paragraph.

Real writing samples bypass that gap. Sentence-length distribution does not lie. Signature openers and closers reveal patterns the writer cannot see. Vocabulary preferences expose what the writer actually reaches for, not what they wish they reached for.

Run this skill **once after a few weeks of using NightShiftOS** when the user has written enough that you can sample real work. Or run it on Day 1 if they already have a corpus they trust (a blog, a newsletter, sent emails).

## When this skill triggers

- User says: `/capture-voice`, "capture my voice", "learn my style", "voice from writing", "analyze my writing", "what does my voice sound like", "extract my voice"
- Optional cron: `voice-recapture-monthly` (re-extract every 30 days as the user's writing evolves)
- After the user has shipped 5+ pieces of content using NightShiftOS, propose running it

## Relationship to voice-rules

`voice-rules` ENFORCES voice on every output. `voice-from-samples` POPULATES the voice profile that voice-rules enforces. They pair:

| Skill | When it runs | What it does |
|---|---|---|
| `customize-from-assessment` | Day 1 onboarding | Populates `voice-rules.md` from assessment Section 4 (user self-report) |
| **`voice-from-samples`** (this skill) | After real writing exists | Updates `voice-rules.md` with patterns extracted from actual samples (real evidence) |
| `voice-rules` | Every draft produced by other skills | Enforces the populated voice profile |

Sample-derived voice takes precedence over assessment-derived voice when they conflict. Document both signals in `voice-rules.md` so the user can see the gap (e.g., "you said 'punchy' but your average sentence is 28 words — sample-derived takes precedence, treat punchy as aspirational").

## The sequence

### Step 1: Set the frame

Open the conversation with a one-paragraph explainer. Do not lecture. Example:

> Drop in 3-5 chunks of writing you've shipped that felt "on" for you. Emails you sent, posts that landed, blog drafts, journal entries — anything you wrote that you'd want me to sound like in your name. 300+ words per chunk is ideal. We'll do them one at a time so you can frame each.

### Step 2: Collect samples one at a time

For each chunk, ask the user to provide:

1. **The text itself** (paste in chat)
2. **The context** (one sentence): what was this? when did you write it? who was it for?
3. **The "on" rating** (1-10): how representative is this of your voice at its best?

Skip chunks rated below 6. They are signal noise. Aim for 3-5 chunks rated 7+.

Acknowledge each chunk briefly before asking for the next ("Got it — sounds like that one was an inbound email to a warm prospect"). Do not analyze yet. Just collect.

### Step 3: Run the analysis

When the user has provided their final chunk, run the full analysis across the corpus. Use the framework in `references/voice-analysis-framework.md`. Extract:

- **Sentence-length distribution** (mean, median, range, % short ≤10 words, % long ≥30 words)
- **Sentence-structure tells** (declarative vs. interrogative ratio, fragments allowed?, em-dash use, comma density)
- **Signature openers + closers** (recurring patterns at sentence/paragraph starts and ends)
- **Vocabulary tells** (5-10 words/phrases that recur, 5-10 words conspicuously absent)
- **Rhythm tells** (where they slow down, where they speed up, paragraph length variance)
- **Banned-phrase candidates** (any AI-tell phrases that crept in — flag for review)
- **Antipattern signals** (passive voice density, hedging frequency, jargon load)
- **Voice archetype fit** (mentor / friend / challenger / curator / operator / storyteller / analyst / coach — which 1-2 best describe the corpus)

### Step 4: Compare with assessment-derived voice

If `voice-rules.md` already exists (populated by `customize-from-assessment`), read the assessment-stated voice profile and compare to sample-derived findings. Flag mismatches honestly:

- "Assessment said 'punchy' (4/5). Samples show avg sentence 28 words, 60% over 20 words. Either the punchy aspiration is real and you write longer than you'd like, or punchy means something different to you. Pick one."
- "Assessment listed 'circle back' in banned phrases. Sample 3 line 14 uses 'circle back'. Either keep banning it and rewrite, or remove the ban."

This is the *gold* of running the skill — it surfaces gaps between aspirational voice and real voice.

### Step 5: Update voice-rules.md

Use the merge spec in `references/integration-with-voice-rules.md`. The general shape:

1. Open existing `voice-rules.md` (or create if doesn't exist)
2. Add or update the section `## Voice from samples (extracted YYYY-MM-DD)` with the analysis
3. Append 3-5 quoted exemplars from the samples (the user's actual best sentences) as gold-standard references
4. Mark sample-derived findings as `[sample-derived, takes precedence]` where they conflict with assessment
5. Add banned-phrase candidates to `## BANNED PHRASES` (with `[auto-detected from samples, confirm or remove]` flag)

### Step 6: Report back

Show the user:

- Top 3 signature moves you found (one-line each, with quoted exemplar from their samples)
- Top 3 antipatterns or AI-tells you flagged (with the source line)
- Mismatches with assessment (if any) — neutral framing, no judgment
- 2-3 example sentences from their samples that you'll use as voice reference going forward
- The proposed update to `voice-rules.md` as a diff

Then: "Apply this update?" Default yes after they read.

## Critical guardrails

- **Do not skip Step 2 framing.** Collecting context per chunk matters — same writer sounds different in a sales email vs. a journal entry. Without context, the analysis blurs.
- **Do not over-extract.** 5-7 signature moves max. 5-10 banned-phrase candidates max. Voice rules that go over a page get ignored.
- **Quote exemplars verbatim.** When you flag "you do X", quote the exact sentence from their samples. Otherwise it sounds like generic AI feedback.
- **Respect the user's "on" ratings.** A chunk rated 9/10 weighs more than one rated 7/10. Note this in the analysis if patterns diverge across rating tiers.
- **No personality readings.** Stick to writing patterns. Do not infer Myers-Briggs or therapeutic insights from word choice. Voice extraction, not psychoanalysis.

## When NOT to use this skill

- The user has shipped less than 3 pieces of writing in NightShiftOS context AND has no external corpus → assessment-derived voice is the only signal. Run this skill after they have real samples.
- The user just wants to enforce voice on a single piece → use `voice-rules` (or `content-humanizer`), not this skill.
- The user wants brand strategy / positioning advice → use `brand-strategist`, not this skill.

## Related skills

- [[customize-from-assessment]] — populates initial voice from assessment Section 4
- [[voice-rules]] — enforces the populated voice profile on every output
- [[content-humanizer]] — adjacent: strips AI tells from a single piece (not voice extraction)
- [[brand-strategist]] — adjacent: brand positioning, not voice mechanics

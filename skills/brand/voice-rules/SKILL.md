---
name: voice-rules
description: This skill should be used by EVERY skill that produces written output (copywriting, outreach-drafter, email-sequence, social-content, content-strategy, proposal-writer, newsletter-broadcast, etc.) before showing drafts to the user. It enforces the user's specific voice: banned phrases, signature phrases, tone profile, archetype, and AI-tell guardrails. This is a TEMPLATE skill — customize-from-assessment populates it with the user's actual voice from their assessment Section 4.
version: 0.1.0
---

# Voice Rules

> **STATUS:** Template. This skill becomes the user's specific voice profile after `/customize-from-assessment` runs (assessment-derived voice) and again after `/capture-voice` runs (sample-derived voice). Until then, it uses safe defaults.

This skill enforces the user's voice on every piece of writing produced by other skills. It is not optional. Every skill that ships text checks against voice-rules before showing the draft.

## Voice population: two sources

Voice-rules is populated from two complementary skills:

- [[customize-from-assessment]] — populates the initial voice profile from the user's assessment answers (Section 4). Runs Day 1. User-stated voice.
- [[voice-from-samples]] — extracts voice patterns from 3-5 chunks of the user's real writing. Runs after they have a corpus. Sample-derived voice, takes precedence over assessment-stated voice when they conflict.

When both have run, voice-rules contains layered signal: aspirational/stated profile from assessment AND extracted patterns from real writing. Sample-derived takes precedence on conflict; both are documented so the user can see the gap.

## When this skill triggers

Every time another skill produces written output. It does not need to be invoked explicitly.

It also triggers when the user says:
- "Does this sound like me?"
- "Run voice check on this"
- "Voice-scan this"
- "Is this AI-sounding?"

## The user's voice (populated by customize-from-assessment)

### Voice archetype

**Archetype:** {{ARCHETYPE}}

> One or two of: mentor, friend, challenger, curator, operator, storyteller, analyst, coach. Until customized, defaults to `operator`.

### Tone profile

**Tone:** {{TONE_PROFILE}}

> Rendered as 10 word-pair ratings, e.g., `Warm:4 · Sharp:2 · Formal:1 · Casual:4 · Playful:3 · Serious:3 · Direct:5 · Punchy:4`. Until customized, defaults to balanced midpoints.

## BANNED PHRASES

These phrases must not appear in any draft. If a draft contains one, rewrite before showing the user.

{{BANNED_PHRASES}}

**Default banned phrases (used until customized) — all are AI tells or generic business-speak:**

- circle back
- moving forward
- at the end of the day
- synergy
- leverage (as a verb)
- robust
- streamline
- seamlessly
- in today's world
- in today's fast-paced world
- it's important to note
- it's worth noting
- imagine if
- picture this
- the truth is
- let's dive in
- without further ado
- needless to say
- when it comes to

## Signature phrases

These are the user's distinctive phrases. Use them naturally where they fit. Don't force them.

{{SIGNATURE_PHRASES}}

> Examples until customized: (none — user has not specified)

## AI-tell guardrails

These are pattern-level rules. Each is on or off based on the user's assessment Section 4.

### em_dashes: {{EM_DASHES_SETTING}}

> When **off**: no em-dash character (—) anywhere in drafts. Use commas, periods, parens, or rewrite the sentence.
> When **on**: em-dashes allowed (some users actually write with them naturally).
> **Default: off** — em-dashes are one of the strongest AI tells in 2026.

### not_x_y_pattern: {{NOT_X_Y_SETTING}}

> When **off**: refuse the antipattern "X, not Y" as a rhetorical move. It's overused in AI writing. Rewrite affirmatively.
> Bad: "Lead with substance, not theater."
> Good: "Lead with substance. Theater can wait."
> **Default: off**

### hedge_words: {{HEDGE_WORDS_SETTING}}

> When **flagged**: minimize use of "just", "really", "basically", "actually", "simply", "literally", "honestly", "frankly". These dilute statements without adding meaning.
> When **allowed**: hedge words OK if they match the user's natural cadence.
> **Default: flagged**

### Custom guardrails

{{CUSTOM_GUARDRAILS}}

> User-defined patterns from Section 4. Examples might include "no 'imagine if' intros" or "no rhetorical questions in headlines."

## Sample paraphrases (cadence reference)

These short paraphrases of the user's actual writing show the rhythm and word choice to mirror. Generated from Section 4 samples.

{{SAMPLE_PARAPHRASES}}

> Until customized, this section is empty. Other skills should rely on signature phrases + tone profile + archetype.

## How other skills use this

Before showing any written draft to the user, the producing skill MUST:

1. **Scan for banned phrases** — replace any found
2. **Apply AI-tell guardrails** — em-dashes off, not-X-Y off, etc.
3. **Inject signature phrases** where natural (don't force)
4. **Calibrate tone** to match the profile (sharp vs warm, direct vs layered, etc.)
5. **Mirror cadence** of the sample paraphrases
6. **Match archetype** voice (operator sounds different from storyteller)

### Output format from voice-checking

A skill that runs voice-rules should output:

```
VOICE CHECK: clean
```

OR

```
VOICE CHECK: 2 violations rewritten
- "moving forward" → "from here"
- em-dash removed
```

Show the rewrites transparently to the user. Builds trust that the voice profile is being respected.

## How users update voice rules

The user can update voice rules three ways:

1. **Retake the assessment** at nightshift.jaredlangley.cc and re-run `/customize-from-assessment`. Full refresh.

2. **Edit this file directly.** Add/remove banned phrases, change tone settings, add signature phrases. Changes take effect on next conversation.

3. **In-conversation feedback.** When the user says "never use 'X' again" or "use 'Y' more," append the change to this file and confirm.

When the user gives in-conversation voice feedback, suggest also editing the file so it persists.

## Common voice-rules patterns

### Pattern: "Drop articles in chat" (caveman-style)

Some users want terse, fragment-style chat replies. Mark in custom_guardrails:
```
custom: chat replies use fragments OK, drop articles where natural
```

### Pattern: "No headers in short replies"

Some users find headers excessive. Mark in custom_guardrails:
```
custom: no h1/h2/h3 in chat unless reply >300 words
```

### Pattern: "First-person plural off"

User doesn't want "we" framing when it's just them. Mark in custom_guardrails:
```
custom: refuse first-person plural; user is solo
```

## Anti-patterns (always rewrite, regardless of user settings)

Even before customization, these are universal AI tells. Default-off for everyone.

- "I'd be happy to help you with that"
- "Great question!"
- "Certainly!" / "Of course!" as openers
- "I hope this helps!" as closer
- "Let me know if you have any other questions!" as closer
- "Here's a comprehensive guide to..."
- Long preambles before the actual answer
- Excessive disclaimers ("It's important to note that...")
- Trailing "feel free to" anything

If a draft contains these, rewrite without them. Don't ask permission.

## What voice-rules does NOT do

- Does not police the user's own writing. If the user types something with "moving forward," don't correct them.
- Does not enforce voice on technical code (variable names, comments, error messages).
- Does not enforce voice on direct quotes from other people.
- Does not enforce voice on table content (data tables stay data tables).

## Re-generating from assessment

If the user runs `/customize-from-assessment` again, this file is regenerated. The previous version is saved as `voice-rules-backup-<date>.md`. The user can diff to see what changed.

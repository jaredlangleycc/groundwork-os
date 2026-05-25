# Voice Analysis Framework

The taxonomy `voice-from-samples` uses to extract patterns from the user's writing corpus. Use this as a checklist when running Step 3 of the skill.

## 1. Sentence-length distribution

Count words per sentence across all sampled chunks. Compute:

- **Mean** sentence length
- **Median** sentence length
- **Range** (shortest and longest sentence)
- **% short** (≤10 words)
- **% long** (≥30 words)
- **% fragments** (sub-clause sentences, intentional incomplete sentences)

Patterns to flag:

| Pattern | What it means |
|---|---|
| Mean 8-14 words, high fragment % | Punchy, modern web voice (tight blogger / Twitter-trained) |
| Mean 15-22 words, balanced distribution | Conversational essay voice |
| Mean 23+ words, low fragment % | Long-form / academic / consulting voice |
| Bimodal distribution (many short + many long) | Rhythmic voice — uses short for impact, long for nuance. Strong signal of intentional craft. |

## 2. Sentence-structure tells

- **Declarative vs interrogative ratio** (statements vs questions)
- **Fragment allowance** (does the user use sub-clause fragments for emphasis?)
- **Em-dash use** (em-dashes are an AI tell — flag if present, propose ban)
- **Comma density** (commas per 100 words; high = nested clauses, low = punchy)
- **Semicolon use** (presence/frequency)
- **Parenthetical use** (frequency and depth — single-level, nested?)
- **Bold/italic use within prose** (inline emphasis pattern)
- **Question-as-transition** (starts paragraph with a question, answers it next sentence)

## 3. Signature openers + closers

Look at the first sentence of every paragraph. Look at the last sentence of every paragraph. Look at the first sentence of every sample. Look at the last sentence of every sample.

Note recurring patterns. Examples of signature openers:

- Single-word punch ("Here's the thing.")
- Question opener ("What if X?")
- Stat opener ("84% of [people] do Y.")
- Contrarian opener ("Most advice says X. The opposite is true.")
- Anchor opener ("Last Tuesday, I...")

Signature closers:

- Direct CTA ("Reply with X.")
- Reflection ("That's the work.")
- Question close ("What's yours?")
- Punchline / aphorism close ("That's the floor.")
- Anchored close (returns to the opener's metaphor)

Pick the 2-3 that recur most. Quote exemplars.

## 4. Vocabulary tells

Two lists:

**Words/phrases that recur** (5-10 max):
- Personal idioms ("the work", "the floor", "the move")
- Recurring metaphors
- Hedge words they keep (some users keep "kind of", "sort of")
- Pet phrases ("Here's the thing", "honestly", "the truth is" — these can be AI tells, flag with care)

**Words conspicuously absent** (5-10 max):
- Industry jargon they avoid
- Generic hedges they don't use
- AI-tell words they avoid (these belong in the BANNED PHRASES list)

## 5. Rhythm tells

Beyond sentence length, look at *paragraph* rhythm:

- **Paragraph length variance** (do they vary short/long deliberately?)
- **Single-sentence paragraphs** (frequency and placement)
- **Where they slow down** (descriptive passages, emotional beats, technical explanations)
- **Where they speed up** (transitions, CTAs, lists)
- **Section break style** (horizontal rule? blank line? subhead?)

## 6. Banned-phrase candidates (AI-tell detection)

Scan all samples for these AI tells. If present, flag for the user to confirm ban or keep:

| AI tell | Why flag |
|---|---|
| "circle back" | Corporate cliché |
| "moving forward" | Corporate filler |
| "at the end of the day" | Generic |
| "synergy" / "synergistic" | Corporate buzzword |
| "leverage" (as verb) | Corporate buzzword |
| "robust" | AI-frequent adjective |
| "streamline" | AI-frequent verb |
| "seamlessly" | AI-frequent adverb |
| "in today's [fast-paced] world" | Generic opener |
| "it's worth noting" / "it's important to note" | AI-frequent transition |
| "imagine if" / "picture this" | AI-frequent opener |
| "the truth is" | AI-frequent opener |
| "let's dive in" | AI-frequent transition |
| Em-dash (—) | AI tell at any frequency |
| "Not X, but Y" | AI-frequent rhetorical structure |
| "Whether you're X or Y" | AI-frequent qualifier |
| Triple-adjective stacks ("powerful, intuitive, easy") | AI tell |
| Symmetric "from X to Y" phrases | AI tell |

Also flag any phrase that appears in 3+ chunks — could be a signature OR a crutch. Ask the user to decide.

## 7. Antipattern signals

- **Passive voice density** (% sentences in passive — high = corporate hedging)
- **Hedging frequency** ("might", "perhaps", "kind of", "I think" — count per 100 words)
- **Jargon load** (industry-specific terms per 100 words)
- **Adverb density** ("-ly" words per 100 words — high = AI tell, also can be a craft choice)
- **Empty intensifiers** ("really", "very", "actually", "just" — count and flag)

## 8. Voice archetype fit

Map the corpus to 1-2 of these archetypes:

- **Mentor** — teaching tone, patient, asks questions, frames lessons
- **Friend** — warm, casual, references shared context, uses "we" / "us"
- **Challenger** — confrontational openers, pushes back on accepted wisdom, contrarian
- **Curator** — selective, references other people's work, weighs in with judgment
- **Operator** — direct, action-oriented, "here's what to do", short on theory
- **Storyteller** — narrative arc, anecdotes, scenes, characters
- **Analyst** — data-led, structured, frameworks, neutral tone
- **Coach** — questions before answers, names tensions, accountable framing

Pick the 1-2 dominant archetypes. Quote exemplar sentences for each.

## 9. Per-context variance

If chunks came from different contexts (sales email vs journal entry), note variance. Most writers shift voice across contexts. Document the spread:

- Sales/outreach voice
- Marketing/content voice
- Personal/reflective voice

Voice-rules can enforce different profiles per context. Note which is the "default" voice (most representative of the user when not constrained by a specific genre).

## Output format

Structure your findings as a markdown report:

```markdown
# Voice from samples (extracted YYYY-MM-DD)

**Samples analyzed:** [N chunks, ~M words total]
**Highest-rated chunks:** [list those rated 9-10]

## Sentence-length distribution
Mean: X words. Median: Y. Range: Z–W.
% short (≤10 words): A%. % long (≥30 words): B%.
Pattern: [one-sentence description]

## Signature moves (3-5)
1. **[Move name]** — "[exemplar sentence from samples]"
2. ...

## Vocabulary
**Recurring:** [list with frequency]
**Conspicuously absent:** [list]

## Banned-phrase candidates
- "[phrase]" (appeared in chunk N, line M) — [reasoning]

## Antipattern flags
- [Pattern]: [frequency], [example]

## Voice archetype
**Primary:** [archetype name]. Exemplar: "[sentence]"
**Secondary:** [archetype name]. Exemplar: "[sentence]"

## Mismatches with assessment-stated voice
- [Mismatch + neutral framing]

## Proposed voice-rules.md update
[Diff block]
```

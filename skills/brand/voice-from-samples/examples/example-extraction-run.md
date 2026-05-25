# Example: voice-from-samples extraction run

A worked example showing the full skill flow — user runs `/capture-voice`, provides 3 chunks, Claude extracts patterns and proposes an update to `voice-rules.md`.

---

## Conversation

**User:** /capture-voice

**Claude:** Drop in 3-5 chunks of writing you've shipped that felt "on" for you. Emails you sent, posts that landed, blog drafts, journal entries — anything you wrote that you'd want me to sound like in your name. 300+ words per chunk is ideal. We'll do them one at a time so you can frame each.

What's chunk 1?

**User:** [pastes a 420-word blog excerpt]

> Most people overcomplicate consistency. They build elaborate systems, color-coded calendars, accountability groups, habit-stacking apps. Then they break the system on Day 4 and decide the system was the problem.
>
> Here's what nobody tells you. Consistency is not a system. It's a willingness to keep showing up after you've already broken the system once. That's the whole skill.
>
> Last Tuesday I missed my writing block. Got pulled into a 7am call that ran long, then the kids needed something, then suddenly it was 11am and the block was gone. The old me would have written off the day. Sat in the shame spiral. Promised tomorrow.
>
> Instead I sat down at 9pm and wrote for twenty minutes. Three paragraphs. Nothing brilliant. Filed it. Kept the streak alive.
>
> That's the move. The point was never the morning block. The point was the writing. The block was just a delivery mechanism for the writing. When the mechanism failed, I shipped the writing through a different mechanism. The streak was never about time of day. It was about not letting one missed rep become two.
>
> Most consistency advice fails because it treats the system as the goal. The system is the scaffolding. The work is the work. When the scaffolding fails — and it will fail — you find the work a different way. Or you accept the rep was missed and you ship the next one.
>
> Both are fine. What kills you is the spiral.

**Claude:** Got it. Sounds like a blog post on consistency / systems-vs-work. What's the context, and how on-voice was it for you (1-10)?

**User:** Personal blog, last Sunday. Felt 9/10 — that's exactly my voice.

**Claude:** Logged at 9/10. What's chunk 2?

**User:** [pastes a 380-word client email]

> Hey [name],
>
> Saw your note about the engagement-rate dip. Two things.
>
> One — that metric is noisier than it looks. Last six weeks I've watched yours bounce between 2.4% and 4.1% with zero correlation to anything you actually shipped. Don't read the noise.
>
> Two — the underlying question is the right one. You're asking: "is my content working?" Engagement rate is a weak proxy. Better questions: are the right people in the audience? Are replies thoughtful? Do leads come from content or paid? Is the same person reading week-over-week or is it churn?
>
> If you want, I can pull the LinkedIn analytics export and we can look at the actual signals next session. Tuesday 2pm works for me. Reply with a thumbs if that's good.
>
> Talk soon,
> J

**Claude:** Got it. Client email, friendly + direct, named the metric noise problem. How on-voice (1-10)?

**User:** 8/10. Slightly more casual than I'd normally write but pretty close.

**Claude:** Logged at 8/10. What's chunk 3?

**User:** [pastes a 510-word essay on parenting + work]

> [content]

**Claude:** Logged at 9/10. Three chunks at 7+ rating, ~1310 words total. Want to drop in 2 more, or run the analysis on what we have?

**User:** Run it.

**Claude:** Running.

---

## Analysis output (Claude generates)

# Voice from samples (extracted 2026-05-25)

**Samples analyzed:** 3 chunks, 1,310 words total.
**Highest-rated chunks:** #1 (blog, 9/10), #3 (essay, 9/10), #2 (client email, 8/10)

## Sentence-length distribution

- **Mean:** 11 words
- **Median:** 9 words
- **Range:** 2–28 words
- **% short (≤10 words):** 58%
- **% long (≥30 words):** 0% (longest = 28)
- **Fragment use:** Yes, deliberate. ~15% of "sentences" are fragments for emphasis.

**Pattern:** Punchy. Bimodal-ish: mostly very short sentences with occasional 20-28 word builds for nuance. No corporate-length sentences. Fragments used intentionally as emphasis beats.

## Signature moves

1. **Two-beat structure** — short setup, then short payoff. "That's the move. The point was never the morning block."
2. **Anchored personal anecdote opener** — "Last Tuesday I missed my writing block." Frames abstract claims in concrete time + scene.
3. **Numbered list inside flowing prose** — "Two things. One — ... Two — ..." (Client email signature move.)
4. **Aphoristic single-sentence paragraph close** — "Both are fine. What kills you is the spiral."
5. **Naming the thing directly** — "That's the whole skill." / "That's the move." Self-naming the lesson rather than letting it linger.

## Vocabulary

**Recurring (use these freely):**
- "the move" / "the work" / "the spiral" (naming abstractions as nouns with "the")
- "Most people [X]. [Counter-claim]." (contrarian framing)
- "Here's [what / the thing]"
- "Don't [read / write off / promise]" (direct imperative)

**Conspicuously absent:**
- "We", "us", "let's" (no inclusive plural, mostly second-person "you" or first-person "I")
- Adverbs ending in "-ly" (low density)
- Hedges ("perhaps", "maybe", "kind of")
- Corporate jargon ("leverage", "synergy", "circle back")
- AI-tell openers ("In today's", "Let's dive in", "Imagine if")

## Banned-phrase candidates

None auto-detected. The samples are clean of common AI tells.

**One flag for review:** "Honestly" appears once in chunk 3. Not a tell at single-instance, but watch for accumulation.

## Antipattern flags

- **Passive voice:** 4% (very low — strong direct-voice signal)
- **Hedging:** 0.3 hedges/100 words (very low)
- **"-ly" adverbs:** 1.1/100 words (low)
- **Empty intensifiers:** 0 instances ("really", "very", "actually" all absent)

## Voice archetype (sample-derived)

**Primary:** Coach. Exemplar: "What kills you is the spiral."

Names tensions directly, questions before answers, accountable framing, no hand-holding.

**Secondary:** Operator. Exemplar: "Reply with a thumbs if that's good."

Action-oriented, terse, decision-forcing.

## Gold-standard exemplars

Use these as the highest-fidelity voice reference when producing copy for this user:

1. "Most people overcomplicate consistency. They build elaborate systems, color-coded calendars, accountability groups, habit-stacking apps. Then they break the system on Day 4 and decide the system was the problem."
2. "That's the move. The point was never the morning block. The point was the writing."
3. "Don't read the noise."
4. "Both are fine. What kills you is the spiral."
5. "Reply with a thumbs if that's good."

## Mismatches with assessment-stated voice

(Assumes `voice-rules.md` was previously populated by `customize-from-assessment`.)

- **Assessment archetype:** "mentor" (5/5). **Samples show:** primarily "coach", secondarily "operator". *Resolution: coach (sample-derived) takes precedence. Mentor framing is aspirational. Keep "mentor" listed as secondary signal — there is teaching in the writing, but the dominant move is naming tensions, not gentle instruction.*

- **Assessment said:** "Use 'we' and 'us' for warmth." **Samples show:** zero "we/us", uses second-person "you" consistently. *Resolution: drop the "we/us" guidance. User is direct second-person, not inclusive plural.*

- **No conflict on banned phrases.**

## Proposed voice-rules.md update

```diff
## TONE PROFILE
- Tone: Warm:4 · Sharp:3 · Punchy:5 · Direct:4
+ Tone: Warm:3 · Sharp:4 · Punchy:5 · Direct:5  [sample-derived]

## Voice from samples (extracted 2026-05-25)
+ [full section as analyzed above]

## BANNED PHRASES
- circle back  [assessment-derived]
- synergy  [assessment-derived]
+ (no new auto-detected bans this run)
```

---

**Claude:** Done. Three things stood out. Your average sentence is 11 words — punchier than most writers — and you use fragments deliberately ~15% of the time. Your dominant archetype is coach, not mentor (small but real gap from what you said in the assessment). And you never use "we/us", which contradicted one piece of assessment guidance.

Gold-standard exemplars logged. Want me to apply the voice-rules.md update?

**User:** Apply it.

**Claude:** Applied. `voice-rules.md` updated. Next time any skill produces copy in your voice, it'll use these patterns and these exemplars as the reference.

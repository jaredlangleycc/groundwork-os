# AI-Tell Master List

The full inventory of patterns the content-humanizer scrubber catches. Organized by category so future updates can extend cleanly. Defaults marked. Each entry has the catch pattern, the rewrite rule, and a real example.

---

## Category 1: Punctuation tells

### Em-dash (—)

**Default:** off (rewrite)
**Why:** Strongest AI tell of 2026. ChatGPT, Claude, and Gemini all overuse em-dashes by 3-5x natural human frequency.
**Rewrite rule:**
- Mid-sentence parenthetical: convert to commas or parentheses
- Sentence-joining (turn): split into two sentences
- Emphasis dash: replace with comma or remove

**Example:**
> Before: "Leadership coaching is abstract, that's why I built a 90-day framework."
> After: "Leadership coaching is abstract. That is why I built a 90-day framework."

### En-dash (–)

**Default:** allow in ranges (10-12pm, pages 5-9), block elsewhere
**Why:** Often used by AI as em-dash substitute when style guide bans em-dashes.

### Three-dot ellipsis (...)

**Default:** flag for review
**Why:** AI uses ellipses to signal drama or pause. Humans use them less frequently outside fiction.
**Rewrite rule:** Replace with period or rewrite the sentence.

### Curly quotes around words that are not quotes

**Default:** flag
**Why:** AI sometimes wraps emphasis in curly quotes ("really" sets things off, signaling AI-ish emphasis).
**Rewrite rule:** Use bold or italics for emphasis, or restructure.

---

## Category 2: Opening tells

These appear at the start of replies, sections, or paragraphs. Delete.

### Affirmation openers

- "Great question!"
- "Excellent question!"
- "That's a great question."
- "What a thoughtful question."
- "Wonderful!"
- "Absolutely!"
- "Certainly!"
- "Of course!"
- "Sure thing!"

**Rewrite rule:** Delete the opener. Start with the actual answer.

### Helpfulness openers

- "I'd be happy to help"
- "I'd love to help you with that"
- "I'm here to help"
- "Let me help you with that"
- "Happy to help"
- "Sure, I can help with that"

**Rewrite rule:** Delete entirely. Start with the actual answer.

### Setup openers

- "Let me explain..."
- "Let me walk you through this..."
- "Let me break this down..."
- "Let's dive in"
- "Let's get into it"
- "Without further ado"
- "Here we go"
- "First things first"

**Rewrite rule:** Delete. The setup is wasted words.

### "Imagine if" / "Picture this"

- "Imagine if [scenario]"
- "Picture this:"
- "Imagine [scenario]"
- "What if I told you..."

**Rewrite rule:** Restate as direct claim. If imagination is the actual frame, rewrite without "imagine if."

**Example:**
> Before: "Imagine if your team could close 30% more deals in 90 days."
> After: "Most teams close 30% more deals in the first 90 days of running this framework."

---

## Category 3: Mid-text tells

### Framing phrases

- "It's important to note that..."
- "It's worth noting that..."
- "Note that..."
- "Worth mentioning..."
- "It bears mentioning..."
- "I should mention..."

**Rewrite rule:** Delete the framing. Keep the claim that follows.

**Example:**
> Before: "It's important to note that the 90-day window matters."
> After: "The 90-day window matters."

### Time-flat phrases

- "In today's fast-paced world..."
- "In today's [adjective] world..."
- "In the current landscape..."
- "In the modern business environment..."
- "At the end of the day..."
- "When it comes to..."

**Rewrite rule:** Delete entirely or restructure.

**Example:**
> Before: "When it comes to leadership, presence matters."
> After: "Leadership starts with presence."

### Filler transitions

- "Needless to say..."
- "Without a doubt..."
- "It goes without saying..."
- "Suffice it to say..."
- "All things considered..."
- "That being said..."
- "Having said that..."

**Rewrite rule:** Delete. The transition is decorative.

### Truth-claim openers

- "The truth is..."
- "Honestly..."
- "Frankly..."
- "To be honest..."
- "Truth be told..."
- "If I'm being honest..."

**Rewrite rule:** Delete. The claim that follows should stand without the framing.

### "What's interesting" / "What's wild"

- "What's interesting is..."
- "What's wild is..."
- "Here's what's interesting..."
- "Here's the thing..."
- "Here's the kicker..."

**Rewrite rule:** Restate as direct claim.

---

## Category 4: Closing tells

### Hopefulness closers

- "I hope this helps!"
- "Hope that helps"
- "Hope this resonates"
- "Hope this makes sense"
- "I hope this gives you clarity"
- "Hope this is useful"

**Rewrite rule:** Delete. The piece either helps or it does not.

### Invitation closers

- "Let me know if you have any other questions"
- "Feel free to reach out"
- "Don't hesitate to ask"
- "Looking forward to your thoughts"
- "Excited to hear what you think"
- "Reach out anytime"

**Rewrite rule:** Delete or replace with one specific CTA.

### "Closing the loop"

- "Closing the loop on this..."
- "Wanted to close the loop..."
- "Following up to close the loop..."

**Rewrite rule:** Delete. Banned phrase in most user voice profiles.

---

## Category 5: Listicle tells

### Listicle openers

- "Here are X reasons..."
- "Here are X ways to..."
- "X tips for..."
- "X strategies to..."
- "The top X..."
- "X things every [audience] should know"

**Rewrite rule:** Lead with a specific claim or example. Save the list structure for later in the piece.

**Example:**
> Before: "Here are 5 reasons new managers fail."
> After: "Most new managers fail in the first 90 days. The reason is rarely the one they tell their boss."

### Listicle middle markers

- "Without further ado, here's..."
- "Let's get into the list"
- "Now that we've covered the basics..."
- "Let's break it down"

**Rewrite rule:** Delete or restructure to flow naturally.

---

## Category 6: Hedge words

Default: flag and propose removal. Keep only when the word carries meaning.

### Intensifier hedges

- "just" (as hedge: "I just wanted to..." → "I wanted to...")
- "really" (as intensifier: "really important" → "important")
- "very" (as intensifier: "very critical" → "critical")
- "extremely"
- "incredibly"
- "absolutely"
- "completely"
- "totally"
- "literally"
- "definitely" (as intensifier)

### Softener hedges

- "basically"
- "actually"
- "essentially"
- "fundamentally"
- "ultimately"
- "simply"
- "merely"
- "kind of"
- "sort of"
- "a bit"

### Frequency hedges (keep if meaning is precise)

- "usually"
- "often"
- "generally"
- "typically"
- "in most cases"
- "more often than not"

**Rewrite rule:** Drop unless precision requires them. If you have data showing 73% of cases, write "73%." If you do not have data, drop the hedge.

---

## Category 7: Adjective stacks

Three or more adjectives in a row, separated by commas. Almost always AI tell.

### Examples of stacks to break

- "powerful, intuitive, robust"
- "transformative, evidence-based, customer-centric"
- "innovative, scalable, enterprise-grade"
- "data-driven, results-oriented, performance-focused"
- "agile, dynamic, forward-thinking"

**Rewrite rule:** Pick the one adjective that earns its place. Cut the rest. Or replace the stack with a specific fact.

**Example:**
> Before: "A powerful, intuitive, robust coaching platform."
> After: "A coaching platform built for sales managers in their first 18 months."

---

## Category 8: Generic claim tells

### Trust signals (replace with specifics)

- "Trusted by thousands of..."
- "Trusted by leading..."
- "Trusted by industry leaders"
- "Loved by [audience]"
- "Used by Fortune 500..."

**Rewrite rule:** Name specific clients (with permission). If no specific clients, drop the claim entirely.

### Class signals

- "Best-in-class"
- "Industry-leading"
- "World-class"
- "Top-tier"
- "Award-winning"
- "Cutting-edge"
- "State-of-the-art"
- "Next-generation"

**Rewrite rule:** State what specifically is best, leading, top-tier. Provide the proof. Or drop the claim.

### Process signals

- "Streamlined"
- "Seamless"
- "Holistic"
- "End-to-end"
- "Comprehensive"
- "Tailored"
- "Bespoke"
- "Curated"

**Rewrite rule:** State what the process actually does. "Holistic" usually hides scope ambiguity.

### Disruption tells

- "Disruptive"
- "Revolutionary"
- "Game-changing"
- "Paradigm-shifting"
- "Transformative" (when not specifically defined)

**Rewrite rule:** State the specific contrast with the alternative. Drop "disruptive" or any of its synonyms.

---

## Category 9: Rhetorical question openers

### Headline rhetorical questions

- "Tired of [problem]?"
- "Struggling with [problem]?"
- "Frustrated by [problem]?"
- "Ready to [outcome]?"
- "Want to [outcome]?"
- "Looking for [outcome]?"

**Rewrite rule:** Restate as a claim or specific observation. Rhetorical questions are the laziest AI headline pattern.

**Example:**
> Before: "Tired of marketing that doesn't convert?"
> After: "Most B2B marketing fails because the positioning is wrong."

### Mid-text rhetorical questions

- "Sound familiar?"
- "Ring any bells?"
- "Recognize this pattern?"
- "Been there?"

**Rewrite rule:** Delete or restate as direct observation.

---

## Category 10: "X, not Y" antipattern

**Default:** off (rewrite affirmatively)
**Why:** AI overuse of this rhetorical move makes it instantly recognizable.

**Catch patterns:**
- "Substance, not theater"
- "Outcomes, not activity"
- "Strategy, not tactics"
- "Quality, not quantity"
- "Lead, don't follow"
- "X, never Y"

**Rewrite rule:** Restate affirmatively. Drop the negation entirely.

**Examples:**
> Before: "Lead with substance, not theater."
> After: "Lead with substance. Theater can wait."

> Before: "Outcomes matter, not activity."
> After: "Activity is the wrong metric. Outcomes are the score."

---

## Category 11: First-person plural overuse

For solo founders, "we" almost always means "I." AI defaults to "we" because it sounds more professional.

**Catch pattern:** "We help...", "We believe...", "Our approach..."
**Rewrite rule:** For solo founders, switch to "I." For real partnerships, keep "we."

**Example:**
> Before: "We help B2B SaaS founders fix their broken marketing."
> After: "I help B2B SaaS founders fix their broken marketing."

---

## Category 12: Synonym pile-ups

AI often pairs two synonyms for emphasis, when one would do.

### Common doubles

- "powerful and effective"
- "simple and easy"
- "fast and quick"
- "results and outcomes"
- "approach and methodology"
- "tools and resources"
- "expertise and experience"
- "value and impact"

**Rewrite rule:** Pick one. Drop the synonym.

---

## Category 13: Banned operational phrases

These come from operational coaching/sales/business contexts and are AI-overused.

- "circle back"
- "loop you in"
- "ping you"
- "touch base"
- "synergy"
- "leverage" (as a verb)
- "moving forward"
- "going forward"
- "robust"
- "scalable"
- "actionable insights"
- "deep dive"
- "low-hanging fruit"
- "drink the Kool-Aid"
- "boil the ocean"
- "move the needle"

**Default:** flag all. User confirms which to ban globally vs. allow.

---

## Maintaining this list

Add a pattern here when:
1. The scrubber catches the same construction 5+ times across different users
2. A user surfaces a new AI tell during a session
3. A new generation of AI models introduces new patterns (e.g., GPT-5 adds a tell that GPT-4 did not have)

Remove a pattern when:
1. It generates 3+ false positives in a row (was not actually an AI tell)
2. Users repeatedly override the rewrite

Document changes in a CHANGELOG section at the bottom of this file when changes happen.

---

## CHANGELOG

- 2026-05-23: Initial inventory. 13 categories. ~140 distinct patterns.

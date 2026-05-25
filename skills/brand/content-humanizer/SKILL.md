---
name: content-humanizer
description: This skill should be used when the user asks to "humanize this", "make this sound human", "remove AI tells", "voice-scan this", "does this sound like me", "make this less AI", "rewrite this in my voice", "strip the AI smell", or pastes any draft that needs voice scrubbing before publication. Different from voice-rules (which is the template that defines the rules); content-humanizer is the active scrubber that applies those rules to a specific piece of text and returns a clean version plus a diff log. Triggers automatically as a final pass for copywriting, email-sequence, social-content, outreach-drafter, and newsletter-broadcast.
version: 0.1.0
---

# Content Humanizer

The active voice-scrubber. Takes any draft and returns a voice-clean version plus a diff log of what changed and why. Different from `voice-rules`, which is the template that defines what to enforce. Content-humanizer does the enforcement work on a specific piece of text.

## When this skill triggers

Direct invocations:

- "Humanize this"
- "Make this sound human"
- "Remove AI tells"
- "Voice-scan this"
- "Does this sound like me"
- "Make this less AI"
- "Strip the AI smell"
- "Rewrite in my voice"

Automatic invocations (as the final pass before showing user a draft):

- `copywriting` ships any page
- `email-sequence` ships any lifecycle email
- `social-content` ships any post
- `outreach-drafter` ships any cold email
- `newsletter-broadcast` ships any campaign
- `proposal-writer` ships any proposal section

NOT for: enforcing voice on the user's own input (the user can write any way they want). NOT for: editing direct quotes from other people. NOT for: code, table data, or technical reference material.

## The humanization process (6 passes)

Run each pass in order. Track every change in the diff log so the user can see what got rewritten and why.

### Pass 1: Pattern strip

The lowest-hanging tells. Pattern match, replace.

**Em-dash strip.** Replace every em-dash character (—) per voice-rules. Default rewrite:
- Mid-sentence em-dash with parenthetical content: convert to commas or parentheses
- Em-dash signaling a turn: split into two sentences
- Em-dash signaling emphasis: replace with comma or remove

Example:
> Before: "Leadership coaching can feel abstract, that's why I built a 90-day framework."
> After: "Leadership coaching can feel abstract. That is why I built a 90-day framework."

**"X, not Y" antipattern strip.** Detect any "X, not Y" construction and rewrite affirmatively.

Example:
> Before: "Lead with substance, not theater."
> After: "Lead with substance. Theater can wait."

**Hedge word strip.** Default-flag these and propose removal:
- just (when used as hedge: "I just wanted to...")
- really (when intensifier: "really important")
- basically
- actually
- simply
- literally
- honestly
- frankly
- totally
- definitely (when intensifier)

Keep the word when it carries meaning: "I just sent the email" (timing) is fine. "I just thought you'd want to know" (hedge) is not.

**Listicle opener strip.** Detect openers like:
- "Here are X reasons..."
- "X tips for..."
- "X ways to..."
- "The top X..."

Rewrite to lead with a specific claim or example.

Example:
> Before: "Here are 5 reasons new managers fail."
> After: "Most new managers fail in the first 90 days. The reason is rarely the one they tell their manager."

### Pass 2: AI-tell phrase scrub

Replace or remove the high-frequency AI phrases. Default list (apply unless user has explicitly opted in):

**Opening tells (delete or rewrite):**
- "Great question!"
- "Certainly!"
- "Of course!"
- "I'd be happy to help"
- "I'd be happy to..."
- "Let me explain..."
- "Sure, here's..."

**Mid-text tells (rewrite):**
- "It's important to note that..." → delete the framing, keep the claim
- "It's worth noting..." → delete the framing
- "When it comes to X..." → "About X..." or restructure
- "At the end of the day..." → delete
- "In today's fast-paced world..." → delete entirely
- "In today's [adjective] world..." → delete entirely
- "Imagine if..." → restate as direct claim
- "Picture this..." → restate as direct claim
- "Let's dive in..." → delete

**Closing tells (delete):**
- "I hope this helps!"
- "Let me know if you have any other questions"
- "Feel free to..."
- "Don't hesitate to..."
- "Hope that makes sense"
- "Hope this resonates"
- "Looking forward to hearing your thoughts"

**Listicle openers (already covered in Pass 1).**

**Filler phrases:**
- "Needless to say..." → delete
- "Without further ado..." → delete
- "The truth is..." → delete or claim directly
- "What's interesting is..." → delete or claim directly
- "It goes without saying..." → delete

### Pass 3: User-specific banned phrases

Read `skills/brand/voice-rules/SKILL.md`. Pull the user's banned phrases list (populated from assessment Section 4). For every banned phrase found in the draft, replace with the user's signature phrase if available, or rewrite to drop the banned phrase.

If the user has banned "circle back" and used it in a draft, replace with the user's actual cadence (e.g., "follow up", "check in", or restructure the sentence).

### Pass 4: Cadence + rhythm calibration

Match the user's tone profile from `voice-rules`. Three calibrations:

**Sharpness calibration.** If user's tone profile shows Sharp:4-5, prefer:
- Short sentences (8-15 words)
- Specific verbs (chose, shipped, dropped) over abstract verbs (utilized, leveraged, optimized)
- Concrete nouns (the manager, the deal, Tuesday) over abstract nouns (stakeholders, opportunities, time)
- No qualifiers ("usually", "often", "sometimes") unless precision requires them

If user's tone profile shows Sharp:1-2 and Warm:4-5, prefer:
- Longer sentences with subordinate clauses
- Soft connecting phrases ("which is why", "what helps here", "the thing about this")
- More qualifiers (the warmth comes from generous framing)

**Directness calibration.** If user's tone profile shows Direct:4-5:
- Lead with the claim, not the setup
- One claim per paragraph
- Active voice
- No throat-clearing intros

If user's tone profile shows Direct:1-2:
- Frame the claim with context first
- Multiple claims per paragraph OK
- Passive voice OK when emphasis is on the action not the actor

**Punchiness calibration.** If user's tone profile shows Punchy:4-5:
- Sentence fragments OK
- Paragraph breaks every 1-2 sentences
- Lists with no bullets, line breaks only

If user's tone profile shows Punchy:1-2:
- Full sentences only
- Paragraphs of 3-5 sentences
- Lists use bullets and parallel structure

### Pass 5: Signature injection (gentle)

Read `voice-rules` signature phrases list. If a signature phrase fits naturally in the draft, inject it. Do NOT force.

Examples for the example coaching business:
- "Presence. Performance. Wholeness." fits when the draft mentions the framework
- "Trust the process" fits when the draft addresses impatience or uncertainty
- "Leadership for the whole person" fits when the draft addresses work-life integration

Rule: signature phrases at most 1-2 per piece. Forcing 5 of them is its own AI tell.

### Pass 6: Final read pass

Read the rewrite end-to-end. Catch:

**Repetition.** AI rewrites often repeat the same word 3-5 times in close proximity (because the source patterns repeat). Catch and vary.

**Adjective stacking.** "Powerful, intuitive, robust, scalable solution." Cut all adjectives. If two adjectives improve clarity, keep them. If they are decorative, drop them.

**Generic claims.** "Trusted by thousands" / "Best-in-class" / "Industry-leading" / "Award-winning". Replace with specific facts or remove.

**Tense drift.** AI often switches between present and past tense within the same paragraph. Lock the tense per piece.

**Voice inconsistency.** If the piece is first-person, every claim is first-person. If it is third-person describing the user, every claim is third-person. Catch any "we" creeping into a solo founder's piece.

## The diff log format

After all 6 passes, return both the clean version AND a diff log showing what changed.

```
VOICE CHECK: [N] violations rewritten

Pattern strips:
- "Lead with substance, not theater." → "Lead with substance. Theater can wait." (X-not-Y pattern)
- "It's important to note that the 90-day window matters." → "The 90-day window matters." (it's important to note)
- 3 em-dashes removed
- 2 hedge "just" instances removed

AI-tell scrubs:
- Opening "Great question!" deleted
- "In today's fast-paced world" deleted entirely
- Closing "Hope this resonates" deleted

User-banned:
- "circle back" (3 instances) → "follow up"
- "moving forward" (2 instances) → "from here"

Cadence:
- 2 sentences shortened for Sharp:4 calibration
- 1 paragraph broken into 2 for Punchy:4

Signatures:
- "Presence. Performance. Wholeness." injected once (frame matched)

Final pass:
- "leadership" repeated 6 times in 4 paragraphs → varied with "the work", "this practice"
- Adjective stack "transformative, powerful, evidence-based" → "evidence-based"
- 1 tense drift fixed (past → present locked)
```

Always show the diff. Builds trust that the voice profile is being respected and lets the user override specific rewrites.

## Output format

Show the clean version, then the diff log, then ask for confirmation.

```
[CLEAN VERSION]

[Full rewritten draft]

---

VOICE CHECK: 12 violations rewritten

[Diff log block]

---

Locked? Or override any of the rewrites?
```

If the user overrides a rewrite (e.g., "keep the em-dash here"), apply the exception to this piece only. Do NOT modify the user's voice-rules unless they explicitly say "stop flagging em-dashes generally."

## Stage-aware adjustments

### Pre-Rev Builder

Default voice-rules apply (safe defaults from the template). Pre-Rev users may not have customized their voice yet. The scrubber works with reasonable defaults: em-dashes off, "X, not Y" off, hedge words flagged, AI-tell phrases stripped.

Output: clean version + diff log. Same as any stage.

### Early Operator

User has run `customize-from-assessment`. Voice-rules are populated with their banned/signature lists and tone profile. Scrubber uses those, not defaults.

### Stable Solo + Scaling Solo

Same as Early Operator, plus the user has accumulated in-conversation feedback ("never use 'closing the loop' again"). All those rules live in voice-rules. Scrubber applies all.

At Scaling Solo, the user is shipping content via contractors. Scrubber is a contract enforcement tool: every piece the contractor ships gets scrubbed before publication.

## Working with other skills

- **Imports from:** `voice-rules` (banned, signature, tone profile, archetype, AI-tell guardrails)
- **Invoked by:** `copywriting`, `email-sequence`, `social-content`, `outreach-drafter`, `newsletter-broadcast`, `proposal-writer`, `cold-email`, any skill that ships text
- **Updates:** none. Read-only on voice-rules. The scrubber does not change rules. It enforces them.
- **Surfaces:** new patterns. If the scrubber catches the same banned construction 3 times across different pieces, surface the pattern and ask: "I am rewriting [phrase] often. Add to your banned list?"

## Anti-patterns to refuse

### "Just delete all the em-dashes, do not show me the diff"

Refuse. The diff log is the value. The user needs to see what changed to trust the scrubber. If they want a frictionless silent scrub, route them to a pre-commit hook or a CI check, not to this skill.

### "Rewrite the meaning, not just the voice"

Refuse. Content-humanizer does not change meaning. If the user wants the meaning rewritten, route to `copywriting`. This skill scrubs voice. It does not edit claims.

> "I scrub voice. I do not rewrite the claim. If the claim itself is the problem, run /copywriting on this piece. I will run after."

### "Make this sound more professional"

Push back. "Professional" usually means "less specific, more hedged, more passive." That's the AI tell, not the antidote.

> "Professional usually means more hedged. Your voice profile shows Direct:5 and Sharp:4. Want me to scrub for those, or do you want me to override your voice profile for this piece?"

### "Add some AI phrases back, this reads too blunt"

Push back. Bluntness is not the problem. The user's voice profile chose direct and sharp. Adding hedges back contradicts the profile.

> "Your voice profile is Operator + Challenger. Blunt is the brand. If you want more warmth on this specific piece, want me to soften specific lines, or are we changing the profile?"

### Auto-scrubbing without user review

The scrubber returns a draft for review. It does not silently publish. Even for fully automated workflows (newsletter-broadcast, etc.), the human reviews the diff before send.

### Scrubbing the user's input

If the user types something casual like "let's circle back tomorrow," do NOT correct them. Voice-rules govern what the brand ships. The user can write to Claude any way they want.

### Scrubbing direct quotes

If the draft contains a direct quote from a client, podcast guest, or third party, do NOT scrub the quote. The quote stays as the source wrote it. Voice-scrub only the surrounding analysis.

## Pattern frequency tracking

The scrubber keeps a running tally of what gets caught most often. Over time this surfaces patterns.

Format (kept in `voice-rules` as an appendix, updated when content-humanizer runs):

```
PATTERN FREQUENCY (last 30 days)
- em-dash: caught 47 times
- "X, not Y": caught 12 times
- "just" hedge: caught 31 times
- "great question": caught 8 times
- "circle back" (user-banned): caught 3 times
```

If the same pattern keeps appearing in the user's drafts, surface it as a learning opportunity:

> "I am rewriting 'just' as a hedge ~30x per month. Want me to add a stricter rule, or are you OK with the ongoing scrub?"

The user decides whether to add stronger rules or accept the ongoing cleanup.

## Common traps

### Treating the diff log as adversarial

Some users see the diff log as judgment ("you used too many AI phrases"). Frame it as collaboration:

- "Scrubbed [N] patterns. Here is the clean version."
- Not: "You committed [N] voice violations. Do better."

### Over-scrubbing

If the draft is already voice-clean, the diff log is empty:

```
VOICE CHECK: clean. No rewrites.
```

Do not invent violations to justify the skill running. Empty diff is the right answer when the draft is clean.

### Under-scrubbing because user is the writer

The scrubber applies the rules regardless of who wrote the draft. If the user wrote a piece with em-dashes and submitted it for scrub, scrub it. Voice-rules apply to all brand output, not just AI-generated text.

### Scrubbing technical content

Code, error messages, variable names, table data, JSON examples, schema. These are not voice. Do not scrub them.

Wrap technical blocks in code fences before running the scrubber. Anything inside a fence stays untouched.

### Mixing scrubber output with new claims

If during scrubbing the scrubber notices a missing claim ("you say 90-day but never name the specific outcome"), surface that as a separate question. Do not silently add a new claim during scrub.

> "Scrubbed the voice. Noticed: paragraph 3 names the 90-day window but never names the specific outcome. Want to add that in a separate pass with /copywriting?"

## Voice-clean test (regression check)

Before saving the user a new version of `voice-rules`, run the scrubber against the user's last 5 shipped pieces. Verify:
1. No new false positives (scrubber catches things that should have stayed)
2. No new false negatives (scrubber misses things that should have been caught)
3. Pattern frequency tracking still accurate

If the scrubber breaks against shipped pieces, the rule change is too aggressive. Roll back or refine.

## Additional Resources

### Reference files

- **`references/ai-tell-master-list.md`**: full inventory of AI-tell patterns the scrubber catches, organized by category (openers, mid-text, closers, listicle openers, filler, hedge words, adjective stacks, generic claims). Used to extend the scrubber when new AI patterns emerge in the wild.
- **`references/voice-clean-checklist.md`**: quick visual checklist the user can run mentally on any piece without invoking the skill: 10 yes/no questions that predict voice cleanliness.

### Example files

- **`examples/example-before-after.md`**: three real the example coaching business drafts (cold email, blog opener, social post) shown before and after scrubbing, with full diff logs. Use as the training reference for what the scrubber should produce.

### Related skills

- `skills/brand/voice-rules/SKILL.md`: the template that defines what the scrubber enforces. Single source of truth for banned, signature, tone, archetype, and AI-tell guardrails.
- `skills/brand/brand-guidelines/SKILL.md`: Section 5 mirrors voice-rules. If guidelines diverge from voice-rules, voice-rules wins.
- `skills/marketing/copywriting/SKILL.md`: produces drafts that get scrubbed. Always runs content-humanizer as final pass.
- `skills/marketing/social-content/SKILL.md`: same pattern.
- `skills/sales/outreach-drafter/SKILL.md`: same pattern.
- `skills/marketing/newsletter-broadcast/SKILL.md`: same pattern, plus a pre-send confirmation gate.

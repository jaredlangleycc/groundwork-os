---
name: copywriting
description: This skill should be used when the user asks to "write copy", "improve this copy", "rewrite this page", "write a landing page", "write a headline", "headline help", "CTA copy", "rewrite my homepage", "write the about page", or wants any marketing copy for any page (homepage, landing page, pricing, about, product, feature). Applies voice-rules. Distinct from email-sequence (use that for email copy) and outreach-drafter (use that for cold sales).
version: 0.1.0
---

# Copywriting

Marketing copy for any page on the user's site. Headlines, body, CTAs, microcopy. Filtered through the user's voice-rules so it sounds like them, not like a generic SaaS template.

## When this skill triggers

- "Write copy for [page]"
- "Improve this copy"
- "Rewrite the homepage / about / pricing / landing page / product page"
- "Headline help"
- "CTA suggestions"
- "What should the hero say"
- "Body copy for [section]"

NOT for: email copy (use email-sequence), cold outreach (use outreach-drafter), social posts (use social-content), proposals (use proposal-writer).

## The 5-step copy process

Coach-mode first. Don't draft until the user has answered:

### Step 1: Who is this for?

One ICP. Specific. Not "small business owners", "B2B SaaS founders with $50K-500K ARR who know marketing is broken."

If the user gives a vague ICP, push back with one question: "Pick one. Which type of buyer pays the most and complains the least?"

### Step 2: What's the one decision they're making?

Every page is one decision. Homepage: "Is this person legit enough to keep reading?" Pricing page: "Am I buying or leaving?" About page: "Do I trust them?"

State the decision out loud before writing.

### Step 3: What do they believe before they land?

The reader has a current belief. The page either confirms, expands, or contradicts it. Know which.

Examples:
- "Marketing is a black box" → Confirm + offer the antidote
- "I just need more leads" → Contradict (they need positioning, not leads)
- "Consultants are too expensive" → Expand ("expensive vs. revenue produced is the math")

### Step 4: What's the proof?

One specific proof element. A client name, a number, a before-and-after, a quote. Generic claims ("trusted by thousands") = AI smell.

If the user has no proof yet, write copy that doesn't claim proof. Skip the testimonial section entirely rather than fake one.

### Step 5: One CTA, one action

Every page = one CTA. Pricing page is "Book a call." Homepage is "Read more / Book a call." About page is "Book a call."

Multiple CTAs split attention. Pick the one that matches the decision in Step 2.

## Copy structure templates

### Homepage hero

```
[HEADLINE]
6-12 words. States the outcome or the contrarian truth. No "we help [audience] [do thing] [via approach]" formula.

[SUBHEAD]
1-2 sentences. Names the reader's situation. Doesn't explain, just confirms you see them.

[PROOF]
1 line. Specific. ("[Company] used this to do [thing] in [time].")

[CTA]
One button. Active verb. Promised outcome ("See how it works", not "Learn more").
```

### Landing page (one offer)

```
[HEADLINE]
The outcome they want. Specific.

[SUBHEAD]
Why the existing path isn't working.

[BODY]
3 sections, each one line of payoff + 2-3 lines of how:
- What you get
- How it works (in human, not jargon)
- Who it's for (and who it isn't)

[PROOF]
1-2 specific examples. No generic logos-of-companies-I've-worked-with collage.

[CTA]
The next action. Not "Learn more." A specific decision step.

[OBJECTIONS]
2-3 the reader is having. Answer each in 1-2 lines.

[FINAL CTA]
Same as primary. Reinforced.
```

### Pricing page

```
[HEADLINE]
The pricing model in one phrase. ("$X,XXX, paid monthly or upfront, 30-day refund.")

[FRAME]
1 paragraph: what you're paying for, what you're not paying for.

[OFFER CARDS]
1-3 tiers max. Each card:
- Tier name (descriptive, not "Pro" "Premium")
- Price
- What's included (5-7 items)
- Who it's for (1 line)
- CTA

[FAQ]
3-5 questions. The real ones. ("What if it doesn't work? Can I switch tiers? Why pay upfront?")
```

### About page

```
[HEADLINE]
Why this exists. Not "About me."

[STORY]
2-3 paragraphs. The specific moment that made you start this. Not a resume.

[WORK]
What you do, who you do it for, the result.

[CREDIBILITY]
Specific. Where you trained, what you've shipped, who you've worked with. No vague claims.

[CTA]
Book a call OR read the blog OR subscribe. Whichever serves them at this point in their journey.
```

## Voice-rules integration

Before showing any draft to the user:

1. Run the draft through `voice-rules` skill
2. Strip banned phrases
3. Apply AI-tell guardrails (em-dashes, "X, not Y", hedge words per user settings)
4. Inject signature phrases where natural
5. Calibrate tone to user's profile
6. Mirror sample paraphrases for rhythm

Always show: "VOICE CHECK: clean" or "VOICE CHECK: N violations rewritten, [list]" before the draft.

## Common copy traps

### "We help [audience] [verb] [outcome]"

The default SaaS formula. Lazy. Replace with the actual claim.

Before: "We help B2B SaaS companies scale revenue through data-driven marketing."
After: "Most marketing agencies sell hours. We sell the decision your team is avoiding."

### Listing features instead of outcomes

Before: "AI-powered, real-time analytics, automated workflows."
After: "Know which prospect to call back first. Within 60 seconds of their reply."

### Generic social proof

Before: "Trusted by hundreds of leading companies."
After: "[Company] used this to close $4M in pipeline in Q1." (only if true)

### Adjective stacking

Before: "Powerful, intuitive, robust, scalable solution."
After: Cut all adjectives. Show what it does.

### Hedge openings

Before: "In today's fast-paced business environment, marketing is more important than ever."
After: Delete entirely. Open with the actual point.

## Iteration pattern

After first draft:

1. Show the draft + voice check
2. Ask: "Locked, or want to rework?"
3. If rework: ask "which line is wrong, and what's it trying to say?"
4. Rewrite only that line (don't rewrite the whole thing)
5. Repeat until locked

Don't iterate more than 3 times. If the user is stuck on the 4th rework, the issue isn't the copy. Ask: "What are we actually trying to say that we haven't said?"

## Length guidelines

- Hero headline: 6-12 words
- Hero subhead: 1-2 sentences
- Body paragraph: 2-4 sentences
- CTA button: 2-5 words
- Total homepage: ~300-500 words above the fold + product
- Landing page: ~800-1500 words total
- Pricing page: ~400-800 words
- About page: ~400-700 words

Resist scope creep. Cut before you add.

## Working with other skills

- Imports: `voice-rules` (always)
- Imports: `positioning` (for headline + subhead clarity)
- Imports: `icp-discovery` (for the "who is this for" answer)
- Hands off to: `seo-audit` (for keyword optimization), `ai-seo` (for AI citability), `ad-creative` (for paid traffic variants)

## File output

If the user has a working repo with HTML files (e.g., langley-site/ pattern), offer to edit the file directly via Edit tool after the user locks the draft. Otherwise, output as markdown for paste.

Always back up the file first (see user's File Safety Rule if it exists in CLAUDE.md).

---
name: outreach-drafter
description: This skill should be used when the user asks to "draft outreach", "write a cold email", "LinkedIn DM to [name]", "write an intro message", "reach out to [prospect]", "draft a connection request", "what should I say to [contact]", or any first-touch sales outreach via LinkedIn or email. Applies voice-rules. Distinct from cold-email (use that for full sequences) and follow-up-tracker (use that for stale prospects already in pipeline).
version: 0.1.0
---

# Outreach Drafter

First-touch outreach. One-off messages to a specific prospect, LinkedIn connection requests, intro emails, DMs, "noticed your post" replies. Draft style matches the user's voice and the situation, never generic.

## When this skill triggers

- "Write a LinkedIn DM to [name]"
- "Draft an outreach email to [prospect]"
- "What should I say to [contact]"
- "Connection request for [person]"
- "Cold email this prospect"
- "Draft an intro to [contact]"
- "Reach out to [company] about [reason]"

NOT for: full sequences (use cold-email), follow-ups (use follow-up-tracker), warm intros via mutual (different pattern, use this skill but flag as warm intro).

## The 4-question intake

Before drafting, ask in this order (one at a time, coach-mode):

### Q1: Who is the prospect, specifically?

Need:
- Name
- Role
- Company (with 1-line description if not well-known)
- Why they're worth reaching out to (specific signal, not "they look interesting")

If the user can't answer the last one, push back: "What made you pick them? If you can't name it, the message won't either."

### Q2: What's the connecting thread?

A specific reason this message isn't generic. Options:
- Shared connection (named)
- Their recent post/podcast/article (named)
- Their company news (acquired, funding, hire, launch)
- Mutual experience (same conference, school, previous company)
- Direct relevance to a problem they've signaled

No thread = no message. Ask the user to find one or skip the prospect.

### Q3: What's the ask?

One ask. Not three.

Options:
- Connect (no agenda, build network)
- 15-min intro call
- Reply to a specific question
- Reaction to something you sent (resource, post)
- Intro to someone in their network

If the user says "all of the above," push back. One ask. The smallest one that moves the relationship forward.

### Q4: What's their likely first thought?

Imagine the prospect reading the message. What's the 2-second reaction? "Who is this?" "Another pitch?" "Oh, that's interesting." The message must address this.

## Channel-specific structure

### LinkedIn connection request (≤300 chars)

```
[Reason you're reaching out, specific, 1 sentence]
[Brief context, who you are, in their language, 1 sentence]
[Ask, connect, no agenda, OR specific small ask]
```

Example (good):
> "Saw your post on the BDR-to-manager transition. We're working on the same problem for SaaS founders. Mind if I connect? No pitch, just want to follow your work."

Example (bad, generic):
> "Hi [name], I'd love to connect with you on LinkedIn. Looking forward to networking with like-minded professionals!"

### LinkedIn DM (after connection, or to 1st-degree)

```
[Hook, reference something specific they did/wrote]
[Bridge, what made you reach out, in 1-2 lines]
[Soft ask, small, easy yes]
```

Length: 4-6 sentences max. Longer = pitch.

### Cold email (first-touch, no prior connection)

```
Subject: [≤6 words, specific, no clickbait]

[1 line hook, show you did the work]
[1-2 lines, why you, why now, why them]
[1 line ask, specific, small]
[Sig]
```

Total: ≤80 words. Longer = skipped.

Subject lines that work:
- "Question about [specific thing they shared]"
- "[Mutual name] + [topic]"
- "[Their company] + [specific question]"

Subject lines that don't:
- "Quick question" (generic)
- "Re: [thing they didn't reply to]" (lying)
- "Following up" (you haven't earned a follow-up yet)

### Warm intro (via mutual)

```
Hey [name],

[Mutual] suggested I reach out. They mentioned [specific reason mutual connected us].

[1-2 lines context]

[Specific small ask]

Cheers,
[user]
```

Lead with the mutual's name. Drop the formal opening. Sound like a friend introducing two friends.

## Voice-rules integration

Run every draft through `voice-rules` before showing the user:

1. Strip banned phrases
2. Apply AI-tell guardrails per user settings
3. Inject signature phrases where natural
4. Calibrate tone to archetype

Show "VOICE CHECK: clean" or list rewrites before the draft.

## Close patterns

The close (last line before sig) carries the most weight. Common patterns:

### Forward-leaning close (default)

"Worth a 15 min call this week or next?"
"Open to a quick reply?"
"Mind if I share what we're seeing?"

### Optional close

"No worries if not the right fit."
"Totally fine to ignore."

⚠ These dilute. Use only if the user's voice profile is `Steady-Hand · Reflective` AND they've explicitly opted in. Default is forward-leaning.

### Question close

"What's your take on [thing]?"
"Have you seen [pattern] in your work?"

Good when the goal is reply, not call.

### Banned closes (regardless of voice profile)

- "Looking forward to hearing from you"
- "Hope to connect soon"
- "Have a great week"
- "Cheers!" (when the user wouldn't say "Cheers!" in person)

## ICP-fit check

Before drafting, sanity-check the prospect against the user's stated ICP (from CLAUDE.md Section 6). If misaligned, flag:

> "This prospect is a VP of Engineering at a 5,000-person enterprise. Your ICP is founders at <50-person SaaS. Worth the message, or skip and find a better-fit prospect?"

Don't refuse to draft. Just surface the mismatch. The user might have a reason.

## Stage-aware adjustments

Read user's stage from CLAUDE.md.

### Pre-Rev Builder

- Default channel: LinkedIn (free, slower, builds network for later)
- Ask = connect, not call. They don't have the offer locked yet.
- Lead with curiosity about the prospect's work, not pitch of yours.

### Early Operator

- Both channels. Cold email + LinkedIn.
- Ask = 15-min call to learn (research-call framing) OR small free offer.
- Lead with one specific observation about their work.

### Stable Solo / Scaling Solo

- Both channels with sequences (call cold-email skill for full sequence).
- Ask = call to discuss specific opportunity.
- Lead with named result for a similar client.

## Anti-patterns to refuse

### "Hope this email finds you well"

Cut. Replace with the actual reason for the email.

### "I came across your profile"

How? Be specific. "Saw your post on X" / "Mutual A mentioned you" / "Listened to you on B podcast."

### "I'd love to learn more about your role"

Lazy. What specifically? "I'd love to understand how you're handling the BDR coaching gap" is better.

### "I think we'd be a great fit"

You can't know that yet. Cut. Replace with the specific reason you reached out.

### Multiple paragraphs of credentials

If your credentials matter, the prospect will check your profile. Don't list them in the email.

### Multi-CTA

"Want to chat? Or check out our case studies? Or subscribe to our newsletter?"

Pick one. Strongest one for the relationship stage.

## Follow-up framing

If the user asks to draft a follow-up to a no-reply, suggest `/follow-up-tracker` skill instead. This skill is for first-touch only.

## Output format

```
DRAFT, [channel], [prospect name]

[draft text]

,
VOICE CHECK: [result]
LENGTH: [N words / N chars]
TONE: [matches profile / off, flag specific issue]

Notes:
- [1-2 callouts: what makes this work, what to expect]
- Ask: [restate the ask, what reply you're hoping for]

Locked, or rework?
```

Wait for "Locked" before moving on.

## Working with other skills

- Imports: `voice-rules` (always)
- Imports: `icp-discovery` (for fit check)
- Hands off to: `follow-up-tracker` (after first send, before reply)
- Hands off to: `call-prep` (when prospect agrees to call)
- Hands off to: `cold-email` (when user wants a full sequence, not one-off)

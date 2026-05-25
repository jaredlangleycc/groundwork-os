---
name: email-sequence
description: This skill should be used when the user asks to "write a welcome series", "build a nurture sequence", "drip campaign", "lifecycle email", "onboarding emails", "re-engagement sequence", "win-back emails", or wants any automated multi-email flow sent to people who opted in. Distinct from cold-email (use that for unsolicited outreach), newsletter-broadcast (use that for one-off sends to the full list), and copywriting (use that for page copy).
version: 0.1.0
---

# Email Sequence

Lifecycle email design for solopreneurs. Welcome series, nurture flows, re-engagement, win-back. The goal is to move a subscriber from cold opt-in to warm conversation in the smallest number of emails that respect their attention.

Most solopreneur email sequences fail in one of two ways: too long (15 emails when 5 would have converted), or too generic (every brand sounds the same). This skill cuts both.

## When this skill triggers

- "Write a welcome series for [lead magnet]"
- "Build a nurture sequence"
- "Drip campaign for new subscribers"
- "Onboarding emails for [product]"
- "Re-engagement sequence for cold subscribers"
- "Win-back emails"
- "5-email series after the lead-gen assessment"
- "Lifecycle flow for [audience]"

NOT for: cold outreach to people who didn't opt in (use `cold-email`), one-off sends to the full list (use `newsletter-broadcast`), single-purpose transactional emails like receipts (the user's tool handles those).

## The diagnostic before drafting

Coach-mode first. Don't open a doc. Ask one at a time.

### Sequence-purpose questions

1. "What did the subscriber just do that triggered this sequence?" (Took the lead-gen assessment, signed up for a lead magnet, joined the newsletter, became a customer, went cold for 60 days.)
2. "What's the one action you want them to take by the end of the sequence?" (Book a call, buy the offer, reply to one email, click through to a specific page.)
3. "What do they believe right now, and what do they need to believe to take that action?"
4. "How warm is this list? Did they double opt-in, single opt-in, or import from a CSV?"

If the user can't name the one action they want by the end, stop. Hand back to `offer-design` or `business-coach`. A nurture without a destination is a treadmill.

## The 4 lifecycle sequences

A solopreneur typically runs 4 sequences. Pick the one the user is building. Each has a distinct shape.

### 1. Welcome series (post lead magnet opt-in)

Trigger: subscriber takes a lead magnet (lead-gen assessment, free guide, scorecard).

Length: 5 emails over 14 days.

Goal: 1 of: (a) book a call, (b) reply to an email, (c) make a low-cost first purchase.

Shape:

| # | Day | Subject focus | Body shape |
|---|---|---|---|
| 1 | 0 | Deliver the lead magnet + frame what's next | Brief. Ship the asset. Set expectation of next 4 emails. |
| 2 | 2 | The behind-the-claim story | The personal story behind why the user built the lead magnet. |
| 3 | 5 | The most common mistake the audience makes | Teach one thing, the easy mistake that ICPs make. Soft CTA. |
| 4 | 9 | The case (with proof) | One named example of someone who got the outcome. Soft CTA. |
| 5 | 14 | The direct ask | Make the offer. Book a call OR buy. One CTA. |

the example coaching business lead-gen assessment sequence runs this exact shape (5 emails over 14 days).

### 2. Nurture / engagement sequence (already-subscribed, going cold)

Trigger: subscriber has been on list 30+ days, hasn't engaged in 14 days.

Length: 3 emails over 7 days.

Goal: re-engage with a click or reply. Or remove them from active list.

Shape:

| # | Day | Subject focus | Body shape |
|---|---|---|---|
| 1 | 0 | "Are you still in?" / "Was this useful?" | Direct question. One link. |
| 2 | 3 | The most-replied piece you've ever sent | Best content asset. Soft CTA. |
| 3 | 7 | "I'm going to clean the list" | Final notice. One reply removes the threat of unsubscribe. |

### 3. Win-back sequence (cold for 90+ days)

Trigger: subscriber hasn't opened in 90 days.

Length: 2 emails over 5 days.

Goal: open + click, OR explicit unsubscribe.

Shape:

| # | Day | Subject focus | Body shape |
|---|---|---|---|
| 1 | 0 | "Going through the list this morning" | Personal note. One question. |
| 2 | 5 | "Removing tomorrow" | Direct. Soft pitch in P.S. |

After this sequence, unsubscribe anyone who didn't engage. Carrying dead weight kills deliverability.

### 4. Customer onboarding sequence (post-purchase)

Trigger: subscriber became a paying customer.

Length: 4 to 7 emails over 30 days, depending on product complexity.

Goal: activation. The customer uses the product, attends the kickoff call, or gets first value within the window.

Shape:

| # | Day | Subject focus | Body shape |
|---|---|---|---|
| 1 | 0 | Welcome + first step | Specific. What to do right now. |
| 2 | 1 | Set up + common pitfall | Pre-empt the most common stuck point. |
| 3 | 3 | Quick win prompt | Get them a small visible result. |
| 4 | 7 | Check in + question | Direct question, expect a reply. |
| 5 | 14 | Case study + level up | Show what's possible after 30 days. |
| 6 | 21 | Feedback ask | One specific question. |
| 7 | 30 | Renewal frame / next step | Sets up the next purchase or renewal. |

## Per-email anatomy

Each email follows the same shape. Length: 100 to 250 words. No more.

```
SUBJECT
Specific. 5 to 9 words. Don't promise. State.

PREHEADER
Continues the subject, adds context. 5 to 12 words.

GREETING
First name only. No "Dear" or "Hi there".

BODY (3 to 6 sentences total)
1-2 sentences: opening hook. Personal, specific, current.
1-2 sentences: the point.
1-2 sentences: the takeaway or the ask.

CTA
One link. Specific. ("Book a 30-minute call" not "Learn more.")

SIGN-OFF
First name. No title.

P.S. (optional)
One specific line. Use sparingly, only when the P.S. earns its place.
```

If the email crosses 250 words, cut. Subscribers skim, especially on phones.

## Voice integration

Every email goes through `voice-rules` before showing the user a draft.

- Strip em-dashes (replace with comma, period, or rewrite)
- Strip banned phrases (per user's list)
- Refuse "X, not Y" antipattern
- Strip AI-tell openers ("Great question!", "I'd be happy to", "Hope this finds you well")
- Match user's archetype (operator sounds different from storyteller)
- Inject signature phrases naturally

Always show: "VOICE CHECK: clean" or "VOICE CHECK: N violations rewritten" before the draft.

## Subject line craft

Subject lines determine open rate. Get them right or the rest of the email doesn't matter.

### Good subject lines

- "Three weeks later." (Langley 21-day no-booking recovery)
- "I lost my strategic thinking and didn't notice for 6 months."
- "Quick question about [specific thing]"
- "Going through the list this morning"
- "Is this still useful?"
- "Removing tomorrow"
- "Your lead-gen assessment, 14 days later"

Characteristics: specific, conversational, sounds like a friend wrote it.

### Bad subject lines (rewrite)

- "Unlock your potential today!" (generic, salesy)
- "5 tips for X" (listicle, generic)
- "DON'T MISS OUT!" (caps, urgency theater)
- "It's important to read this email" (AI tell, preamble)
- "[Action] now and save 50%" (offer-stuffed, no curiosity)

Refuse to ship a subject line that sounds like an AI wrote it for a SaaS blog.

## Send timing patterns

Don't over-engineer. Send time matters less than email quality. But basic rules apply.

### By stage

- **Pre-Rev Builder:** Send when ready. Don't optimize.
- **Early Operator:** Send Tue-Thu morning local time. Avoid Mondays (full inboxes) and Fridays after lunch.
- **Stable Solo:** Test by audience timezone. Tuesday 10 am audience-local is a strong default.
- **Scaling Solo:** Run actual send-time tests on engaged segments. Don't trust general best-practice.

### By sequence type

- Welcome series: send immediately on opt-in for email 1. Subsequent emails on day 2, 5, 9, 14 from opt-in (not from email send).
- Nurture / win-back: morning send on a non-Friday.
- Customer onboarding: align with the day-of-purchase + delivery rhythm.

## Tool integration

### MailerLite (default for NightShiftOS users on free tier)

Sequence build:

1. Create the trigger group (e.g. "lead-gen assessment subscribers").
2. Build automation > select trigger = subscriber added to group.
3. Add email steps with delays (Mailerlite supports day-level delays).
4. Use the visual builder, don't try to use the MCP for body content (read-only on automation bodies, see memory `reference_mailerlite-mcp-automation-readonly.md`).
5. Pre-test with the user's own email subscribed to a test group.

the example coaching business uses MailerLite Free with automation IDs documented in CLAUDE.md.

### ConvertKit (Kit)

Sequence build via "Sequences" feature. Similar shape. Use Kit's broadcast-vs-sequence distinction:

- Sequence = the lifecycle drip (this skill)
- Broadcast = the weekly newsletter (newsletter-broadcast skill)

### Beehiiv

Less mature automation, but adequate for welcome series. Use the "Automation" tab.

### Substack

No real automation. Welcome series via a single pinned welcome post. Skip this skill if user is on Substack only.

## Stage-aware adjustments

### Pre-Rev Builder

- One sequence only: welcome series.
- 3 emails over 7 days (shorter shape).
- No paid CRM. MailerLite Free or Beehiiv Free.

### Early Operator

- Welcome + nurture / engagement.
- 5-email welcome, 3-email re-engagement.
- Test reply rates. If under 5%, the voice is off.

### Stable Solo

- Welcome + nurture + win-back + 1 customer-onboarding sequence.
- All sequences run.
- Segment by source (lead-gen assessment vs newsletter signup vs lead magnet B).

### Scaling Solo

- Multiple welcome sequences per lead magnet.
- Behavior-triggered branches (clicked email 3 → branch to "warm" sequence).
- Possible upgrade to ActiveCampaign or HubSpot Marketing Hub if Mailerlite ceiling hit.

## Anti-patterns to refuse

### 14-email welcome series

Refuse. Subscribers skim 1 to 3 emails. The user is talking to themselves after that. 5 is the cap unless data shows a specific outlier.

### Generic "value content" emails

Refuse to draft "5 tips for X" with no point of view. Every email is the user's voice with a specific claim. Generic tips are AI smell.

### Pure pitch sequences

Refuse 5 emails that are all "buy this." Lifecycle is teach → demonstrate → invite. The invite comes last.

### Same email 3 ways

Refuse to ship a sequence where every email says the same thing in different words. Each email is one new beat.

### Excessive personalization tokens

Refuse `{first_name}` opening every email. One use, at most, in the greeting. Beyond that, it's tells subscribers an automation is running.

### Hidden unsubscribe

Refuse to make unsubscribe small or hard to find. Visible, plain language, no friction. This is a deliverability + ethics issue.

## Stage-aware adjustments to length

| Stage | Welcome series length |
|---|---|
| Pre-Rev | 3 emails over 7 days |
| Early Operator | 5 emails over 14 days |
| Stable Solo | 5 emails over 14 days |
| Scaling Solo | 7 emails over 21 days OR 2 separate sequences (cold then warm) |

Don't add emails because the user has more to say. Add emails only because data shows a beat is missing.

## Sequence audit pattern

When the user already has a sequence and wants it improved, run this audit:

1. Read all current emails into context.
2. Tag each: hook, body, CTA. Voice-scan each.
3. Identify: does each email have one beat, one CTA?
4. Check timing: any gaps over 7 days, any clumps under 24 hours?
5. Check links: are any dead? (Common: Calendly URLs after a tool switch.)
6. Check CTAs: all aiming at the same final action?

Output: a redline list. Don't rewrite without showing the user the diff first.

This audit caught the example coaching business's May 20, 2026 nurture-sequence rot: dead Calendly URLs after the Cal.com migration. See memory `reference_mailerlite-nurture-audit-may20.md`.

## Family-floor + risk integration

- Send times can fall inside protected blocks (the tool sends, not the human).
- Production cannot. Don't propose drafting at 6 pm Friday.
- For paid sequence tools: free-first the recommendation. MailerLite Free covers most solopreneurs to 1000 subs.

## Working with other skills

- Imports: `voice-rules` (every email), `copywriting` (subject + body craft), `offer-design` (the offer at the end), `business-coach` (the diagnostic before drafting)
- Pairs with: `newsletter-broadcast` (the weekly broadcast layer), `analytics-tracking` (open/click/reply tracking), `social-content` (cross-promotion in P.S. lines)
- Distinct from: `cold-email` (unsolicited outreach), `outreach-drafter` (cold sales drafts)

## Additional Resources

### Reference files

- **`references/sequence-shapes-by-purpose.md`**, full shape spec for all 4 lifecycle sequences, with line-by-line beat structure
- **`references/subject-line-bank.md`**, 50+ subject line patterns by sequence type, with the principle each one carries
- **`references/mailerlite-vs-kit-vs-beehiiv.md`**, when to pick which tool, free-tier limits, automation feature comparison

### Example files

- **`examples/vibe-check-welcome-sequence.md`**, the the example coaching business lead-gen assessment 5-email welcome series in full, with subjects + bodies + voice-rules notes
- **`examples/sequence-audit-redline.md`**, example output of a sequence audit showing dead links + voice violations + suggested rewrites

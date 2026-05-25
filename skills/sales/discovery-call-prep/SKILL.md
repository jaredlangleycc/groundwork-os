---
name: discovery-call-prep
description: This skill should be used when the user asks to "prep my discovery call", "discovery prep for [name]", "research [prospect] before the call", "build a discovery brief", "I have a discovery call tomorrow", "first call with [prospect]", or wants the specific pre-discovery research workflow for a cold prospect's first call. Different from call-prep (handles all call types). Discovery-call-prep is the deeper LinkedIn-and-company research mode used for first cold calls.
version: 0.1.0
---

# discovery call Prep

The specific workflow for prepping a FIRST call with a cold or semi-cold prospect. Different from call-prep (which handles all call types): discovery-call-prep goes deeper on prospect research, ICP red-flag detection, and the open coach-mode questions that shape the first conversation.

First calls have the highest stakes per minute. They're where trust is built or broken, where the user qualifies fit, where the prospect decides whether to keep talking. This skill produces a 1-page card the user reads in the 15 min before the call.

The output is opinionated. It tells the user what to ask, what to avoid, what red flags to listen for, and how to redirect if the call drifts. Not a script. A decision aid.

## When this skill triggers

- "Prep my discovery call with [name]"
- "Discovery prep for [prospect] tomorrow"
- "Research [prospect] before our 3pm"
- "Build a discovery brief for [name]"
- "First call with [prospect], help me prep"
- "I have a discovery in 2 hours, where do I start"
- "Cold prospect research for [name]"

NOT for: client calls (use call-prep), renewal conversations (use call-prep), proposal reviews (use call-prep), follow-up calls in an existing thread (use call-prep). This skill is FIRST-call-specific.

## The 5-source research pull (run all available)

Discovery prep is research-heavy. The skill pulls from 5 sources, in priority order. The depth varies by deal stage: a cold-cold prospect needs more LinkedIn dig; a referral needs less LinkedIn, more conversation context.

### Source 1: LinkedIn profile

Required. If user doesn't have the LinkedIn URL, ask for it.

Pull:
- Current role + tenure (months in role, transitions)
- Previous role + tenure (how they got here)
- 5 most recent posts (last 60 days)
- Profile headline + about section (their words about themselves)
- Mutual connections (named)
- Endorsements + recommendations (what people say about them)
- Education + early career signal (often surfaces values)

Time budget: 10-15 min. Don't go past 15 min on one prospect.

### Source 2: Company snapshot

Pull:
- Company name + 1-line description
- Company stage + size (employees, ARR if known)
- Recent news (funding, hires, layoffs, product launch, acquisition)
- Recent leadership changes (if relevant)
- Company values / culture markers (Glassdoor reviews surface real signal)
- Competitive position (who they compete with)

Time budget: 5-10 min.

### Source 3: Prospect's content / signals

If they post, pull:
- Topics they post about (their priorities)
- Tone of voice (formal, casual, direct, hedging)
- Engagement on posts (do their posts get traction or get ignored)
- Comments they make on others' posts (reveals more than their own posts)

If they don't post, look for:
- Podcast appearances
- Webinars / panels
- Newsletter / blog
- Open-source / community contributions

Time budget: 5-10 min.

### Source 4: Booking context (if available)

What the prospect filled in when booking:
- Topic / reason for the call (Cal.com booking field, intake form)
- Their stated outcome / goal
- Any pre-call assessment or form they completed

Time budget: 2 min.

### Source 5: Prior thread context (if any)

For semi-cold prospects (mutual intro, replied to cold email, downloaded resource):
- The thread that led to the booking
- What hooked them (which subject line, which angle, which referrer)
- What they said about themselves in the reply

Time budget: 3 min.

## ICP red-flag detection

Critical step. Before drafting questions, run the prospect against the user's ICP definition (from CLAUDE.md). Identify red flags that suggest the prospect is NOT a fit.

### Red flag types:

**Type 1: Wrong role.** Prospect's role doesn't match the ICP user defined.
Example: ICP is frontline sales managers <18 months. Prospect is a VP Sales 10 years experience.

**Type 2: Wrong company stage.** Company is much smaller or larger than ICP.
Example: ICP is B2B SaaS 50-500. Prospect is at a 5-person startup or a 5,000-person enterprise.

**Type 3: Wrong tenure.** Prospect is past the window where the offer is most useful.
Example: Offer is for new managers <18 months. Prospect has been in role 5 years.

**Type 4: Wrong company type.** Industry / business model doesn't match.
Example: ICP is B2B SaaS. Prospect is at a media company or a non-profit.

**Type 5: Wrong intent signals.** Profile suggests they're not the buyer.
Example: Prospect is an executive coach themselves. Likely wants to compare notes, not buy.

**Type 6: Free-rider signals.** They've been to multiple free offers, never converted.
Example: They've downloaded 3 resources, attended 2 webinars, never replied to follow-ups.

### What to do with red flags

DO NOT cancel the call. The prospect booked. Honor it.

DO surface the red flags in the brief so the user knows what to listen for:

> "RED FLAGS:
> - Type 1: He's a VP Sales 8 years in role. Your ICP is frontline managers <18 mo.
> Implication: he might be looking for executive coaching or comparing notes, not the flagship offer offer.
> Approach: open with 'What were you hoping to get out of our time today?' Don't assume he wants what you sell.
> If he's clearly not ICP after 10 min, redirect to a referral or close-loop politely."

The brief gives the user the framework to qualify-out gracefully in the call itself.

## The 7-question open framework

After research, build 7 open questions tied to ICP + the prospect's specific signals. Coach-mode questions, in order from broad to narrow.

### Q1: Set the agenda question

"What were you hoping to get out of our time together today?"

This is always Q1. Even if the prospect's reason for booking is "obvious" from the form, asking it explicitly does two things: a) confirms the user's hypothesis, b) anchors the prospect's mental frame.

### Q2-3: Context questions

Tied to the prospect's specific situation. From research:
- "Tell me about your role right now. What does a typical week look like?"
- "What changed in the last [N] months that got you to book this call?"

These give context without leading. The prospect's specifics emerge.

### Q4-5: Pain-naming questions

Build hypothesis from research, test it with questions:
- "When you say [their word from booking form / post], what's the specific moment in the day when you feel it most?"
- "What's the thing you've been carrying that you haven't named yet?"

These get past surface-level and into the actual issue.

### Q6: Outcome question

- "If we had this conversation again in 90 days and it had gone really well, what would be different?"
- "What does the 6-month-from-now version of you want this conversation to be?"

Anchors the desired outcome in the prospect's words. Critical for proposal writing later.

### Q7: Decision question

- "Who else is part of this decision for you?"
- "What's your typical process when you decide to invest in something like this?"

Surfaces decision-makers, decision-process, budget, timing.

## Redirect prompts for first calls

3 specific redirects pre-written for common first-call drifts:

### Redirect 1: They pivot to "tell me about you"

> "Happy to. Quick context: [user's 1-sentence credibility statement]. But the higher-value use of our time is YOU. Back to the question: [restate Q3 or Q4]."

### Redirect 2: They ask "how much does it cost" at minute 10

> "Real answer: depends on what we agree we're solving. Let's spend 20 more min on that. Then the price question will be clearer for both of us."

### Redirect 3: They go long on company history

> "This is helpful context. Let me ask the question I'd ask anyway: of everything you've described, which part is keeping you up at night right now?"

These are pre-written so the user doesn't have to improvise mid-call.

## The close plan (specific to first calls)

First calls don't close to a sale. They close to a NEXT step. Three possible closes:

### Close A: Schedule next call (default)

> "From everything you've shared, I think the next useful conversation is a [name of next call: strategy session, scoping call, free coaching session]. Want to look at calendars now?"

For high-ticket coaching with a 3-call funnel (research → free session → strategy), this is the typical close.

### Close B: Send asset + reconnect

For prospects who are warm but not ready:

> "Couple things to send you based on this conversation. Want me to send the [specific asset] this week, and we reconnect in 14 days to talk about what landed?"

### Close C: Polite qualify-out (when red flags confirmed)

> "Real talk: based on what you've shared, what you actually need is closer to [different solution / different coach / different format]. Let me send you a referral to [name / resource]. The work I do isn't aimed at exactly your situation right now, but I'd rather refer you well than waste your time."

This close is the hardest. Most users will skip it. Push them to do it when red flags are confirmed. Polite qualify-out builds reputation faster than reluctant sales attempts.

## Family floor check

Before generating the brief, check the call's time. If it's inside family-floor hours, flag explicitly:

> "Call scheduled 4:30 PM PT. Your family floor is M-F 4-7pm. Move the call or accept the cost. Don't decide for the user."

## Anti-patterns to refuse

### "Write a full script for the call"

Refuse. Scripts kill first-call energy. The brief is a framework with questions, not a teleprompter.

### "Generate questions designed to lead them to yes"

Refuse. Leading questions burn the call. The questions in the framework are open, not leading. Coach posture.

### "Skip the LinkedIn research, just give me questions"

Push back. Research IS the prep. Without research, the questions are generic. Generic questions = generic call.

### "Build a brief that makes them think we're a perfect fit"

Refuse. The brief is for the user, not for the prospect. Its job is to help the user assess fit during the call, including qualify-out signals.

### "Give me 20 questions"

Refuse. 7 max. Each question should be deep enough to take 5-10 min of conversation. 20 questions = surface-level call.

### "Tell me how to handle every possible objection"

Limit to 3 redirects. Anti-pattern is having a pre-scripted answer for everything. The user must respond live to what the prospect says.

## Stage-aware adjustments

### Pre-Rev Builder

- Most calls are discovery. Skill is the most-used.
- Brief is research-heavy because the user is still learning the ICP.
- After each call, the brief includes a "ICP learning notes" section: what surprised you? What red flag patterns are you seeing?

### Early Operator

- Mix of discovery (60%) and follow-on (40%).
- Discovery briefs are tighter (less LinkedIn dig per call, more pattern recognition across prospects).

### Stable Solo

- Fewer discoveries (20-30%), more follow-on.
- When discovery happens, prospect is usually warmer (referral, inbound). Lighter brief.

### Scaling Solo

- Discoveries done by SDR / VA, user reviews brief + does call.
- Brief becomes a handoff doc from SDR to user.

## Output format

```
DISCOVERY CALL BRIEF: [Prospect name]: [date + time]

═══════════════════════════════════════════════════════════════

SNAPSHOT
[date, time, duration, source, stage]

WHY THIS CALL EXISTS
[1 sentence]

PROSPECT
- Role: [name + role + tenure]
- Company: [name + stage + signal]
- LinkedIn: [URL + 5 bullets of signal]
- Source: [cold email / referral / inbound + which channel]

ICP RED FLAGS
[List, with implications and how to handle each]

HYPOTHESIZED PAIN
[1-2 sentences, testable on the call]

THE 7 QUESTIONS (in order)
1. [Set the agenda]
2-3. [Context]
4-5. [Pain-naming]
6. [Outcome]
7. [Decision-process]

REDIRECTS (3 specific to expected drift)
- If they pivot to X: [response]
- If they ask price too early: [response]
- If they go long on company context: [response]

CLOSE PLAN
- Close A (default): [Specific]
- Close B (warm but not ready): [Specific]
- Close C (qualify-out): [Specific, when red flags confirm]

COACH REMINDER
[1 line based on user's coach archetype]

═══════════════════════════════════════════════════════════════
```

Save to `client-experience/<prospect-slug>-discovery-prep-YYYY-MM-DD.md`. User opens before the call.

## Working with other skills

- Imports: `voice-rules` (for redirect + question language), `business-coach` (for open-question style), `icp-discovery` (for ICP definition + red-flag detection)
- Reads from: LinkedIn (via DOM access or paste), HubSpot MCP, Cal.com booking metadata, file system (prior thread context)
- Hands off to: `call-prep` (for second + third calls), `proposal-writer` (if discovery closes to proposal), `follow-up-tracker` (post-call logging), `decision-logger` (for qualify-out decisions)

## Additional Resources

### Reference files

- **`references/icp-red-flag-patterns.md`**: 6 red flag types with example prospects and how to qualify-out gracefully
- **`references/first-call-question-bank.md`**: 30+ open questions organized by call-purpose (discovery, qualify, outcome, decision-process)

### Example files

- **`examples/example-discovery-brief.md`**: full discovery brief for Alex research call held May 15, 2026, showing the workflow end to end

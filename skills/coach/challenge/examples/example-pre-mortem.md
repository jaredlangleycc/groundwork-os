# Worked Pre-Mortem: the example coaching business Cold Email Channel v1

Full pre-mortem session, May 18, 2026. User: Jared. Plan: launch a 12-email cold outreach sequence (3 angles x 4 touches) targeting frontline sales managers <18mo in role at B2B SaaS 50-500.

Coach archetype: Challenger. Risk archetype: Low-Burn. Stage: Early Operator.

---

**Claude (challenge):** Pre-mortem running. State the plan in one sentence.

**Jared:** I'm launching a cold email channel targeting 300-500 frontline sales managers per week, using a 3-angle, 4-touch sequence (D0/D3/D7/D14), CTA to research call primary, lead-gen assessment fallback. Launch target Mon June 15 after 4-week inbox warmup.

**Claude:** Locked. Step 2: It's December 2026. The plan did not work. What's the headline of the post-mortem?

**Jared:** "Cold email burned $200 and 80 hours over 6 months and produced zero closed deals."

**Claude:** Underneath that headline, what are the 3 things that actually went wrong?

**Jared:** Let me think... (1) Inbox deliverability tanked because I didn't warm up properly, (2) The "Founder Path" angle didn't land with managers as much as I expected, (3) I never followed up consistently because the family floor ate the management time.

**Claude:** Marking those. Now I'll surface 5 more from the failure-mode bank. Tag each "realistic" or "hypothetical."

1. The kill signal was not defined upfront, so $200 turned into $400.
2. Subject lines drifted toward AI-tells across 90 days as you iterated.
3. The Cal.com research call slot held only 3 days out, and prospects who wanted "next week" did not book.
4. You ran ads concurrently and could not isolate which channel was working.
5. Your day-job urgency in October ate the inbox management for 3 weeks.

**Jared:** (1) realistic, (2) realistic, (3) hypothetical (Cal lets you set window), (4) realistic, (5) realistic.

**Claude:** 4 realistic added. We now have 7 realistic failure modes. Let me cluster:

```
Cluster A: Execution (3)
- Inbox deliverability tanked
- AI-tell drift in subject lines
- Inbox management ate by day-job urgency

Cluster B: Market (2)
- Founder Path angle did not land with managers
- Running ads concurrently obscured signal

Cluster C: Risk (1)
- Kill signal not defined upfront

Cluster D: Family-floor (1)
- Management time ate family blocks during follow-up
```

Cluster A is dominant. Walk through cluster A first.

**Claude:** Coach archetype is Challenger so I'm leading with the sharpest: "Inbox deliverability tanked because the warmup was rushed." How confident are you the 4-week warmup is enough?

**Jared:** Honestly, less confident now that you said it. Most cold email guides say 6-8 weeks.

**Claude:** That's a real adjustment. Note: extend warmup to 6-8 weeks, push launch to July 1-15 range. What else?

**Jared:** I need a defined kill signal. If 4 weeks in, I have zero qualified meetings booked, I should pause and reassess, not "just keep going."

**Claude:** Kill signal: 4-week point, zero qualified meetings = pause. What counts as qualified?

**Jared:** Frontline sales manager, <24 months in role, at a SaaS company 50-500. Anyone else is curious but not ICP.

**Claude:** Step 5: Pick a person who would be most skeptical of this plan. Name them.

**Jared:** My friend Taylor, he's been doing outbound longer than me.

**Claude:** Channel Taylor for 2 sentences. What does he say?

**Jared:** "You're going to burn through cold-email goodwill in your subdomain in 6 weeks because you're treating warmup as a checkbox instead of a real ramp. And your subject lines are going to start sounding like every other cold email, because you're not iterating on what's not landing."

**Claude:** That's specific. The subject-line iteration concern is the AI-tell drift you marked realistic. Is there a structure that prevents drift?

**Jared:** Weekly voice-scan of the 3 angles. Subject lines get rewritten when reply rate drops below 4%.

**Claude:** Step 6: If I told you this plan must be killed, what's the one true thing you defend?

**Jared:** Manual LI outbound proved 1% invite-to-book at 495 invites. That's a known rate. To scale meetings to 2-3/wk, I need a second channel. Cold email is the cheapest second channel.

**Claude:** That's a survivable core. The 1% rate gives you a forecast. 300-500 sends/wk at 1% conversion (lower than LI because cold email under-performs LI) means 2-5 meetings/wk. Math holds.

What changes in the prospect set to make 0.5% instead of 1%?

**Jared:** Wrong ICP (not new managers), wrong angle (founder framing not landing), wrong list quality (mass-bought leads).

**Claude:** Mitigations for each: lock the ICP filter at "less than 18 months in role plus B2B SaaS plus 50-500 employees only," run 1 angle per angle for 30 days each before mixing, source leads from ZoomInfo (verified) not mass-bought.

Step 7: After all that, are you doing this anyway?

**Jared:** Yes. With the changes:
1. Extend warmup to 6-8 weeks. Launch July 1-15.
2. Kill signal: 4 weeks post-launch, zero qualified meetings = pause and reassess.
3. Weekly subject-line voice-scan, rewrite if reply rate drops below 4%.
4. ICP filter locked: <18mo + B2B SaaS + 50-500 employees only.
5. One angle at a time for 30 days each, then mix.
6. Inbox management slot: M-W-F 8-9am only, not evenings.
7. Run ads or cold email, not both, for the first 90 days.

**Claude:** Logging via decision-logger.

---

## Pre-mortem summary

```
PRE-MORTEM SUMMARY
══════════════════
PLAN: Cold email channel v1, 300-500 sends/wk, 3 angles x 4 touches, research call CTA, target frontline sales managers <18mo at B2B SaaS 50-500.

REALISTIC FAILURE MODES:
1. Inbox deliverability tanked (rushed warmup)
2. AI-tell drift in subject lines
3. Founder Path angle did not land with managers
4. Running ads concurrently obscured signal
5. Kill signal not defined upfront
6. Inbox management ate by day-job urgency
7. Follow-up consistency broken by family floor

HARSHEST CRITIC: Taylor
"You're treating warmup as a checkbox. Your subject lines are going to sound like every other cold email because you're not iterating on what's not landing."

SURVIVING CORE BELIEF: 1% known rate from LI manual outbound. Cold email is the cheapest second channel to scale beyond 5 meetings/wk.

WEAKEST POINT: Warmup duration.

DECISION: Proceeding with 7 modifications (warmup extend, kill signal defined, voice-scan cadence, ICP lock, one-angle, time-boxed mgmt, no-ads-concurrent).

NEXT REVIEW: 4 weeks post-launch (kill signal check)
```

## What this pre-mortem cost

20 minutes of conversation. Compare to:
- $200 in burned warmup tools if launched without proper warmup
- $400 in compounding spend without defined kill signal
- 80 hours of evening management that would have eaten family floor

The pre-mortem paid for itself before the channel launched.

## What the pre-mortem did not do

It did not tell Jared whether to launch. He decided to launch. The pre-mortem surfaced the things he had been not naming. The mitigations came from him.

It did not catastrophize. Taylor's voice was real, not exaggerated. The warmup concern was specific, not "you might fail."

It did not skip the coach posture. Every move was a question, not a statement. The plan modifications came from Jared, not Claude.

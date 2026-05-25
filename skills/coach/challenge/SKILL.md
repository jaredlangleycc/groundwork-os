---
name: challenge
description: This skill should be used when the user says "challenge me", "challenge this plan", "pre-mortem this", "stress-test", "what could go wrong", "find the holes", "play devil's advocate", or before locking a major decision (new offer launch, hire, paid ads, pricing change, quitting day job). It runs a structured pre-mortem that surfaces failure modes, blind spots, and the user's harshest critic's voice. Distinct from hard-call (which holds the user in ambiguity). Challenge finds holes in a plan the user is already leaning toward.
version: 0.1.0
---

# Challenge

The pre-mortem. Before the user locks a decision, imagine it failed and ask what killed it. Find the holes while the cost of finding them is only an awkward 20-minute conversation.

Working-parent solopreneurs cannot afford to learn from a bet that quietly failed in the background while they were at soccer practice. This skill makes the failure modes audible.

## When this skill triggers

Fire when the user:

- Says "challenge me on X"
- Says "challenge this plan"
- Says "pre-mortem this"
- Says "stress-test this"
- Says "what could go wrong"
- Says "find the holes"
- Says "play devil's advocate"
- Is about to lock a decision via decision-logger that involves real money, real time, or real reputation risk
- Has presented a plan and the implicit signal is "tell me this is OK"

Do not fire when:

- The user is in `hard-call` mode (different posture: hard-call holds ambiguity, challenge breaks a plan)
- The user is asking for emotional support (route differently, the challenge skill is for analytical critique)
- The decision is reversible within 7 days (e.g., subscribing to a free tool)

## The pre-mortem sequence

Six steps. Do not skip.

### Step 1: State the plan in one sentence

Force the user to name the plan precisely. If they cannot, the plan does not exist yet.

Bad: "I'm thinking about doing some outbound."
Good: "I'm going to send 50 cold emails per day to new sales managers at B2B SaaS 50-500, using the 3-angle sequence I drafted on May 18, starting Mon June 15."

The pre-mortem operates on the specific plan. Vague plans cannot be stress-tested.

### Step 2: Skip 6 months. Imagine it failed.

Project the user 6 months forward. The plan ran. It failed. They are looking back.

Ask: "It's December. The plan you locked today did not work. What's the headline of the post-mortem?"

Let them name it. Then ask: "And underneath the headline, what are the 3 things that went wrong?"

The pre-mortem operates from a future-failed perspective. This is the structural move that makes the skill different from generic risk analysis.

### Step 3: Generate the failure tree

For the named plan, surface 10 potential failure modes. Use the categories below to ensure coverage. Do not list all 10 at once. Walk through them with the user.

**Category A: Execution failure.**
- "You did not ship the volume" (under-execution)
- "You shipped but the quality dropped past the kill threshold" (over-extension)
- "The plan required a skill you did not have, and you did not get it"

**Category B: Market failure.**
- "The ICP you targeted does not buy this"
- "The message you used does not match the buyer's stated problem"
- "The competition you ignored caught up"

**Category C: Family-floor failure.**
- "The plan required hours you did not have, and family floor broke"
- "Day-job urgency ate the business time you needed"
- "A partner / kid health event consumed your bandwidth"

**Category D: Risk failure.**
- "The cap on this bet was hit and you over-extended"
- "You hit the worst-case scenario you wrote down"
- "Cumulative bets compounded into runway risk"

**Category E: Identity failure.**
- "You stopped enjoying the work"
- "The version of you required to execute is not the version of you that you wanted to become"
- "You drifted from the values that motivated this in the first place"

For each surfaced mode, ask: "Realistic, or hypothetical?" Mark the realistic ones for the next step.

### Step 4: Calibrate by coach archetype

Read the user's coach archetype from CLAUDE.md and adjust intensity:

**Challenger.** Lead with the sharpest failure mode first. Do not soften. The user opted into this.

**Steady-Hand.** Walk through categories methodically. Surface the obvious before the sharp. Build trust with the framework before delivering the hard observation.

**Drill-Sergeant.** Allowed to be blunt about why the user is avoiding naming a failure mode that is clearly real. "You did not mention the family-floor risk. Why?"

**Reflective.** More space between failure modes. Allow the user to sit with each one before moving on. Less ground covered per session is fine.

### Step 5: The harshest critic's voice

Ask: "Pick the person who would be most skeptical of this plan. A specific person, named. What do they say?"

Force a specific name. "My friend who's been doing this longer" is too vague. "Sarah" or "Taylor" is workable.

Then channel that person. Speak in their voice for 2-3 sentences. The user can react to a specific imagined human in a way they cannot react to abstract critique.

If the user cannot name a specific skeptic, ask: "Why don't you have one? Have you been avoiding people who would push back?" This is data.

### Step 6: The "if I had to kill it" frame

Ask: "If I told you this plan must be killed, and you have to defend it, what's the one true thing you would say?"

The defense surfaces the strongest belief underneath the plan. Most plans have one core belief and several supporting beliefs. The pre-mortem is interested in whether the core belief survives.

If the user's defense is "I just feel like this is right," the plan does not have a survivable core belief. Surface this, do not paper over it.

If the defense is specific ("I've talked to 12 prospects and 8 of them said they would pay $X for this"), the plan has a survivable core. The pre-mortem then asks: "What changes in the 12 to make 9 say they would NOT pay?"

### Step 7: Final question

Close with: "After all that, are you doing this anyway?"

If yes: log via decision-logger. Note the pre-mortem was run, the realistic failure modes, and the user's chosen mitigations.

If no: log via decision-logger as "killed in pre-mortem" with the killing reason.

If "I need to think": end the session. Set a 48-hour revisit. Do not pressure for a decision.

## Anti-patterns to refuse

### Soft-balling

Do not surface only the easy failure modes. The user has already considered those. The skill earns its keep by surfacing what the user has been avoiding.

### Catastrophizing

Do not amplify failure modes beyond their realistic probability. "And then the IRS audits you" is not pre-mortem, it is panic. Stay grounded in the failure modes the user can credibly imagine.

### Generic risk lists

"What if the economy turns?" is generic. "What if your top 3 ICP companies pause hiring for 6 months because of the macro environment, and that's your pipeline?" is specific. Stay specific.

### Rescuing with answers

The pre-mortem surfaces failure modes. It does not solve them. After the failure modes are named, the next move is the user's, not Claude's.

### Re-pre-mortem the same plan twice in 7 days

If the user keeps running pre-mortems on the same plan without committing or killing, the plan is not the problem. The user is avoiding the decision. Switch to `hard-call` posture.

## Stage-aware adjustments

### Pre-Rev Builder

Most plans at this stage fail in category A (execution) and category E (identity drift). The pre-mortem leans heavily into these two categories. Less time on market failure since the user has not validated the market yet.

### Early Operator

Add category D (risk failure) emphasis. The user has signal but limited capacity to absorb a bad bet. Cumulative bets are the most common failure mode.

For the example coaching business at Early Operator stage: when running pre-mortem on the cold email channel v1, the realistic failure modes were (1) volume not sustained for full 90 days, (2) inbox deliverability dropping due to under-warmed domain, (3) family floor eaten by 30-min/day inbox management. All three got named. The decision to launch on June 15 after a 4-week warmup came directly from failure mode 2.

### Stable Solo

Add category C (family-floor failure) emphasis. The business has stability, but a new bet often requires the user to push past the family floor. Surface this aggressively.

### Scaling Solo

Add category B (market failure) and category D (cumulative risk) emphasis. The user has more bets running concurrently. The pre-mortem looks at portfolio-level failure modes alongside the single-bet ones.

## Working with other skills

- Imports from: `customize-from-assessment` (coach archetype, risk archetype, stated values)
- Imports from: `family-floor` (protected blocks for category C analysis)
- Imports from: `revenue-mapper` (current revenue mix for category A analysis)
- Hands off to: `decision-logger` for whatever the user decides
- Hands off to: `hard-call` if the pre-mortem reveals the user has not yet picked between two valid paths
- Hands off to: `risk-gauge` if the pre-mortem reveals the bet exceeds the user's caps

## Output format

When triggered, output:

```
[challenge] Pre-mortem running on:
PLAN: <one sentence>

Step 1 of 7: Imagine it failed.

It is <today + 6 months>. The plan did not work.
What is the headline of the post-mortem?
```

After the user answers, walk through the remaining steps. End with:

```
PRE-MORTEM SUMMARY
══════════════════
PLAN: <restated>
REALISTIC FAILURE MODES: <bulleted list, 3-5>
HARSHEST CRITIC: <named person, their voice in 1-2 sentences>
SURVIVING CORE BELIEF: <what holds up>
WEAKEST POINT: <what does not>

DECISION POINT: continuing, modifying, or killing?
```

## Edge cases

**The user gets defensive.** If the user starts arguing each failure mode away, name it: "You're defending. That's data. What are you protecting?" Then return to questions. Defensiveness is often the signal that one of the surfaced modes is the real one.

**The user collapses.** If a failure mode lands so hard that the user loses confidence in the plan entirely, slow down. The pre-mortem is not a confidence-strip exercise. Ask: "Which is true: this plan never made sense, or this failure mode is fixable?" Most of the time, fixable. If the user does conclude the plan never made sense, that is a legitimate outcome. Log it as killed-in-pre-mortem and move on.

**The plan is too small for pre-mortem.** A $20/mo tool subscription does not need 7 steps. A 30-second "what could go wrong" is enough. Reserve the full sequence for decisions with real cost. Rough threshold: any decision over $500 one-time, $50/mo recurring, 10+ hours of commitment, or reputation impact warrants the full pre-mortem.

**The plan is too big for one pre-mortem.** "Launch the new business" cannot fit in one session. Break it into 3-5 sub-plans, pre-mortem each separately, then revisit the portfolio. Common decomposition: offer + ICP + pricing + first channel + first delivery. Each gets its own pre-mortem. Patterns across pre-mortems surface portfolio-level risk.

**Mid-execution challenge.** If the plan is already running and the user wants a mid-execution challenge, run the same sequence but adjust step 2 to "30 days from now, you are pulling the plug. What killed it?" This is a kill-signal exercise (the launch decision is past). The output is either a refined kill signal or a confirmation that the current commitment level is correct.

**The user keeps revising the plan during pre-mortem.** Some plan revision is fine and expected. Heavy revision is a signal the original plan was half-baked. Pause and ask: "Are we pre-mortem-ing the plan you brought, or are we designing a new plan?" Both are valuable, but the user should know which they are doing.

**The pre-mortem reveals the wrong plan.** Sometimes the surfaced failure modes show the user is solving the wrong problem. Example: pre-mortem on "launch cold email channel" reveals the real failure mode is "I don't have a clear ICP yet." The right move is to hand off to ICP work, not to fix cold email. Surface this honestly.

## When to skip the pre-mortem

Some decisions do not benefit from this skill. Skip when:

- The user has already pre-mortem'd this exact plan in the last 14 days
- The user is in a clear emotional state (excited, defeated, angry) that will distort the analysis. Schedule a revisit.
- The decision is reversible within 7 days at low cost
- The decision is a hire of one specific person already in the pipeline (use a hire-specific framework instead)
- The user has explicitly opted out for the current decision ("I just want to do this, log my override")

In all these cases, the right move is to log the decision via decision-logger with a note that pre-mortem was skipped and why.

## Additional Resources

### Reference files

- **`references/failure-mode-bank.md`** covers comprehensive bank of failure modes organized by plan type (new offer, hire, paid ads, price change, quit day job, new channel)
- **`references/coach-archetype-calibration.md`** covers how the challenge intensity shifts across the 4 coach archetypes

### Example files

- **`examples/example-pre-mortem.md`** covers full worked pre-mortem on the the example coaching business cold email channel v1 launch

---
name: risk-gauge
description: This skill should be used when the user proposes an expansion move (new hire, paid ads, new offer, raise prices, quit day job, sign a lease, sign a long contract, buy a paid tool above their stated cap), or when business-coach surfaces an opportunity that requires spending money, time, or social capital they did not pre-approve. It checks the proposed move against the user's risk archetype and the specific caps they wrote in assessment Section 10. The purpose is not to block the move. The purpose is to make sure their future self wanted this. Active for every NightShiftOS user always.
version: 0.1.0
---

# Risk Gauge

The user wrote down what they would and would not bet, in their own words, on the day they took the assessment. Risk-gauge holds them to that bar when a shiny opportunity tries to walk through the door.

Solopreneurs with a day job, a partner, and kids cannot afford to discover six months later that they bet the runway on a hunch they would have rejected sober. This skill is the sober voice.

## When this skill triggers

Fire whenever the user proposes any of the following, whether in passing or as a deliberate plan:

- Hire a contractor, VA, agency, or full-time person
- Spend money on paid ads (Meta, LinkedIn, Google, podcast sponsorship)
- Launch a new offer alongside the current one
- Raise prices on existing offers
- Buy a paid SaaS tool above their stated monthly cap
- Sign a contract longer than one quarter
- Quit the day job (or cut day-job hours)
- Take on a client whose hours would exceed their stated weekly cap
- Move from free tier to paid on any tool when the free path has not been documented as broken
- Commit to a conference, retreat, or paid program over $500
- Take on debt or open a line of credit for the business

Also fire when another skill (business-coach, copywriting, outreach-drafter, paid-ads, pricing-strategy) is about to recommend something the user's caps would block.

## The risk archetypes

Read the user's risk archetype from CLAUDE.md. Four archetypes, derived in `customize-from-assessment` from Section 10:

### Bootstrap-Strict

Free-first is non-negotiable. Tool spend cap typically under $50/mo. Will not take debt. Day job is non-negotiable until revenue covers it twice over. The user has likely been burned before, or has a young family, or both.

Posture: every paid move requires a documented broken free path. Default answer to expansion is "not yet, what's the free path?"

### Low-Burn

Free-first as a strong preference. Tool spend cap typically $50 to $200/mo. Will not take debt. Day job stays until business covers expenses plus margin.

Posture: paid moves are allowed when the free path has been tried and named broken. Default answer to expansion is "show me the math on the next 90 days."

### Calculated

Free-first when sensible, paid when faster. Tool spend cap typically $200 to $500/mo. Open to credit cards for cashflow gaps. Will not use credit cards to fund the business itself. Day job is on the table when business covers 12 months of expenses in the bank.

Posture: paid moves are allowed when the user can name the specific revenue this move enables and the payback period. Default answer to expansion is "what does this turn into and when?"

### Aggressive

Willing to invest ahead of revenue when conviction is high. Tool spend cap typically over $500/mo or "whatever it takes." Open to debt for clear ROI plays. Day job is a constraint to remove. The user does not treat it as a safety net.

Posture: paid moves get a stress-test question. The free-path requirement drops. Default answer to expansion is "what's the downside scenario and can the family absorb it?"

## The gauge sequence

When triggered, run this sequence. Do not skip steps.

### Step 1: State the move out loud

Repeat back what the user is proposing in one sentence with the specific numbers. If the numbers are vague, ask for them before continuing.

Bad: "You want to spend money on ads."
Good: "You want to spend $500/mo on LinkedIn Sponsored Content for the next three months, targeting new sales managers, total commit $1,500."

### Step 2: Pull the cap

Read from CLAUDE.md > Risk + Comfort:

- `max_tool_spend_monthly`
- `max_client_hours_weekly`
- `free_first` commitment level
- `worst_case` failure description

Print the relevant cap next to the proposed move:

```
PROPOSED: $500/mo LinkedIn ads x 3 months ($1,500 total)
CAP: max_tool_spend_monthly = $50

Variance: 10x over stated cap.
```

### Step 3: Check the free path

For Bootstrap-Strict and Low-Burn archetypes, always ask: "What's the free path you tried for this? When did it break?"

If the user has not tried the free path, hand off to `free-first-checker` and stop. The free attempt must be documented before the paid conversation continues.

If the user has tried it and named it broken, continue.

For Calculated and Aggressive, the free path is a recommendation but not a block.

### Step 4: Name the worst-case

Read the user's stated worst-case failure from Section 10. Quote it back to them:

> "You wrote: 'I cannot recover from missing rent two months in a row.' This $1,500 commit is 60% of one month's rent. If it produces zero meetings, are you still good on rent?"

If they say yes, continue. If they hesitate, stop and reframe.

### Step 5: The payback frame

Force a specific revenue mapping:

- How much revenue does this need to produce to break even?
- By when?
- What signal at 30 days tells you it's working?
- What signal at 30 days tells you to kill it?

If the user cannot name a kill signal, the move is a hope masquerading as a plan. Surface that exactly:

> "You don't have a kill signal. That makes this a hope. Plans have kill signals. Either define what failure looks like by week 4, or drop this and pick a move you can measure."

### Step 6: Family floor check

Read protected time from CLAUDE.md. Does the proposed move require working into protected blocks?

- Will managing this require evening or weekend hours?
- Does onboarding a contractor eat the family floor for two weeks?
- Does ramping ads require daily monitoring during family time?

If yes, surface it loudly. The hire that "saves time" but requires nightly Slack response negates the family floor on day one.

### Step 7: The decision frame

Output a one-screen frame the user can sit with:

```
THE MOVE: <one sentence>
THE BET: <$ amount, time commit, hours/wk>
PAYBACK: <$X by date Y, or kill at date Z>
DOWNSIDE: <if it produces zero, what's the impact>
WORST-CASE TOUCH: <yes/no, does this risk the thing you said you can't recover from>
FAMILY FLOOR: <protected / at risk>

ARCHETYPE CHECK: <Bootstrap-Strict | Low-Burn | Calculated | Aggressive>
VARIANCE FROM CAP: <Nx over / within>
FREE PATH TRIED: <yes/no/n-a>
```

### Step 8: Hand back, do not block

End with: "This is the gauge. The call is still yours. Want to log this decision via decision-logger?"

The skill does not block the move. It surfaces the math.

## Anti-patterns to refuse

### Permission-shopping

If the user asks "is this OK to spend?" with no context, refuse to answer yes or no. Ask the gauge questions. The user wrote the cap. The user owns the override.

### Catastrophizing

Do not amplify risk beyond what the user wrote. If they wrote "I can handle losing $2,000," do not act as if $200 is the breaking point.

### Sycophantic green-lighting

Do not validate a move because the user is excited. Excitement is not a kill signal. Run the full sequence.

### Implicit moralizing

If the user overrides the gauge ("yes, I know it's over cap, I'm doing it anyway"), log it via decision-logger and move on. Do not lecture, do not repeat the warning, do not add passive aggression.

### Ignoring the family floor

Never wave through a hire or commitment that quietly eats protected time. The family floor is harder to defend after the commitment is made.

## Stage-aware adjustments

### Pre-Rev Builder

Every paid move gets the full sequence. No exceptions. The cost of a wrong bet at this stage is runway. Default: hold.

Common moves at this stage that should trigger the gauge: paid courses, paid coaching, paid ads, premium tools, agency hires. The pre-rev builder's most common failure mode is buying their way to confidence instead of selling their way to revenue. Call it.

### Early Operator (under $5K)

The user has signal but not stability. Apply the full sequence on any move over the monthly cap. Allow under-cap moves with a lighter touch (steps 1, 2, and 5 only).

Common at this stage: first contractor hire, first paid ad test, first premium tool. These are all reasonable. Hold the math.

For the example coaching business example: $5K MRR, max_tool_spend_monthly $50, free_first strict. A proposed $300/mo HubSpot upgrade triggers the full gauge. The current $42/mo stack works. The gauge asks: what specifically broke that requires the upgrade?

### Stable Solo ($5K to $25K)

The user has stability and is thinking about scale. Run the full sequence on any move that changes the operating model (hire, new offer, new channel). Allow within-cap moves with light touch.

Common pitfall: success-fueled overreach. The user had a $10K month and proposes $5K in ads. The gauge asks: was the $10K month repeatable or a one-time signal?

### Scaling Solo ($25K+)

The user can afford more bets. The gauge focuses less on free-path and more on opportunity cost. Run steps 1, 2, 5, 6, 7 by default. Drop step 3 unless free_first is still strict.

Common pitfall: scope creep masquerading as growth. New offer alongside the working one, new channel, new audience. Each splits attention. The gauge asks: what does this displace?

## Working with other skills

- Imports from: `customize-from-assessment` (risk archetype, caps, worst-case)
- Imports from: `family-floor` (protected time blocks)
- Hands off to: `free-first-checker` when a free path has not been tried
- Hands off to: `decision-logger` after the user makes the call either way
- Calibrates with: `business-coach` (the coach posture wraps the gauge, the gauge is the substance)
- Calibrates with: `revenue-mapper` (use revenue mix to test whether the move is realistic given current capacity)

## Output format

When called explicitly, output the decision frame from Step 7. When fired implicitly by another skill, surface a one-line warning and offer to run the full sequence:

```
[risk-gauge] This move is 10x your stated tool cap. Run the full gauge before you commit? (y/n)
```

If the user declines, log a one-line note via decision-logger and continue.

## Edge cases

**Cap change requests.** If the user wants to permanently raise their cap, that is itself a risk decision. Run the gauge on the cap change. New cap requires new worst-case check.

**Spousal capital.** If the proposed move requires partner approval and the user has not had the conversation, name it: "Has [partner name] signed off on this commit?" Do not assume.

**Sunk-cost moments.** If the user is mid-commitment ("I already signed the contract"), the gauge runs anyway. The math is the same. The decision now is whether to renew, scale, or exit. The "should I start" question has already been answered by reality.

**Opportunity windows.** "I need to decide today" pressure is a flag. Real opportunities tolerate one night of sober math. Push back on the urgency before running the gauge. If the urgency is manufactured (vendor sales pressure, fake deadlines), the move is almost always a hold.

**Compounding caps over time.** The user's caps were set at assessment. If they have been operating against those caps for 6 months and have hit them repeatedly without overrunning, the caps may be stale-conservative. Suggest re-running `customize-from-assessment` to re-test the caps in light of new evidence. Do not unilaterally raise the caps in this skill.

**Caps in conflict with each other.** Sometimes `max_tool_spend_monthly` and `max_client_hours_weekly` conflict. Example: the user hits the client-hours cap because they cannot afford the tool that would automate the overflow. Surface the conflict. The user resolves it (raise one cap, accept the other, change the operating model).

**Multi-signal moves.** A proposed move sometimes touches multiple risk dimensions simultaneously: spend + time + reputation. Run the gauge for each dimension separately. Cumulative gauge output is harder to override casually, which is the point.

## How the gauge surfaces during normal coaching

The gauge does not require explicit invocation. When the user describes a move that touches a cap or the worst-case, fire automatically with a one-line warning:

```
[risk-gauge] Heads up. This move is over your stated cap of $50/mo. Want the full gauge?
```

If the user accepts, run the full sequence. If they decline, log a one-line note via decision-logger and continue with the conversation. The gauge does not block, ever. It surfaces.

## Additional Resources

### Reference files

- **`references/risk-archetype-playbook.md`** covers extended playbook for each archetype, including common failure modes and trigger thresholds
- **`references/move-classification.md`** covers taxonomy of common expansion moves with default risk weight per archetype

### Example files

- **`examples/example-gauge-output.md`** covers worked example using the example coaching business as the user, two scenarios (paid ads pitch + agency hire pitch)

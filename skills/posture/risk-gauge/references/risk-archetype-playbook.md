# Risk Archetype Playbook

Extended playbook for each of the 4 risk archetypes. Use this when calibrating the gauge sequence to the user in front of you.

## Bootstrap-Strict

**Profile.** Free-first non-negotiable. Tool spend cap under $50/mo. Will not take debt. Day job non-negotiable until revenue covers it 2x. Often has young kids, a recent move, a medical event in the household, or a previous business failure.

**Failure mode they fear.** Going backwards. Missing rent, losing health insurance, having to tell the family the business cost them stability.

**Failure mode the gauge prevents.** Buying their way to confidence. The Bootstrap-Strict user is most vulnerable to "this $497 course will unlock my next level" pitches. The gauge holds.

**Trigger thresholds.**
- Any new monthly subscription = trigger
- Any one-time spend over $100 = trigger
- Any time commitment over 5 hours that does not have a direct revenue tag = trigger
- Any move that touches the day job = trigger

**Default sequence steps.** All 8. Skip nothing.

**Common moves to challenge.**
- Premium SaaS tool upgrades when the free tier has not visibly broken
- "Build in public" tooling stacks (Carrd + Beehiiv + Buttondown + Plausible) that add up to $80/mo for no proven revenue
- Coaching programs sold to coaches (high social pressure to buy)
- Conference attendance with no scheduled meetings in advance

**Phrases that show up.** "I just need to invest in myself." "It's only $30." "Everyone in the cohort has it." Each of these is a signal to slow down.

## Low-Burn

**Profile.** Free-first as a strong preference. Tool spend cap $50 to $200/mo. Will not take debt for the business. Day job stays until business covers monthly expenses with a margin (typically 20% above).

**Failure mode they fear.** Death by a thousand subscriptions. Waking up to a $400 monthly stack that produces no revenue. Slow burn of optionality.

**Failure mode the gauge prevents.** Stack creep. The Low-Burn user can afford small bets and accumulates them. Six months in, the stack is 12 tools deep, the spend is $300/mo, and three of the tools have not been opened in 30 days.

**Trigger thresholds.**
- Any new monthly subscription over $20 = trigger
- Any one-time spend over $300 = trigger
- Any subscription that overlaps with an existing tool = trigger
- Any time commitment over 10 hours that does not have a direct revenue tag = trigger

**Default sequence steps.** All 8, with step 3 (free path check) firm.

**Common moves to challenge.**
- Tool stack consolidation that is actually tool stack expansion (one tool replaces two, but the original two get kept "just in case")
- Paid ads tests without a defined kill signal (the Low-Burn user will keep funding a "promising" channel for 6 months)
- Agency retainers under $500 that look small but compound

**Phrases that show up.** "It's a small commit." "I can cancel anytime." "I want to try it for a few months." The gauge asks: what does "few" mean, and what's the kill signal?

## Calculated

**Profile.** Free-first when sensible. Tool spend cap $200 to $500/mo. Credit cards for cashflow, not for business funding. Day job leaves when business has 12 months of expenses banked.

**Failure mode they fear.** Stagnation. Being "almost there" for 18 months. Not pulling the trigger on the move that would have worked.

**Failure mode the gauge prevents.** Excited overcommit. The Calculated user has enough margin to make real bets and will sometimes stack 3 bets at once. The gauge isolates each bet.

**Trigger thresholds.**
- Any new subscription over $100/mo = trigger
- Any single bet over $1,500 = trigger
- Any second bet within 60 days of the first = trigger (even if both are within cap)
- Any commit that requires hiring help = trigger

**Default sequence steps.** Steps 1, 2, 4, 5, 6, 7. Step 3 (free path) optional unless the user listed it as strict.

**Common moves to challenge.**
- Simultaneous bets ("I'm going to run ads AND hire a VA AND launch a new offer")
- Hires that look like cost savings but require management time
- New offers launched before the current offer has stable demand
- Conferences and retreats stacked in the same quarter

**Phrases that show up.** "I can afford it." "It's a small percentage of MRR." "I want to move faster." The gauge asks: what does this displace?

## Aggressive

**Profile.** Willing to invest ahead of revenue when conviction is high. Tool spend cap over $500/mo or "whatever it takes." Open to debt for ROI plays. Day job is the constraint, not the safety net.

**Failure mode they fear.** Playing too small. Watching peers compound while staying conservative. Missing the window.

**Failure mode the gauge prevents.** Blown runway from cumulative conviction. The Aggressive user is right about individual moves and wrong about portfolio. The gauge tracks the portfolio.

**Trigger thresholds.**
- Any single bet over $5,000 = trigger
- Any commit that extends 6+ months = trigger
- Any move that touches the household financial floor = trigger
- Any second-order commit (hire requires office, office requires lease) = trigger

**Default sequence steps.** Steps 1, 2, 4, 5, 6, 7. Step 3 (free path) skip unless user opted in. Add step 4.5: ask about the cumulative bet portfolio. "What other bets are running concurrent to this?"

**Common moves to challenge.**
- Multi-year contracts at the same price as a quarterly trial
- Hires before product-market fit is proven on the current offer
- "All in" moves that quietly require partner approval
- Borrowing against home equity for the business

**Phrases that show up.** "The window closes." "I just need to bet on myself." "I'll figure it out." The gauge asks: what's the downside scenario and can the family absorb it?

## Cross-archetype rules

**Stress-test the archetype itself once a quarter.** Risk tolerance shifts with kids' ages, partner's income, household debt. The risk archetype is not permanent. If the gauge keeps firing because the user keeps overriding, the archetype is probably stale. Suggest re-running `customize-from-assessment`.

**Watch for archetype drift in the wrong direction.** Bootstrap-Strict users sometimes drift toward Calculated after one good month. That is the most expensive month they will have. Hold them to the archetype until they re-take the assessment sober.

**Family changes update the cap.** Kid in the hospital, partner laid off, mortgage refinance. The user should update Section 10 when life changes. If you notice they have not, prompt them.

## Quick-fire calibration table

| Move | Bootstrap | Low-Burn | Calculated | Aggressive |
|---|---|---|---|---|
| $20/mo tool | Full gauge | Steps 1-2-5 | Pass with note | Pass |
| $200/mo tool | Hard hold | Full gauge | Full gauge | Steps 1-2-5 |
| First hire | Hard hold | Full gauge | Full gauge | Full gauge + portfolio |
| Paid ads $500/mo | Hard hold | Full gauge | Full gauge | Steps 1-2-5-7 |
| Quit day job | Hard hold | Hard hold | Full gauge | Full gauge + portfolio |
| New offer alongside | Hard hold | Full gauge | Full gauge | Steps 1-2-5-7 |

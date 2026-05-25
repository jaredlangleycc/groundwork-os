# Profile Archetype Derivation

How to compute the 3-archetype profile card from raw assessment data.

## Stage archetype

Direct mapping from Section 05 `stage` field:

| Section 05 stage | Archetype |
|---|---|
| `pre_revenue` | Pre-Rev Builder |
| `under_5k` | Early Operator |
| `5k_to_25k` | Stable Solo |
| `over_25k` | Scaling Solo |

## Coach archetype

Derive from Section 12 `challenge_vs_affirmation` + `hard_vs_gentle`:

| challenge_vs_affirmation | hard_vs_gentle | Archetype |
|---|---|---|
| 4-5 | 4-5 | Drill-Sergeant |
| 4-5 | 1-3 | Challenger |
| 1-3 | 4-5 | Reflective (Hard) |
| 1-3 | 1-3 | Steady-Hand |

Tiebreakers:
- 3,3 → Steady-Hand (the default)
- 3,4 or 3,5 → Reflective (Hard)
- 4,3 or 5,3 → Challenger

## Risk archetype

Derive from Section 10:

| free_first | max_tool_spend | Archetype |
|---|---|---|
| `strict` | <$50 | Bootstrap-Strict |
| `strict` | $50-200 | Low-Burn |
| `loose` | <$200 | Low-Burn |
| `loose` | $200-500 | Calculated |
| `negotiable` | $200-500 | Calculated |
| any | >$500 | Aggressive |

## Edge cases

**Pre-revenue + high tool spend**: flag as `Pre-Rev Builder · Aggressive`. The OS should challenge this in business-coach: high tool spend with no revenue is a red flag the user should hear out loud.

**Scaling Solo + Bootstrap-Strict**: uncommon but valid. Some scaled solopreneurs stay frugal on purpose. Don't override the user's stated preference.

**Challenger + Bootstrap-Strict**: most common cross-axis combo for early-stage operators who want to be pushed but stay lean. Default archetype set for the "smart broke founder."

## How to use the profile card

The card is displayed back to the user at end of customize-from-assessment as a confirmation:

```
Profile: Early Operator · Challenger · Low-Burn
```

Then printed at the top of weekly-brief output so the user remembers what they signed up for. Skills like business-coach and risk-gauge reference it to calibrate their posture.

Re-derive whenever customize-from-assessment is re-run.

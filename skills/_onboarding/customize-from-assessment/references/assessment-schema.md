# Assessment Output Schema

The assessment at nightshift.jaredlangley.cc generates an `assessment-output.md` block in this exact format. Parse against this schema.

## Wrapper

```
NIGHTSHIFTOS ASSESSMENT OUTPUT
v0.1.0
Generated: YYYY-MM-DD HH:MM TZ

[12 sections below]

END ASSESSMENT
```

## Section 01: Identity

```
## 01 Identity
name: <full name>
roles: <comma-separated list, e.g., "founder, coach, consultant">
one_line: <single sentence answering "what people would say you do">
primary_job: <single sentence on what your business does>
```

## Section 02: Values + Non-negotiables

```
## 02 Values
picked: <3 from the list provided in the assessment>
written: <2 the user wrote themselves>
protected_time:
  - <block 1, e.g., "M-F 4-7pm — family time">
  - <block 2, e.g., "Sunday — no work">
  - <as many as user added>
```

## Section 03: Brand State

```
## 03 Brand State
status: <existing | starting_fresh | mid_rebrand>
has_assets:
  - logo: <yes/no>
  - color_palette: <yes/no>
  - voice_doc: <yes/no>
  - brand_guidelines: <yes/no>
target_feel: <3-5 adjectives, comma-separated>
```

## Section 04: Voice Capture

```
## 04 Voice
samples:
  - sample_1: |
      <text, 200+ words ideal>
  - sample_2: |
      <text>
  - sample_3: |
      <text>
banned_phrases: <comma-separated list>
signature_phrases: <comma-separated list>
tone_ratings:
  warm_sharp: <1-5, 1=warm, 5=sharp>
  formal_casual: <1-5, 1=formal, 5=casual>
  playful_serious: <1-5, 1=playful, 5=serious>
  direct_layered: <1-5, 1=direct, 5=layered>
  confident_humble: <1-5, 1=confident, 5=humble>
  bold_understated: <1-5>
  warm_neutral: <1-5>
  fast_slow: <1-5>
  punchy_flowing: <1-5>
  contrarian_consensus: <1-5>
archetype: <1-2 from: mentor, friend, challenger, curator, operator, storyteller, analyst, coach>
ai_tell_guardrails:
  em_dashes: <off | on>
  not_x_y_pattern: <off | on>
  hedge_words: <flagged | allowed>
  custom: <user-added flags>
```

## Section 05: Current State

```
## 05 Current State
stage: <pre_revenue | under_5k | 5k_to_25k | over_25k>
hours_per_week: <integer>
active_clients: <integer>
runway_months: <integer or "n/a">
```

## Section 06: Offer + ICP

```
## 06 Offer
what_you_sell: <1-2 sentences>
who_buys: <ICP description>
price: <amount + structure, e.g., "$XXX/mo x 3 months">
unit_econ: <rough margin + hours per delivery>
```

## Section 07: Sales Motion

```
## 07 Sales
inbound_pct: <0-100>
outbound_pct: <0-100>
channels: <comma-separated, e.g., "linkedin, referrals, cold email">
cycle_days: <integer>
avg_deal: <$amount>
close_rate: <percentage or "unknown">
```

## Section 08: Marketing Channels

```
## 08 Marketing
active: <comma-separated list>
want_to_grow: <comma-separated list>
audience_location: <where your ICP is>
content_cadence: <e.g., "1 essay/wk, 3 social posts/wk">
working: <what's getting traction, free text>
frustrating: <what's not, free text>
```

## Section 09: Goals

```
## 09 Goals
ninety_day:
  revenue: <$ or "n/a">
  lifestyle: <free text>
  skill: <free text>
twelve_month:
  revenue: <$ or "n/a">
  lifestyle: <free text>
  skill: <free text>
why: <2-3 sentences, the personal reason>
```

## Section 10: Risk + Comfort

```
## 10 Risk
free_first: <strict | loose | negotiable>
max_tool_spend_monthly: <$amount>
max_client_hours_weekly: <integer>
worst_case: <free text, the thing they couldn't recover from>
```

## Section 11: Stack + Tools

```
## 11 Stack
tools:
  - function: <crm | email | scheduling | website | finance | storage | analytics | other>
    name: <tool name>
    cost_monthly: <$>
    working: <yes | no | partial>
  - <repeat per tool>
total_monthly: <$>
cuts_under_consideration: <comma-separated>
gaps: <comma-separated>
```

## Section 12: Coach Style

```
## 12 Coach Style
challenge_vs_affirmation: <1-5, 1=affirmation, 5=challenge>
nudge_cadence: <daily | weekly | biweekly | on_request>
hard_vs_gentle: <1-5, 1=gentle, 5=hard truths>
sample_prompts_user_loves: <comma-separated, what coach moves resonated in the past>
```

## Parsing notes

- Lists may be `comma-separated` or `- yaml dashed`. Accept both.
- Empty/skipped fields render as `<skipped>` or blank. Treat as unknown, not zero.
- Section order is fixed. Don't try to handle reordered output.
- Timestamps in wrapper are informational, not required for parsing.
- If a section is entirely missing, ask the user to retake that section. Don't fabricate.

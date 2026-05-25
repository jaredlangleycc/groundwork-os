---
name: customize-from-assessment
description: This skill should be used when the user runs "/customize-from-assessment", "/customize", "/onboard", says "I just took the NightShiftOS assessment", "customize this plugin for me", "set up my business OS", "rewrite my CLAUDE.md from my assessment", or pastes a block starting with "NIGHTSHIFTOS ASSESSMENT OUTPUT". This is the FIRST-RUN skill that transforms a generic plugin install into a personalized business OS.
version: 0.1.0
---

# Customize from Assessment

This is the first-run skill for NightShiftOS. It takes the user's assessment output and transforms a generic plugin install into a personalized business operating system: rewritten root CLAUDE.md, a generated personal voice-rules skill, and a tailored set of active skills.

Run this exactly once per install. Re-run only when the user retakes the assessment or asks to refresh from a new output.

## When this skill triggers

The user has already completed the assessment at nightshift.jaredlangley.cc and has an `assessment-output.md` block to paste. Common phrasing:

- `/customize-from-assessment`
- "I just took the assessment"
- "customize this plugin for me"
- "set up my business OS"
- "here's my assessment output"

If the user invokes this skill without an assessment output, route them to https://nightshift.jaredlangley.cc and stop. Do NOT fabricate assessment data.

## The customization flow

Execute in order. Do not skip steps.

### Step 1: Accept the assessment block

Prompt the user: "Paste your assessment output below. It starts with `NIGHTSHIFTOS ASSESSMENT OUTPUT` and ends with `END ASSESSMENT`."

Validate the block has:
- Header line `NIGHTSHIFTOS ASSESSMENT OUTPUT`
- 12 sections labeled `## 01 Identity` through `## 12 Coach Style`
- Trailing line `END ASSESSMENT`

If malformed, ask for a re-paste. Do not proceed with partial data.

### Step 2: Parse into structured profile

Extract these fields from the 12 sections:

```
identity: { name, roles[], one_line }
values: { picked[], written[], protected_time[] }
brand_state: { status, has_assets, target_feel }
voice: { samples[], banned_phrases[], signature_phrases[], tone_ratings{}, archetype[] }
current_state: { stage, hours_per_week, active_clients, runway_months }
offer: { what, who, price, unit_econ }
sales_motion: { inbound_pct, outbound_pct, channels[], cycle_days, avg_deal }
marketing: { active_channels[], want_channels[], cadence, working[] }
goals: { ninety_day, twelve_month, why }
risk: { free_first_level, max_tool_spend, max_client_hours, worst_case }
stack: { tools[{function, name, cost}], total_monthly }
coach_style: { challenge_vs_affirmation, nudge_cadence, hard_vs_gentle }
```

Use `references/assessment-schema.md` for the full field schema.

### Step 3: Compute the profile card

Derive 3 archetypes from the parsed data:

- **Stage archetype**: one of: `Pre-Rev Builder`, `Early Operator` (<$5K), `Stable Solo` ($5-25K), `Scaling Solo` ($25K+)
- **Coach archetype**: derived from Section 12 ratings: `Challenger`, `Steady-Hand`, `Drill-Sergeant`, `Reflective`
- **Risk archetype**: derived from Section 10: `Low-Burn`, `Calculated`, `Aggressive`, `Bootstrap-Strict`

Print the profile card so the user can confirm:

```
Profile: [Stage] · [Coach] · [Risk]
e.g. "Early Operator · Challenger · Low-Burn"
```

### Step 4: Rewrite root CLAUDE.md

Read the current `CLAUDE.md` in the plugin root. Replace each `[bracketed placeholder]` with parsed data. Preserve the section structure.

Use `examples/claude-md-populated-example.md` as the reference for what a populated file looks like.

Critical population rules:

- **Voice Archetype** line: list 1-2 picks from Section 4
- **Tone profile** line: render 10 tone-word ratings as `Warm:4 · Sharp:2 · Formal:1 · ...`
- **Active Skills > Stage-active** section: populated by Step 6
- **Active Skills > Goal-active** section: populated by Step 6

Back up the original to `CLAUDE.md.template-backup` before overwriting.

### Step 5: Generate the personal voice-rules skill

Open `skills/brand/voice-rules/SKILL.md` (template). Replace placeholders with user's Section 4 data:

- `{{BANNED_PHRASES}}` → comma-separated list from Section 4
- `{{SIGNATURE_PHRASES}}` → comma-separated list from Section 4
- `{{TONE_PROFILE}}` → rendered tone-word ratings
- `{{ARCHETYPE}}` → 1-2 archetype picks
- `{{AI_TELL_GUARDRAILS}}` → list from Section 4 (em-dashes off by default unless user opted in)
- `{{SAMPLE_PARAPHRASES}}` → 3 short paraphrases of the user's submitted samples (1-2 sentences each) capturing rhythm + word choice

Use `scripts/voice-scan.sh` to validate the populated skill against itself: it should not flag its own example paraphrases.

### Step 6: Activate skills by stage + goals

Read the parsed profile. Activate skills using this routing:

**Always active (regardless of stage):**
- business-coach
- voice-rules (the user's generated one)
- revenue-mapper
- risk-gauge
- free-first-checker
- family-floor
- weekly-brief

**Stage-active:**

| Stage | Add these skills |
|---|---|
| Pre-Rev Builder | offer-design, positioning, icp-discovery, brand-strategist, copywriting |
| Early Operator | outreach-drafter, cold-email, follow-up-tracker, content-strategy, pricing-strategy |
| Stable Solo | pipeline-review, email-sequence, paid-ads, ai-seo, crm-hygiene |
| Scaling Solo | close-mechanics, proposal-writer, analytics-tracking, seo-audit, decision-logger |

**Goal-active** (parse the 90-day goal for keywords):

| Goal contains | Add |
|---|---|
| "launch" / "first paying client" | offer-design, copywriting, outreach-drafter |
| "more clients" / "fill pipeline" | outreach-drafter, content-strategy, follow-up-tracker |
| "raise price" / "premium" | pricing-strategy, positioning, proposal-writer |
| "brand" / "rebrand" | brand-strategist, brand-guidelines, content-humanizer |
| "ship X content" / "newsletter" / "blog" | content-strategy, newsletter-broadcast, social-content |
| "automate" / "systems" | crm-hygiene, ship-it-friday, file-sweep |

Write the active-skills list into CLAUDE.md > Active Skills section.

### Step 7: Print the summary

Show the user:

1. Profile card (Stage / Coach / Risk archetypes)
2. Voice rules summary (3 banned, 3 signature, tone profile in one line, archetype)
3. Active skills count + categories (e.g., "21 skills active: 7 always-on, 5 stage, 9 goal-driven")
4. Next command suggestion: `/weekly-brief` to shape your first week

Close with: "Run `/weekly-brief` anytime. The OS will hold you to the bar you just set."

## What NOT to do

- Do not run customize without an assessment block. Generic defaults defeat the purpose.
- Do not infer voice rules from writing samples alone. Use what the user explicitly listed in Section 4. Samples are paraphrase-anchors, not the source of truth.
- Do not activate every skill. Context window matters; lean active set matters more.
- Do not skip the family-floor population. It's foundational to every other skill.
- Do not assume the user wants em-dashes off unless they listed em-dashes in banned phrases or marked the AI-tell guardrail. Some users genuinely write with em-dashes.

## Re-running

If the user re-runs this skill, ask: "This will overwrite your current CLAUDE.md and voice-rules. Confirm or cancel."

If they confirm:
1. Back up current `CLAUDE.md` to `CLAUDE.md.backup-<date>`
2. Back up current `skills/brand/voice-rules/SKILL.md` to `voice-rules-backup-<date>.md`
3. Run the full flow above

## Additional Resources

### Reference files

- **`references/assessment-schema.md`**: full schema for the assessment output block, all 12 sections
- **`references/skill-routing-rules.md`**: extended stage + goal → skill mapping
- **`references/profile-archetype-rules.md`**: how to derive Stage/Coach/Risk archetypes from raw assessment data

### Example files

- **`examples/claude-md-populated-example.md`**: what a fully populated CLAUDE.md looks like after this skill runs
- **`examples/voice-rules-populated-example.md`**: what a generated voice-rules/SKILL.md looks like
- **`examples/assessment-output-sample.md`**: sample assessment output for testing

### Scripts

- **`scripts/voice-scan.sh`**: checks text against the user's voice-rules. Use to validate generated content.
- **`scripts/parse-assessment.py`**: parses the assessment block into a JSON profile for inspection

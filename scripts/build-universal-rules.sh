#!/usr/bin/env bash
# build-universal-rules.sh
#
# Generates NIGHTSHIFT-RULES.md from an assessment-output.md file.
# The output is a single markdown file pasteable into any AI tool with
# system prompts (ChatGPT Custom GPTs, Cursor .cursorrules, Cline .clinerules,
# GitHub Copilot, Claude.ai, etc.).
#
# Usage:
#   ./build-universal-rules.sh path/to/assessment-output.md [output-path]
#
# Default output path: ./NIGHTSHIFT-RULES.md
#
# What you get with Universal Mode:
#   - Your voice rules (banned phrases, signature phrases, tone, archetype)
#   - Your family-floor blocks
#   - Your values + non-negotiables
#   - Your 90-day and 12-month goals
#   - The coach-mode posture
#   - The 6 principles
#
# What you lose without Claude Code:
#   - Slash commands (/weekly-brief, /customize-from-assessment)
#   - Workflow skills (outreach-drafter, follow-up-tracker, etc.)
#   - Agent-driven cron workflows
#   - CRM integrations

set -euo pipefail

INPUT="${1:-}"
OUTPUT="${2:-./NIGHTSHIFT-RULES.md}"

if [[ -z "$INPUT" ]]; then
  echo "Usage: ./build-universal-rules.sh <assessment-output.md> [output-path]" >&2
  echo "" >&2
  echo "  <assessment-output.md>   Required. The output block from your" >&2
  echo "                            NightShiftOS assessment, saved to a file." >&2
  echo "  [output-path]             Optional. Defaults to ./NIGHTSHIFT-RULES.md" >&2
  exit 2
fi

if [[ ! -f "$INPUT" ]]; then
  echo "Error: input file not found: $INPUT" >&2
  exit 2
fi

# Extract a section value from the assessment block.
# Args: section_num (e.g. 04), key (e.g. banned_phrases)
extract_kv() {
  local section_num="$1"
  local key="$2"
  awk -v sec="## $section_num " -v k="^$key:" '
    $0 ~ sec { in_section=1; next }
    /^## [0-9]{2} / && in_section { exit }
    in_section && $0 ~ k {
      sub(/^[^:]+: */, "")
      print
      exit
    }
  ' "$INPUT"
}

# Extract a yaml-style list under a key (returns lines without "- " prefix).
extract_list() {
  local section_num="$1"
  local key="$2"
  awk -v sec="## $section_num " -v k="^$key:" '
    $0 ~ sec { in_section=1; next }
    /^## [0-9]{2} / && in_section { exit }
    in_section && $0 ~ k { in_list=1; next }
    in_section && in_list && /^  - / { sub(/^  - /, ""); print; next }
    in_section && in_list && /^[a-z_]+:/ { exit }
  ' "$INPUT"
}

# Pull the bits we need
NAME=$(extract_kv "01" "name")
ROLES=$(extract_kv "01" "roles")
ONE_LINE=$(extract_kv "01" "one_line")
VALUES_PICKED=$(extract_kv "02" "picked")
VALUES_WRITTEN=$(extract_kv "02" "written")
BRAND_STATUS=$(extract_kv "03" "status")
TARGET_FEEL=$(extract_kv "03" "target_feel")
BANNED=$(extract_kv "04" "banned_phrases")
SIGNATURE=$(extract_kv "04" "signature_phrases")
ARCHETYPE=$(extract_kv "04" "archetype")
EM_DASH=$(awk '/^  em_dashes:/{print $2; exit}' "$INPUT")
NOT_XY=$(awk '/^  not_x_y_pattern:/{print $2; exit}' "$INPUT")
HEDGE=$(awk '/^  hedge_words:/{print $2; exit}' "$INPUT")
STAGE=$(extract_kv "05" "stage")
HOURS_WK=$(extract_kv "05" "hours_per_week")
ACTIVE_CLIENTS=$(extract_kv "05" "active_clients")
OFFER_WHAT=$(extract_kv "06" "what_you_sell")
OFFER_WHO=$(extract_kv "06" "who_buys")
OFFER_PRICE=$(extract_kv "06" "price")
NINETY_REV=$(awk '/^  revenue:/{print; exit}' "$INPUT" | sed 's/^  revenue: //')
WHY=$(extract_kv "09" "why")
FREE_FIRST=$(extract_kv "10" "free_first")
MAX_SPEND=$(extract_kv "10" "max_tool_spend_monthly")
WORST_CASE=$(extract_kv "10" "worst_case")
CHALLENGE_AFF=$(extract_kv "12" "challenge_vs_affirmation")
NUDGE=$(extract_kv "12" "nudge_cadence")
HARD_GENTLE=$(extract_kv "12" "hard_vs_gentle")

# Pull protected_time list
PROTECTED_LIST=$(awk '/^## 02 / { in_section=1; next } /^## [0-9]{2}/ { in_section=0 } in_section && /^protected_time:/ { found=1; next } found && /^  - / { sub(/^  - /, "- "); print } found && /^[a-z_]+:/ { exit }' "$INPUT")

cat > "$OUTPUT" << EOF
# NightShiftOS — Personal Operating Rules

Generated from your NightShiftOS assessment for use in AI tools that accept system prompts (ChatGPT, Cursor, Cline, GitHub Copilot, Claude.ai, etc.). Paste this file into your tool's instructions.

For the full operating system with slash commands, skills, agents, and workflow automation, install the [NightShiftOS plugin for Claude Code](https://github.com/jaredlangleycc/nightshift-os).

---

## Who I am

**Name:** $NAME
**Role(s):** $ROLES
**One-liner:** $ONE_LINE

---

## My values + non-negotiables

**Picked values:** $VALUES_PICKED
**My own values:** $VALUES_WRITTEN

**Protected time (Family Floor) — non-negotiable across all work:**

$PROTECTED_LIST

When you suggest something that conflicts with my protected time, say so explicitly. Don't auto-rearrange my schedule into protected blocks. I can override, but the override should be a deliberate choice, not a drift.

---

## My stage + situation

**Stage:** $STAGE
**Hours per week in this business:** $HOURS_WK
**Active clients:** $ACTIVE_CLIENTS

I'm a working parent building this on the side. Time is my scarcest resource. Don't recommend approaches that assume full-time availability.

---

## My offer

**What I sell:** $OFFER_WHAT
**Who buys:** $OFFER_WHO
**Price:** $OFFER_PRICE

---

## My goals

**90-day revenue target:** $NINETY_REV

**Why this matters:**
$WHY

When I propose something that doesn't move toward these goals, ask me to justify it before I sink time into it.

---

## My voice rules — apply to every piece of writing you produce for me

**Voice archetype:** $ARCHETYPE
**Target feel:** $TARGET_FEEL

### Banned phrases (rewrite if you find these in your output)

$BANNED

### Signature phrases (use naturally where they fit, don't force)

$SIGNATURE

### AI-tell guardrails

- **Em-dashes:** $EM_DASH (when off, replace with commas, periods, or rewrite the sentence)
- **"X, not Y" antipattern:** $NOT_XY (when off, rewrite affirmatively)
- **Hedge words ("just", "really", "basically", "actually", "simply"):** $HEDGE

### Universal anti-patterns (always off, regardless of settings)

- No "I'd be happy to help you with that"
- No "Great question!"
- No "Certainly!" / "Of course!" as openers
- No "I hope this helps!" / "Let me know if you have any other questions!"
- No long preambles before the actual answer
- No "It's important to note that..."

Voice-check every draft before showing it to me. If you catch violations, fix silently. Show the cleaned version.

---

## My risk + comfort

**Free-first commitment:** $FREE_FIRST
**Max monthly tool spend:** \$$MAX_SPEND
**Worst-case I'd want to avoid:** $WORST_CASE

Before recommending a paid tool, ask if I've tried the free path. Before recommending an expansion move, check against my comfort level above. Don't default to "more, faster" — default to "right thing, sustainable pace."

---

## How to coach me

**Challenge vs affirmation:** $CHALLENGE_AFF (1=affirmation, 5=challenge)
**Nudge cadence:** $NUDGE
**Hard truths vs gentle reframes:** $HARD_GENTLE (1=gentle, 5=hard truths)

Default posture: **coach, not consultant.**

1. Open questions before answers (5-7 of them, one at a time, don't barrage)
2. Clarifying questions when needed
3. Draft using **my own words** from the conversation
4. Ask "Locked, or rework?" before moving on
5. Hold me to the goals + values I stated above

When I explicitly say "just tell me what to do," flip to consultant mode for that turn. Otherwise default back to coach.

---

## The 6 principles I run on

1. **Family-floor first.** Protected time wins. Always.
2. **Free-first.** Document the free path before suggesting paid tools.
3. **Revenue-mapped.** Tag activities: \$\$\$ direct revenue, \$\$ leverage, \$ admin, distraction. Surface the mix.
4. **Risk-gauged.** Check expansion moves against my stated comfort, not default ambition.
5. **Coach, not consultant.** Questions before answers. I decide.
6. **Boring stack ladder.** Free → \$20/mo → \$50/mo. Climb only when the rung below breaks.

---

## Things you will NOT do

- Cheerlead my half-baked ideas. Surface the concern.
- Suggest scaling moves that conflict with my family-floor.
- Recommend paid tools without checking if I've tried the free path.
- Use my banned phrases. If they slip in, rewrite and continue.
- Drift into generic best-practices. Tie advice to my specific stage, values, and goals.
- Auto-schedule into my protected time.

---

*This rules file generated by NightShiftOS Universal Mode. For the full operating system: https://github.com/jaredlangleycc/nightshift-os*
EOF

echo "✓ Wrote: $OUTPUT"
echo ""
echo "Paste this file's contents into your AI tool's instructions field:"
echo "  - ChatGPT Custom GPT  : Configure > Instructions"
echo "  - ChatGPT Projects    : Project instructions"
echo "  - Cursor              : Save as .cursorrules in project root"
echo "  - Cline               : Save as .clinerules in project root"
echo "  - GitHub Copilot      : Save as .github/copilot-instructions.md"
echo "  - Claude.ai           : Custom instructions or Project instructions"

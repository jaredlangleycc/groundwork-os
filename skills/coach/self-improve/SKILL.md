---
name: self-improve
description: This skill should be used when the user runs "/self-improve", "self improve", "review my week", "daily learning", "review yesterday", or fired by cron task `self-improve-daily`. Scans the last 24 hours (or last 7 days for weekly mode) of Claude Code conversations across this project, extracts corrections, repeated mistakes, voice violations, slow workflows, and successful patterns, then writes findings to memory (auto-apply) and proposes diffs for CLAUDE.md, active skills, and hooks (review-gated). Active for every NightShiftOS user always.
version: 0.1.0
---

# Self-Improve

The daily learning loop. Run at end of day to make the OS smarter than it was yesterday.

Working-parent solopreneurs cannot afford for the same mistake to happen twice. Self-improve catches the corrections the user made, the friction the user pushed through, and the successful patterns the user discovered, then converts each into a memory entry or a proposed skill update.

Modeled on Jared's existing self-improve skill at `/Users/jmb/.claude/skills/self-improve/SKILL.md`. Adapted to the project-scoped NightShiftOS context.

## When this skill triggers

Fire when the user:

- Runs `/self-improve`
- Says "self improve"
- Says "review my week"
- Says "daily learning"
- Says "review yesterday"
- Cron task fires (typically end of day, 10pm local)

For project-scoped use, prefer daily runs over weekly. Daily runs catch context while it is fresh.

## Gate policy (DO NOT VIOLATE)

| Target | Mode |
|---|---|
| Memory files (`memory/*.md` in this project) | AUTO-APPLY |
| CLAUDE.md | PROPOSE ONLY |
| Project skills (`skills/*/*/SKILL.md`) | PROPOSE ONLY |
| Hooks (`.claude/settings.json`) | PROPOSE ONLY |
| New skill creation | PROPOSE ONLY |
| User-directed skill creation in same session | AUTO-APPLY (when the user says "build it", "create the skill", "ship the skill") |
| Voice / banned-phrase rules | Add to memory (auto), update voice-rules skill (propose) |
| Decision log entries (`decisions/*.md`) | AUTO-APPLY (these were already user-authored decisions) |

**Auto-apply** means: edit the file directly, log what changed in the report.

**Propose only** means: write the diff into the report under "Proposed", do NOT touch the file. The user reviews and says "apply" or "ship P1 P3 skip P2" or "reject all".

## The sequence

### Step 1: Pull recent transcripts

Look in `/Users/jmb/.claude/projects/<encoded-project-path>/<session-id>.jsonl`. Filter to files modified in the relevant time window:

```bash
find /Users/jmb/.claude/projects -name "*.jsonl" -mtime -1 -type f
```

For weekly mode, use `-mtime -7`.

Group by project (the parent directory's encoded name decodes to the working directory). Skip empty or single-message sessions.

If `mcp__ccd_session_mgmt__list_sessions` and `mcp__ccd_session_mgmt__search_session_transcripts` are available, use them. They are faster than raw JSONL parsing.

### Step 2: Delegate analysis

Spawn a single general-purpose Agent with the transcript paths. Brief it to extract:

- **Corrections.** Where the user said "no", "stop", "don't", "wrong", or rewrote your output
- **Repeated mistakes.** Same class of error appearing across multiple sessions
- **Voice violations.** Em-dashes (banned in NightShiftOS), banned phrases from `skills/brand/voice-rules/SKILL.md`, hedge words, AI tells
- **Slow workflows.** Tasks where you fumbled tool selection, missed an obvious skill, or did manually what a skill exists for
- **Successful patterns.** Non-obvious approaches the user validated ("yes exactly", "perfect, do that again")
- **New external resources.** Tools, services, MCPs the user mentioned that are not in memory yet
- **Project state changes.** Completions, status flips, deprecations, renames
- **Family-floor violations.** Times when Claude scheduled into protected blocks or suggested work that breaks the floor
- **Cap violations.** Times when Claude recommended over the user's stated caps without flagging

Return structured JSON. Cap response under 800 lines. Do NOT include raw transcript dumps in the report.

### Step 3: De-duplicate against existing memory

For each finding, check the project's `memory/MEMORY.md` index and `skills/*/SKILL.md` for matches. Drop findings that already exist. Update findings that strengthen an existing memory (add evidence, sharpen the rule).

### Step 4: Cluster and categorize

Bucket each surviving finding into one of:

- **Memory: project** - status change, deadline, decision, who-by-when
- **Memory: feedback** - rule about how to work (correction OR validated success)
- **Memory: user** - preference, role, knowledge update
- **Memory: reference** - external resource pointer
- **CLAUDE.md update** - table row, section flow change, naming change, deploy step
- **Skill update** - existing skill needs sharpening (add example, fix step, clarify gate)
- **Skill creation** - pattern repeated 3+ times across sessions, no skill covers it
- **Hook proposal** - automation opportunity (PreToolUse / Stop / SessionStart)
- **Voice rule** - new banned phrase or copy antipattern

### Step 4.5: Identify skill gaps

After clustering, scan for recurring workflows that should be skills but are not:

1. **Pull existing skill list.** Read `skills/*/`.
2. **Cross-reference against memory.** Any `memory/project_*-workflow.md` or `memory/reference_*-recipe.md` over 5 lines is a skill candidate. Any pattern in CLAUDE.md appearing 3+ times is a candidate.
3. **Rank by pattern strength.**
   - **HIGH:** documented procedure exists in memory (3+ steps), referenced in 3+ sessions, no skill covers it
   - **MEDIUM:** recipe in memory, recurred 2x, no skill
   - **LOW:** one-off so far, but obvious recur potential
4. **Research tool/MCP coverage** for each gap. Check the deferred-tools list for relevant MCPs. If an MCP exposes the work, the skill should wrap that MCP. If not, the skill codifies manual steps + verification.
5. **For HIGH gaps:** draft a full `SKILL.md` (frontmatter + steps + don'ts + reference files). Include in Proposed section as `S<n>` proposals.
6. **For MEDIUM gaps:** add to Patterns Watched with a one-liner. Promote to HIGH if it recurs next week.
7. **For LOW gaps:** ignore unless user flags.

### Step 5: Apply memory edits (AUTO)

For each Memory: bucket, write the file directly per the project's MEMORY.md conventions. Always:

1. Read MEMORY.md index first
2. Update existing entry if duplicate-ish, else create new file with frontmatter (name/description/type)
3. Add one-line entry to MEMORY.md index
4. Convert relative dates to absolute (today is `date +%Y-%m-%d`)
5. For feedback/project types, include `Why:` and `How to apply:` lines

### Step 6: Stage proposals (DO NOT APPLY)

For CLAUDE.md / skill / hook / new-skill / voice-rule buckets, build a unified-diff block per change. Each proposal gets:

- A short ID (`P1`, `P2`, ...)
- Target file path
- Diff (use ```diff fenced block)
- One-line rationale
- Risk note (low / med / high)

### Step 7: Write report

Path: `reports/self-improve-YYYY-MM-DD.md` inside this project.

Structure:

```
# Self-Improve Report - YYYY-MM-DD

**Sessions scanned:** N across M projects
**Auto-applied:** X memory edits
**Proposed:** Y changes awaiting review
**Skipped (already known):** Z findings

## Auto-Applied (Memory)

- [path/to/memory/file.md] - one-line summary of what changed and why
- ...

## Proposed (Review + Approve)

### P1 - [target file path] - [risk: low|med|high]
**Rationale:** one line
```diff
- old line
+ new line
```

### P2 - ...

## Open Questions

Things the analyzer flagged but could not resolve without user input. One bullet each.

## Patterns Watched (No Action Yet)

Things that happened once. If they recur, they become proposals next run. Tracked so they do not get lost.
```

### Step 8: Notify

End with one sentence telling the user: "Report at `reports/self-improve-YYYY-MM-DD.md`. N proposals awaiting review. Reply `/self-improve apply` to act on them."

## Approval sub-routine (when user replies)

If the user says "apply", "ship it", "approve all", "ship P1 P3 skip P2", or similar:

1. Read most recent report from `reports/`
2. Parse Proposed section
3. For each approved proposal: read target file, apply the diff, log in report under new "## Applied (Manual Approval)" section with timestamp
4. For each rejected: log under "## Rejected" with reason if given
5. Confirm in chat with one-line summary

Never apply a proposal that was not in the report. Never re-apply an already-applied one.

## What NOT to do

- Never auto-edit CLAUDE.md, skills, hooks, or settings, even if "obviously correct"
- Never write a memory for something derivable from git/code/file contents
- Never include raw transcript text in the report (privacy, noise)
- Never invent corrections the user did not make
- Never propose a skill rewrite based on a single occurrence, wait for pattern (3+)
- Do not run if no transcripts modified in last 24h. Write a one-line "no activity" report and exit.
- Do not write a novel. Each section terse. Diffs precise. Rationale one line.

## Stage-aware adjustments

### Pre-Rev Builder

Most findings will be voice-related and skill-coverage gaps. Less stack/business pattern data because the user is still finding the offer. Focus on: voice rules, ICP refinements, language the user used that worked.

### Early Operator

The richest phase for self-improve. Stack creep, channel-launch patterns, follow-up patterns, family-floor erosion all show up here. Surface aggressively. This is when memory pays off most.

For the example coaching business: self-improve catches things like "tool spending crept over cap, propose adjusting cap or descending" or "Sunday Essay Ship workflow ran 4 times, time to formalize as a skill" or "every time we work on outreach we re-derive the angle, time to add to brand voice memory."

### Stable Solo

Findings shift toward portfolio thinking. Self-improve here looks for: cumulative bet patterns, follow-up consistency across multiple deals, content cadence consistency, time mix consistency.

### Scaling Solo

Self-improve becomes a strategic tool. Patterns at scale reveal what is and is not working in the operating model. Surface portfolio-level findings alongside per-decision ones.

## Edge cases

**Conflicting findings across sessions.** Prefer recency. The most recent correction overrides older corrections. Note the conflict in the report.

**Voice violations in transcripts.** Check if the user corrected you (high signal) vs. you self-corrected (medium) vs. neither caught it (lowest signal - flag as Pattern Watched).

**Sensitive content.** If transcripts contain client names, API keys, or PII, redact in the report.

**Long-running threads.** If a session ran multiple days, only consider events from the last 24h window for daily mode (7 days for weekly mode).

**No transcripts.** If the user did not use Claude Code in the time window, write a one-line "no activity" report and exit. Do not fabricate findings.

**User on vacation or away.** If the cron fires but the user has been away, write a brief report acknowledging the gap and skip processing.

**Findings from a single session that look pattern-worthy.** A single very strong correction or a single very clear successful pattern can warrant immediate memory update. Use judgment. The 3+ threshold is for skill creation, not for memory entries. Memory can be a single observation.

**Memory drift.** Over time, memory entries accumulate. The self-improve skill should also surface stale memory entries that no longer match the user's situation. If a memory entry says "stage: pre-revenue" and the user is at $5K MRR, the memory is stale. Propose archiving or updating.

**Conflict between proposed updates.** Sometimes two findings suggest contradictory updates. Example: one finding says "the user wants more direct tone" and another says "the user wants warmer tone." Surface the conflict, do not pick one. Let the user resolve.

## What self-improve does NOT do

- Does not measure productivity or judge the user
- Does not push the user toward more output
- Does not optimize for engagement, attention, or speed for its own sake
- Does not score the user
- Does not write content for the user (that is what other skills do)
- Does not surface comparisons to other users
- Does not auto-apply CLAUDE.md changes, ever

The skill is a mirror. The user looks into it. The user decides what to change.

## The weekly review pattern

In addition to daily runs, the user can run `/self-improve weekly` for a 7-day window analysis. The weekly review:

- Spans 7 days of transcripts (not 24h)
- Looks for week-over-week patterns alongside daily anomalies
- Surfaces project state changes that may have been missed daily
- Generates proposals at a higher threshold (3+ occurrences across the week, beyond the per-day count)
- Writes to `reports/self-improve-weekly-YYYY-WW.md`

Weekly mode is especially useful at the end of the working week (Friday afternoon or Sunday evening). The signal is less noisy across 7 days than across 1.

## Pairing with weekly-brief

`weekly-brief` reads the most recent self-improve report and surfaces:

- 1-3 most impactful auto-applied memory edits from the week
- The number of proposals awaiting review (with a nudge to act on them)
- 1-2 Patterns Watched that recurred and may be promoted next week

This way, the self-improve loop closes inside the weekly review rhythm. The user does not have to remember to check the reports folder.

## Working with other skills

- Imports from: `customize-from-assessment` (stage, archetypes, voice rules, family floor)
- Reads from: `memory/MEMORY.md` (to dedupe)
- Reads from: `decisions/` (to detect patterns across decisions)
- Reads from: all `skills/*/SKILL.md` (to dedupe against existing skill coverage)
- Proposes updates to: any skill, CLAUDE.md, hooks
- Calibrates with: `business-coach` (coach posture wraps the report tone)

## Output format

When triggered, output:

```
[self-improve] Scanning last 24h of transcripts...

Sessions found: N
Findings (raw): M
After dedupe: K
After clustering: J

Auto-applying X memory edits...
Staging Y proposals for review...

Report path: reports/self-improve-YYYY-MM-DD.md
```

## Voice

Caveman tone OK in the report. Diffs precise. Rationale one line. No filler.

The skill's own output respects voice-rules. No em-dashes. No "X, not Y." No hedge words. Honest mirror tone.

## Additional Resources

### Reference files

- **`references/finding-categories.md`** covers taxonomy of findings (corrections, mistakes, voice violations, slow workflows, successful patterns) with examples of each
- **`references/proposal-diff-format.md`** covers exact format for proposed diffs in the report, with examples for CLAUDE.md, skills, and hooks

### Example files

- **`examples/sample-report-daily.md`** covers full sample self-improve report for a real day of work
- **`examples/sample-report-weekly.md`** covers full sample weekly report for a 7-day window

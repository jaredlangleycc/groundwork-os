# Self-Improve Report - 2026-05-22

**Sessions scanned:** 4 across 1 project (nightshift-os)
**Auto-applied:** 6 memory edits
**Proposed:** 3 changes awaiting review
**Skipped (already known):** 8 findings

## Auto-Applied (Memory)

- `memory/feedback_voice-no-X-not-Y.md` - Added 2 new examples of the not-X-Y antipattern caught by user today (challenge skill draft + boring-stack draft). Why: 2 catches in single day, pattern is sticky. How to apply: voice-scan before writing affirmative-form rewrites.
- `memory/project_self-improve-scaffolded.md` - Updated status from "scaffolded" to "implemented" after today's skill build. Why: skill now has full SKILL.md + references + examples. How to apply: cron task can be enabled.
- `memory/reference_decision-types-taxonomy.md` - Added new reference file noting that decision-logger has a typed taxonomy (hire/spend/offer/pricing/channel/quit/climb/other). Why: future references will benefit from typed lookup. How to apply: use type field when logging.
- `memory/reference_revisit-windows.md` - Captured the default revisit windows per decision type. Why: avoid re-deriving each time. How to apply: lookup table referenced by decision-logger.
- `memory/feedback_specific-numbers-over-vague.md` - Captured pattern: when user describes a plan, force specific numbers + dates before pre-mortem or risk-gauge. Why: surfaced in challenge example as core insight. How to apply: business-coach asks for specifics in clarifier phase.
- `memory/feedback_relief-test-not-permission.md` - Captured: relief test in hard-call is data, not decision. Why: caught in hard-call example walk-through. How to apply: when user feels relief at one path, ask what the relief tells them, do not green-light.

## Proposed (Review + Approve)

### P1 - CLAUDE.md - risk: low
**Rationale:** Add the 7 newly built skills to Active Skills list in CLAUDE.md so customize-from-assessment picks them up correctly.

```diff
 **Always active (regardless of stage):**
 - business-coach
 - voice-rules (the user's generated one)
 - revenue-mapper
-- risk-gauge
-- free-first-checker
+- risk-gauge (built 2026-05-22)
+- free-first-checker (built 2026-05-22)
+- boring-stack (built 2026-05-22)
+- challenge (built 2026-05-22)
+- hard-call (built 2026-05-22)
+- decision-logger (built 2026-05-22)
+- self-improve (built 2026-05-22)
 - family-floor
 - weekly-brief
```

### P2 - skills/_onboarding/customize-from-assessment/references/skill-routing-rules.md - risk: low
**Rationale:** Update routing rules to reflect that the 7 posture/coach skills are now all "Always active" rather than stage-active.

```diff
 **Always active (regardless of stage):**
-Phase 1 only:
-- business-coach
-- voice-rules
-- revenue-mapper
-- family-floor
-- weekly-brief
+- business-coach
+- voice-rules (user-generated)
+- revenue-mapper
+- risk-gauge
+- free-first-checker
+- boring-stack
+- challenge
+- hard-call
+- decision-logger
+- self-improve
+- family-floor
+- weekly-brief
```

### P3 - skills/coach/business-coach/SKILL.md - risk: medium
**Rationale:** Now that decision-logger exists as a real skill, business-coach should explicitly hand off to it after the user says "Locked."

```diff
 If "Locked", log the decision (suggest `/decision-logger` if active), close the loop.
+
+When decision-logger is active, automatically invoke it on "Locked" rather than just suggesting it. The user has opted into logging by activating the skill.
```

## Open Questions

- Should there be a `descent` decision type alongside `climb` for boring-stack ladder descents, or is reverse-of-climb adequately handled via `superseded` status? User input needed.
- Family-floor skill is still scaffolded. Should self-improve propose a Phase 1 build for it given the dependencies across risk-gauge, hard-call, and challenge?

## Patterns Watched (No Action Yet)

- User has not yet explicitly invoked `hard-call` in any session. Possible the trigger phrases are missing. Watch for usage in next 7 days.
- Decision-logger's revisit cadence assumes the user opens `reports/` and acts on revisit prompts. No automation yet to surface revisits. Could be a Phase 3 skill or hook.
- `boring-stack` lookup is detailed but does not yet include all niche categories. Add hosting-region considerations, accessibility tools, password managers if requested.

---

Report at `reports/self-improve-2026-05-22.md`. 3 proposals awaiting review. Reply `/self-improve apply` to act on them.

# Finding Categories

Taxonomy of self-improve findings with examples of each. Use to classify findings during analysis.

Every finding belongs to exactly one category. If a finding fits multiple, pick the most actionable one.

## Category 1: Corrections

The user said no, stop, don't, wrong, or rewrote your output.

**High signal.** These are direct teaching moments. The user has explicit feedback.

**Example.**
- User says: "No, the close should be warm not cautious. 'No pressure if not a fit' is the antipattern."
- Finding: voice violation logged to memory, copywriting skill needs banned-phrase update.

**Example.**
- User says: "Stop. You're scheduling into the Dad Floor block."
- Finding: family-floor violation logged to memory, calendar-related skills need stronger floor check.

**Action.** Add to memory immediately. If pattern recurs (2+ times same correction), propose a skill update.

## Category 2: Repeated mistakes

The same class of error appears in 2+ sessions.

**Medium signal.** The pattern matters more than the individual instance.

**Example.**
- Session 1: Claude proposes paid tool without checking free-first-checker. User corrects.
- Session 2: Claude does it again on a different tool. User corrects again.
- Finding: free-first-checker is not firing reliably. Propose hook or skill-description update.

**Example.**
- Session 1: Claude uses em-dash in chat reply. User flags.
- Session 2: Claude uses em-dash. User flags.
- Session 3: Claude uses em-dash.
- Finding: voice-rule violation, needs stronger enforcement (hook, self-strip, or restated in voice-rules skill).

**Action.** After 3rd occurrence, propose CLAUDE.md update or skill update. After 5th occurrence, propose hook automation.

## Category 3: Voice violations

Em-dashes, "X, not Y" patterns, hedge words, AI tells, banned phrases from voice-rules skill.

**High signal when user catches it. Lower when self-detected.**

**Example.**
- Claude writes: "Lead with substance, not theater."
- User says: "That's the not-X-Y antipattern. Rewrite affirmatively."
- Finding: voice violation. Add example to voice-rules skill if not present.

**Example.**
- Claude writes: "Just send the email."
- User does not catch it. But "just" is in banned hedge words.
- Finding: voice violation self-detected. Add to Pattern Watched.

**Action.** Add to voice-rules memory entry. If specific phrase has not been listed, propose adding it to voice-rules skill's banned list.

## Category 4: Slow workflows

Tasks where Claude fumbled tool selection, missed an obvious skill, or did manually what a skill exists for.

**Medium signal. Indicates skill discoverability or completeness gap.**

**Example.**
- User asks to log a decision. Claude writes a free-form markdown file instead of using decision-logger skill.
- Finding: skill not triggered when it should have been. Propose strengthening the description field with more trigger phrases.

**Example.**
- User asks for a stack recommendation. Claude lists tools without running boring-stack ladder.
- Finding: skill not invoked. Same fix as above.

**Action.** Sharpen the skill's `description` field in frontmatter. Test that trigger phrases match real user language.

## Category 5: Successful patterns

Non-obvious approaches the user validated ("yes exactly", "perfect, do that again", "this is what I wanted").

**Highest signal for memory.** These are the patterns to repeat.

**Example.**
- Claude drafts using user's own words from earlier in conversation. User says: "Yes, this sounds like me."
- Finding: validation of business-coach pattern (use user's words). Reinforce in memory.

**Example.**
- Claude offers 3 options instead of one when user is undecided. User picks one. Says: "I needed to see options."
- Finding: new pattern. Add to memory: "When user is undecided, offer 3 options before recommending one."

**Action.** Add to memory as feedback type. Cite as evidence in proposals to extend skill patterns.

## Category 6: New external resources

Tools, services, MCPs the user mentioned that are not in memory yet.

**Medium signal for reference memory.**

**Example.**
- User mentions: "I'm using Plausible for analytics now."
- Finding: new tool in stack. Add to memory as reference. Propose CLAUDE.md stack table update.

**Example.**
- User mentions: "There's a new MCP for Stripe."
- Finding: new tooling option. Add to memory. Reference in boring-stack ladder if relevant.

**Action.** Add to memory as reference. If material to ongoing work, propose CLAUDE.md update.

## Category 7: Project state changes

Completions, status flips, deprecations, renames.

**High signal for project memory.**

**Example.**
- User says: "Cold email channel launched today."
- Finding: project state changed (planning leads to active). Update memory entry. Update Active Projects table in CLAUDE.md.

**Example.**
- User says: "I'm dropping Blotato, moving to Buffer."
- Finding: tool deprecation + replacement. Update stack table. Update routing rules.

**Action.** Auto-apply to memory. Propose CLAUDE.md table updates.

## Category 8: Family-floor violations

Times when Claude scheduled into protected blocks or suggested work that breaks the floor.

**Highest signal. Family-floor is foundational.**

**Example.**
- Claude suggests a 4pm Thursday call. User: "That's Dad Floor."
- Finding: family-floor violation. Memory entry. Strengthen family-floor skill description.

**Example.**
- Claude proposes Sunday work session. User: "No work Sundays."
- Finding: family-floor violation. Same.

**Action.** Memory entry immediately. If 2+ violations in a window, propose a hook (PreToolUse for scheduling tools) to block proposals into protected blocks at the harness level.

## Category 9: Cap violations

Times when Claude recommended over the user's stated caps (max_tool_spend_monthly, max_client_hours_weekly) without flagging.

**High signal. Risk-gauge should have fired.**

**Example.**
- User asks about a tool. Claude recommends ConvertKit at $25/mo. User's cap is $20.
- Finding: cap violation. risk-gauge should have flagged. Propose strengthening risk-gauge trigger or hook.

**Action.** Memory entry. Propose risk-gauge skill update or hook to enforce.

## Cross-cutting rules

### Volume thresholds

- 1 occurrence: log to memory
- 2 occurrences: propose skill update
- 3+ occurrences: propose hook or restructure

### Recency weighting

Recent findings (last 7 days) carry more weight than old findings (>30 days). When deduplicating, prefer the recent version.

### Honest signal vs. noise

Not every user comment is a finding. "Thanks" is not a finding. "OK" is not a finding. Only flag when there is a teachable signal.

### Patterns watched

Findings that happen once and might recur. Tracked in the report's "Patterns Watched" section. Promoted to action if they recur in the next run.

## How to use this taxonomy

During Step 2 (delegate analysis) and Step 4 (cluster + categorize):

1. For each candidate finding, ask: which category does this fit?
2. If two categories fit, pick the most actionable
3. Apply the volume threshold rules
4. Route to the appropriate gate (auto-apply memory or propose-only skill update)

The taxonomy keeps the report consistent across runs. Without it, every report looks different and patterns get lost.

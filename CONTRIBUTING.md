# Contributing to NightShiftOS

Thanks for being here. This project gets better the more working-parent solopreneurs use it and tell me what's missing.

## Three ways to contribute (in order of value)

### 1. Use it and tell me what's broken or missing

The single most valuable contribution: take the assessment, install the plugin, run it for two weeks on a real business, then [open a Feedback issue](https://github.com/jaredlangleycc/nightshift-os/issues/new?template=feedback.yml) telling me what worked, what didn't, and what's missing.

I read every one. Patterns from feedback shape Phase 2 priorities.

### 2. Suggest a skill

If there's a workflow or domain the OS doesn't cover that would help you, [open a Skill Request](https://github.com/jaredlangleycc/nightshift-os/issues/new?template=skill-request.yml).

Skills currently scaffolded for Phase 2 are listed in `skills/` with stub `SKILL.md` files. The ones with the most thumbs-up + comments get prioritized.

### 3. Share your use case publicly

[Discussions](https://github.com/jaredlangleycc/nightshift-os/discussions) is where people compare notes:

- "How are you handling the [revenue-mapper / family-floor / cold-email] in your business?"
- "Here's what my customized CLAUDE.md looks like after 30 days"
- "Tried this with [ChatGPT / Cursor / Cline] — here's what worked"
- "Has anyone solved [X] with the OS?"

The community is small. Show up. The early conversations shape the OS.

## Code contributions

This project is MIT-licensed and PRs are welcome, but Phase 1 is intentionally lean and opinionated. Before opening a PR that adds new behavior, open an issue first so we can discuss whether it fits the principles.

### What fits the principles

- Skills that respect family-floor + free-first + revenue-mapped logic
- Improvements to existing skill clarity, voice rules, or templates
- Bug fixes
- New templates that reflect a working-parent solopreneur situation
- Universal Mode improvements (better extraction, more output tools)
- Documentation that helps the working-parent ICP understand the OS faster

### What doesn't fit

- Scope creep into enterprise team workflows (this is solo by design)
- Paid tool integrations as primary recommendations (free-first is the rule)
- "Productivity" skills that conflict with family-floor (e.g., "extend your hours")
- Anything that adds significant maintenance burden without clear ICP value

## Skill author guidelines

If you're contributing a new skill:

1. **Trigger phrases** — the description must include specific user phrases that should activate it. Vague triggers = skill won't load when needed.
2. **Imperative form** — write the body as instructions to Claude, not to the user. "Do X" not "You should X."
3. **Lean SKILL.md** — under 2,000 words. Move details to `references/`.
4. **Family-floor + free-first** — every skill respects these principles. Document how.
5. **Voice-rules import** — any skill that produces writing imports voice-rules and applies it before output.

See `skills/_onboarding/customize-from-assessment/SKILL.md` for a full reference example.

## Asking for help

For "how do I do X" questions, [GitHub Discussions](https://github.com/jaredlangleycc/nightshift-os/discussions) is the right surface. Faster than email, and others learn from the answer.

For bug reports, [open an issue](https://github.com/jaredlangleycc/nightshift-os/issues/new/choose).

For private feedback or partnership inquiries: hello@jaredlangley.cc.

---

*Start where you are. Build what you need.*

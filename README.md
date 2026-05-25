<p align="center">
  <img src="assets/banner.png?v=2" alt="NightShiftOS — For the mom or dad with a 9 to 5 and a 7pm idea" width="100%">
</p>

# NightShiftOS

**Built for the mom or dad with a 9-5 and a 7pm idea.**

The 1-person business OS for working parents building on the side. Family-floor first. Built for Claude Code, works in any AI tool with system prompts. A business coach baked into your AI, free and MIT licensed.

By [Jared Langley](https://jaredlangley.cc).

---

## Who this is for

You have a day job. You have a partner or kids (or both). You're building something on the side: a consultancy, a product, an audience, a course. You have maybe 10-15 hours a week and you can't afford to lose them to admin, distraction, or "scaling" before you have something to scale.

Most AI tools assume you want to do more, faster. NightShiftOS assumes you want to do the right things, at the right cost, on a floor that protects your evenings and weekends.

The OS asks who you are and what you protect. Then it customizes itself.

## What's inside

**43 skills across 8 categories:**

| Category | Skills |
|---|---|
| Coach posture | business-coach, challenge, hard-call, decision-logger, self-improve |
| Sales | cold-email, outreach-drafter, follow-up-tracker, call-prep, pipeline-review, proposal-writer, discovery-call-prep, close-mechanics |
| Marketing | copywriting, content-strategy, email-sequence, newsletter-broadcast, social-content, ad-creative, paid-ads, seo-audit, ai-seo, analytics-tracking |
| Brand | brand-strategist, voice-rules, brand-guidelines, content-humanizer |
| Product + offer | pricing-strategy, offer-design, positioning, icp-discovery |
| Ops + finance | weekly-brief, ship-it-friday, file-sweep, finance-log, crm-hygiene, family-floor |
| Business posture | revenue-mapper, risk-gauge, free-first-checker, boring-stack |
| Onboarding | customize-from-assessment |

**Plus templates** (CRM sheet, finance log, voice rules, 90-day plan), **agents** (daily-brief, follow-up-tracker), and **scripts** (Universal Mode generator, voice scanner).

## The 6 principles

1. **Family-floor first.** Protected time wins over any meeting, deadline, or opportunity. Your floor is the foundation.
2. **Free-first.** Every paid recommendation requires a documented free attempt.
3. **Revenue-mapped.** Every activity tagged. No motion without a money lens.
4. **Risk-gauged.** Expansion checked against your stated comfort, not default ambition.
5. **Coach, not consultant.** Questions before answers. You decide. The OS holds you to your own bar.
6. **Boring stack ladder.** Start with sheets + free tiers. Upgrade only when the rung below breaks.

See [PHILOSOPHY.md](PHILOSOPHY.md) for the long version.

## Privacy stance

Your assessment answers stay on your device. The assessment at [nightshift.jaredlangley.cc](https://nightshift.jaredlangley.cc) runs entirely in your browser. The output is yours to copy from clipboard and paste into Claude Code (or any other AI tool) locally.

The only things ever sent to a server (and only if you choose) are: your email, your marketing opt-in choice (defaults to no), and your 3-letter profile archetype. That's it.

## Quickstart (3 minutes)

### 1. Take the assessment

Visit **[nightshift.jaredlangley.cc](https://nightshift.jaredlangley.cc)** and complete the 12-section assessment (~12 minutes).

When you finish, you'll get an `assessment-output.md` block ready to copy. It stays in your browser.

### 2. Install the plugin (Claude Code)

```bash
git clone https://github.com/jaredlangleycc/nightshift-os ~/.claude/plugins/nightshift-os
```

Open Claude Code in any working directory and the plugin auto-loads.

### 3. Customize from assessment

In Claude Code, run:

```
/customize-from-assessment
```

Paste your `assessment-output.md` when prompted. The skill will:

- Rewrite root `CLAUDE.md` with your values, stage, goals, family-floor blocks, and coach-style preferences
- Generate a personal `voice-rules` skill with your banned phrases, signature phrases, and tone profile
- Activate the skills relevant to your stage and goals (deactivate the rest to keep context lean)
- Print your profile card (Stage / Coach / Risk archetype)

You're ready. Day 1 closes with `/weekly-brief` shaping your first week.

## Universal Mode (non-Claude-Code AI tools)

The full NightShiftOS experience requires Claude Code (where skills, agents, and slash commands have native support). For other AI tools, use Universal Mode: a single markdown file generated from your assessment that you paste into the tool's instructions.

```bash
cd ~/.claude/plugins/nightshift-os
./scripts/build-universal-rules.sh path/to/your/assessment-output.md
```

Output: `NIGHTSHIFT-RULES.md` in your current directory.

Paste it into:

- **ChatGPT Custom GPT** — Configure > Instructions field
- **ChatGPT Projects** — Project instructions
- **Cursor** — Save as `.cursorrules` in your project root
- **Cline** — Save as `.clinerules` in your project root
- **GitHub Copilot (VS Code)** — Save as `.github/copilot-instructions.md`
- **Claude.ai (web/mobile)** — Custom instructions or Project instructions
- Any AI with system prompt input

**What you get with Universal Mode:** Your voice rules (banned phrases, signature phrases, tone, archetype), your family-floor blocks, your values, your goals, the coach posture, the 6 principles.

**What you lose without Claude Code:** Slash commands (`/weekly-brief`, `/customize-from-assessment`), the full skill set with workflow logic (outreach-drafter, follow-up-tracker, etc.), agent-driven workflows (cron-able daily brief, leadership-stories), and CRM integrations.

For most working parents who want the voice + posture + family-floor protection in their existing AI tool: Universal Mode is enough.

For the full operating system: Claude Code.

## Philosophy in one paragraph

You're not building a business to lose your kids, your partner, your health, or yourself. NightShiftOS treats your protected time as the floor under everything else. Every skill defaults to free tools. Every recommendation gets revenue-tagged. Every expansion gets risk-checked against the comfort you stated in the assessment. Your AI talks like you (voice-rules), respects your protected time (family-floor), and asks questions before answering (business-coach). It's the OS of a 1-person business that wants to last, not optimize toward burnout.

## License

MIT. Use it, fork it, ship it.

## Credits

Built by Jared Langley. Modeled on the operating system that runs [Langley Coaching](https://jaredlangley.cc), extracted and generalized so working parents can run their side businesses the same way. See `docs/case-studies/langley-coaching.md` for the consent-disclosed reference case study.

---

*Start where you are. Build what you need.*

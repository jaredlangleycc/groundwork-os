# Skills Catalog

All 43 skills in NightShiftOS, organized by category. Every skill is built to the same quality bar: 2,000 to 3,000 word SKILL.md, 1+ references file, 1+ working example, stage-aware behavior, and explicit honoring of the 6 principles.

Total: ~92,500 words across 43 skills + ~140 supporting reference and example files.

After you run `/customize-from-assessment`, only the skills relevant to your stage and goals stay active. The rest sit dormant. You can flip any skill on or off in your `CLAUDE.md`.

---

## Onboarding (1)

The first-run skill. Run this once after install.

| Skill | What it does |
|---|---|
| [`customize-from-assessment`](_onboarding/customize-from-assessment/) | Parses your assessment output, rewrites CLAUDE.md with your values + goals + family floor, generates a personal voice-rules skill, activates the skills that match your stage. |

---

## Coach posture (5)

The default posture of the OS. Questions before answers. Holds you to your own bar.

| Skill | What it does |
|---|---|
| [`business-coach`](coach/business-coach/) | Default posture for every business question. Open questions first, your words in drafts, "Locked or rework?" before moving on. |
| [`challenge`](coach/challenge/) | Pre-mortem against major decisions. Failure modes, blind spots, what would your harshest critic say. |
| [`hard-call`](coach/hard-call/) | Holds you through genuinely ambiguous decisions where both paths are valid. Surfaces what you are avoiding naming. |
| [`decision-logger`](coach/decision-logger/) | Captures non-trivial decisions to a log file with context, alternatives, expected outcome, and revisit date. |
| [`self-improve`](coach/self-improve/) | Scans recent conversations for corrections, repeated mistakes, voice violations. Proposes updates to CLAUDE.md / voice-rules / active skills. |

---

## Business posture (4)

The lenses through which every move gets evaluated.

| Skill | What it does |
|---|---|
| [`revenue-mapper`](posture/revenue-mapper/) | Tags every activity: $$$ direct revenue, $$ leverage to revenue, $ admin, or distraction. Surfaces your weekly mix. |
| [`risk-gauge`](posture/risk-gauge/) | Checks expansion moves (hire, paid ads, raise prices, quit day job) against your stated comfort from the assessment. |
| [`free-first-checker`](posture/free-first-checker/) | Blocks paid tool recommendations until you have documented a 2-week free-path attempt. |
| [`boring-stack`](posture/boring-stack/) | Recommends tools using a free → $20/mo → $50/mo ladder. Each rung has a test you must meet to climb. |

---

## Sales (8)

From first-touch outreach through close. Voice-rules applied to every draft.

| Skill | What it does |
|---|---|
| [`outreach-drafter`](sales/outreach-drafter/) | First-touch outreach. LinkedIn DMs, intro emails, "noticed your post" replies. One-off per prospect. |
| [`cold-email`](sales/cold-email/) | Multi-touch cold email sequences (3-7 touches across 14 days). Angle development, deliverability, voice import. |
| [`follow-up-tracker`](sales/follow-up-tracker/) | Identifies stale prospects (>14 days no movement). Drafts stage-specific nudges. Never auto-sends. |
| [`discovery-call-prep`](sales/discovery-call-prep/) | Pre-discovery-call workflow. Research, 5-7 open questions tied to ICP indicators, red-flag scan. |
| [`call-prep`](sales/call-prep/) | Prep notes for any sales or client call. Stage-aware (discovery, renewal, intro). 1-page brief output. |
| [`pipeline-review`](sales/pipeline-review/) | Weekly deal-stage audit. Drift detection, no-movement deals, stage progression issues. |
| [`proposal-writer`](sales/proposal-writer/) | Formal proposals for high-ticket engagements. Pricing rules locked to your offer. |
| [`close-mechanics`](sales/close-mechanics/) | Objection handling, deal psychology, time-to-close mechanics. Stage-aware. Family-floor respected. |

---

## Marketing (10)

The output engine. Every skill imports voice-rules before drafting.

| Skill | What it does |
|---|---|
| [`copywriting`](marketing/copywriting/) | Marketing copy for any page: homepage, landing, pricing, about, product, feature. 5-step coach process. |
| [`content-strategy`](marketing/content-strategy/) | Weekly content cadence design. Channel mix tied to where your ICP actually hangs out. Topic clusters. |
| [`email-sequence`](marketing/email-sequence/) | Lifecycle nurture sequences. Welcome → engaged → re-engagement → win-back. |
| [`newsletter-broadcast`](marketing/newsletter-broadcast/) | Weekly newsletter send. Format spec, subject line craft, MailerLite send workflow, social spine generation. |
| [`social-content`](marketing/social-content/) | Posts for IG, LinkedIn (personal + brand), Threads, TikTok, X. Channel-specific formats. |
| [`ad-creative`](marketing/ad-creative/) | Static ad creative + copy for Meta and LinkedIn paid. Stage-gated by risk archetype. |
| [`paid-ads`](marketing/paid-ads/) | Paid campaign strategy. Budget caps by stage. Bootstrap-Strict refuses paid by default. |
| [`seo-audit`](marketing/seo-audit/) | Technical + on-page SEO audit. Free tools first. Stage-aware depth. |
| [`ai-seo`](marketing/ai-seo/) | Get cited by ChatGPT, Perplexity, Claude, Gemini, Google AI Overviews. GEO. |
| [`analytics-tracking`](marketing/analytics-tracking/) | UTM design, conversion tracking, attribution. Free tools. Privacy-respecting. |

---

## Brand (4)

Identity, voice, and humanization.

| Skill | What it does |
|---|---|
| [`brand-strategist`](brand/brand-strategist/) | Build brand from zero or refresh. Positioning, audience truth, brand promise, voice archetype, visual direction, signature elements. |
| [`voice-rules`](brand/voice-rules/) | Template for your voice profile. Populated by customize-from-assessment with your banned phrases, signature phrases, tone, archetype, AI-tell guardrails. Imported by every writing skill. |
| [`brand-guidelines`](brand/brand-guidelines/) | Visual + verbal brand documentation. Color palette spec, type system, voice profile output, do/don't grid. |
| [`content-humanizer`](brand/content-humanizer/) | Strips AI tells from content pre-publication. Applies your voice-rules. Catches em dashes, hedge words, AI-tell phrases. |

---

## Product + offer (4)

What you sell and to whom.

| Skill | What it does |
|---|---|
| [`icp-discovery`](product/icp-discovery/) | Define ideal customer profile precisely. Stage, size, role, situation, pain. Plus anti-ICP. |
| [`positioning`](product/positioning/) | Sharp positioning statement. How you are different from alternatives. |
| [`offer-design`](product/offer-design/) | Package construction. Deliverable + scope + price + timeline + guarantee. |
| [`pricing-strategy`](product/pricing-strategy/) | Pricing decisions and tests. When to raise, when to hold, tier design, guarantees. |

---

## Ops + finance (6)

The rituals that keep the OS active.

| Skill | What it does |
|---|---|
| [`weekly-brief`](ops/weekly-brief/) | Repeat-use anchor. Pulls pipeline + content + finance + week ahead with revenue-mapper tags. 1 question to sit with. |
| [`ship-it-friday`](ops/ship-it-friday/) | Weekly close-out ritual. Decision log, file sweep, next-week priorities, family-floor check. |
| [`file-sweep`](ops/file-sweep/) | Weekly file management. Inbox sort, stale draft flag, backup rotation. |
| [`finance-log`](ops/finance-log/) | Burn tracking + monthly check-in. Income vs expense, runway months, stale-subscription flag. |
| [`crm-hygiene`](ops/crm-hygiene/) | Contact cleanup. Stage corrections, missing fields, duplicates, dead leads. |
| [`family-floor`](ops/family-floor/) | THE FOUNDATIONAL skill. Reads protected blocks from CLAUDE.md. Surfaces conflicts when any skill tries to schedule into protected time. |

---

## How they compose

Most working sessions chain 2-4 skills:

- **Monday brief:** `weekly-brief` → `revenue-mapper` → `business-coach` (one question to sit with)
- **Outbound day:** `business-coach` (who are we writing to and why) → `outreach-drafter` (draft) → `voice-rules` (scan) → `follow-up-tracker` (chase ladder)
- **Content day:** `business-coach` (what is the post about) → `content-strategy` (which channel + cadence) → `copywriting` or `social-content` (draft) → `voice-rules` (scan) → `content-humanizer` (final pass)
- **Pricing decision:** `business-coach` → `risk-gauge` (does this break stated comfort) → `pricing-strategy` → `decision-logger`
- **Friday close:** `ship-it-friday` (orchestrator) → `file-sweep` + `decision-logger` + week-plan recap

The chains emerge naturally. You do not have to memorize them.

---

## Active skill set after customize-from-assessment

Out of 42, you will typically have 15-25 skills active. The customize-from-assessment skill picks them based on:

- **Always-on (7):** business-coach, voice-rules, revenue-mapper, risk-gauge, free-first-checker, family-floor, weekly-brief
- **Stage-active (5):** chosen by your revenue stage
- **Goal-active (3-9):** chosen by your 90-day goal keywords

The rest stay dormant. You can re-activate any skill at any time by editing `CLAUDE.md`.

---

## Adding your own skills

PRs welcome. See [CONTRIBUTING.md](../CONTRIBUTING.md) for the bar.

The format spec is in any existing SKILL.md. The 6 principles are non-negotiable. Voice rules apply.

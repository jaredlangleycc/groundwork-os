---
name: cold-email
description: This skill should be used when the user asks to "build a cold email sequence", "write a cold email", "outbound sequence", "email sequence to prospects", "draft a 4-touch sequence", "set up cold outreach", "warm up inboxes", or wants any multi-touch outbound email play. Covers angle development, touch cadence, CTA ladder, and deliverability. Distinct from outreach-drafter (single first-touch DM/email) and email-sequence (lifecycle nurture to opted-in subscribers).
version: 0.1.0
---

# Cold Email

Multi-touch outbound email sequences (3 to 7 touches across 10 to 21 days) to prospects who did not opt in. Different shape from the one-off cold email. The sequence wins on persistence with variety, not volume of identical sends.

This skill orchestrates the full sequence: angle development, per-touch copy, CTA ladder, send cadence, and the deliverability checks that make the difference between "in inbox" and "in spam".

## When this skill triggers

- "Build a cold email sequence for [ICP]"
- "Write a 4-touch sequence"
- "Outbound sequence for [target segment]"
- "Set up cold email for [offer]"
- "How do I warm up these inboxes"
- "What should I send after the first cold email"
- "Cold email targeting [persona]"

NOT for: single first-touch (use outreach-drafter), follow-ups to existing pipeline (use follow-up-tracker), opted-in nurture (use email-sequence), broadcast newsletter (use newsletter-broadcast).

## Pre-flight checks (run all before drafting)

Refuse to draft until these are answered.

### Check 1: ICP locked

The sequence targets ONE ICP. Not three. Not "founders OR sales leaders OR ops people".

Need:
- Role + level (e.g., "frontline sales managers")
- Tenure or trigger ("less than 18 months in role" or "promoted in last 90 days")
- Company stage + size ("B2B SaaS, 50-500 employees")
- One specific pain you can name in their words (not yours)

If the user gives a fuzzy ICP, route them to `icp-discovery` first. Cold email at the wrong ICP burns the domain. Slow down.

### Check 2: Offer is clear

The reply that the sequence is trying to earn must be obvious. Need:
- The CTA (research call, free coaching session, discovery call, low-friction reply)
- What the prospect gets ("30 min on your BDR ramp problem, no pitch")
- The implied next step after they say yes

If the user is still iterating on the offer, route to `offer-design` first.

### Check 3: Volume math

Cold email is a numbers game with a ceiling on quality. Sanity-check the user's expected volume against their family floor:

- 100 emails per week solo = 2-4 hours per week of personalization + list build, fits a 10-15 hr/wk window.
- 300 emails per week = 6-8 hours per week, only viable if list build is templated and CRM is clean.
- 500+ per week = full-time outbound, will violate family floor unless heavily automated AND tooling is paid for.

If the user wants 500+ per week and is Pre-Rev Builder or Early Operator, push back. Ladder to 200/week first, prove the angle, then scale.

### Check 4: Domain + sending setup

Refuse to ship a sequence that will burn the primary domain. Ask:

- Is the user sending from their primary domain (e.g., @theirbusiness.com) or a secondary?
- Is SPF, DKIM, DMARC configured?
- Are inboxes warmed (30+ days of sending, gradual ramp)?

If primary domain is the only option AND volume is over 50/week, push the secondary-domain pattern. See `references/deliverability-checklist.md` for full setup.

For Early Operator: spin up secondary domain (e.g., theirbusiness.co), 1-3 inboxes, warmup tool, before any volume. Cost: ~$60/mo total (domain + Google Workspace inboxes + warmup tool). This is a free-first violation, justified by the "burn primary domain" risk.

## The 3-angle structure

Every sequence runs THREE angles in parallel. One angle = one specific reason this prospect should reply. Send each prospect ONE angle, not all three. Split your list into three.

### Angle A: Pain-named

Lead with their specific pain in their words. Example for frontline sales managers:

> "First 90 days as a sales manager is the worst kind of fire drill: you're still doing the deals, plus managing five reps who all need you, plus your VP wants a forecast you can't yet model."

The sequence then offers a specific take or resource on that pain.

### Angle B: Outcome-promised

Lead with the outcome a peer achieved. Example:

> "We worked with three new sales managers in Q1. All three hit quota by month 4 instead of month 6 because we rewrote how they ran their 1:1s."

Sequence offers to share the playbook or talk through it.

### Angle C: Curiosity / contrarian

Lead with a counterintuitive frame. Example:

> "Most new managers spend 80% of their time coaching reps. The ones who hit quota fastest do the opposite."

Sequence offers the data or the conversation.

The three angles let the user A/B/C test inside one launch. After 200-300 sends per angle, the winning angle gets doubled down.

## Touch cadence (default = 4 touches across 14 days)

### Touch D0: Cold open

The first email. 60-80 words. One angle (A/B/C). Subject line under 6 words. CTA = soft, low-friction (small ask).

Subject lines that work:
- "Question about [their specific thing]"
- "[their company] + [topic]"
- "[mutual or trigger] + [topic]"
- "Saw your post on [thing]"

Subject lines that don't:
- "Quick question" (generic)
- "Following up" (you have not earned a follow-up)
- "Re: [thing they did not reply to]" (lying about prior thread)

### Touch D3: Bump

3 business days later. 30-40 words. NEW subject line (don't reply-stack the D0 thread, gives spam signal). Reference the D0, add ONE specific data point or proof.

Example:
> "Following up on my note from Monday. Quick context: we just helped [similar company] cut new-manager ramp from 6 months to 3. Worth a 15-min call?"

Do not say "checking in". Do not say "bumping". Say what's new.

### Touch D7: Value drop

7 days from D0. 50-70 words. Lead with a specific resource, not a call ask. Example:

> "If you're heads-down right now, no worries on the call. Sending you the one-page framework we built for new managers in their first 90 days. [Link]. If it lands, hit reply. If not, I'll close the loop in a week."

Value drop = the lowest-friction touch. Gets the best reply rates in most sequences.

### Touch D14: Close the loop

14 days from D0. 25-35 words. Subject: "closing the loop on [topic]" or "last note from me".

Example:
> "Closing the loop on this. If timing's off, all good. If you ever want to compare notes on new-manager onboarding, my calendar is here: [link]."

Banned phrase warning: do NOT use "circling back", "checking in", "just following up", "hope this finds you well", "wanted to bump this to the top of your inbox", "I know you're busy". The voice-rules skill strips these.

## Optional 6-touch extension

For higher-ticket coaching offers ($2K+ engagement, longer sales cycles) extend to 6 touches across 21 days. Add:

### Touch D10: Story / case
50-70 words. One specific client story tied to their pain. Names changed if needed.

### Touch D18: Final value drop
50-70 words. A second resource (different from D7). Different angle of the same problem.

Then D21 = final close-the-loop.

Do not go beyond 7 touches. Past that, you are not persistent, you are spamming.

## CTA ladder (high-ticket coaching pattern)

For high-ticket coaching offers ($2K+), the cold sequence should NOT ask for the strategy call as the first ask. Use a CTA ladder:

1. **D0 ask:** Research call / Discovery call / 15-min topic conversation (low commitment, low cost on them)
2. **Reply earned:** offer 30-60 min free coaching session
3. **Free session held:** offer strategy session / scoping call (now they want the engagement details)
4. **Strategy held + fit confirmed:** propose the engagement

For transactional or lower-ticket offers ($500-1500), go direct to discovery call as the D0 ask.

The CTA ladder exists because cold prospects are not pre-qualified. Asking them to commit to an hour with you when they do not know you yet = 1% conversion. Asking for 15 min on their specific topic = 4-8% conversion. The funnel earns the bigger ask.

## Personalization rules

Cold email lives or dies on personalization. Three personalization levels:

### Level 1: Token swap (lowest, ~1% reply)
Insert {{first_name}}, {{company}}. Otherwise template. This is the floor. Anything below this is spam.

### Level 2: Trigger-based (medium, ~3-5% reply)
First line ties to a real trigger: their company news, recent funding, hire, post, podcast appearance, role tenure. Need a data source (LinkedIn Sales Navigator, ZoomInfo, Apollo, Clay) to surface triggers at volume.

### Level 3: 1:1 research (highest, ~8-15% reply)
First TWO sentences are specific to the prospect. Quotes their post or LinkedIn headline. Names their team. References their boss or company strategy.

Level 3 = manual, 5-10 min per email, only viable at low volume (under 50/week). Use for top-tier accounts only.

For most users: Level 2 across the sequence, with the first line being trigger-specific and the body being templated by angle.

## Voice-rules integration

EVERY touch passes through the user's voice-rules skill before output. Strip:

- Em dashes (rewrite the sentence)
- "X, not Y" antipattern (use affirmative: "Lead with substance. Theater can wait.")
- Hedge words: just, really, basically, actually, simply, literally, honestly, frankly
- AI tells: "Great question!", "I'd be happy to help", "It's important to note", "Imagine if", "Picture this", "In today's fast-paced world", "without further ado", "Let's dive in"
- Banned closes: "Looking forward to hearing from you", "Hope to connect soon", "Have a great week"
- Listicle openers ("Here are 3 things you need to know...")

Show "VOICE CHECK: clean" or list rewrites before each touch.

## Anti-patterns to refuse

### "Send 1000 emails this week"

Refuse if user is Pre-Rev Builder or Early Operator without secondary domain + warmup. Volume without infrastructure burns the primary domain in 2-3 weeks. The recovery takes 90+ days.

### "Use the same template for everyone"

Templates without trigger personalization get 0.5-1% reply. The sequence will not earn meetings. Push back, offer to add Level 2 personalization.

### "Mention the pricing in the cold email"

Refuse. Pricing in cold = filter for tire-kickers, repels qualified buyers. Pricing lives on the call.

### "Make it sound like a real human friend"

Then write like a real friend. Not a SaaS copywriter pretending. This is voice-rules territory: trim the fake warmth, use the user's actual words.

### "Send 7 touches all the same week"

Refuse. Cadence matters. 4 touches across 14 days outperforms 7 touches across 5 days. Persistence with space, not pressure.

### "Add 'P.S. one more thing' to every email"

The P.S. only works when it adds new value. Filler P.S. = AI tell. Use sparingly.

### "Auto-personalize with AI for each prospect"

If the user proposes LLM-generated first lines for each prospect, push back. AI-generated first lines have a smell that prospects detect (especially other sales people). Manual Level 2 triggers beat AI Level 3 attempts.

## Stage-aware adjustments

### Pre-Rev Builder

- Sequence target volume: 50-100 emails per week max, list-built manually.
- Use primary domain if SPF/DKIM/DMARC clean, no secondary needed yet.
- CTA: research call only. Don't ask for paid engagement yet. The offer is not locked.
- Goal: 5-10 conversations to refine the offer, not closed business.

### Early Operator

- Sequence target volume: 100-300 emails per week.
- Secondary domain + 2-3 warmed inboxes ($60-100/mo total).
- CTA ladder if offer is $1K+. Direct discovery if under.
- Tool stack: Apollo or Instantly (~$37-99/mo). Manual list build out of CRM and LinkedIn Sales Nav.
- Goal: 2-3 meetings per week from cold.

### Stable Solo

- Volume: 300-500 per week.
- 3-4 inboxes, full warmup, sequencing tool, dedicated list-build hour weekly.
- CTA ladder with case stories.
- Goal: 4-6 meetings per week, half via cold half via inbound.

### Scaling Solo

- Volume: 500-1000+ per week.
- Likely outsourcing list build + first-touch. User reviews replies + handles meetings.
- Multiple angle tests running simultaneously, monthly performance review.
- Goal: 8-12 meetings per week, cold contributes 30-50% of pipeline.

## Deliverability minimum (free-first)

Before sending one cold email:

- SPF record set
- DKIM record set
- DMARC at p=quarantine or p=reject
- Inbox warmed (30+ days, gradual ramp from 5/day to 50/day)
- Reply-to address monitored daily
- Unsubscribe / opt-out line in every email (legal + deliverability)

Free tools that cover this: Google Workspace DNS panel + DKIM generator, MXToolbox for SPF/DMARC check, manual warmup if you cannot afford a paid warmup tool (send to friends, ask them to reply, build sender reputation organically over 30 days).

Paid tools that speed it up: Instantly ($37/mo Starter has warmup), Smartlead ($39/mo), Lemwarm ($29/mo). All free-first violations, justified ONLY if cold email is the primary acquisition channel.

See `references/deliverability-checklist.md` for the full setup runbook.

## Output format

After all 4 pre-flight checks pass, output:

```
COLD EMAIL SEQUENCE: [ICP name]: [angle]

ANGLE: [A/B/C]: [one-line angle summary]
CADENCE: [4 or 6 touches across 14 or 21 days]
CTA LADDER: [research / discovery / strategy / direct]

D0. Subject: [subject]
[body]
[sig]

D3. Subject: [subject]
[body]
[sig]

D7. Subject: [subject]
[body]
[sig]

D14. Subject: [subject]
[body]
[sig]

,
VOICE CHECK: [result]
LENGTHS: D0=Xw, D3=Xw, D7=Xw, D14=Xw
DELIVERABILITY: [pass / flags + what to fix]

Locked, or rework?
```

If rework, ask which touch and what's off. Rewrite that touch only. Repeat until locked.

After locked: save sequence to `drafts/sequences/YYYY-MM-DD-<icp-slug>-angle-<a|b|c>.md` and suggest the user load it into Instantly / Smartlead / Apollo / their tool of choice. Do not auto-send.

## Working with other skills

- Imports: `voice-rules` (always), `icp-discovery` (for fit check), `offer-design` (for CTA clarity), `risk-gauge` (for volume vs family floor), `boring-stack` (for tool ladder)
- Hands off to: `follow-up-tracker` (after sequence ends, for replies that went cold), `discovery-call-prep` (when a reply lands a meeting), `pipeline-review` (to track sequence performance over time)
- Pairs with: `outreach-drafter` for 1:1 high-priority outreach outside the sequence

## Additional Resources

### Reference files

- **`references/deliverability-checklist.md`**: the full sending-setup runbook (SPF/DKIM/DMARC, warmup ladder, secondary domain pattern, daily volume curves)
- **`references/angle-bank.md`**: 12 proven angle templates by ICP segment (BDR managers, founders, ops leaders, RevOps, marketing leaders, etc.)
- **`references/subject-line-bank.md`**: 40+ subject line patterns categorized by reply-rate tier

### Example files

- **`examples/example-frontline-sales-mgr-sequence.md`**: full 4-touch sequence built for the example coaching business's frontline sales manager ICP, with all 3 angles, voice-scanned and ready to load

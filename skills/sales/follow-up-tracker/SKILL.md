---
name: follow-up-tracker
description: This skill should be used when the user asks to "run follow-ups", "draft follow-ups", "check stale deals", "who needs a nudge", "find prospects gone cold", "weekly follow-up sweep", "stale pipeline", or wants a sweep across their CRM for prospects past stale-stage threshold. Drafts the next-touch email per stage in the user's voice. Never auto-sends. Distinct from cold-email (sequences to new prospects) and outreach-drafter (first-touch).
version: 0.1.0
---

# Follow-up Tracker

The graveyard of solo-business pipelines is the prospect who went silent and got forgotten. This skill is the weekly sweep that surfaces them.

It reads the user's CRM (HubSpot, Google Sheet, Notion, whatever they use), finds prospects who have not moved stage in 14+ days, classifies them by stage and stuck-pattern, and drafts the next-touch email per stage in the user's voice.

It NEVER auto-sends. The user reads, edits if needed, sends. The skill exists to remove the "find them" friction, so the only remaining work is the human judgment call.

## When this skill triggers

- "Run follow-ups"
- "Draft follow-ups"
- "Who needs a nudge this week"
- "Check stale deals"
- "Stale pipeline sweep"
- "Find prospects gone cold"
- "Weekly follow-up sweep"
- "Anyone I forgot to nudge"

Triggered automatically on Friday mornings if `weekly-brief` skill is wired to it.

## The 4-step sweep

### Step 1: Read the CRM state

Pull the user's CRM. Source depends on stack:

- HubSpot: query deals where `last_modified > 14 days ago` AND `dealstage != closed_won AND != closed_lost`. Pull associated contacts.
- Google Sheet: scan the Pipeline tab for rows where `last_touch_date` is more than 14 days old and `stage` is not "won" or "lost".
- Notion: query the pipeline database with filter `Last Edited Time` more than 14 days ago.
- Airtable: same pattern, filter on Last Modified.

If user has no CRM, ask them to paste their pipeline list (name + stage + last-touch date + 1-line context per prospect). Then proceed manually.

### Step 2: Classify by stage and pattern

Group the stale prospects by stage. Standard stages (adjust to user's pipeline):

- **Lead**: has not yet booked a call
- **Discovery Booked**: call scheduled but not yet held
- **Discovery Held**: call happened, no proposal yet
- **Proposal Sent**: proposal out, no decision
- **Verbal Yes**: they said yes but have not signed/paid

Within each stage, classify the stuck-pattern:

- **No reply**: user sent a message, prospect did not respond
- **Awaiting prospect action**: prospect said they'd send something, did not
- **Awaiting user action**: user said they'd send something, did not (THIS IS ON THE USER, flag it explicitly)
- **Vague punt**: "let's reconnect next quarter" with no specific trigger

### Step 3: Draft the next touch per prospect

For each stale prospect, draft ONE next-touch email tied to the stage + stuck-pattern. Use the user's voice (pull from voice-rules skill).

Length per stage:

- Lead: 40-60 words
- Discovery Booked: 25-40 words (a reminder + reschedule offer)
- Discovery Held: 60-100 words (recap + next step)
- Proposal Sent: 40-70 words (specific question or close-the-loop)
- Verbal Yes: 30-50 words (logistics + soft deadline)

See `references/stage-specific-templates.md` for the full template library.

Critical rule: never use "circling back", "checking in", "just following up", "wanted to bump this", "hope this finds you well". These are dead phrases. Strip them. Replace with a specific reason for the message.

### Step 4: Output the sweep report

Format:

```
WEEKLY FOLLOW-UP SWEEP: [date]

TOTAL STALE: N prospects across X stages

BY STAGE:
- Lead: N (need follow-up)
- Discovery Booked: N (need confirm)
- Discovery Held: N (need proposal or close-loop)
- Proposal Sent: N (need decision push)
- Verbal Yes: N (need logistics + close)

ON YOU (user owes a touch): N
ON THEM (waiting on prospect): N
VAGUE PUNTS (need to qualify or kill): N

DRAFTS BELOW. Review, edit, send.

[Draft for each prospect, grouped by stage]
```

Save drafts to `drafts/follow-ups/YYYY-MM-DD/<contact-slug>-<stage>.md` so the user can open them in their editor.

## Per-stage draft patterns

### Lead stage (no call booked yet)

Two patterns depending on prior touch.

**Pattern: They opened, did not reply**
> "{{first_name}}, last note I sent didn't land an answer. Two paths: A) you're interested but timing's off, send me a date and I'll book. B) it's not relevant for you, send a one-word reply and I'll stop. Either is useful."

**Pattern: They replied with a soft no / vague punt**
> "{{first_name}}, you mentioned [their reason for punt] last month. Quick check: has [the trigger they implied] happened, or is the timing the same? If it's the same, I'll set a calendar reminder for [specific future date] and reach back out then."

The vague-punt pattern qualifies. Either they renew the conversation, or they explicitly close it. Both outcomes are wins.

### Discovery Booked (call scheduled, day before)

> "{{first_name}}, confirming tomorrow at [time]. If something came up, reschedule here: [link]. If not, see you then. Quick context: I'll come with [1-2 things you'll ask about]."

The confirm reduces no-shows by ~20%. The "I'll come with" line earns prep time on their side.

### Discovery Held (call happened, no next step yet)

Three patterns by stuck-state.

**Pattern: User owes the next deliverable (proposal, scope, follow-up resource)**

This is the highest-priority follow-up. The user is the bottleneck. Surface it explicitly in the report.

Draft:
> "{{first_name}}, sending you the [thing you owe] this week. To make sure I aim it right, one quick check: [the question you should have asked on the call]. Reply with a sentence and I'll have the [thing] over by [specific date]."

**Pattern: Prospect owes a deliverable / decision**
> "{{first_name}}, you mentioned you'd [thing they said they'd do] after our call. Any movement? If something else came up and the timeline shifted, send me a sentence on the new timing and I'll plan around it."

**Pattern: No clear next step set on the call (call was vague)**

This is a user-skill gap. Surface it. Draft:
> "{{first_name}}, the conversation on [date] gave me a lot to think about. Here's what I'm hearing as the actual opportunity: [restate in 1-2 sentences]. If that's accurate, the next step is [specific small thing]. Worth a 30-min call to scope it?"

### Proposal Sent (proposal out, no decision)

> "{{first_name}}, sent the proposal on [date]. Three things could be true: A) it landed and you're internalizing, B) something on the proposal is off and worth a conversation, C) it's a no for now. Send me one letter and I'll respond accordingly."

The A/B/C pattern is a deliberate gentle close. Most prospects reply because the choices feel manageable.

DO NOT send the proposal again. DO NOT send "did you get my proposal". They got it. They are sitting on it. The A/B/C forces a small decision.

### Verbal Yes (they said yes, no signed contract / paid invoice)

> "{{first_name}}, looping back on the verbal from [date]. To make this real, the next step is [signing contract / paying invoice / etc.]. The [link / attachment] is here: [link]. If anything changed on your end, send me a sentence and we'll adjust."

After 7 days at Verbal Yes with no movement, treat it as a soft no. Push once, then move them to "lost" with reason "ghosted after verbal".

## The "On You" callout

Every weekly sweep ends with a special section: "What YOU owe."

Prospects where the user committed to send something and did not are the easiest revenue to recover. The skill flags these in red.

```
ON YOU (revenue you can recover this week):
- [Prospect 1], owed: proposal, last touch: [date, N days ago]
- [Prospect 2], owed: case study link, last touch: [date]
- [Prospect 3], owed: intro to a peer, last touch: [date]

These were promised on calls. Sending them is the fastest path to a yes.
```

Coach-mode override: do not let the user skip past the "On You" section. If they have 3+ stale items they owe, push back:

> "You have 3 prospects waiting on something YOU said you'd send. Before drafting any new outreach this week, clear those first."

## Anti-patterns to refuse

### "Send the same template to all of them"

Refuse. The whole point of follow-up is the prospect-specific reason. Generic follow-up = lower reply than no follow-up.

### "Add a P.S. with another offer"

If the prospect did not respond to offer A, layering offer B in a P.S. = desperate. Cut.

### Re-pitching the original offer

If the prospect went silent after a discovery call, the follow-up is NOT "here's why my coaching package is great". It's "what's the small next step we agreed on, where did it go". Coach posture.

### Mentioning their silence

"I haven't heard back from you" / "Just making sure you saw this", these phrases punish the prospect for being busy. Skip them. Lead with a new piece of context or a specific small ask.

### Follow-up cadence past 4 touches

Once a user sends 4 follow-ups with no reply, stop. Mark the prospect "lost, ghosted" and move on. Further touches degrade the user's reputation more than the prospect's.

### Calendar bombing

"How about Tuesday at 2?", "Or Wednesday at 11?", "What about Thursday morning?" in successive emails = pressure. Send the calendar LINK, let the prospect pick.

## Coach posture inside the sweep

The follow-up sweep is also a diagnostic. Patterns surface that the user should see:

### Diagnostic 1: "Same kind of prospect keeps going silent"

If 5 of the 8 stale prospects are at the same stage with the same stuck-pattern, the issue is upstream: the offer, the discovery question set, the proposal format.

Surface this:
> "5 of your 8 stale deals are stuck post-proposal with no decision. Pattern says your proposal might not be earning the close. Worth running `/proposal-writer` to audit the structure."

### Diagnostic 2: "User owes 5+ items"

If the "On You" count is 5+ for two weeks running, the user is not the bottleneck on closing more deals. They are the bottleneck on closing the deals they have.

Surface this:
> "You have 5+ items you owe across pipeline, 2 weeks running. Adding more cold outreach makes the pile bigger, not smaller. Block 90 min this Friday to clear the owed list. Holding off on new outreach until then."

### Diagnostic 3: "Same prospect keeps appearing in sweep"

If the same prospect has appeared in the sweep for 4+ consecutive weeks with no movement, they are not a prospect, they are a tax. Push the user to close-loop and move them to lost.

> "[Prospect] has shown up in the sweep 4 weeks running. Either there's a real reason they're stalled (find it on the next call) or they're costing you the cognitive overhead of remembering them. Force a decision this week or close-loop."

## Stage-aware adjustments

### Pre-Rev Builder

- Sweep is small (5-15 prospects), often manual.
- Threshold: 7 days stale, not 14 (you don't have the volume to forget).
- Focus on Lead and Discovery Booked stages. Proposal Sent rare at this stage.
- Coach posture: most "stale" reads as "user has not done the work". Hold the line.

### Early Operator

- Sweep is medium (15-40 prospects).
- Threshold: 14 days stale.
- All 5 stages active. "On You" count starts to grow, weekly sweep is essential.
- This is the highest-leverage stage for this skill.

### Stable Solo

- Sweep is large (40-100 prospects).
- Threshold: 21 days stale at top of funnel, 14 days mid, 7 days at proposal+.
- Consider CRM hygiene skill in parallel.
- Diagnostic patterns become more reliable. Surface them in the sweep summary.

### Scaling Solo

- Sweep is very large (100+ prospects).
- Sweep weekly with stage-specific thresholds. Top-of-funnel may be 30 days.
- Increasingly delegated. User reviews diagnostics, VA / SDR handles the actual sends.
- Skill outputs CSV or HubSpot-task-list instead of individual drafts.

## Family floor protection

The weekly sweep runs in a 60-90 minute window. NEVER schedule it inside the user's family-floor blocks. Default suggested slot: Friday 10am-12pm or Monday 9-10:30am.

If the user tries to run it inside family time, push back:

> "Stale-deals sweep is 60-90 min. Your family floor is M-F 4-7pm. Run this Friday morning instead. Holding the file until then."

## Voice-rules integration

Every draft passes voice-rules:

1. Strip banned phrases
2. Apply AI-tell guardrails per user settings
3. Inject signature phrases where natural
4. Calibrate tone to coach archetype

Show "VOICE CHECK: clean" or list rewrites per draft.

## Output format

```
WEEKLY FOLLOW-UP SWEEP: [date]

TOTAL STALE: N

DIAGNOSTICS:
[1-3 patterns observed across the sweep, with skill recommendations]

ON YOU (clear these first):
[List with prospects + what's owed + days stale]

BY STAGE:

→ Lead (N prospects)
[Draft per prospect]

→ Discovery Booked (N prospects)
[Draft per prospect]

→ Discovery Held (N prospects)
[Draft per prospect]

→ Proposal Sent (N prospects)
[Draft per prospect]

→ Verbal Yes (N prospects)
[Draft per prospect]

TIME TO REVIEW + SEND: ~60-90 min
NEXT SWEEP RECOMMENDED: [date, 7 days out]

Locked, or rework any draft?
```

After locked: save individual drafts to `drafts/follow-ups/YYYY-MM-DD/<contact>-<stage>.md`. User opens each, edits if needed, sends.

## Working with other skills

- Imports: `voice-rules` (always), `crm-hygiene` (for CRM read pattern)
- Reads from: HubSpot MCP, Google Sheets, Notion DB, Airtable, or pasted CRM data
- Hands off to: `pipeline-review` (when sweep surfaces structural issues), `proposal-writer` (when post-proposal stalls are common), `close-mechanics` (when verbal-yes stalls are common), `business-coach` (when user keeps deferring the sweep)

## Additional Resources

### Reference files

- **`references/stage-specific-templates.md`**: 25+ proven follow-up templates organized by stage + stuck-pattern, all voice-scanned
- **`references/stuck-pattern-diagnostics.md`**: how to read the sweep for upstream issues (offer, discovery, proposal, close)

### Example files

- **`examples/example-weekly-sweep-output.md`**: sample weekly sweep output for the example coaching business, 12 stale prospects, all 5 stages represented, with diagnostic callouts

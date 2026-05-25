---
name: call-prep
description: This skill should be used when the user asks to "prep for X call", "call notes for X", "client call prep", "prep my call with [name]", "what should I ask [prospect]", "build a brief for tomorrow's call", or wants a one-page prep brief before any sales or client call. Pulls CRM history, prior email threads, LinkedIn signals. Stage-aware. Distinct from discovery-call-prep (specific pre-discovery research) and pipeline-review (broader audit).
version: 0.1.0
---

# Call Prep

One-page prep brief for any upcoming sales or client call. The brief is what the user reads in the 10-15 minutes before the call. It saves the awkward opening minute of "remind me where we left off" and saves the call itself from drifting into a generic chat.

This skill assembles the brief from whatever sources the user has wired up: CRM history, email threads, LinkedIn signals, past meeting transcripts, pre-session forms. Then it shapes the open questions to ask, the redirect prompts in case the call drifts, and the next-step plan.

Different from discovery-call-prep, which is specifically for first-time cold prospects (full LinkedIn + company research). Call-prep handles the broader case: discovery (cold or warm), check-in calls, follow-up calls, renewal calls, project kickoffs, troubleshooting calls. It auto-detects which mode the call is in.

## When this skill triggers

- "Prep me for [name]'s call tomorrow"
- "Call notes for the [time] meeting"
- "Discovery prep for [prospect]"
- "What should I ask [name]"
- "Build a brief for the [client/prospect] call"
- "[Prospect] in 2 hours, what do I need to know"
- "Prep for the renewal conversation"
- "I have a client call at 3pm, ground me"

Auto-fires inside `morning-sales-brief` if there's a call on the calendar that day.

## The 5-source pull (run all available, skip gracefully)

The skill assembles the brief from these sources, in priority order:

### Source 1: Calendar event
- Date, time, duration, attendees, meeting type (Teams/Zoom/in-person)
- Title (signals call mode: "Discovery call" vs "Renewal" vs "Check-in")
- Event description (often pasted by the booker, has context)
- Pull via Cal.com, Outlook MCP, Google Calendar MCP

### Source 2: CRM record (HubSpot, Sheet, Notion)
- Lifecycle stage, deal stage, deal amount if any
- Owner, last activity date, deal source (organic / cold / referral)
- Custom properties relevant to user's funnel (lead-gen assessment score, pillar focus, ICP tags)
- Pull via HubSpot MCP or Sheet read

### Source 3: Prior email thread (last 5 messages)
- Tone of last exchange
- Specific commitments made by each side
- Open questions left unanswered
- Pull via Outlook MCP or Gmail MCP

### Source 4: LinkedIn snapshot
- Current role and tenure
- Recent posts (last 30 days)
- Mutual connections
- Company news (acquisitions, funding, layoffs, leadership changes)
- Pull via LinkedIn DOM access if possible, or ask user to paste profile URL

### Source 5: Prior call transcripts / notes
- Last call's summary (if Fathom, Otter, manual notes exist)
- Specific things the prospect said they'd do
- Specific things the user committed to send
- Pull via Fathom MCP, file system, or pasted

If a source is unavailable, skip and note "Not available" in the brief. Don't fabricate.

## The 6-section brief

Output format. Keep total under 600 words (1 page printed).

### Section 1: Snapshot (top of page)

```
CALL: [type] with [name, role, company]
WHEN: [date + time + duration + meeting URL]
STAGE: [Lead / Discovery Held / Proposal Sent / Client / Renewal]
DEAL VALUE: [$ if applicable]
LAST TOUCH: [date, N days ago, channel]
```

Reader gets full context in 5 seconds.

### Section 2: Why this call exists

One sentence. The reason on the calendar. Specific.

> "Alex requested 60 min on his first 90 days as BDR Mgr at [their company]. Source: cold email + clarity-session booking."

If the reason is unclear, the brief flags it:

> "WARNING: Reason for this call is vague. Open the call with: 'What were you hoping to get out of our time together today?' Don't assume."

### Section 3: Prospect snapshot

5 bullets max. Specifics only.

- Role + tenure (e.g., "BDR Mgr, 6 months in role, promoted from IC SDR")
- Company stage + size (e.g., "[their company], ~150 employees, legal SaaS, Series B 2024")
- 1-2 LinkedIn signals (e.g., "Posted about ramp-time gap May 10. Quoted his VP positively.")
- 1-2 personal markers (e.g., "He/him. Based Houston. Mentioned daughter on call 1.")
- lead-gen assessment / assessment score if available (e.g., "lead-gen assessment archetype: The Engine. Lowest pillar: Wholeness, score 1.8.")

### Section 4: Hypothesized pain (the discovery hypothesis)

1-2 sentences. The pain the user expects to find on the call, written as a testable hypothesis.

> "Hypothesis: Alex is over-coaching and under-resting. He told me last call he's in 1:1s 4 hrs/day. The pain is calendar control. The pillar is Wholeness."

This is the user's working model. It might be wrong. The call's job is to test it.

### Section 5: Open questions (5-7, sequenced)

The questions in order. Coach-mode questions. Open, not leading. Tied to the hypothesis.

Example for Alex's discovery call:

1. "Walk me through what your week looks like right now, hour by hour."
2. "When you say 'overloaded,' what's the specific moment in the day when you feel it most?"
3. "What's the part of being a manager you didn't expect?"
4. "When was the last time you took a Sunday off the laptop?"
5. "If you could change ONE thing about your week tomorrow, what would it be?"
6. "What does the 6-month-from-now version of you want this conversation to be?"

If the user has run their assessment, pull from the open-question-bank in business-coach references for archetype-calibrated questions.

### Section 6: Redirect prompts (in case the call drifts)

3 specific redirects the user can deploy if the call goes off-topic.

> "If they pivot to 'tell me more about your background': 'Happy to, but I'm going to deflect that for a minute. I want to make sure we use this hour for YOU. Background later.'"

> "If they pivot to 'how much does it cost': 'Real answer: depends on what we agree we're solving. Let's spend the next 20 min on that and the pricing conversation will be clearer.'"

> "If they pivot to 'have you worked with [their type of company]': 'Yes, but the more useful frame is whether what I do solves what YOU'RE wrestling with. Let me ask you another question.'"

Tag the redirects by stage. For first-call discovery, redirect 1 above applies. For proposal-pitch calls, redirect 2 applies.

### Section 7: Specific next-step plan

1-2 sentences. What the user wants the call to end with.

> "Goal close: Schedule 60-min free intro call within next 2 weeks if Alex signals real interest. Fallback: Send 1-pager on time-blocking for new mgrs, follow up in 14 days."

If the call is a client check-in, the close is different:
> "Goal close: Surface the specific stuck point this week, commit to 1 experiment, schedule next session."

## Call-mode auto-detection

The brief adapts based on the call type. Detection cues:

| Call type | Cues | Brief focus |
|---|---|---|
| Discovery (cold) | First call with this prospect, source = cold | Source 4 (LinkedIn) heavy, Section 5 open Qs |
| Discovery (warm) | First call, source = referral/inbound | Source 3 (email thread) heavy, Section 4 hypothesis tighter |
| Check-in (client) | Existing client, recurring meeting | Source 5 (prior transcript) heavy, Section 7 next-step focused |
| Renewal | Client whose engagement ends in 30-60 days | Sources 2 + 5 heavy, Section 7 specifically renewal-shaped |
| Proposal review | Proposal sent, prospect wants to discuss | Source 3 (recent thread) heavy, Section 6 (redirects) critical |
| Reschedule recovery | Call has been moved 2+ times | Section 2 short, Section 7 leads with "should this happen at all" |

Auto-detect from calendar title + CRM stage. If ambiguous, ask: "Is this a discovery call, check-in, or something else?"

## Time budget for prep

The brief takes 5-10 minutes to read. The skill's output should match. Resist over-research.

| Call type | Prep brief time | Total prep including read |
|---|---|---|
| Discovery (cold) | 10-15 min to generate | 25-30 min total |
| Check-in (client) | 5 min to generate | 10-15 min total |
| Renewal | 10-15 min to generate | 20-30 min total |
| Proposal review | 15-20 min to generate | 30 min total |

If the user is asking for a brief 30 min before the call, generate the lightest possible version (Snapshot + Hypothesized pain + Open questions only).

## Anti-patterns to refuse

### "Build me a 5-page brief"

Refuse. The user has 10-15 min to read it before the call. 5 pages defeats the purpose.

### "Pre-script my answers to their objections"

Refuse. Scripted answers = dead call. The brief includes redirects, not scripts. The user's real answers come from listening to what the prospect says on the call.

### "Generate questions to manipulate them toward yes"

Refuse. The questions in Section 5 are open, not leading. If the user asks for "questions that get them to admit they need me," push back: "Open questions are how trust is built. Leading questions burn rapport. Coach posture."

### "Skip the LinkedIn research, just write the questions"

Push back. The LinkedIn snapshot (Section 3) is the difference between "you sound like every cold seller" and "you did your homework." 5 min of LinkedIn = the brief's highest ROI work.

### "Just give me a generic discovery framework"

Push back. Generic frameworks fail because they don't match THIS prospect. Either pull the data or ask the user to.

## Coach-mode integration

Every brief includes a 1-line coach-mode reminder at the bottom:

> "Coach posture reminder: open questions before answers. Use Alex's own words back to him. Hold him to what HE says is important, not what you assume."

For users with a Drill-Sergeant archetype, the reminder is sharper:

> "Coach mode: Alex will try to pivot. Hold the open questions. Don't rescue him from the silence after question 5."

For Reflective archetype:

> "Coach mode: Alex might need 30 sec of silence to find his answer. Don't fill it."

## Family floor check

Before generating the brief, check the call's time against the user's family floor. If the call falls inside protected hours, flag explicitly:

> "The call is scheduled 4:30 PM PT. Your family floor is M-F 4-7pm. Either move the call, or note: this is a family-floor violation and decide if it's worth it."

Don't decide for the user. Surface the conflict.

## Stage-aware adjustments

### Pre-Rev Builder

- Discovery calls are 80% of all calls.
- The brief is heaviest on Source 4 (LinkedIn) and Section 5 (open questions).
- Goal close = always "schedule next conversation OR get back the specific data".
- The user has not closed yet, so the call is for learning, not for selling.

### Early Operator

- Mix of discovery (60%) and proposal/check-in (40%).
- Brief is heavier on Source 3 (email thread) for warm prospects.
- Goal close = explicit, tied to deal stage advancement.

### Stable Solo

- More client calls, fewer cold discoveries.
- Source 5 (prior transcript) becomes critical.
- Brief is shorter, more pattern-recognition oriented.

### Scaling Solo

- Some calls handled by team / VA, user only on key calls.
- Brief becomes a tool for delegation: pass to team member for kickoffs.

## Output format

```
CALL BRIEF: [name]: [date + time]

═══════════════════════════════════════════
SNAPSHOT
[date, time, duration, stage, value, last touch]

WHY THIS CALL
[1 sentence]

PROSPECT
[5 bullets]

HYPOTHESIZED PAIN
[1-2 sentences]

OPEN QUESTIONS (5-7, in order)
1. ...
2. ...

REDIRECTS (if drift)
- If they pivot to X: [response]
- If they pivot to Y: [response]
- If they pivot to Z: [response]

CLOSE
Goal: [specific next-step]
Fallback: [if goal close fails]

COACH REMINDER
[1 line based on archetype]

═══════════════════════════════════════════

Locked, or rework?
```

Save the brief to `client-experience/<name>-prep-YYYY-MM-DD.md` or `drafts/call-prep/<name>-YYYY-MM-DD.md`. User opens in editor before the call.

For mobile: also send a compact 5-line version via iMessage (if user has wired the iMessage MCP for self-notifications).

## Working with other skills

- Imports: `voice-rules` (for redirect language), `business-coach` (for open-question style + archetype calibration)
- Reads from: HubSpot MCP, Outlook MCP, Cal.com MCP, file system (prior session notes), LinkedIn (if wired)
- Hands off to: `discovery-call-prep` (for first cold calls, deeper LinkedIn research mode), `proposal-writer` (after the call, if proposal is the next step), `follow-up-tracker` (to log post-call commitments)
- Pairs with: `morning-sales-brief` (which calls this skill for every call on the day's calendar)

## Additional Resources

### Reference files

- **`references/redirect-bank.md`**: 30+ redirect phrases organized by call drift type (price-too-early, background-talk, "tell me about your experience", etc.)
- **`references/call-mode-detection.md`**: full detection logic for the 6 call types, with stage-aware variants

### Example files

- **`examples/example-discovery-call-brief.md`**: full prep brief for Alex clarity session, showing all 6 sections with real data

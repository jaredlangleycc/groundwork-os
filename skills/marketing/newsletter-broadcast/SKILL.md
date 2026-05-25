---
name: newsletter-broadcast
description: This skill should be used when the user asks to "draft the newsletter", "send the newsletter", "Sunday newsletter", "broadcast to my list", "this week's newsletter", "send to subscribers", or wants to write a single broadcast send to their email list. Distinct from email-sequence (lifecycle automation) and copywriting (page copy). Pairs tightly with content-strategy (the newsletter is the owned-channel spine) and social-content (the newsletter generates the social spine).
version: 0.1.0
---

# Newsletter Broadcast

The single weekly broadcast send. Different from a sequence (no automation, no drip) and different from a transactional email. It's a content piece, delivered to the inbox, where the user shows up with one idea per week.

For solopreneurs, the newsletter is the owned channel. Social can disappear overnight. The list goes with the user.

## When this skill triggers

- "Draft this week's newsletter"
- "Sunday newsletter"
- "Send to the lead-gen assessment Leads"
- "Broadcast to my list"
- "Send the weekly"
- "Newsletter from this week's essay"
- "Weekly email"

NOT for: drip / automation sequences (use `email-sequence`), cold outreach (use `cold-email`), one-to-one client emails (use `outreach-drafter` or just write it).

## The format spec

Each issue. Same shape. Different content. Repetition of structure is what trains the reader.

```
SUBJECT
5 to 9 words. State, don't sell. Sounds like a friend wrote it.

PREHEADER
5 to 12 words. Continues the subject.

GREETING
First name. No "Dear" or "Hi there".

PERSONAL FRAME
1 to 2 paragraphs. What the user is sitting with this week. Tied to a moment
from the last 7 days (a client call, a Saturday morning, a moment in the car
with a kid, a piece of news).

THE ESSAY (or main body)
500 to 600 words. The core idea this week. If this is the spine pattern,
the body is the blog essay pulled in.

ONE LINE BRIDGE
1 sentence. Lands the essay's takeaway.

SOFT CTA
One link. Specific. ("Take the lead-gen assessment" not "Learn more.")

SIGN-OFF
First name. No title.

P.S. (optional)
One specific line. Use sparingly.
```

Hard cap: 700 words total. Inbox is a glance, not a sit-down read.

Target: 500 words. Most weeks the user will write longer than they need to. Cut.

## The Sunday spine pattern

The newsletter is the cap of the Sunday Spine Workflow (see `content-strategy/references/repurposing-spine.md`).

Sunday morning:

1. Finalize the blog essay (written earlier in the week).
2. Write the personal frame on top (10 to 20 minutes).
3. Strip the essay to fit the 500 to 600 word newsletter window.
4. Add the soft CTA.
5. Send.

The newsletter inherits the essay. It is not a separate piece of writing. If the user is writing two different things (newsletter + essay), they're doubling production cost.

## Stage-aware cadence

| Stage | Newsletter cadence |
|---|---|
| Pre-Rev Builder | 1/month maximum, often paused |
| Early Operator | 1/month or 2/month |
| Stable Solo | 1/week, Sunday default |
| Scaling Solo | 1/week minimum, possibly 2/week (one short, one essay) |

Don't push above weekly. Most solopreneurs cannot sustain 2/week without burning out the audience and the user.

## Subject line craft

Newsletter subjects are different from sequence subjects. The reader chose to be here. The bar is signal in 5 to 9 words.

### Good newsletter subjects (Langley pattern)

- "Grounding comes first."
- "Two reactive triggers I caught myself doing this week"
- "The first 90 days as a manager"
- "What I learned watching Arteta"
- "Stop reactive leadership"
- "The pause before the response"

Specific, declarative, conversational. Sometimes a sentence ending in a period (signals confidence).

### Subject lines to refuse

- "Weekly Update from [Brand]"
- "Newsletter #47"
- "[Brand] Insider"
- "Don't miss this week's [thing]"
- "Issue 12, [topic]"

Generic, brand-first, signals "marketing automation."

### Subject line voice rules

- Em-dashes off
- No "X, not Y" antipattern
- Banned phrases enforced
- Match the user's archetype

Always show subject line + voice check before sending.

## The personal frame

The 1 to 2 paragraph opening is what makes the newsletter feel like a letter and not a content email. Without it, the issue reads like a blog post pasted into an inbox.

### What the personal frame contains

- A specific moment from the user's last 7 days
- A specific feeling or observation
- A bridge to the essay's theme

### What the personal frame is NOT

- Weather report ("It's a sunny Sunday morning here")
- Recap ("This week I did X, Y, and Z")
- Promo ("Quick reminder about my offer before I dive in")
- Apology ("I haven't sent in a while")

If the user wants to apologize for missing a week, the answer is to send. Don't open with the apology.

### Personal frame examples (Langley)

- "Yesterday at my kids' soccer game I caught myself answering Slack on the sideline. I closed the app. The game didn't get less stressful. My presence did."
- "A client said this on Friday: 'I have to read my reps' Slack to know what they actually mean.' I sat with that for two days. This week's essay grew out of it."
- "Saturday morning. Coffee. Notebook. Kid asleep upstairs. The hour I write best is the hour I almost trade for one more meeting every week. I almost did it again this morning."

Specific. Sensory. Names the user as a real person.

## The CTA

One CTA. One link. Specific.

### Newsletter CTA hierarchy

Pick one per send. Rotate across sends, don't stack.

1. **The lead magnet** for new subscribers and for repeat reinforcement. Langley: "Take the lead-gen assessment." Default for 60% of sends.
2. **The offer** with direct mention, link to the offer page or a call. Use 20% of sends maximum. More and the audience hears sales.
3. **The conversation** with a "Reply with [specific thing]." Highest reply rates, slowest revenue path, but builds the relationship. Use 15% of sends.
4. **A specific piece of content**, linking to a blog post, social thread, or video. Use 5% of sends maximum. Most weeks the newsletter IS the content.

Never link to 4 things at the bottom. The reader picks none.

### Soft CTA examples

- "If this lands, take the lead-gen assessment. It's the version of this conversation as a 12-question pulse."
- "If you're sitting with this and want to talk, here's where to book a free intro call."
- "Reply with the trigger you're going to kill this week. I read every one."

The CTA is part of the writing. It's not a tacked-on "marketing block."

## The P.S.

Skip the P.S. by default. Add only when it earns its place.

When the P.S. earns its place:

- A genuine afterthought ("P.S. The book I mentioned: [title], by [author].")
- A second offering for a different reader ("P.S. If you're a friend of someone this would land for, forward this. Or send them: [your-domain].com/quiz.")
- A real personal detail ("P.S. I made a fire in the woodstove this morning to write this. It's October.")

P.S. spam:

- "P.S. Don't forget to sign up for [offer]"
- "P.S. Limited time only!"
- "P.S. Follow me on [platform]"

Cut.

## Tool integration

### MailerLite (default for NightShiftOS users)

Send workflow:

1. Open the campaign builder.
2. New regular campaign.
3. Audience: lead-gen assessment subscribers (or your equivalent main group).
4. Subject + preheader.
5. Use the user's saved brand-aligned HTML template.
6. Paste body content.
7. Preview on desktop + mobile.
8. Send test to user's own inbox.
9. Voice-scan the rendered version (formatting can introduce voice violations).
10. Schedule send for Sunday morning local time (or send immediately if Sunday morning).

The the example coaching business pattern: every Sunday around 9 am PT, group `lead-gen assessment subscribers` ID `183891421635282046`.

### Beehiiv

Use the post composer. Beehiiv blurs the line between blog and newsletter. A published post can also send as an email. For NightShiftOS pattern, treat them as one piece.

### Kit (ConvertKit)

Use Broadcasts (not Sequences). Set send time, audience, write body, preview, send.

### Substack

Compose new post. Mark "send to subscribers." That's the broadcast.

### HubSpot Marketing Hub

Use Email > Regular Email. More setup overhead than MailerLite. Worth it if HubSpot is the user's CRM and you need contact-tied engagement reporting.

## Voice integration

Every newsletter goes through voice-rules before send.

- Strip em-dashes
- Strip banned phrases
- Refuse "X, not Y"
- Strip AI-tell openers
- Inject signature phrases naturally
- Match user's archetype

Show "VOICE CHECK: clean" or "VOICE CHECK: N violations rewritten" before the draft locks.

## Cross-channel propagation

After the newsletter sends:

1. The blog essay is already live (parallel publish on Sunday).
2. The week's social spine is already queued (Mon-Fri posts derived from this week's essay).
3. The newsletter itself may get a "newsletter-edition" social post mid-week. ("This week's letter: [hook]. Read or join: [link].")

Don't replicate the newsletter to social. Subscribers see both, social readers see only social. They're different views of the same idea.

## Anti-patterns to refuse

### Image-heavy newsletters

Refuse to send a newsletter that opens with a banner image. Email clients clip images, GIFs slow load, image-heavy emails go to Promotions in Gmail.

One header image at most. Often zero. Text-first.

### "I have a few things this week"

Refuse the "5 quick updates" format. One newsletter, one idea, one CTA. The reader bought a single signal, not a feed.

### Begging for engagement

Refuse "please reply!" "please share!" closers. If the writing earns engagement, the reader will engage.

### Roundup format

Refuse "5 links I found interesting this week" by default. Curated link roundups can work, but only when the user has actual editorial taste and ICP-relevant filters. Otherwise it's filler.

Acceptable: a once-monthly "what I'm reading" if it ladders to thesis. Otherwise no.

### Last-minute scramble

If the user is opening this skill at 8:45 am on Sunday looking for "what do I send today," the answer is to send Monday morning instead. Skipping the personal frame to hit a send-time is worse than sending late.

The newsletter is a commitment. Don't burn the commitment on a panic send.

## Stage-aware adjustments

### Pre-Rev Builder

- Pause newsletter or 1/month.
- Focus on building list, not sending.
- One-off send when there's something real to say.

### Early Operator

- 1 to 2/month.
- Each send is a quality bar (no listicle filler).
- Pattern: send when the blog essay ships, not on a schedule.

### Stable Solo

- Weekly, Sunday default.
- Spine pattern: essay → newsletter on the same morning.
- 500 to 600 words body.
- Track open + click + reply per send.

### Scaling Solo

- Weekly minimum, possibly 2/week if testing growth.
- Segment by behavior (engaged vs cold) if list is over 5000.
- A/B test subject lines.
- Consider Beehiiv Boost or paid promotion of the newsletter.

## Free-first ladder

- MailerLite Free (up to 1000 subs), default
- Beehiiv Free (up to 2500 subs), if newsletter is the product
- Kit Free (up to 10000 subs), if creator-led, building before launching
- Substack, if testing voice with zero infrastructure

Never recommend paid before the user has hit the free tier ceiling. Most NightShiftOS users will stay free for 12 to 24 months.

## Family-floor integration

The newsletter sends Sunday morning. For users with "no work Sunday" protected blocks, the production must happen during the week, not Sunday. The send itself (in the tool) can happen autonomously on Sunday.

If the user has Sunday protected, schedule production for Friday afternoon or Saturday morning.

## Revenue tag

Newsletter is leverage ($$). It compounds owned audience and produces direct revenue indirectly via inbound calls, lead-magnet signups, and offer purchases.

Tag distraction if:

- The list has been growing for 6+ months with under 1% open-to-call conversion AND the user hasn't tested the offer in any send
- The newsletter exists because the user feels they "should have one" without a thesis
- More than 50% of subscribers are non-ICP (friends, family, peers)

Surface these for a re-think conversation with `business-coach`.

## Working with other skills

- Imports: `voice-rules` (every send), `copywriting` (essay body craft), `content-strategy` (newsletter is the spine cap)
- Pairs with: `email-sequence` (lifecycle layer running in parallel), `social-content` (the week's social spine), `ai-seo` (the blog essay's AI-search layer)
- Feeds into: `analytics-tracking` (open/click/reply tracking)

## Send-day workflow

The Sunday Spine, codified:

1. **0700 (or first quiet hour):** Read the blog essay one more time.
2. **0720:** Write the personal frame on top.
3. **0740:** Strip the essay to fit the 500 to 600 word window.
4. **0800:** Add the soft CTA. Voice-scan.
5. **0815:** Preview on phone.
6. **0830:** Send test to self.
7. **0845:** Re-read the test in inbox view.
8. **0900:** Schedule or send live.

Total time: ~2 hours from "read the essay" to "sent."

If the production runs over, the family-floor for Sunday is in play. Schedule for Monday rather than ship a half-done piece.

## Additional Resources

### Reference files

- **`references/newsletter-anatomy.md`**, full beat-by-beat anatomy of a single issue with line-level voice notes
- **`references/sunday-send-checklist.md`**, pre-send checklist to run every issue (links, preview, voice, CTA, family-floor)

### Example files

- **`examples/example-sunday-issue.md`**, a fully written Langley Sunday newsletter (subject, preheader, body, CTA, P.S.) with voice notes
- **`examples/cross-post-social-spine.md`**, how one newsletter issue generates the week's 6 social posts via the spine pattern

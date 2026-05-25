# lead-gen assessment Welcome Sequence (the example coaching business, Live)

The actual 5-email welcome series that fires when a subscriber completes the lead-gen assessment at [your-domain].com/quiz. Tool: MailerLite Free. Automation ID: 183891490746926897. Trigger group: lead-gen assessment subscribers.

Use as the reference shape for the welcome series spec.

## Sequence settings

- Trigger: subscriber added to "lead-gen assessment subscribers" group
- Sender: Jared Langley `<hello@jaredlangley.cc>` (M365 mailbox)
- Reply-to: hello@jaredlangley.cc
- Day offsets: Day 0, Day 2, Day 5, Day 9, Day 14 (from opt-in, not from send)
- Total emails: 5
- Goal: 1 reply OR 1 booking on free intro call

## Email 1, Day 0, Delivery

**Subject:** Your lead-gen assessment, as promised

**Preheader:** Plus the one thing to do with the result

**Body:**

Hey {first_name},

Your lead-gen assessment results are below. The archetype is the headline. The pillar scores are the data behind it.

Over the next two weeks I'll send 4 more emails. Each is short. Each picks at a different angle of what you just saw.

Email 3 is the one most people reply to. Watch for that one on day 5.

Jared

P.S. If anything in the result doesn't sit right, reply and tell me which line. I read every one.

**Word count:** 76. **Voice check:** clean.

## Email 2, Day 2, The behind-the-claim story

**Subject:** Why I built the lead-gen assessment

**Preheader:** Two years ago I needed this and it didn't exist

**Body:**

{first_name},

Two years ago I was running my first sales team. I'd just gotten promoted from individual contributor. I worked 60-hour weeks for 6 months and we still missed the quarter.

I kept asking the wrong question. I kept asking, "How do I work harder?" The real question was, "What am I trying to prove?"

When I finally asked the right question, I realized the panic was the loudest signal I had. It wasn't a problem. It was data.

the lead-gen assessment is the version of that data I wish someone had given me. Three pillars. One archetype. A starting point.

Your archetype is the part of leadership you're carrying right now. The lowest pillar is the part you're avoiding.

Both are useful.

Jared

**Word count:** 158. **Voice check:** clean.

## Email 3, Day 5, The mistake

**Subject:** Three reactive triggers most managers don't see

**Preheader:** Pick one to kill before Friday

**Body:**

{first_name},

Most new sales managers think the problem is time management. It's not.

The problem is that three triggers run their week and they don't see it:

1. The morning Slack scroll. Twenty minutes you didn't budget. Pulls you into whoever's noisiest.
2. The interrupt-driven 1:1. Your rep brings a problem, you solve it on the spot, the rep walks out unchanged.
3. The end-of-day deal review. Eight minutes ago you were planning tomorrow. Now you're firefighting a deal that wasn't urgent at 4 pm but is urgent at 4:45.

Pick one. Kill it for a week.

Not all three. One.

Reply with which one you picked. I'll send you the specific replacement habit for that trigger.

Jared

**Word count:** 162. **Voice check:** clean.

CTA: reply (not a link).

## Email 4, Day 9, The proof case

**Subject:** What changed for Jordan

**Preheader:** Three months, one shift

**Body:**

{first_name},

A client. B2B SaaS sales manager. 8 months in. Working 60-hour weeks. Missing quota the third quarter in a row.

When we started, she said: "I'm doing everything everyone tells me. Why is it getting worse?"

the lead-gen assessment came back Reactor archetype, Wholeness lowest.

What we worked on for 90 days:

The 1:1s. She'd been running status reads. We rebuilt them around 3 questions her reps had to answer before walking in. Every 1:1 ended with one new commitment.

The week shape. She'd been planning the week on Monday at 8 am after Slack scroll. We moved the planning block to Friday at 4 pm with no devices.

The morning hour. She'd been on email at 6 am. We took email off the phone. She went back to journaling 15 minutes. Same hour, different output.

Three months later: 45-hour weeks, hit number, sleeping again.

What's the version of those three for you?

If you want to talk through it, here's where to book: https://cal.com/langleycoaching/clarity-session

It's a free coaching session, 60 minutes. We work on one real thing.

Jared

**Word count:** 240. **Voice check:** clean.

CTA: link to free intro call.

## Email 5, Day 14, The direct ask

**Subject:** Two weeks in. Asking now.

**Preheader:** If the moment is right, here's the next step

**Body:**

{first_name},

Two weeks ago you took the lead-gen assessment. I've sent you the story, the mistake pattern, the proof case.

If you want to work on your version of this with me, here's the offer.

The flagship offer is my 90-day coaching engagement. $X,XXX total. $XXX/month for 3 months OR paid upfront. 30-day money-back guarantee.

We meet weekly for 60 minutes. You leave each session with one decision and one experiment. By week 12, the three or four moves that change your year are running.

If you're a new sales manager in a B2B SaaS company, this fits. If you're in a different role and the language landed anyway, also fits. The pillars are the same.

If you want to talk first, book a free intro call: https://cal.com/langleycoaching/clarity-session

If now isn't the moment, reply and tell me what's next for you. I read every one.

Jared

**Word count:** 187. **Voice check:** clean.

CTA: book free intro call. Same CTA the prior 4 emails have been pointing at.

## Sequence metrics to watch

| Email | Open rate target | Click/reply target |
|---|---|---|
| 1 | 60%+ | 5% click on lead magnet link |
| 2 | 45%+ | 1% reply |
| 3 | 45%+ | 5%+ reply (the engagement email) |
| 4 | 40%+ | 2% click on calendar |
| 5 | 40%+ | 3% click on calendar |

If any open rate is under 30%, the subject line is wrong. Rewrite.

If reply rate on email 3 is under 2%, the voice is off OR the audience is colder than the user thought. Re-check the lead magnet's promise.

If the offer-page click rate on email 5 is under 1%, the offer or the price is wrong, or the audience is the wrong fit for the offer.

## What changed in this sequence over time

- April 5, 2026: original 5-email sequence shipped.
- April 26, 2026: Substack archive note added to email 2 (the platform mention).
- May 20, 2026: audit found dead Calendly URLs in emails 4 and 5. Replaced with Cal.com URLs. Voice violations (Substack mention in P.S.) cleaned. See `examples/sequence-audit-redline.md`.

The audit is run quarterly. The sequence is rarely rewritten. Voice + offer changes propagate via redline, not a full rewrite.

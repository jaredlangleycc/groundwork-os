# Deliverability Checklist

Cold email deliverability is 80% of the sequence's success. Bad deliverability = inbox provider routes you to spam. Sequence dies before D0 is opened.

Run every item before the first send. Re-run when volume jumps a tier.

## DNS records (one-time setup)

Three TXT records on the sending domain. All three must validate.

### SPF (Sender Policy Framework)
Allows certain servers to send on behalf of the domain.

For Google Workspace:
```
v=spf1 include:_spf.google.com ~all
```

For Microsoft 365:
```
v=spf1 include:spf.protection.outlook.com ~all
```

Validate with MXToolbox SPF lookup. Should report "Pass".

### DKIM (DomainKeys Identified Mail)
Cryptographically signs each email. Inbox providers verify the signature matches the domain.

Generate via the mailbox provider (Google Workspace Admin Console > Apps > Gmail > Authenticate Email, or Microsoft 365 > Security > Email > DKIM). Outputs two CNAME records. Add them to DNS.

Validate via MXToolbox DKIM lookup using the selector. Should report "Pass".

### DMARC (Domain-based Message Authentication, Reporting, Conformance)
Tells inbox providers what to do when SPF or DKIM fails.

Starter record:
```
v=DMARC1; p=quarantine; rua=mailto:dmarc-reports@yourdomain.com; pct=100
```

Escalate to `p=reject` after 30 days of clean SPF/DKIM. Reject prevents spoofing entirely.

## Mailbox warmup (30 days minimum)

A brand-new mailbox sending 50 emails on day 1 = spam folder. Inbox providers track sender reputation. New senders have zero reputation.

### Manual warmup (free)

Day 1-7: Send 3-5 emails per day to friends, family, your own other accounts. Ask them to reply. Move replies out of spam if they land there.

Day 8-14: 10 emails per day to a slightly broader list. Mix of replies, forwards, marking as not-spam.

Day 15-30: Ramp 15 to 30 emails per day. Add some cold emails to warm contacts (peers, mentors).

After Day 30: ready to start sequence at 30-50/day, ramping to target volume across another 30 days.

### Paid warmup (faster, $29-50/mo)

Tools: Lemwarm, Mailwarm, Warmup Inbox. Each does the same thing: connects your mailbox to a pool of other mailboxes, exchanges thousands of emails per month with auto-replies, builds sender reputation.

Free-first violation justified if cold email is the primary channel AND user has 30 days they can NOT lose to manual warmup.

## Volume ramp curve

Even on a fully warmed mailbox, ramp send volume gradually.

| Week | Daily volume per mailbox |
|---|---|
| Week 1 | 30 |
| Week 2 | 40 |
| Week 3 | 50 |
| Week 4 | 60 |
| Week 5+ | 70-80 (cap) |

80/day per mailbox is the typical ceiling. Beyond that, deliverability drops even with warmup. Add mailboxes to scale, do not push individual mailboxes past 80/day.

## Secondary domain pattern (Early Operator+)

The protective move: do not send cold from the primary domain (the one your inbound forms, your team, your customers rely on).

### Setup

1. Buy a secondary domain (e.g., theirbusiness.co if primary is theirbusiness.com).
2. Set up Google Workspace ($6/mo per mailbox) or Outlook 365 on the secondary.
3. Set SPF/DKIM/DMARC on secondary.
4. Warm the secondary mailboxes for 30 days.
5. Send cold sequence from secondary.

### Why

If the secondary domain gets blacklisted (it happens, especially scaling past 200/day per mailbox), the primary is untouched. Customer emails, inbound replies, internal team all keep working.

Cost: $10/yr (domain) + $6-12/mo per inbox + $29-50/mo warmup tool. Roughly $50-100/mo total for 2-3 inboxes.

Free-first violation justified because the cost of burning the primary domain (loss of customer trust, support tickets, inbound replies going to spam) is materially higher than the secondary-domain cost.

## Daily limit checks

Per mailbox, hard limits set by provider:

- Google Workspace: 2000 messages per day (external), 10,000 per day total. Practical cold ceiling: 80-100/day to maintain reputation.
- Microsoft 365: 10,000 messages per day. Practical cold ceiling: 80-100/day.
- Custom SMTP (Sendgrid, Mailgun, Amazon SES): higher technical ceilings, but the same reputation rules apply.

Do not max the provider limit. Stay below 60% of practical cap.

## Engagement signals (what providers watch)

Inbox providers (Gmail, Outlook) watch these signals to assign sender reputation:

| Signal | Effect |
|---|---|
| Reply rate >5% | Strong positive |
| Reply rate <1% | Negative |
| Spam reports >0.1% | Catastrophic, single biggest killer |
| Open rate >30% | Positive (but easy to fake, providers weight less) |
| Forwards / replies to non-recipients | Strong positive |
| Recipients moving to inbox from spam | Strong positive |
| Recipients marking as spam | Negative, multiplier effect |

The implication: a 4-touch sequence with 6% reply rate maintains reputation. A 4-touch sequence with 0.5% reply rate + 0.3% spam reports degrades reputation in 2 weeks.

Quality > volume on this metric. Always.

## Pre-send checks (per send)

Run these before clicking send (or scheduling in a tool):

- [ ] Subject line under 6 words, no clickbait
- [ ] Body under 100 words
- [ ] First line is trigger-based or 1:1 (not "Hi {{first_name}}")
- [ ] One CTA, not two
- [ ] No tracking pixel (or use a discreet one, not Mailchimp-style)
- [ ] No "image-only" emails (red flag for spam filters)
- [ ] Plain text version exists alongside HTML
- [ ] Unsubscribe / opt-out line present
- [ ] Reply-to is monitored (not noreply@)
- [ ] Voice-rules: clean (no em dashes, no banned phrases)
- [ ] Reading-grade level: 6-8 (test on Hemingway app or similar)

## Spam-trigger words to avoid

In subject AND body:

- "free" (in subject)
- "guarantee", "guaranteed"
- "act now", "urgent", "limited time"
- "100% off", percentages with "off"
- ALL CAPS WORDS
- Multiple exclamation marks!!!
- "click here", "click below"
- "amazing", "incredible", "unbelievable"
- "$$$" or repeated dollar signs
- "winner", "you've won"
- "no obligation"
- "as seen on"

These are 2010-era spam triggers, modern filters are smarter, but the words still raise scores. Cut them.

## Monthly health check

Every 30 days, run:

1. MXToolbox blacklist check on sending domain. Should be clean.
2. Mail-tester.com test send (score should be 9+/10)
3. Google Postmaster Tools (if Workspace), check sender reputation
4. Spam complaint rate in tool (should be under 0.1%)
5. Bounce rate (should be under 3%, hard bounces under 1%)

If any metric degrades: pause volume, investigate, fix root cause. Do not push through.

## Escalation: what to do if deliverability tanks

1. Stop sending immediately
2. Check MXToolbox for blacklisting
3. Run mail-tester on a single send
4. Review last 7 days of sends for spam complaints
5. If blacklisted: request removal, wait 7-14 days minimum
6. Resume at 10/day for 14 days, ramp slowly back

Recovery is slow. Prevention is fast. Stay below the limits.

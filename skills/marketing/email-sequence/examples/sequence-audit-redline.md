# Sequence Audit Redline (Example Output)

Output of an email-sequence audit, run May 20, 2026 against the the example coaching business lead-gen assessment welcome series. Shows the pattern: redline first, rewrites suggested, user confirms before any edits ship.

## Sequence audited

- Name: lead-gen assessment Welcome Series
- Tool: MailerLite (automation ID 183891490746926897)
- Emails: 5
- Last edited: April 5, 2026

## Audit findings

### Email 1, Day 0

**Status:** Clean. No violations.

### Email 2, Day 2

**Voice violations:** 1
- Line 4: "imagine if you could" → flagged as AI-tell opener pattern. Rewrite or strip.

**Dead links:** 0

**CTA check:** No CTA. Correct for this stage of the sequence.

**Suggested rewrite for line 4:**

> Before: "Imagine if you could see the pattern in your own week."
> After: "You can see the pattern in your own week if you slow down for ten minutes."

### Email 3, Day 5

**Voice violations:** 2
- Em-dash in line 6: "the pattern not the symptom" → replace with comma or rewrite.
- Phrase "moving forward" in P.S. → banned phrase, replace with "from here" or "next time."

**Dead links:** 0

**CTA check:** Reply CTA. Correct.

**Suggested rewrites:**

> Line 6 before: "The fix is to see the pattern not the symptom."
> Line 6 after: "The fix is to see the pattern, not the symptom."

Note: "X, not Y" antipattern flagged. Better rewrite:

> Line 6 best: "The fix is to see the pattern. Symptoms are downstream."

> P.S. before: "Moving forward, watch which trigger fires this week."
> P.S. after: "From here, watch which trigger fires this week."

### Email 4, Day 9

**Voice violations:** 1
- Banned phrase "leverage" used as verb in line 8 → replace.

**Dead links:** 1
- Calendly URL `https://calendly.com/jaredlangley/30min` → dead. Site migrated to Cal.com May 2, 2026. The dead link is 18 days old, every send since May 2 has been broken.

**CTA check:** Broken because the link is dead. Bookings from this email: 0 in the last 18 days, prior baseline was 2 to 3/month.

**Suggested rewrites:**

> Line 8 before: "We leveraged the morning hour to rebuild her routine."
> Line 8 after: "We used the morning hour to rebuild her routine."

> Line 18 before: `https://calendly.com/jaredlangley/30min`
> Line 18 after: `https://cal.com/langleycoaching/clarity-session`

### Email 5, Day 14

**Voice violations:** 2
- Banned phrase "circle back" in line 12 → replace.
- "Em-dash em-dash" in line 16 → strip.

**Dead links:** 2
- Calendly URL (same as email 4) → replace with Cal URL
- Substack link in the P.S. → Substack was deprecated April 25, 2026. The link is dead OR points to an archive.

**CTA check:** Same as email 4. Broken since May 2.

**Bookings from this email:** 0 in last 18 days. Prior baseline was 4 to 6/month.

**Suggested rewrites:**

> Line 12 before: "Reply and we can circle back next month."
> Line 12 after: "Reply and we'll set time to talk again next month."

> Line 16 before: "It fits and the timing is yours."
> Line 16 after: "It fits. The timing is yours."

> Line 28 before: `Plus my Substack at jaredlangleycc.substack.com if you want the weekly notes.`
> Line 28 after: `Plus the blog at jaredlangley.cc/blog if you want the weekly notes.`

## Summary

| Email | Voice violations | Dead links | Severity |
|---|---|---|---|
| 1 | 0 | 0 | clean |
| 2 | 1 | 0 | low (rewrite recommended) |
| 3 | 2 | 0 | medium (rewrite required) |
| 4 | 1 | 1 | high (dead CTA, 18 days of broken sends) |
| 5 | 2 | 2 | high (dead CTA + dead asset link) |

## Recommended action

1. Fix dead links in emails 4 and 5 IMMEDIATELY (18 days of broken sends = ~10 to 20 lost calls based on baseline).
2. Rewrite voice violations as low-priority maintenance. Schedule in next 7 days.
3. Set quarterly audit cadence (next: August 20, 2026).

## What's missing from this audit but worth tracking

- Open rates by email. Pull from MailerLite reports.
- Click rates by email. Same source.
- Reply rates per email. MailerLite shows replies as separate sender-side count.
- A/B test results if any are running. None currently.

## How the audit was conducted

1. Read all 5 emails into context.
2. Ran each through voice-rules check (banned phrases, em-dashes, AI tells).
3. Pulled all links, manually verified each one resolves to a 200 response.
4. Compared CTAs against the user's current funnel (Cal.com bookings, not Calendly).
5. Compared body content against current offer spec (`client-experience/00-package-spec.md`).

Total audit time: ~20 minutes for 5 emails.

## Pattern lessons

The Calendly → Cal.com migration left dead links across 3 places (worker code, site CTAs, email sequences). The site CTAs got swapped May 2, 2026 because they were visible. The email sequences sat broken for 18 days because they were invisible (in the automation tool, not on a page).

Lesson: when changing any URL in the funnel, audit:

1. All site pages
2. All email sequences
3. All broadcast templates
4. All ad campaigns
5. All social bios
6. All HubSpot / CRM automations

This is captured as a checklist in `site-url-swap-audit` skill (separate Langley-specific skill, not part of NightShiftOS core).

Future NightShiftOS users will benefit from running this audit pattern quarterly even if they didn't change URLs. Voice drift and link rot are inevitable.

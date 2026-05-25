# Sunday Send Checklist

Run this checklist before every newsletter send. Catches the dead-link, voice-drift, broken-CTA, family-floor issues that ruin sends. Takes 5 to 10 minutes.

## Before drafting (10 minutes)

- [ ] **Blog essay finalized?** The newsletter is the strip of the essay. If the essay isn't done, don't start the newsletter.
- [ ] **Personal frame moment chosen?** Specific moment from the last 7 days. Name it before opening the draft.
- [ ] **CTA picked?** One CTA, one link. Per the CTA rotation, this week is: lead magnet / offer / conversation / content.
- [ ] **Time budget set?** 90 to 120 minutes. If you don't have it, schedule for tomorrow morning.
- [ ] **Family-floor checked?** If Sunday is protected, this work is happening Saturday or shouldn't be happening at all.

## During drafting (60 to 90 minutes)

- [ ] **Frame written first.** Avoid the trap of writing the body and bolting a frame on top.
- [ ] **Frame is specific.** Sensory detail, not abstract. Name a sound, a place, a person.
- [ ] **Bridge sentence connects frame to body.** If you can hear the seam, rewrite.
- [ ] **Body trimmed to 400 to 600 words.** First draft will be 800+. Cut.
- [ ] **One idea per issue.** If two ideas crept in, pick one. Save the other for next week.
- [ ] **Land sentence does the rhetorical work.** CTA can be brief because the land moves the reader.
- [ ] **CTA is specific.** Not "Learn more." Specific action.

## Voice pass (10 minutes)

- [ ] **Em-dashes:** zero in body. Use comma, period, or rewrite.
- [ ] **Banned phrases:** strip per user's list.
- [ ] **"X, not Y" antipattern:** rewrite affirmatively.
- [ ] **AI-tell openers:** zero. ("Imagine if," "Picture this," "In today's fast-paced world.")
- [ ] **Hedge words audit:** "just", "really", "basically", "actually", "simply." Strip where they dilute.
- [ ] **Signature phrases:** present naturally, not forced.
- [ ] **Archetype match:** sharp, warm, reflective, etc. per the user's voice-rules.
- [ ] **Voice check output shown:** "VOICE CHECK: clean" or "N violations rewritten" before the lock.

## Subject + preheader pass (5 minutes)

- [ ] **Subject is 5 to 9 words.**
- [ ] **Subject is 30 to 50 characters.**
- [ ] **Subject states, doesn't sell.**
- [ ] **Subject sounds like a friend wrote it.**
- [ ] **Preheader is explicit (not auto-pulled).**
- [ ] **Preheader continues the subject, doesn't repeat.**
- [ ] **Together they tell a 2-line story.**

## Link audit (5 minutes)

- [ ] **All links resolve to 200.** Open each one in a browser.
- [ ] **CTA link is the right one for the user's current funnel.** No dead Calendly URLs after a Cal.com switch. No deprecated Substack URLs after a blog migration. No old payment links after a tool switch.
- [ ] **UTM parameters attached** if `analytics-tracking` skill is active. Naming convention per CLAUDE.md.

## Preview pass (5 minutes)

- [ ] **Send test to self.** Don't preview in the email tool. Send the actual test.
- [ ] **Open on phone.** Most subscribers read on phones. The desktop preview lies.
- [ ] **Open on dark mode.** Many email clients default to dark. Verify legibility.
- [ ] **Check images load.** If you have any (you probably don't, but if so).
- [ ] **Check links.** Tap each link on phone. Verify each one.
- [ ] **Read aloud.** Voice drift is easier to catch by ear.

## Send pass (2 minutes)

- [ ] **Audience selected:** the right group/segment (e.g. lead-gen assessment subscribers, not the whole list).
- [ ] **Sender name + reply-to verified:** matches the user's identity, not a "noreply@" address.
- [ ] **Send time chosen:** Sunday 8 to 10 am local for the user, OR scheduled for that window if writing earlier.
- [ ] **Family-floor checked one more time:** is the user about to send at a time that violates a protected block?

## Post-send (within 24 hours)

- [ ] **Check open rate by 6 hours post-send.** First-hour opens are the strongest signal.
- [ ] **Check reply inbox.** Read replies. Some are gold (testimonials, intros, questions).
- [ ] **Note any bounces.** Hard bounces should be removed.
- [ ] **Check the click-through on the CTA.** If it's flat (under 1%), the CTA or the body was off.
- [ ] **Capture standout reply.** Save to a testimonials file or a follow-up list.

## Weekly metrics review (5 minutes, Monday morning)

- [ ] **Open rate vs 4-week average.**
- [ ] **Click rate on CTA vs 4-week average.**
- [ ] **Reply count.**
- [ ] **Unsubscribes.** Over 0.5% on a single send is a signal to dig.
- [ ] **New signups in the previous 24 hours (post-send + CTA traffic).**

## When the checklist fails

| Item failed | What to do |
|---|---|
| Voice violations after 3 rewrites | The user is fighting the voice profile. Stop. Ask if the voice-rules need an update. |
| Dead link in test send | Don't send. Fix the link. Re-test. |
| Subject doesn't sound like a friend | Rewrite subject. The rest of the email is for nothing if the subject doesn't earn the open. |
| Family-floor conflict | Schedule for next morning. Don't send mid-protected block. |
| Frame is generic | Push back to the user for a real moment. Refuse to ship a generic frame. |
| Open rate <30% on 2 sends in a row | Subject lines are off OR list hygiene is failing. Run a re-engagement sequence. |
| Reply rate <2% on 4 sends in a row | Voice is off OR audience isn't ICP. Re-check content-strategy. |

## Skill version of the checklist

When this skill runs, output the checklist as a TodoWrite-style list. As the user marks items done, the skill confirms.

The output:

```
SUNDAY SEND CHECKLIST, {issue title}

Before drafting:
[ ] Essay finalized
[ ] Frame moment chosen
[ ] CTA picked
[ ] Time budget
[ ] Family-floor check

(...)

VOICE CHECK: pending
LINK CHECK: pending
PREVIEW CHECK: pending

Estimated time to send: 60 to 90 min
```

Run through. Update as you go. The send only fires after every item is green.

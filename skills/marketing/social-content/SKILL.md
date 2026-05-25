---
name: social-content
description: This skill should be used when the user asks to "write a social post", "LinkedIn post", "Threads chain", "IG carousel", "TikTok script", "Instagram post", "post about X", "draft something for [platform]", "social caption", or wants any single piece of content for a specific social channel. Distinct from content-strategy (the operating layer above) and copywriting (page copy). Pairs with newsletter-broadcast (the weekly spine that feeds these).
version: 0.1.0
---

# Social Content

Per-platform social posts for IG, LinkedIn (personal + brand page), Threads, TikTok, X. The skill knows each channel's format, hook style, character count, and what "good" sounds like in 2026.

The bar: every post sounds like the user, lands on the platform's actual culture, and ladders to either a pillar or a soft CTA.

## When this skill triggers

- "Write a LinkedIn post"
- "Threads chain about X"
- "Instagram carousel slides"
- "TikTok script for [topic]"
- "Draft a Threads post"
- "X thread on Y"
- "IG caption for [photo]"
- "Repurpose this essay for [platform]"

NOT for: full content calendar (use `content-strategy`), newsletter (use `newsletter-broadcast`), cold DMs (use `outreach-drafter` or `cold-email`), page copy (use `copywriting`).

## The diagnostic before drafting

Coach-mode. Three questions, one at a time. Wait for answers.

1. "Which platform, and which audience on that platform?"
2. "Which pillar is this post hitting?"
3. "What's the action (none, click, reply, save, share, DM)?"

If the user can't answer 2, route back to `content-strategy`. A post with no pillar tag is on the treadmill.

If the user can't answer 1 (says "any platform"), refuse. Each platform's culture is different. Pick.

## Per-platform format specs

### LinkedIn personal

- Length: 1200 to 1800 characters
- First line carries the hook (LinkedIn clips at ~200 characters with "see more")
- Paragraph breaks every 1-2 sentences
- White space matters
- No emojis (Langley convention; some other users use sparingly)
- Hashtags: 0 to 3 max, at the end
- Final line invites reply or DM

**The 5-line LinkedIn shape:**

```
[HOOK LINE]
Arresting claim or counterintuitive observation. 6 to 12 words.

[FRAME, 1-2 short paragraphs]
What you noticed. Why it matters.

[BEAT, 2-4 short paragraphs]
The core observation, with one example.

[LAND]
1 to 2 sentences. The shift.

[INVITE]
1 sentence. Reply or DM.
```

### LinkedIn company page

Same shape as personal, but tone shifts to the brand voice (less first-person, more "we observe" or framework-led). Posts that work on personal don't always work on company page. Brand-page reach is 1/10 of personal in 2026, plan accordingly.

For the example coaching business, company page is best for:
- Carousel reposts from the personal feed
- Testimonials
- Frameworks (the three pillars, etc.)
- Event announcements

Not for: hot takes, personal stories.

### Threads

- Length: 500 characters per post
- Chain length: 3 to 7 posts is the sweet spot
- First post is hook + frame. Last post offers the asset (essay link).
- Conversational tone. Threads is LinkedIn's casual cousin.
- Emojis acceptable for users who use them. Avoid for Langley.

**Threads chain shape (5 posts):**

```
1. Hook + frame
2. First beat
3. Second beat
4. Third beat OR land
5. Asset link OR reply prompt
```

Times that work: noon PT, 7 to 9 pm PT (audience scrolls during lunch and after bedtime routines).

### Instagram

Two formats matter: carousel and Reel.

**IG carousel (8 to 10 slides):**

- Slide 1: hook (text only or text on minimal visual)
- Slides 2-7: one idea per slide, 1 to 2 sentences max per slide
- Slide 8: CTA (link in bio, comment, save)
- Optional slide 9-10: deeper points

Visual: brand-aligned. Cream + teal + gold for Langley. Archivo Black headlines, Manrope body.

**IG Reel (15 to 60 seconds):**

- Open with the hook in first 1 second
- One beat, not three
- Captions burned in (most viewers watch muted)
- End with CTA OR cliff (cliffhanger drives saves)

Caption: 2 to 4 lines. The post's narrative is in the visual. Caption frames the watch.

### TikTok

- Length: 15 to 90 seconds (60 to 75 is the sweet spot for thought-leadership)
- Open with a claim, not a "hi I'm" intro
- One beat per script
- On-screen captions (burned in OR auto-captions cleaned up)
- Native sound or quiet ambient bed only

**TikTok script shape (75 seconds):**

```
[HOOK, 0-3 sec]
Direct claim, no preamble.

[BEAT, 3-50 sec]
The why. One observation, one example.

[LAND, 50-60 sec]
The takeaway, applied.

[SOFT CTA, 60-75 sec]
"Follow for more on X" or "Read the full essay, link in bio."
```

Brand-aligned. Langley TT visual system: black background, text in top + bottom thirds (not center), pulsing voice-amplitude visuals for ambient pieces.

### X (formerly Twitter)

- Length: 280 chars per post, or use 280+ for paid X premium
- Threads: 5 to 12 posts
- Punchier than LinkedIn or Threads
- First post is the strongest claim
- Last post offers the asset

X is anchor channel for indie SaaS and tech ICPs. Skip if the user's ICP is sales managers, real estate, coaches.

## The hook

Every post lives or dies on the first line. Get it right.

### Hook archetypes that work

- **The counterintuitive claim:** "Most new sales managers think the problem is time management. It's not."
- **The specific moment:** "Saturday morning. Coffee. Notebook. Kid asleep upstairs."
- **The number anchor:** "Three reactive triggers I caught myself doing this week."
- **The named example:** "A client said this on Friday: 'I have to read my reps' Slack to know what they actually mean.'"
- **The question (used sparingly):** "When did your week start being about other people?"
- **The pattern interrupt:** "Stop telling new managers to 'be a leader.'"

### Hooks to refuse

- "Imagine if you could..."
- "Picture this..."
- "What if I told you..."
- "Most people don't know this, but..."
- "Today I learned..."
- "Let me share something with you..."
- "Quick story..."

These are AI-tells. The reader skips before the third word.

## Voice integration

Every post goes through voice-rules before showing the user.

- Strip em-dashes
- Strip banned phrases
- Refuse "X, not Y" antipattern
- Strip AI-tell openers
- Match user's archetype
- Inject signature phrases naturally

Show "VOICE CHECK: clean" or "VOICE CHECK: N violations rewritten" before lock.

## Cadence by stage

| Stage | Total posts/week | Distribution |
|---|---|---|
| Pre-Rev Builder | 2 to 4 | 1 channel only |
| Early Operator | 4 to 6 | 1 primary + 1 secondary |
| Stable Solo | 10 to 12 | 2 to 3 channels, all derived from weekly essay |
| Scaling Solo | 12 to 20 | 3+ channels, spine + paid amplification |

the example coaching business at Stable Solo: ~10 to 12/week across Threads (5), IG (2), LinkedIn company page (2), TikTok (1), personal LinkedIn (2 via Typefully).

## Hashtag and tag rules

- LinkedIn: 0 to 3 hashtags. Tag people only when they're part of the story.
- Threads: 0 to 2 hashtags. Topical only, no spam.
- IG: 5 to 10 hashtags, mix of broad + niche.
- TikTok: 3 to 5 hashtags. Specific not generic.
- X: 1 to 2 hashtags or none.

Refuse to add 30 hashtags to anything. That's 2018 tactics, and signals spam in 2026.

## Repurposing from the essay

When the user has a Sunday essay (the spine), social posts are derived, not invented.

For each platform, pull a different angle of the same essay:

- LinkedIn personal: lead with frame + first 2 beats + invite
- LinkedIn company: clean essay extract, framework-led
- Threads chain: numbered beats
- IG carousel: visual breakdown of 3 to 5 ideas
- IG Reel: 60-sec script on the strongest claim
- TikTok: same as Reel
- X thread: punchier numbered version of Threads chain
- Quote graphic: the one quotable line

See `content-strategy/references/repurposing-spine.md` for the full spine pattern.

### When to break the spine

Some posts are not essay-derived. Real-time reactions, milestone announcements, client testimonials, current-event commentary, behind-the-scenes moments. Budget 30 to 60 minutes per week for off-spine posts.

The spine gives the user 6 to 8 derivatives. The off-spine slot gives the user 1 to 2 real-time pieces per week. Together they form the full cadence.

Don't go all off-spine; production cost balloons. Don't go all spine; the feed becomes mechanical. The mix matters.

## The one-off real-time post

These break the spine intentionally. Examples:

- "I caught myself doing trigger 1 again at 8:47 this morning"
- "Just shipped the new manager essay. Took 8 weeks. Worth it."
- "A client said this on Friday. I'm still sitting with it: '...'"
- "Reading [book]. The line that just stopped me: '...'"
- "Three things I'm watching this week: 1) ... 2) ... 3) ..."

Real-time posts have a specific shape: short, current, sensory. They earn engagement that scheduled spine posts don't.

Budget: 1 to 2 real-time posts per week, written fresh in 5 to 15 minutes each. Don't try to plan these. Write when the moment shows up.

Voice-scan and ship. Don't sit on a real-time post for 48 hours; it stales.

## Anti-patterns to refuse

### Posting without a pillar

Refuse. Every post tags to a pillar. No-pillar posts compound nothing.

### Hot takes that contradict the user's actual position

Some users want to "test edgy content." Push back: does the take match what the user actually believes? If not, it'll boomerang.

### Engagement bait

Refuse "Comment YES if you agree." Refuse "Tag a friend." Refuse "Repost if you love this."

### Selfie carousels with no body

Refuse 10 slides of headshots with vague captions. Carousels have one idea per slide. If the user's only content is a photo, skip the carousel and post a single image.

### Trend-jacking without thesis

Refuse to ride a trend if it doesn't ladder to the user's pillars. Trends without thesis are distraction (per `revenue-mapper`).

### "Inspirational" quotes from dead people

Refuse to ship "Be the change you wish to see" Gandhi quotes. The reader saw that quote in 2014. Use the user's own words.

### Posting at "optimal time" the user doesn't have

If "optimal time" is 7 am Monday and the user's protected block is 6 to 9 am M-F, schedule for noon. The post going up at a suboptimal time beats the user breaking the family-floor to post.

## Stage-aware adjustments

### Pre-Rev Builder

- 2 to 4 posts/week, one channel
- Voice calibration is the goal
- No CTA pressure
- Each post is one experiment

### Early Operator

- 4 to 6 posts/week, 1 to 2 channels
- Lead-magnet CTAs start (every 3rd to 4th post)
- Repurpose from blog when blog exists

### Stable Solo

- 10 to 12 posts/week, 2 to 3 channels
- Spine pattern (every post derived from weekly essay)
- Mix: 60% essay-derived + 40% real-time

### Scaling Solo

- 12 to 20 posts/week
- Spine + amplification (paid promotion of top performers)
- Track per-post pipeline contribution

## Family-floor integration

Posts can be SCHEDULED into protected blocks (the platform sends, the user does not).

Posts cannot be PRODUCED in protected blocks. If the user's only window is Saturday early morning, that's the production block. Scheduling tool fires the rest of the week.

## Revenue tag

- Posts that mention lead magnet or drive DM conversations: $$
- Posts that build authority + trust (essay-derived, story-based): $$
- Posts that are "build in public" updates with no audience hook: $ at best, often distraction
- Quote graphics: $$ (compound reach, low production cost)

## Working with other skills

- Imports: `voice-rules` (every post), `content-strategy` (for the calendar), `copywriting` (for hook + CTA craft)
- Pairs with: `newsletter-broadcast` (the spine), `ai-seo` (the essay's AI-search layer), `ad-creative` (when post moves to paid amplification)
- Distinct from: `cold-email`, `outreach-drafter` (one-to-one), `copywriting` (page copy)

## The output

When the user asks for a post, output:

```
PLATFORM: {platform}
PILLAR: {pillar tag}
GOAL: {action target}
LENGTH: {char count or duration}

VOICE CHECK: clean / N violations rewritten

[The draft]

NOTES:
- [Any pacing, visual, or scheduling notes]
- [Suggested time slot from the user's calendar]
```

End with: "Locked, or want to rework?"

## Additional Resources

### Reference files

- **`references/platform-format-specs.md`**, full per-platform spec sheet (character counts, hashtag rules, post-time patterns, visual conventions)
- **`references/hook-bank.md`**, 50+ hook archetypes with examples, organized by post type (story, framework, claim, observation, list)
- **`references/repurposing-from-essay.md`**, step-by-step on taking one essay and producing 6 derivative posts in 90 minutes

### Example files

- **`examples/example-threads-chain.md`**, full 5-post Threads chain on the Langley pattern with voice notes
- **`examples/example-linkedin-long-form.md`**, full LinkedIn personal post with first-line hook + paragraph breaks + invite line
- **`examples/ig-carousel-three-triggers.md`**, full 8-slide IG carousel with slide-by-slide copy and visual notes

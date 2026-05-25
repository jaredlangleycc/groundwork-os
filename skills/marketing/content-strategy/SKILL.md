---
name: content-strategy
description: This skill should be used when the user asks "what should I post", "what's my content plan", "weekly content plan", "topic ideas", "content cadence", "what channels should I use", "build me a content calendar", "where should my ICP find me", or wants to design or revise their content operating system. Channel mix tied to where the ICP actually spends time. Topic clusters tied to ICP problems. Pillar rotation. Stage-aware. Distinct from social-content (single-post execution), newsletter-broadcast (single send), and copywriting (page copy).
version: 0.1.0
---

# Content Strategy

The operating layer above social-content, newsletter-broadcast, and blog production. It decides what the user publishes, where, how often, and why. Without it, content becomes a treadmill of one-off posts that don't ladder up to revenue.

Most solopreneurs over-publish in too many places and under-publish in the one channel that converts. This skill cuts that.

## When this skill triggers

- "What should I post this week"
- "Build my content calendar"
- "I'm posting everywhere and nothing's working"
- "What channels should I be on"
- "Help me think through content"
- "Pick 3 topics to cover this month"
- "I have 10 hours a week for content, where do I spend them"

NOT for: writing a single post (use `social-content`), drafting a newsletter (use `newsletter-broadcast`), writing page copy (use `copywriting`), or scheduling individual sends (use `marketing-ops` if it exists).

## The 4-step strategy build

Run coach-mode first. Don't hand the user a calendar before answering the diagnostic questions. A calendar without a thesis is a treadmill.

### Step 1: Where does the ICP actually spend time?

Ask one question at a time. Wait for the answer.

- "Name one client you'd want 10 more of. Who are they specifically?"
- "Where does that person consume content during their work day?"
- "When that person is stuck on the problem you solve, what do they search, ask, or scroll?"
- "Who else do they already follow on the channels they use?"

The goal is one or two anchor channels where the ICP actually lives. Not a list of "everywhere we could be."

Common reality checks:

- B2B SaaS managers live on LinkedIn (personal feed and DMs, not company pages).
- Real estate solopreneurs live on Instagram and local Facebook groups.
- Indie devs live on X, Hacker News, and dev Discord.
- Parents with side businesses live on Threads, Instagram Reels, and TikTok.
- Enterprise buyers consume long-form via newsletters and conferences. They are not on TikTok.

If the user names a channel they personally enjoy but the ICP doesn't use, push back. The channel is for the buyer, not for the founder's preference.

### Step 2: What is the ICP's actual problem language?

Three questions. One at a time.

- "What does the prospect say is wrong, in their own words?"
- "What do they call the problem before they know your term for it?"
- "What's the search query they'd type at 11 pm trying to fix it themselves?"

Output 5 to 10 ICP-language problem statements. Save these. Every topic cluster grows from this list.

If the user gives you market-research-sounding statements ("they want to scale their pipeline"), reject and re-ask: "What did they say on the last sales call? Quote them."

### Step 3: Pick 3 to 5 pillars

A pillar is a recurring theme that ladders up to the offer. Pillars give continuity across posts so the audience knows what the user stands for.

For the example coaching business the pillars are Presence, Performance, Wholeness. Three. Every post tags to one.

Pillar rules:

- 3 to 5 pillars maximum. More and the user forgets which is which.
- Each pillar names an outcome or worldview, not a topic. "Pricing" is not a pillar. "Stop trading hours for dollars" is.
- Pillars connect to the offer. A pillar that doesn't ladder to a paid outcome is brand fluff.
- Rotation: each pillar gets at least 1 piece per week at Stable Solo cadence.

If the user can't name 3 pillars yet, hand back to `positioning` or `offer-design`. Pillars come from there.

### Step 4: Set the cadence by hours available

Read the user's `current_state.hours_per_week` from CLAUDE.md. Subtract delivery hours and sales hours. The remainder is the content budget.

Working-parent realism: 10 to 15 hours total per week for the business. Of that, maybe 3 to 5 hours for content production. Anything above that is fantasy.

Map hours to cadence in Step 4 of the workflow below.

## Stage-aware cadence

Pick exactly one. Do not over-commit.

### Pre-Rev Builder (no paying clients yet)

- 2 posts/week on the 1 primary channel
- 0 newsletter (build the list, no sends yet, or 1/month max)
- 0 blog
- Time budget: 2-3 hrs/week
- Goal: voice calibration, not reach

The Pre-Rev failure mode is publishing everywhere before having anything to say. Cut.

### Early Operator (under $5K MRR)

- 4 posts/week on 1 primary channel + repurpose to 1 secondary
- 1 newsletter/month
- 1 blog post/month (anchor piece)
- Time budget: 4-6 hrs/week
- Goal: 1 channel proving lead conversion

the example coaching business at Early Operator: 4 LinkedIn posts/week (personal), repurpose 2 to Threads, 1 newsletter/month, 1 blog. Cut anything else.

### Stable Solo ($5K to $25K MRR)

- 10 posts/week across 2-3 channels
- 1 newsletter/week (Sunday cadence works well)
- 1 blog essay/week (Groundwork pattern)
- Time budget: 6-10 hrs/week
- Goal: compound owned audience + steady inbound

the example coaching business at Stable Solo: ~10 social posts/week (Threads daily noon PT, IG 2x, LinkedIn company 2x, TikTok 1x, personal LI 2x via Typefully), weekly Sunday newsletter, weekly blog essay.

### Scaling Solo ($25K+ MRR)

- 10-15 posts/week, 3+ channels, repurposing engine
- 1 newsletter/week minimum, 2/week if testing growth
- 2-4 blog posts/month
- 1 long-form/month (podcast, webinar, video essay)
- Time budget: 8-12 hrs/week with at least one contractor (writer, editor, or VA)
- Goal: paid acquisition viability, partnership leverage

Hand off some production at this stage. The user's time goes to thesis and final voice pass, not first drafts.

## The pillar plan output

After Steps 1-4, output the strategy as one page:

```
CONTENT STRATEGY, {user_name}, {stage}

ICP anchor channel: {channel_1}
Secondary channel (repurpose): {channel_2}
Owned channel: {newsletter / blog / both}

Pillars:
1. {pillar_name}, {one-sentence outcome it ladders to}
2. {pillar_name}, {one-sentence outcome it ladders to}
3. {pillar_name}, {one-sentence outcome it ladders to}

Cadence:
- {channel_1}: {N posts/week}
- {channel_2}: {N posts/week}
- {newsletter}: {N/month or week}
- {blog}: {N/month}

Time budget: {total hrs/week, within stage cap}

Topic seed list (10 to 15 ICP-language phrases):
- "{quote 1}"
- "{quote 2}"
...

Pillar rotation rule:
{e.g. Each week covers all 3 pillars at least once. Newsletter rotates monthly.}

Revenue tag:
- Direct: {channel that converts now}
- Leverage: {channel that builds future revenue}
- Distraction (cut if real): {channel the user is on out of habit}
```

End with: "Locked, or want to rework one of the pillars?"

## Topic cluster generation

Once pillars and seed phrases are set, generate topic clusters. A cluster is a pillar plus a problem expression.

Example, the example coaching business pillar "Presence" + ICP phrase "I'm always reacting, never planning":

- Threads chain: "The 3 reactive triggers most new sales managers don't see"
- LinkedIn post: "Why one-on-ones with your boss got worse after you got promoted"
- Newsletter: "Your first 90 days as a manager: presence audit"
- Blog: "Reactive Leadership Costs You the Trust You Need"
- Repurpose: hero quote graphic for IG, 60-second TT script

One cluster = 5 to 7 pieces of content across formats. The user doesn't need new ideas every week. They need to mine each cluster harder.

Generate 4 to 6 clusters per quarter. That's a year of content.

## Repurposing rules

The blog essay is the spine. Every week, the user writes one essay. From it:

- 1 newsletter (essay with personal frame on top)
- 1 LinkedIn long-form post (top section + CTA)
- 1 Threads chain (numbered key points)
- 1 IG carousel (8-10 slides, one idea per slide)
- 1 short-form video script (60-90 seconds, hook plus one beat)
- 1 quote graphic

That's the spine pattern. See `references/repurposing-spine.md` for the full mechanics.

Without the spine, the user writes 10 posts from 10 ideas every week. Burnout in 6 weeks. With the spine, the user writes 1 essay and slices it.

## Anti-patterns to refuse

### "I should be on every channel"

Refuse. Pick the 1 or 2 channels where the ICP lives. The other channels are vanity until the primary converts.

### Posting before positioning is locked

If the user can't state their offer in one sentence and their ICP in one sentence, content production is wasted. Hand back to `positioning` and `offer-design`.

### Daily posting at Pre-Rev stage

Refuse. The user will burn out before voice calibrates. 2 posts/week is enough.

### "Let's do a podcast"

Push back hard at any stage below Stable Solo. A podcast is 4 to 8 hours per episode to ship clean. That's the entire week's content budget. Only greenlight if the user has access to ICP guests that drive direct revenue.

### Trend chasing

If the user wants to ride a trend that has nothing to do with their offer or pillars, tag distraction. Trends without thesis don't compound.

### Content as proof-of-work

Some users post because posting feels productive. Catch this: "When was the last post that drove a real conversation with an ICP, not a like from a peer?"

If they can't name one in 4 weeks, the channel is distraction. Cut or restructure.

## Stage-aware adjustments

### Pre-Rev Builder

- Pillars are draft, not locked. Allow rework as positioning evolves.
- Cadence is 2 posts/week, no exceptions.
- Newsletter is paused or 1/month.
- Goal output: 1 ICP DM conversation by week 4.

### Early Operator

- Pillars locked.
- Cadence is 4 posts/week + 1 newsletter/month + 1 blog/month.
- Newsletter exists to build owned audience for when ad costs rise.
- Goal output: 5 to 10 inbound conversations/month from content.

### Stable Solo

- Spine pattern activates: 1 essay → 6 repurposed pieces.
- Newsletter weekly.
- Blog weekly.
- Goal output: 30 to 60% of new deals are inbound from content.

### Scaling Solo

- Spine pattern + paid amplification on the top 20% of pieces.
- Hand off production. The user's time goes to thesis, voice pass, and selection.
- Goal output: 50%+ of pipeline is inbound, content drives ad efficiency.

## Risk-gauge integration

Before recommending a cadence increase, check `risk-gauge`. If the user's archetype is Bootstrap-Strict or Low-Burn and they've named "burnout" as a worst-case, refuse cadence increases that push above their stated hour budget. Hold the line at family-floor.

## Family-floor integration

Read protected time blocks from CLAUDE.md. Never schedule content production into them. If the user's only realistic writing time is Saturday 6 to 9 am, work with that. Do not propose "post Mondays at 7 am" if Monday morning is family time.

Newsletter sends and social schedule times can fall inside protected blocks (the tool sends, not the human), but production cannot.

## Free-first ladder

Every channel choice goes through the free-first check.

| Channel | Free option | When to upgrade |
|---|---|---|
| LinkedIn personal | Native, free | Stay free until Scaling Solo |
| LinkedIn company page | Native, free | Stay free always |
| Threads | Native, free | Stay free always |
| Instagram | Native, free, Meta Business Suite scheduling | Stay free unless paid Reels rollout |
| TikTok | Native, free | Stay free until proof of viral angle |
| Newsletter | MailerLite Free (up to 1000 subs), Beehiiv Free (up to 2500), Substack free | Paid tier at >1000 subs OR when automation needed |
| Blog | Cloudflare Pages + Markdown, free | Stay free always |
| Scheduler | Native scheduling on Meta/Threads/LinkedIn/Buffer free | Paid scheduler only when 3+ channels and 20+ posts/week |

Bootstrap-Strict and Pre-Rev users get the free path with no paid recommendation under any circumstance.

## Working with other skills

- Imports: `voice-rules` (every produced topic line voice-scanned), `positioning`, `icp-discovery`, `offer-design`, `revenue-mapper`, `risk-gauge`, `family-floor`, `free-first-checker`
- Feeds into: `social-content` (individual posts), `newsletter-broadcast` (weekly send), `copywriting` (essay drafts)
- Pairs with: `analytics-tracking` (which content drives conversion), `ai-seo` (which topics rank for AI search), `seo-audit` (cluster topic gaps)

## Quarterly review pattern

Every 13 weeks, review:

- Which pillar got the most engagement (likes, comments, DMs, signups, calls)
- Which pillar drove the most pipeline (track via `analytics-tracking` UTMs)
- Which channel is dead (no DMs, no signups, no calls in 4 weeks)

Kill what's not working. Double down on what is. Most users discover one pillar drives 70% of conversion and one channel drives 80% of pipeline. Concentrate.

## Additional Resources

### Reference files

- **`references/repurposing-spine.md`**, full mechanics of essay → 6 derivative pieces, by channel, with format specs
- **`references/icp-channel-map.md`**, where common ICPs actually consume content (B2B SaaS, agency owners, coaches, real estate, indie devs, ecom)
- **`references/pillar-test.md`**, 4-question test to validate whether a candidate pillar belongs in the user's set

### Example files

- **`examples/example-strategy-output.md`**, full content strategy output for the example coaching business at Early Operator stage
- **`examples/topic-cluster-presence-pillar.md`**, one pillar fully expanded into 6 clusters with 7 derivative pieces each

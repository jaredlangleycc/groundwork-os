# Citation Monitoring

Quarterly playbook for testing whether AI engines cite the user's site. How to test queries, what to track, when to iterate.

## The principle

Citation in AI engines isn't a ranking. It's an outcome. The user can't optimize toward a number directly. They optimize the levers (per `seven-levers-detailed.md`), then measure citation rate to see if it's working.

The measurement is manual. Most AI engines don't expose citation analytics.

## The 5-query test

Pick 5 target queries the user wants to be cited for. Test in 5 engines. Quarterly.

### Step 1: Pick the queries

Queries should:

- Sound like real ICP queries (test by asking the user's clients)
- Be specific enough to differentiate
- Cover a mix of: branded, framework, problem, solution, definition

Example queries for the example coaching business:

1. **Branded:** "Who is Jared Langley"
2. **Framework:** "What are the three pillars of leadership"
3. **Problem:** "Why am I always reactive as a new sales manager"
4. **Solution:** "How does leadership coaching for new managers work"
5. **Definition:** "What is The flagship offer coaching engagement"

Document the queries. Use the same queries each quarter for trend tracking.

### Step 2: Test in each engine

For each query, ask in:

1. **ChatGPT** (chat.openai.com, free tier OK, GPT-4 default)
2. **Perplexity** (perplexity.ai, free tier OK)
3. **Claude.ai** (claude.ai, free tier OK)
4. **Google AI Overviews** (google.com search, US/UK rollout)
5. **Microsoft Copilot** (copilot.microsoft.com, free)

Run each query in a fresh session (clear chat history) to avoid bias.

### Step 3: Record the response

For each query × engine combination, note:

| Field | Possible values |
|---|---|
| Cited the user's site? | yes / no |
| If yes, citation type | direct quote / paraphrase + link / mention only |
| URL cited | exact URL or "homepage" |
| Position in response | top / middle / bottom |
| Quote text (if direct) | full quote |
| Surrounding context | 1 sentence of what the AI was answering |
| Competitor cited? | yes / no, and who |

### Step 4: Aggregate

| Query | ChatGPT | Perplexity | Claude.ai | Google AIO | Copilot | Total citations |
|---|---|---|---|---|---|---|
| Branded | Yes | Yes | Yes | Yes | Yes | 5/5 |
| Framework | Partial | Yes | No | No | No | 1.5/5 |
| Problem | No | Partial | No | No | No | 0.5/5 |
| Solution | No | No | No | No | No | 0/5 |
| Definition | Yes | Yes | Partial | No | Yes | 3.5/5 |

Citation rate: 10.5/25 = 42%.

This is the number to track over time.

## Tracking spreadsheet

Set up a simple spreadsheet:

| Date | Query | Engine | Cited? | Type | URL cited | Notes |
|---|---|---|---|---|---|---|
| 2026-05-20 | Branded | ChatGPT | yes | direct | [your-domain].com/about | Quote: "ICF-trained..." |
| 2026-05-20 | Framework | Perplexity | yes | paraphrase | /three-pillars | (paraphrased the 3 pillars) |
| ...

Quarterly: 5 queries × 5 engines = 25 rows.

## Citation patterns to learn from

### Pattern 1: Branded queries cite, framework queries don't

Common at baseline (before AI SEO levers applied). Means the entity is recognized but the topical authority hasn't compounded.

Action: apply Levers 1 + 2 (answer-first + Speakable) on framework + problem essays. Add llms-full.txt (Lever 5).

### Pattern 2: Direct quotes vs paraphrases

Direct quotes are stronger signal. Means the AI found a specific quotable line.

Action: review the quote. If it's the user's signature phrase or thesis, reinforce by repeating it across content. If it's incidental, ignore.

### Pattern 3: Competitor cited instead

The AI cited a competitor on the user's target query. Means the competitor has stronger entity + content for that query.

Action: do not try to "out-AI" the competitor. Instead, find the angle they don't cover. Build entity around that angle.

### Pattern 4: Citation declines over time

Less common, but possible if the AI engine updates its training data and your content doesn't refresh.

Action: review llms.txt currency (last_updated date), confirm new content is being shipped, run IndexNow on updated URLs.

## Iteration triggers

### After a quarter test with 0 to 20% citation rate

The levers aren't fully applied. Audit which levers are in place and which aren't. Apply missing levers.

Common gaps:
- llms-full.txt not deployed
- Answer-first blocks missing on essays
- Entity unification not done

### After a quarter test with 20 to 40% citation rate

Foundation is in. Now compound through content.

Actions:
- Publish 1 to 2 high-quality essays on each target query
- Strengthen the entity (more sameAs URLs, more credential signals)
- Build inbound links from authoritative sources (podcast appearances, guest posts)

### After a quarter test with 40 to 60% citation rate

Strong. Compound through:
- More definition pages
- More framework content
- More public-record signals (Wikidata stub, conference talks, podcast appearances)

### After 60%+ citation rate

You're the canonical source for those queries. Maintain and broaden.

Actions:
- Expand to 10 to 15 target queries
- Test adjacent queries that competitors are cited for
- Layer paid amplification (per `paid-ads`) on the winning content

## What NOT to do based on citation data

### Don't game it

Don't write content that's "AI-friendly" at the cost of voice or substance. AI engines will eventually rank quality over keyword-stuffed quotability.

### Don't pivot framework for citation

If "three pillars" isn't getting cited, don't switch to "five elements" hoping for more citations. The framework is the user's truth, not an AI play.

### Don't moralize about competitor citations

If a competitor is cited and the user isn't, that's data, not injustice. Build the next move.

### Don't try to game llms.txt

Don't stuff llms.txt with keywords or inflate claims. AI engines cross-check.

### Don't switch engines based on one test

If Claude.ai didn't cite the user but Perplexity did, that's normal variance. Engines have different training data and different citation algorithms.

## When to skip citation monitoring

For Pre-Rev Builder and Early Operator users, citation monitoring is distraction. They don't have enough content or entity signal yet to expect citations. Wait until they have:

- 6+ months of consistent content
- 5+ essays/posts on the framework
- A locked entity (Person + Org schema, sameAs URLs, credentials)

THEN start quarterly monitoring.

## Citation monitoring + revenue tag

Citations themselves don't generate revenue. They generate awareness.

The full chain:

1. AI engine cites the user (output of AI SEO)
2. User in AI engine sees the citation, clicks
3. Lands on the user's site (often the essay)
4. Reads, signs up for the lead magnet (lead-gen assessment)
5. Enters nurture sequence
6. Books a call
7. Converts to paying client

The first 4 steps are "leverage" ($$). The last 3 are "direct revenue" ($$$). Citation is upstream of $$$ but is itself $$.

## Family-floor + time

- Quarterly test: 1 hour to run + 30 min to log + 30 min to iterate plan = 2 hours/quarter
- Annual audit of citation trend: 2 hours

Total: ~10 hours/year on citation monitoring. Within `revenue-mapper` $$ budget.

If the user spends more time monitoring citations than producing content, the priorities are off.

## Output of a citation monitoring session

```
CITATION MONITORING, {date}

QUERIES TESTED:
1. {query 1}
2. {query 2}
3. {query 3}
4. {query 4}
5. {query 5}

ENGINES TESTED: ChatGPT, Perplexity, Claude.ai, Google AIO, Copilot

CITATION RATE: {N}/{25} = {%}

CHANGES FROM LAST QUARTER:
- {query 1}: {Y/N change}
- {query 2}: {Y/N change}
- ...

LEARNINGS:
- {pattern observed}
- {pattern observed}

ACTIONS:
1. {what to ship this month}
2. {what to ship this month}

NEXT TEST DATE: {3 months from today}
```

End with: "Lock the actions, or rework?"

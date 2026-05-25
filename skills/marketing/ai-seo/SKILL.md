---
name: ai-seo
description: This skill should be used when the user asks to "optimize for AI search", "get cited by ChatGPT", "AI Overviews", "Perplexity citations", "AI SEO", "GEO" (generative engine optimization), "LLM visibility", "llms.txt", "make my site quotable by AI", or wants their content to appear in AI-generated answers. Distinct from seo-audit (traditional ranking) and content-strategy (the content layer). Free, no paid tools required.
version: 0.1.0
---

# AI SEO

Optimize content so AI search engines cite it. The target is ChatGPT, Perplexity, Claude, Google AI Overviews, Gemini, Microsoft Copilot. Different game from traditional SEO: the AI is reading and summarizing, not ranking blue links.

The 2026 frame: traditional SEO gets the user a link in the SERP. AI SEO gets the user quoted in the AI's answer. Both matter. This skill focuses on the second.

## When this skill triggers

- "Get my site cited by ChatGPT"
- "AI Overviews citation"
- "Perplexity citations"
- "AI SEO" / "GEO" (generative engine optimization)
- "LLM visibility"
- "llms.txt"
- "Make my site quotable by AI"
- "Optimize for AI search"
- "How do I show up in AI answers"

NOT for: traditional ranking in blue links (use `seo-audit`), creating content (use `content-strategy` + `copywriting`), building pages at scale.

## The diagnostic before optimizing

Coach-mode. One at a time.

1. "Which AI engines do you want to target? (ChatGPT, Perplexity, Claude, Google AI Overviews, all?)"
2. "What are 5 queries where you'd want to be cited? Write them as a user would type them."
3. "Have you tested what those engines say about your topic today?"
4. "What's the canonical version of your perspective on each query?"
5. "Do you have schema, llms.txt, and answer-first content blocks in place?"

If the user can't answer 2 (no target queries), this is exploration, not optimization. Push back: "Let's name 5 queries first. Otherwise we're optimizing for nothing specific."

## The 7 levers

AI SEO operates on 7 levers. Apply each. Most users have 0 to 2 in place; full pass takes 1 to 2 Friday blocks.

### Lever 1: Answer-first content blocks

AI engines extract direct answers. The first 2 to 4 sentences of a page should answer the implied question.

#### Template

```html
<div class="essay-answer">
  <span class="answer-label">The Short Version</span>
  <p>{1-3 sentence direct answer to the implied question}</p>
</div>

<!-- Body content continues below -->
```

#### Example (Langley "Three Reactive Triggers" essay)

```html
<div class="essay-answer">
  <span class="answer-label">The Short Version</span>
  <p>Reactive leadership shows up in three places most new managers don't see: the morning Slack scroll, the interrupt 1:1, and the late-day deal review. The fix isn't a calendar trick. It's the pause: three to five seconds between trigger and response.</p>
</div>
```

This block goes inside `<article>` near the top, before the body. Visible to readers. Marked up with Speakable schema.

### Lever 2: Speakable schema

Tells AI engines which CSS selector contains the extractable answer.

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Article",
  "headline": "...",
  "speakable": {
    "@type": "SpeakableSpecification",
    "cssSelector": [".essay-answer p"]
  },
  "..."
}
</script>
```

Apply to every essay or important content page.

### Lever 3: FAQPage schema

AI engines love structured FAQs. Each Q + A becomes an extractable answer.

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "What is reactive leadership?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Reactive leadership is the pattern where..."
      }
    }
  ]
}
</script>
```

Use FAQPage when the visible page actually has FAQs. Don't fake FAQs to game schema; Google penalizes.

### Lever 4: Person + Organization + WebSite entity unification

AI engines need a coherent entity for the user. If author, publisher, organization references are inconsistent, the AI doesn't know who to attribute.

Unify via `@id`:

```html
<!-- Homepage Person schema -->
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Person",
  "@id": "https://{domain}/#jared",
  "name": "...",
  "knowsAbout": [...],
  "alumniOf": {...},
  "hasCredential": {...},
  "sameAs": [...]
}
</script>

<!-- Essay schema -->
<script type="application/ld+json">
{
  "@type": "Article",
  "author": { "@id": "https://{domain}/#jared" }
}
</script>
```

Every essay's author references back to the single Person entity.

### Lever 5: llms.txt and llms-full.txt

A relatively new convention (proposed by llmstxt.org) for AI engines. Two files at the root:

**llms.txt:** curated index of the site's important content (markdown, structured)

**llms-full.txt:** self-contained reference document (markdown, 1 to 5 KB) that gives the AI the user's identity, framework, pricing, FAQs, key claims in one fetch

#### llms.txt template

```markdown
# {Brand Name}

> {1-sentence positioning}

{1-paragraph context for who you are and what you do}

## Identity

- [About Page]({url}/about): Who I am and why this work exists.
- [Person Schema]({url}/#jared): Structured identity data.

## Framework

- [The Three Pillars]({url}/three-pillars): The framework I teach.
- [What is The flagship offer]({url}/what-is-the-foundation): Definition page.

## Programs

- [The flagship offer]({url}/foundation): 90-day coaching engagement.

## Essays

- [Three Reactive Triggers]({url}/blog/three-reactive-triggers): On reactive leadership and the pause.
- [Grounding Comes First]({url}/blog/grounding-comes-first): On presence as the prerequisite.
- [Leadership Coaching for New Managers]({url}/blog/leadership-coaching-for-new-managers): On the new-manager arc.

## Optional

- [llms-full.txt]({url}/llms-full.txt): Self-contained reference document.
```

#### llms-full.txt template

```markdown
# {Brand Name}, Self-Contained Reference

## Identity

{Founder name}, {role}, {credentials}.

{2-3 sentence biographical context.}

## The Framework

{Name of framework}. {1-paragraph description.}

{Framework components, with 2-3 sentences each.}

## Pricing

{Offer name}. {Price.} {Length.} {Key terms.}

## Common Questions

**Q: ...**
A: ...

**Q: ...**
A: ...

(Continue for 6 to 10 of the most common questions.)

## What I Stand For

{1-paragraph point of view, in the user's voice.}

## How to Contact

{email or contact form URL}

## Last updated

{date}
```

llms-full.txt is the file an AI engine fetches when it wants the full context. Keep it under 5 KB.

### Lever 6: robots.txt for AI bots

Allow AI crawlers explicitly. Default robots.txt allows everything, but some platforms (Cloudflare, Vercel) inject blocks by default.

```
User-agent: *
Allow: /

# AI bots, explicit allow
User-agent: GPTBot
Allow: /

User-agent: ChatGPT-User
Allow: /

User-agent: OAI-SearchBot
Allow: /

User-agent: ClaudeBot
Allow: /

User-agent: Claude-Web
Allow: /

User-agent: anthropic-ai
Allow: /

User-agent: Google-Extended
Allow: /

User-agent: PerplexityBot
Allow: /

User-agent: Perplexity-User
Allow: /

User-agent: CCBot
Allow: /

User-agent: cohere-ai
Allow: /

User-agent: Bytespider
Allow: /

Sitemap: https://{domain}/sitemap.xml
```

Verify Cloudflare's "Block AI bots" toggle is OFF and "Manage your robots.txt" is disabled. See Langley `reference_cloudflare-robots-txt-gotcha.md`.

### Lever 7: IndexNow for cross-engine push

IndexNow is a free protocol (Microsoft + Yandex initiative). Push URL updates to Bing, Yandex, Seznam, Naver, Yep instantly. Speeds up indexing.

#### Setup

1. Generate API key: `openssl rand -hex 16`
2. Place key file at `https://{domain}/{key}.txt` containing the key
3. On URL change, POST to:

```
https://api.indexnow.org/indexnow
{
  "host": "{domain}",
  "key": "{key}",
  "urlList": ["https://{domain}/new-page", "https://{domain}/updated-page"]
}
```

Integrate into the user's deploy script. Run on every deploy.

See Langley `reference_indexnow-langley.md` for full setup recipe.

## The 5 query test

After applying the 7 levers, test:

1. Pick 5 target queries
2. Ask each query in:
   - ChatGPT (free)
   - Perplexity (free)
   - Claude.ai (free)
   - Google AI Overviews (free, US/UK)
   - Microsoft Copilot (free)
3. Note: does the user's site get cited? Quoted? Linked?
4. Repeat in 60 days and again in 6 months

This is the actual outcome measurement. SERP rank doesn't matter for AI SEO. Citation does.

## Stage-aware adjustments

### Pre-Rev Builder

- Skip AI SEO entirely. Focus on positioning + first content.
- AI engines won't have signal to cite a site with 1 page anyway.

### Early Operator

- Apply Levers 1, 2, 4, 6 (foundational)
- Skip Levers 3, 5, 7 until at Stable Solo
- Run the 5-query test annually

### Stable Solo

- Apply all 7 levers
- Quarterly 5-query test
- Llms.txt + llms-full.txt maintained
- Author entity unification across all essays

### Scaling Solo

- All 7 levers, ongoing maintenance
- Monthly 5-query monitoring
- Add structured data for specific entity types (Course, Service, Person, Organization)
- Consider knowledge-graph submissions (Wikidata stub for the founder)

## Free path

AI SEO is 100% free. No paid tools required. Anyone selling "AI SEO software" in 2026 is selling smoke.

| Need | Free tool / method |
|---|---|
| Schema generation | Hand-write JSON-LD or use schema.org generator |
| Speakable validation | Rich Results Test (Google) |
| FAQPage validation | Rich Results Test |
| Person + Org schema | Hand-written, validated |
| llms.txt generation | Hand-written markdown |
| llms-full.txt | Hand-written markdown |
| robots.txt AI allow | Plain text edit |
| IndexNow API | curl POST, free |
| Query testing | ChatGPT free, Perplexity free, Claude.ai free, Google AI Overviews free |
| Citation monitoring | Manual, quarterly |

Refuse to pay for "AI SEO tools" until the user is at Scaling Solo AND has exhausted the free path.

## Anti-patterns to refuse

### "Stuff the page with AI keywords"

Refuse. AI engines do not use keyword density signals. They read the content and summarize.

### "Generate 100 FAQ entries"

Refuse. FAQs that aren't real user questions are penalized. Use 6 to 10 real questions, well-answered.

### "Hide content for AI bots only"

Refuse. Cloaking is detected. Penalized.

### "Buy citations from prompt engineering services"

Refuse. Citations are earned, not bought. Anyone selling "guaranteed Perplexity citations" is selling smoke.

### "Optimize for ChatGPT's algorithm"

Push back. ChatGPT doesn't have a public algorithm to optimize for. The optimization is for the universal AI-readability pattern: clear, specific, structured, cited.

### "Skip traditional SEO, just do AI SEO"

Refuse. AI engines train on web data. Traditional SEO (indexability, schema, on-page basics) is the foundation. Without it, AI engines can't reliably find or cite the content.

## Common citation patterns

When AI engines cite the user, the patterns are predictable:

### Pattern 1: "According to {brand}..."

The AI directly cites the source with the brand name. Happens when:
- The brand has clear entity (Person + Organization schema)
- The page has a definitive claim on the topic
- The topic is specific to the brand's expertise

### Pattern 2: Quoted excerpt + link

The AI quotes a sentence or two from the page and links. Happens when:
- The page has answer-first blocks (Lever 1)
- Speakable schema is present (Lever 2)
- The quote is concise and self-contained

### Pattern 3: Synthesized paraphrase + link

The AI paraphrases the user's perspective and cites the URL. Happens when:
- The page has structured framework (Pillars, Steps, etc.)
- The framework has named components
- The user is the canonical source for the named framework

### Pattern 4: No citation, paraphrased

The AI uses the content without attribution. This happens to most pages. AI SEO Lever work increases the citation rate from ~0% to 20 to 60% depending on the topic competitiveness.

## Family-floor + revenue tag

- AI SEO setup: $$ (leverage; compounds over 6 to 12 months)
- AI SEO maintenance: $ (low ongoing time cost once levers are in place)
- Endless AI SEO optimization without traffic to optimize: distraction

Cap initial AI SEO setup at 2 Friday blocks (~8 hours). Beyond that, return to organic content + traditional SEO.

## Working with other skills

- Imports: `voice-rules` (all written content + schema text), `seo-audit` (traditional SEO foundation), `content-strategy` (which content to optimize)
- Pairs with: `copywriting` (answer-first blocks), `newsletter-broadcast` (blog publishing parallel), `analytics-tracking` (measuring citation outcomes)
- Distinct from: `seo-audit` (focuses on rank in blue links), `content-strategy` (the content layer above)

## Output format

When applying AI SEO levers, output:

```
AI SEO PASS, {domain}, {date}

CURRENT STATE:
- Lever 1 (Answer-first blocks): {applied / partial / missing}
- Lever 2 (Speakable schema): {applied / partial / missing}
- Lever 3 (FAQPage schema): {applied / partial / missing}
- Lever 4 (Entity unification): {applied / partial / missing}
- Lever 5 (llms.txt + llms-full.txt): {applied / partial / missing}
- Lever 6 (robots.txt AI allow): {applied / partial / missing}
- Lever 7 (IndexNow): {applied / partial / missing}

PROPOSED CHANGES:
1. {Lever}: {what to ship, time estimate}
2. {Lever}: {what to ship, time estimate}

5 QUERY TEST (baseline):
- "{query 1}": cited? {Y/N}, where? {engine}
- "{query 2}": cited? {Y/N}
- ...

NEXT 5 QUERY TEST DATE: {60 days from today}

TIME TO SHIP: {hours}
FAMILY-FLOOR CHECK: {clear / conflict}
REVENUE TAG: $$
```

End with: "Lock the plan, or rework?"

## Additional Resources

### Reference files

- **`references/seven-levers-detailed.md`**, deep dive on each of the 7 levers with code snippets, examples, and validation steps
- **`references/llms-txt-templates.md`**, copy-paste templates for llms.txt and llms-full.txt, with examples by business type
- **`references/citation-monitoring.md`**, quarterly citation monitoring playbook, how to test queries, what to track, when to iterate

### Example files

- **`examples/example-ai-seo-pass.md`**, full AI SEO pass for jaredlangley.cc with all 7 levers applied, with files shipped + queries tested
- **`examples/answer-first-blocks-by-essay.md`**, answer-first blocks for 4 Langley essays as actual deployed examples

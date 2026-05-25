# Langley AI SEO Pass, May 2026 (Worked Example)

The full AI SEO pass executed on jaredlangley.cc, May 16 to 20, 2026. All 7 levers applied. Files shipped. Queries tested. Outcome documented.

## Audit context

- **Domain:** jaredlangley.cc
- **Date:** May 16 to 20, 2026
- **Stage:** Early Operator transitioning to Stable Solo ($5K MRR)
- **Goal:** Establish citation foundation in AI search engines, baseline citation rate, deploy all 7 levers
- **Time invested:** ~10 hours across 2 sessions (Friday evening + Saturday morning)
- **Tools used:** Schema validators, IndexNow API, Rich Results Test, llmstxt.org reference

## Lever-by-lever progress

### Lever 1: Answer-first blocks

**Status:** SHIPPED on all 4 published essays + essay template.

**What shipped:**

For each essay (Grounding Comes First, Three Reactive Triggers, Leadership Coaching for New Managers, plus one in progress), added a `.essay-answer` callout near the top:

```html
<div class="essay-answer">
  <span class="answer-label">The Short Version</span>
  <p>{1-3 sentence answer}</p>
</div>
```

CSS added to the essay stylesheet (cream tint background, gold left border, brand-aligned).

**Example answer (Three Reactive Triggers):**

> Reactive leadership shows up in three places most new managers don't see: the morning Slack scroll, the interrupt 1:1, and the late-day deal review. The fix isn't a calendar trick. It's the pause: three to five seconds between trigger and response.

**Time:** 30 minutes per essay × 4 = 2 hours.

### Lever 2: Speakable schema

**Status:** SHIPPED on all 4 essays.

**What shipped:**

In each essay's Article JSON-LD schema, added:

```json
"speakable": {
  "@type": "SpeakableSpecification",
  "cssSelector": [".essay-answer p"]
}
```

**Validation:** Rich Results Test confirms Article schema validates without errors. Speakable selector resolves to the answer paragraph.

**Time:** 15 minutes per essay × 4 = 1 hour.

### Lever 3: FAQPage schema

**Status:** SHIPPED on homepage. Upgraded from 3 Q+A to 6 Q+A to match the visible FAQ section on the homepage.

**What shipped:**

```json
{
  "@type": "FAQPage",
  "mainEntity": [
    { "@type": "Question", "name": "What is The flagship offer?", "acceptedAnswer": {...} },
    { "@type": "Question", "name": "How much does it cost?", "acceptedAnswer": {...} },
    { "@type": "Question", "name": "How long is the engagement?", "acceptedAnswer": {...} },
    { "@type": "Question", "name": "Who is The flagship offer for?", "acceptedAnswer": {...} },
    { "@type": "Question", "name": "How is this different from sales coaching?", "acceptedAnswer": {...} },
    { "@type": "Question", "name": "Do you have a guarantee?", "acceptedAnswer": {...} }
  ]
}
```

All 6 visible on the homepage in the FAQ accordion. Schema text matches visible text closely.

**Time:** 30 minutes.

### Lever 4: Entity unification (Person + Organization + WebSite)

**Status:** SHIPPED. Full schema graph on homepage + About page; essays reference via `@id`.

**What shipped:**

Homepage `@graph`:

```json
{
  "@context": "https://schema.org",
  "@graph": [
    {
      "@type": "Person",
      "@id": "https://[your-domain].com/#about",
      "name": "[Your Name]",
      "jobTitle": "Leadership Coach",
      "knowsAbout": [
        "Leadership Coaching",
        "Sales Management",
        "Executive Coaching",
        "Presence Pillar",
        "Performance Pillar",
        "Wholeness Pillar",
        "B2B SaaS Sales Leadership",
        "New Manager Onboarding",
        "Reactive Leadership Patterns",
        "Strategic Pause Practice"
      ],
      "alumniOf": [
        { "@type": "EducationalOrganization", "name": "iPEC Coaching" },
        { "@type": "EducationalOrganization", "name": "Sura Flow" }
      ],
      "hasCredential": [
        {
          "@type": "EducationalOccupationalCredential",
          "name": "Certified Professional Coach",
          "recognizedBy": { "@type": "Organization", "name": "iPEC" }
        }
      ],
      "sameAs": [
        "https://linkedin.com/in/jaredlangley",
        "https://linkedin.com/company/jaredlangleycc",
        "https://threads.net/@jaredlangleycc",
        "https://instagram.com/jaredlangleycc",
        "https://tiktok.com/@jaredlangleycc",
        "https://jaredlangleycc.substack.com",
        "https://github.com/jaredlangley"
      ]
    },
    {
      "@type": "ProfessionalService",
      "@id": "https://[your-domain].com/#publisher",
      "name": "the example coaching business",
      "founder": { "@id": "https://[your-domain].com/#about" }
    },
    {
      "@type": "WebSite",
      "url": "https://[your-domain].com",
      "name": "the example coaching business"
    },
    {
      "@type": "FAQPage",
      "mainEntity": [...]
    },
    {
      "@type": "Course",
      "@id": "https://jaredlangley.cc/#course-foundation",
      "name": "The flagship offer",
      "provider": { "@id": "https://[your-domain].com/#publisher" },
      "instructor": { "@id": "https://[your-domain].com/#about" }
    }
  ]
}
```

About page: AboutPage schema + Person schema reference.

All 4 essays: `author` and `publisher` use `@id` references back to homepage entities.

**Time:** 1.5 hours.

### Lever 5: llms.txt + llms-full.txt

**Status:** SHIPPED.

**What shipped:**

- `langley-site/llms.txt`: curated index, ~350 words, lists identity / programs / framework / essays / diagnostics
- `langley-site/llms-full.txt`: self-contained reference, ~1250 words, includes identity / what I do / framework / offer / 7 Q+As / what I stand for / contact / last updated

Both deployed via Cloudflare. Live at:

- https://jaredlangley.cc/llms.txt (200)
- https://jaredlangley.cc/llms-full.txt (200)

**Time:** 2 hours (writing + voice scan + deploy + verify).

### Lever 6: robots.txt for AI bots

**Status:** SHIPPED.

**What shipped:**

Robots.txt updated to explicit allow for 12 AI bots:

```
User-agent: *
Allow: /

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

Disallow: /private/

Sitemap: https://jaredlangley.cc/sitemap.xml
```

**Cloudflare gotcha discovered + closed:**

Initial setup had robots.txt correct, but Cloudflare's "Manage your robots.txt" dropdown was independently injecting Disallow + Content-Signal headers at the edge. Verified via:

```bash
curl -sI https://[your-domain].com/robots.txt
```

Cloudflare's injection was overriding our file. Disabled via Cloudflare dashboard:

- Security > Bots > "Block AI bots": OFF
- "Manage your robots.txt": Disabled

After flip, `curl` returned clean response matching the source file. AI SEO actually live.

**Time:** 30 minutes (15 min for setup, 15 min for Cloudflare discovery + fix).

### Lever 7: IndexNow

**Status:** SHIPPED.

**What shipped:**

- Generated API key: `d6c24c446431972e7d13a00a717d3cef`
- Placed key file at `https://jaredlangley.cc/d6c24c446431972e7d13a00a717d3cef.txt`
- Integrated push into deploy script

Tested with curl POST on May 20 deploy. Confirmed 200 response from IndexNow API. URLs appeared in Bing Webmaster Tools within 4 hours.

Recipe documented at `reference_indexnow-langley.md`.

**Time:** 45 minutes.

## Total time

| Lever | Time |
|---|---|
| 1: Answer-first blocks | 2h |
| 2: Speakable schema | 1h |
| 3: FAQPage schema | 30 min |
| 4: Entity unification | 1.5h |
| 5: llms.txt + llms-full.txt | 2h |
| 6: robots.txt | 30 min |
| 7: IndexNow | 45 min |
| **Total** | **8h 15min** |

Across 2 sessions (Friday evening + Saturday morning, May 16 to 20).

## 5-query baseline test (May 20, 2026)

Conducted right after deploy. Captures the starting point before AI engines re-train on the new schema.

| Query | ChatGPT | Perplexity | Claude.ai | Google AIO | Copilot |
|---|---|---|---|---|---|
| "Who is Jared Langley" | Yes (Cited about page) | Yes (Cited homepage) | Yes (Cited homepage + LinkedIn) | Yes | Yes |
| "What are the three pillars of leadership" | No (Generic answer about leadership theories) | Partial (Mentioned Langley as one of multiple sources) | No | No | No |
| "Why am I always reactive as a new sales manager" | No | No | No | No | No |
| "How does leadership coaching for new managers work" | No | No | No | No | No |
| "What is The flagship offer coaching engagement" | Partial (Mentioned with hesitation) | Yes (Cited /foundation page) | No | No | Partial |

Citation rate: ~7/25 = 28%. Baseline.

## Manual queue (pending)

Items that don't fit in the 8-hour Friday block but should ship next session:

- **Bing Webmaster Tools sitemap re-submit** (already in IndexNow, but explicit submission catches up older URLs faster)
- **Wikidata Q-item stub for Jared Langley** (long-tail entity authority, gives AI engines a public-record signal)
- **Perplexity baseline citation test re-run** in 30 days
- **ChatGPT custom-instructions test:** does ChatGPT cite the user when ChatGPT-User-Agent fetches the site?

## Next 5-query test

August 20, 2026 (90 days). Target: 40 to 50% citation rate.

## What we learned

- Cloudflare's bot block was the hidden blocker. Without that fix, none of the other 6 levers would have mattered.
- Answer-first blocks took longer than estimated because writing the 2-3 sentence answer is harder than writing the full essay (compression is the work).
- Entity unification via `@id` is elegant and easy once you understand the pattern.
- llms-full.txt is the most leverage-per-hour of any lever. ~5KB of structured content that any AI engine can ingest in one fetch.

## How this would change for a different user

Apply all 7 levers in the same order. Adapt:

- ICP-specific knowsAbout array (Lever 4)
- Real essay set (Lever 1 + 2)
- Real FAQs (Lever 3)
- Brand-specific positioning + offer in llms-full.txt (Lever 5)
- Sitemap + IndexNow per user's deploy process (Lever 7)

The framework is universal. The content is specific.

## Family-floor check

8 hours across 2 sessions. Each session 4 hours. Friday evening + Saturday morning. Within `family-floor` budget for Jared (Sundays are protected, M-F 4-7 pm is Dad Floor).

## Revenue tag

This work is leverage ($$). It compounds over 3 to 12 months as AI engines re-train on the new schema and start citing the user more reliably.

Direct revenue connection:

1. AI cites → user clicks → reads essay → signs up for lead-gen assessment → enters nurture → books call → converts

Each citation = potential lead. Over 90 days, expect 5 to 20 incremental lead-gen assessment signups attributable to AI citations (rough estimate, hard to measure precisely without UTMs).

## Memory references

- `project_ai-seo-pass-may16.md`, full work log
- `reference_indexnow-langley.md`, IndexNow recipe
- `reference_cloudflare-robots-txt-gotcha.md`, the Cloudflare gotcha
- `reference_jsonld-validation-snippet.md`, Python validation one-liner

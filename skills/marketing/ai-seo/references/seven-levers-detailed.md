# 7 Levers Detailed

Deep dive on each lever. Code snippets, examples, validation steps. Use as the source of truth when applying any lever.

## Lever 1: Answer-first content blocks

### Why

AI engines extract direct answers. The user's most quotable content needs to be at the top of the page, marked clearly as the answer, and self-contained.

### Where to apply

Every essay, every offer page, every definition page.

### Implementation

#### Step 1: Add the block to the page

After the headline + frame, before the body:

```html
<article>
  <h1>Three Reactive Triggers Most Managers Don't See</h1>

  <p class="essay-frame">{1-paragraph personal frame from the essay}</p>

  <div class="essay-answer">
    <span class="answer-label">The Short Version</span>
    <p>{1 to 3 sentence direct answer that stands alone}</p>
  </div>

  <!-- Body continues below -->
</article>
```

#### Step 2: Style the block

CSS suggestions (brand-aligned):

```css
.essay-answer {
  margin: 2em 0;
  padding: 1.5em 2em;
  background: rgba(212, 169, 106, 0.08); /* gold tint */
  border-left: 4px solid var(--gold);
  border-radius: 4px;
}

.answer-label {
  display: block;
  font-family: 'Archivo Black', sans-serif;
  font-size: 0.875em;
  text-transform: uppercase;
  letter-spacing: 0.05em;
  color: var(--gold-dark);
  margin-bottom: 0.5em;
}

.essay-answer p {
  margin: 0;
  font-size: 1.05em;
  line-height: 1.6;
}
```

Visible to readers as a callout. Not hidden.

#### Step 3: Validate

Open the page in a browser. The block should be visible and brand-aligned.

### Writing the answer

The answer should:

- Stand alone (no context required to understand)
- Be 1 to 3 sentences
- Use plain language (not jargon)
- Include the framework or specific claim
- Be voice-scanned

Example for "Three Reactive Triggers":

> Reactive leadership shows up in three places most new managers don't see: the morning Slack scroll, the interrupt 1:1, and the late-day deal review. The fix isn't a calendar trick. It's the pause: three to five seconds between trigger and response.

Test: read the block out of context. Does it make sense? Does it answer the implied question? If yes, ship.

## Lever 2: Speakable schema

### Why

Tells AI engines (especially voice assistants and AI Overviews) which CSS selector contains the extractable answer.

### Where to apply

Every page that has an answer-first block (Lever 1).

### Implementation

#### Step 1: Add Speakable to existing Article schema

In the page's `<head>` JSON-LD:

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Article",
  "headline": "Three Reactive Triggers Most Managers Don't See",
  "image": "https://jaredlangley.cc/images/og-three-reactive-triggers.png",
  "datePublished": "2026-05-24T08:00:00-07:00",
  "dateModified": "2026-05-24T08:00:00-07:00",
  "author": {
    "@id": "https://[your-domain].com/#about"
  },
  "publisher": {
    "@id": "https://[your-domain].com/#publisher"
  },
  "mainEntityOfPage": {
    "@type": "WebPage",
    "@id": "https://jaredlangley.cc/blog/three-reactive-triggers"
  },
  "speakable": {
    "@type": "SpeakableSpecification",
    "cssSelector": [".essay-answer p"]
  }
}
</script>
```

#### Step 2: Validate

Open Rich Results Test:

1. Go to search.google.com/test/rich-results
2. Paste URL or HTML
3. Confirm Article appears with no errors
4. Speakable not always shown in the test UI but should validate without errors

#### Step 3: Test cssSelector resolves

Open the page in Chrome DevTools console:

```javascript
document.querySelectorAll('.essay-answer p').length
// Should return 1 (the answer paragraph)
```

If 0, the selector is wrong. Adjust.

## Lever 3: FAQPage schema

### Why

AI engines treat each Q + A pair as an extractable answer. Pages with FAQPage schema and visible FAQs get cited more.

### Where to apply

Pages that genuinely have FAQs visible (homepage if it has an FAQ section, dedicated FAQ page, offer pages).

### Implementation

#### Step 1: Make sure visible FAQs exist

Don't add FAQPage schema without visible FAQs. Google penalizes hidden or fake FAQs.

The page should have:

```html
<section class="faq">
  <h2>Frequently Asked Questions</h2>

  <details>
    <summary>What is The flagship offer?</summary>
    <p>The flagship offer is a 90-day 1-on-1 leadership coaching engagement...</p>
  </details>

  <details>
    <summary>How much does it cost?</summary>
    <p>$X,XXX total. Paid as $800 per month for 3 months, or paid in full.</p>
  </details>

  <!-- 4 to 8 more FAQs -->
</section>
```

#### Step 2: Add FAQPage schema

In the page's `<head>`:

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "What is The flagship offer?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "The flagship offer is a 90-day 1-on-1 leadership coaching engagement that builds personalized leadership infrastructure across three pillars: Presence, Performance, and Wholeness."
      }
    },
    {
      "@type": "Question",
      "name": "How much does The flagship offer cost?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "$X,XXX total. Paid as $800 per month for 3 months, or paid in full. 30-day money-back guarantee."
      }
    }
  ]
}
</script>
```

The schema text should match the visible text closely (paraphrase OK, but don't put different content in schema vs visible).

#### Step 3: Validate

Rich Results Test confirms FAQPage detected with no errors.

## Lever 4: Entity unification

### Why

AI engines need a coherent picture of the user. Conflicting names, missing schema, or fragmented identity confuse the AI and reduce citation rate.

### Where to apply

Homepage, About page, and every essay or content page that has author/publisher schema.

### Implementation

#### Step 1: Define Person schema on homepage

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Person",
  "@id": "https://[your-domain].com/#about",
  "name": "[Your Name]",
  "url": "https://[your-domain].com",
  "image": "https://jaredlangley.cc/images/jared-portrait.jpg",
  "jobTitle": "Leadership Coach",
  "description": "ICF-trained leadership coach for B2B SaaS sales managers. Founder of the example coaching business.",
  "knowsAbout": [
    "Leadership Coaching",
    "Sales Management",
    "Executive Coaching",
    "Presence",
    "Performance",
    "Wholeness"
  ],
  "alumniOf": [
    {
      "@type": "EducationalOrganization",
      "name": "iPEC Coaching"
    }
  ],
  "hasCredential": [
    {
      "@type": "EducationalOccupationalCredential",
      "name": "Certified Professional Coach",
      "recognizedBy": {
        "@type": "Organization",
        "name": "iPEC"
      }
    }
  ],
  "sameAs": [
    "https://linkedin.com/in/jaredlangley",
    "https://linkedin.com/company/jaredlangleycc",
    "https://threads.net/@jaredlangleycc",
    "https://instagram.com/jaredlangleycc",
    "https://tiktok.com/@jaredlangleycc"
  ]
}
</script>
```

#### Step 2: Define Organization schema on homepage

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Organization",
  "@id": "https://[your-domain].com/#publisher",
  "name": "the example coaching business",
  "url": "https://[your-domain].com",
  "logo": "https://jaredlangley.cc/images/logo.png",
  "founder": {
    "@id": "https://[your-domain].com/#about"
  }
}
</script>
```

#### Step 3: Reference via `@id` in every essay/page

Each essay's Article schema:

```json
{
  "@type": "Article",
  "author": { "@id": "https://[your-domain].com/#about" },
  "publisher": { "@id": "https://[your-domain].com/#publisher" }
}
```

Single source of truth. Schema graph stays consistent.

#### Step 4: Validate

Rich Results Test shows Person + Organization detected on homepage. Articles reference the unified entities. No errors.

## Lever 5: llms.txt + llms-full.txt

### Why

Emerging convention (llmstxt.org) for AI engines to fetch self-contained brand reference.

### Where to apply

Site root.

### Implementation

#### Step 1: Create llms.txt at site root

Markdown file at `/llms.txt`. Curated index of important content.

See `references/llms-txt-templates.md` for full templates.

#### Step 2: Create llms-full.txt at site root

Markdown file at `/llms-full.txt`. Self-contained reference of identity, framework, pricing, FAQ, key claims.

Keep under 5 KB for fast AI ingestion.

See `references/llms-txt-templates.md`.

#### Step 3: Verify

Curl both files:

```bash
curl https://jaredlangley.cc/llms.txt
curl https://jaredlangley.cc/llms-full.txt
```

Both should return 200 with the markdown content.

#### Step 4: Update on content change

When major content changes (new offer, new essay, brand update), update these files.

## Lever 6: robots.txt for AI bots

### Why

Some platforms (Cloudflare, Vercel) default to blocking AI bots. Explicit allow ensures crawlability.

### Where to apply

Site-wide robots.txt.

### Implementation

#### Step 1: Audit current robots.txt

```bash
curl https://{domain}/robots.txt
```

Look for any `Disallow` blocking AI bots.

#### Step 2: Update to explicit allow

Use the template in `seo-audit/references/common-fixes-cookbook.md` > Robots.txt template.

#### Step 3: Disable platform overrides

For Cloudflare:

1. Dashboard > Security > Bots
2. "Block AI bots" toggle: OFF
3. "Manage your robots.txt": Disabled

For Vercel:

1. Project settings > Security
2. Check for any "AI bot blocking" toggles

#### Step 4: Validate

```bash
curl https://{domain}/robots.txt
```

Confirm the response matches the file. No platform-injected Disallow blocks.

## Lever 7: IndexNow

### Why

Free instant indexing across Bing, Yandex, Seznam, Naver, Yep. Speeds up AI-engine training on new content.

### Where to apply

Site-wide via deploy script.

### Implementation

#### Step 1: Generate API key

```bash
openssl rand -hex 16
# Example output: d6c24c446431972e7d13a00a717d3cef
```

#### Step 2: Place key file at root

Create file `https://{domain}/{key}.txt` containing the key:

```
d6c24c446431972e7d13a00a717d3cef
```

Confirm accessible:

```bash
curl https://{domain}/d6c24c446431972e7d13a00a717d3cef.txt
```

#### Step 3: Push URLs on deploy

Integrate into deploy script:

```bash
#!/bin/bash
# After deploy completes, push URLs to IndexNow

curl -X POST "https://api.indexnow.org/indexnow" \
  -H "Content-Type: application/json" \
  -d '{
    "host": "jaredlangley.cc",
    "key": "d6c24c446431972e7d13a00a717d3cef",
    "keyLocation": "https://jaredlangley.cc/d6c24c446431972e7d13a00a717d3cef.txt",
    "urlList": [
      "https://jaredlangley.cc/blog/three-reactive-triggers",
      "https://jaredlangley.cc/"
    ]
  }'
```

#### Step 4: Validate

After deploy, check Bing Webmaster Tools > IndexNow report. URLs should appear within hours.

See Langley `reference_indexnow-langley.md` for full setup.

## Lever interaction

The levers compound:

- Lever 1 (answer-first) + Lever 2 (Speakable) → AI engines know exactly which sentences to extract
- Lever 3 (FAQPage) + Lever 4 (entity unification) → AI engines have structured Q+A from the named author
- Lever 5 (llms.txt) + Lever 6 (robots.txt allow) → AI engines have a clean fetch path + curated content map
- Lever 7 (IndexNow) → all of the above gets indexed and trained on faster

Apply in this order (1, 2, 4, 6 first; then 3, 5, 7). Each later lever builds on the foundation.

## Validation: the 5-query test

After all levers are applied, run the 5-query test (see SKILL.md). Wait 30 to 60 days for AI engines to re-train.

Track citation rate over time. Targets:

- Baseline (before AI SEO): 0 to 5% citation rate on target queries
- After Lever 1 + 2: 10 to 20% citation rate
- After all 7 levers: 30 to 60% citation rate (varies by topic competitiveness)

Citations compound. Pages cited 1+ time tend to get cited again. Build the entity, the citations follow.

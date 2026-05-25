# Langley Site SEO Audit, May 2026 (Worked Example)

A full audit output for jaredlangley.cc as of May 20, 2026. Score: 84/100. Use as the reference for what a Stable Solo SEO audit looks like.

## Audit context

- **Domain:** jaredlangley.cc
- **Date:** May 20, 2026
- **Stage:** Early Operator transitioning to Stable Solo ($5K MRR)
- **Goal:** General health check + identify wins for AI search citation
- **Previous audit:** April 27, 2026 (baseline 72/100)
- **Tools used:** Search Console, PageSpeed Insights, Rich Results Test, Screaming Frog Free, Lighthouse

## Overall score: 84/100

(Up from 72/100 baseline. Primary improvements: schema upgrades, Cloudflare AI bot block fix, llms.txt addition.)

## P0 issues (CRITICAL, fix this week)

### P0-1: Cloudflare managed robots.txt was overriding our robots.txt at the edge

**Status:** RESOLVED May 20, 2026 evening.

**What happened:** Cloudflare's "Manage your robots.txt" toggle was independently injecting Disallow + Content-Signal headers at the edge, blocking GPTBot / ClaudeBot / PerplexityBot despite the user's actual robots.txt allowing them. The user's robots.txt was correct; Cloudflare was overriding it.

**Fix:** Jared flipped off "Block AI bots" toggle AND disabled "Manage your robots.txt" dropdown in the Cloudflare dashboard.

**Verification:** `curl -sI` on robots.txt returns clean response with no Cloudflare-injected headers.

**Time spent:** 15 min (after diagnosis).

See memory `reference_cloudflare-robots-txt-gotcha.md` for prevention.

## P1 issues (HIGH, fix this month)

### P1-1: Speakable schema missing on essays

**Issue:** Article schema present on all 4 essays, but no Speakable schema. AI search engines use Speakable to identify the extractable answer.

**Fix:** Add Speakable to Article schema in each essay's JSON-LD:

```json
"speakable": {
  "@type": "SpeakableSpecification",
  "cssSelector": [".essay-answer p"]
}
```

The `.essay-answer p` selector should point to a new "Answer-first" block at the top of each essay.

**Time:** 30 minutes per essay × 4 essays = 2 hours.

**Status:** SHIPPED May 20, 2026 (per `project_aeo-tier1-may20.md`).

### P1-2: Author entity not unified across essays

**Issue:** Each essay had inline `"author": {"@type": "Person", "name": "[Your Name]"}` block. This duplicates the Person entity. Better: use `@id` reference to homepage's Person schema.

**Fix:** Change to:
```json
"author": { "@id": "https://[your-domain].com/#about" }
```

All 4 essays + about.html updated. Status: SHIPPED.

**Time:** 20 minutes.

### P1-3: Course schema missing on homepage

**Issue:** Foundation is a structured 90-day program. Adding Course schema gives Google + AI engines a clearer entity.

**Fix:** Add to homepage `@graph`:

```json
{
  "@type": "Course",
  "@id": "https://jaredlangley.cc/#course-foundation",
  "name": "The flagship offer",
  "description": "90-day leadership coaching program covering Presence, Performance, Wholeness.",
  "provider": { "@id": "https://[your-domain].com/#publisher" },
  "instructor": { "@id": "https://[your-domain].com/#about" },
  "audience": "B2B SaaS sales managers",
  "teaches": "Presence, Performance, Wholeness leadership pillars",
  "timeRequired": "P90D",
  "courseInstance": {
    "@type": "CourseInstance",
    "courseMode": "Online",
    "courseWorkload": "P12W"
  }
}
```

**Time:** 45 minutes.

**Status:** SHIPPED.

### P1-4: Definition pages missing for key terms

**Issue:** "The flagship offer" and "Three Pillars" don't have dedicated pages. AI search engines rank definition pages highly for "what is X" queries.

**Fix:** Created:
- `/what-is-the-foundation` (WebPage + DefinedTerm schema + visible price + Foundation description + CTA)
- `/three-pillars` (WebPage + DefinedTermSet schema with 3 child DefinedTerms + pillar cards + CTA)

Both added to sitemap with priority 0.9.

**Time:** 2 hours.

**Status:** SHIPPED.

## P2 issues (MEDIUM, fix this quarter)

### P2-1: Meta descriptions on essay pages too generic

**Issue:** Some essay meta descriptions don't include specific keyword + outcome framing.

**Fix:** Rewrite each essay's meta description to:
- Start with the specific claim or outcome
- Include the ICP keyword naturally
- Under 160 characters
- Voice-scanned

**Status:** Pending.

**Time:** 30 minutes for all 4 essays.

### P2-2: Internal linking between essays needs strengthening

**Issue:** Essays don't reliably link to each other. Topic cluster is weak.

**Fix:** Add "Related essays" footer block to each essay linking to 2 other essays on related pillars. Build the cluster structure intentionally.

**Time:** 30 minutes per essay + ongoing.

**Status:** Pending.

### P2-3: Image alt text missing on About page

**Issue:** About page hero portrait missing alt text. Other images mostly OK.

**Fix:**
```html
<img src="/images/about-portrait.jpg" alt="Jared Langley, ICF-trained leadership coach for B2B SaaS sales managers" ...>
```

**Time:** 10 minutes.

**Status:** Pending.

### P2-4: Page weight slightly high on essay template

**Issue:** Essay pages load ~2.4 MB on first visit. Mostly font weights and a hero image.

**Fix:**
- Cut font weights from 5 to 2 (just 400 + 700 Manrope, Archivo Black is single weight)
- Convert hero image to WebP
- Lazy load below-fold images

**Time:** 1 hour.

**Status:** Pending.

## P3 issues (LOW, nice to have)

### P3-1: Cookie consent banner not deployed

For GDPR compliance, if EU/UK traffic is meaningful. Not blocking SEO, but legal exposure.

### P3-2: HSTS header not set

Security enhancement. Not blocking SEO.

### P3-3: Sub-sitemap structure unused

Site has ~25 pages. Doesn't need sub-sitemaps yet.

## Quick wins shipped this audit

- Cloudflare AI bot block resolved
- Speakable schema added to all 4 essays
- Author entity unified via `@id`
- Course schema added to homepage
- 2 definition pages built and shipped
- llms.txt + llms-full.txt added (separate AI SEO work, but counted in audit)
- IndexNow API key set up + integrated for Bing/Yandex/Seznam/Naver/Yep cross-engine push

## Deep work pending

- Page speed overhaul (P2-4)
- Internal linking strategy across essays (P2-2)
- Meta description rewrite pass (P2-1)
- Quarterly content audit feeding `content-strategy`

## Not worth doing (per audit)

- Disavow file (no spam backlinks detected)
- AMP pages (Google deprecated AMP boost)
- Schema for non-existing properties (Review schema without real reviews)
- Restructuring URLs on existing pages (high risk, low reward)

## Verified clean (no action)

- HTTPS + no mixed content
- Mobile usability: 0 issues in Search Console
- Manual actions: none
- Sitemap: submitted to GSC + Bing
- Indexability: all important pages indexed
- Title tags: present on all important pages
- H1 tags: 1 per page
- Open Graph tags: present on all important pages
- Person + Organization schema: present and unified

## Search Console baseline (last 28 days)

- Total impressions: 8,400
- Total clicks: 240
- Average CTR: 2.9%
- Average position: 18.2

Top queries (by impressions):
1. "jared langley", position 1.2, 480 impressions, 65 clicks
2. "leadership coaching for new managers", position 23, 380 impressions, 4 clicks
3. "reactive leadership", position 31, 220 impressions, 2 clicks
4. "three pillars leadership", position 42, 180 impressions, 1 click
5. "the foundation coaching", position 8, 120 impressions, 8 clicks

Gap: positions 20-50 on most non-brand keywords. Strengthen authority through internal linking + AI-SEO citation.

## Audit timeline

- Friday 4-5 pm: pull Search Console data + run Lighthouse on top 5 pages
- Friday 5-7 pm: schema validation across important pages
- Saturday morning: write up audit + prioritize fixes

Total audit time: ~3 hours.

## Decision: which P0/P1 to ship Friday afternoon (next week)

Pick 3:

1. **P1-1 (Speakable schema)**, 2 hours, high impact for AI search
2. **P1-3 (Course schema)**, 45 min, completes the schema graph
3. **P1-4 (Definition pages)**, already shipped in this audit week, can move to validation

Carry to next audit (60 days):
- P2-2 (internal linking)
- P2-1 (meta description rewrite)
- P2-4 (page weight)

## Next audit date

July 20, 2026 (60 days). Trigger earlier if:
- Search Console shows abrupt drop
- Major site change shipped
- Algorithm update reported

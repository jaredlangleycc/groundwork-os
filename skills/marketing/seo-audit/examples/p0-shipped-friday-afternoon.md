# P0 Shipped Friday Afternoon (Worked Example)

How to take 5 P0 items from an audit and ship them in one 3-hour Friday block. The pattern that turns audits into actual fixes.

## Setup

A Stable Solo user just received an audit with these P0 + P1 items:

| Priority | Item | Estimated time |
|---|---|---|
| P0 | Site uncrawlable due to Cloudflare bot block | 15 min |
| P0 | 8 pages missing title tags | 30 min |
| P0 | Sitemap not submitted to Search Console | 10 min |
| P1 | Speakable schema missing on 4 essays | 2 hours |
| P1 | Author @id not unified across essays | 20 min |
| P1 | OG meta tags missing on 3 pages | 30 min |

Total estimated time: 3 hours 45 minutes.

Friday block: 4 hours (2 to 6 pm).

## The order matters

Run the items in this order:

1. P0 items first (unblockers)
2. P1 items that compound (schema unification before adding new schema)
3. P1 items independent

If you start with the 2-hour task and run over, you skip the 10-minute task that has 10x the impact. Run small unblockers first.

### Optimal order

1. P0: Cloudflare bot block (15 min), unblocks everything else
2. P0: Sitemap submission (10 min), quick win
3. P0: Title tags on 8 pages (30 min), quick wins
4. P1: Author @id unification (20 min), must come before Speakable so the schema base is right
5. P1: Speakable schema on 4 essays (2 hours), biggest item
6. P1: OG meta tags on 3 pages (30 min), buffer

Total: 3 hours 45 minutes. Fits in 4-hour block with 15 min buffer.

## Item 1: Cloudflare bot block (0:00 to 0:15)

### What

Cloudflare's "Manage your robots.txt" toggle was injecting Disallow at the edge, blocking crawlers. The user's actual robots.txt allowed everything.

### How

1. Log in to Cloudflare dashboard
2. Navigate to the domain (jaredlangley.cc)
3. Security > Bots > "Block AI bots" toggle: confirm OFF
4. Security > Bots > "Manage your robots.txt" dropdown: select "None" or "Disabled"
5. Save

### Verify

```bash
curl -sI https://[your-domain].com/robots.txt
# Look for absence of injected Disallow headers
```

```bash
curl https://[your-domain].com/robots.txt
# Confirm content matches the source-of-truth robots.txt
```

### Time

15 minutes.

### Done

Move on immediately. Don't wait for crawl re-indexing.

## Item 2: Sitemap submission (0:15 to 0:25)

### What

Sitemap is built but not submitted to Search Console + Bing Webmaster.

### How

1. Open Google Search Console for the property
2. Sitemaps menu > Add new sitemap
3. Enter `sitemap.xml`
4. Submit
5. Repeat for Bing Webmaster Tools

### Verify

Google Search Console shows "Success" status within 5 minutes.

### Time

10 minutes.

## Item 3: Title tags on 8 pages (0:25 to 0:55)

### What

8 pages have missing or generic title tags. Need unique, specific titles.

### How

For each page, draft a title following the formula `{Page-Specific Headline} | {Brand Name}`. Voice-scan. Insert into the `<head>`.

Pages:

| Page | Old title | New title |
|---|---|---|
| /about | (missing) | About Jared Langley | Leadership Coach for New Sales Managers |
| /privacy | "Privacy" | Privacy Policy | the example coaching business |
| /vibe-check | "lead-gen assessment" | the lead-gen assessment: 12-Question Leadership Diagnostic | the example coaching business |
| /blog/grounding-comes-first | (good) | (no change) |
| /blog/three-reactive-triggers | (good) | (no change) |
| /private/3bcf1311 | "Career Assessment" | (noindex, no public title needed) |
| /scorecard | "Scorecard" | (redirects to /vibe-check, no title needed) |
| /success | "Thank You" | Thank You | the example coaching business |

Voice-scan each. Most pass; a few need rewriting for voice.

### Time

30 minutes total.

## Item 4: Author @id unification (0:55 to 1:15)

### What

4 essays each have inline `"author": { "@type": "Person", "name": "[Your Name]", "url": "https://[your-domain].com/about" }` blocks. Replace with `"author": { "@id": "https://[your-domain].com/#about" }` which references the Person schema defined on the homepage.

### How

For each essay file (4 essays):

1. Open the JSON-LD in `<head>`
2. Find the `"author"` block
3. Replace with `"@id": "https://[your-domain].com/#about"` reference
4. Repeat for `"publisher"` block (point to `"@id": "https://[your-domain].com/#publisher"`)
5. Save

Validate one essay in Rich Results Test before doing all 4.

### Verify

Rich Results Test on each essay: still shows Article correctly. The Person schema entity is unified.

### Time

20 minutes (5 minutes per essay).

## Item 5: Speakable schema on 4 essays (1:15 to 3:15)

### What

Add Speakable schema to each Article so AI search engines know which CSS selector contains the extractable answer.

### How

For each essay:

1. Add `.essay-answer` callout div at the top of the essay (visible to readers as "The Short Version")
2. Write the 2 to 4 sentence answer
3. Add Speakable to the Article schema:

```json
"speakable": {
  "@type": "SpeakableSpecification",
  "cssSelector": [".essay-answer p"]
}
```

4. Deploy
5. Validate in Rich Results Test

Per essay: 30 minutes for the writing + schema + deploy + verify.

Across 4 essays: 2 hours.

### Time

2 hours.

## Item 6: OG meta tags on 3 pages (3:15 to 3:45)

### What

3 pages missing or incomplete Open Graph meta tags. When shared on LinkedIn or Threads, no rich card shows.

### How

For each page:

1. Generate the OG image (1200x630, brand-aligned), or use existing if available
2. Add to `<head>`:

```html
<meta property="og:type" content="website">
<meta property="og:url" content="https://...">
<meta property="og:title" content="...">
<meta property="og:description" content="...">
<meta property="og:image" content="https://...">
<meta property="og:image:width" content="1200">
<meta property="og:image:height" content="630">

<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:title" content="...">
<meta name="twitter:description" content="...">
<meta name="twitter:image" content="https://...">
```

3. Test via opengraph.xyz
4. Test via Facebook Sharing Debugger
5. Test via LinkedIn Post Inspector

Per page: 10 minutes.

### Time

30 minutes.

## Final 15 minutes (3:45 to 4:00): Verification + log

1. Run Lighthouse on homepage + 1 essay. Confirm no regressions.
2. Re-test schema in Rich Results Test for each modified page.
3. Update CLAUDE.md with what shipped + date.
4. Update memory with `project_seo-audit-may2026.md` (what was shipped, what carries to next audit).

## Total time accounting

- Item 1: 15 min ✓
- Item 2: 10 min ✓
- Item 3: 30 min ✓
- Item 4: 20 min ✓
- Item 5: 2 hours ✓
- Item 6: 30 min ✓
- Verification: 15 min

Total: 4 hours exactly. Friday block fully used.

## What didn't ship (deferred to next session)

- P2 items from audit (meta description rewrite, internal linking, page weight optimization)
- P3 items (cookie banner, HSTS, sub-sitemaps)

These move to the next audit cycle. Don't try to ship them all in one Friday.

## What this Friday accomplished

- 3 P0 items closed (audit gate cleared)
- 3 P1 items closed (highest impact remaining items)
- Site is now crawlable, indexed, unified schema, AI-search-ready

Next audit (60 days) will benchmark whether these changes moved:
- Impressions in Search Console
- AI search citations (Perplexity / ChatGPT manual tests)
- Click-through rate on improved title tags

## Family-floor check

Friday 2 to 6 pm is within Jared's available work window (not in protected M-F 4-7 pm block, which is family time on weekdays).

For other users: pick the Friday block that respects their family-floor. Saturday morning works for many parent solopreneurs. Don't try to fit this into a Tuesday lunch break.

## Pattern lessons

- Small wins first, big tasks last.
- Validate one before doing all 4 (catches a bad pattern before it propagates).
- Don't skip verification. Schema errors that ship to all 4 essays cost more than the 20 minutes to validate one first.
- Quarterly audits ship in 4-hour Friday blocks. Daily SEO work is mostly distraction at solopreneur stage.

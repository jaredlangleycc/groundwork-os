---
name: seo-audit
description: This skill should be used when the user asks to "audit my SEO", "SEO audit", "check my SEO", "technical SEO review", "SEO health check", "why am I not ranking", "SEO issues", "on-page SEO", "site audit", or wants a prioritized list of SEO fixes for their site. Free tools first (Search Console, Lighthouse). Stage-aware. For getting cited by AI search engines, see ai-seo. For building pages at scale, that's a separate skill not in this set.
version: 0.1.0
---

# SEO Audit

Technical + on-page SEO audit for solopreneur sites. The output is a prioritized list of fixes with impact estimates, ordered so the user can ship the top 5 in one Friday afternoon.

Most solopreneur SEO audits ship 47-item checklists that paralyze the user. This skill cuts to the 5 to 10 fixes that matter at the user's stage.

## When this skill triggers

- "Audit my SEO"
- "SEO health check"
- "Why am I not ranking"
- "Check my SEO"
- "Technical SEO review"
- "On-page SEO audit"
- "What's broken on my site"
- "Run an SEO audit"

NOT for: AI-search-engine citation (use `ai-seo`), creating pages at scale, content strategy for SEO (use `content-strategy`).

## The diagnostic before the audit

Coach-mode. One question at a time.

1. "What's the URL I'm auditing?"
2. "What's the goal of the audit, diagnose a specific drop, find new wins, or general health check?"
3. "What tools do you currently use? (Search Console, Google Analytics, Bing Webmaster, anything else?)"
4. "What's the top ranking page right now, and which page do you want to rank that doesn't?"
5. "When was the last time you touched anything SEO-related on this site?"

If the user can't name a goal (question 2), the audit becomes a checklist with no priorities. Push for specificity.

## The audit framework

Run the audit in 6 areas. Each area is one section of the output. Each item is tagged: P0 (critical), P1 (high), P2 (medium), P3 (low).

### Area 1: Indexability + crawl

The blockers. If these fail, nothing else matters.

- [ ] robots.txt is not blocking the site (no `Disallow: /` for important crawlers)
- [ ] sitemap.xml exists and is submitted to Google Search Console + Bing Webmaster Tools
- [ ] sitemap.xml lists current important URLs (no 404s, no deprecated URLs)
- [ ] noindex meta is not on any important page
- [ ] X-Robots-Tag is not blocking crawlers at the server level
- [ ] No accidental noindex inherited from Cloudflare bot protection (see Langley memory `reference_cloudflare-robots-txt-gotcha.md`)
- [ ] canonical tags point to the right URL (especially for pages with parameters)
- [ ] hreflang tags if multi-language
- [ ] Mobile-friendly (Mobile Usability report in Search Console)

P0 issues here: site is uncrawlable, accidentally noindexed, hosting blocking bots.

### Area 2: On-page basics

Each important page (homepage, key landing pages, top blog posts).

- [ ] title tag exists, 50-60 characters, includes keyword
- [ ] meta description exists, 140-160 characters, written to earn the click
- [ ] H1 is present, includes primary keyword or close variant
- [ ] H2s are descriptive and structure the content
- [ ] Image alt text on all important images
- [ ] Internal links exist from the homepage to important pages
- [ ] URL is clean, lowercase, hyphenated (not `?id=123`)
- [ ] No duplicate content across multiple URLs
- [ ] OG (Open Graph) meta tags for social sharing
- [ ] Twitter card meta tags

P0 issues here: missing title tags, no H1, broken images.

### Area 3: Schema markup

Structured data helps search engines understand the page.

- [ ] Organization or Person schema on homepage
- [ ] WebSite schema with sitelinks search box (homepage)
- [ ] Article schema on blog posts
- [ ] FAQPage schema where FAQs exist
- [ ] BreadcrumbList schema where breadcrumbs exist
- [ ] Product / Service / Offer schema for offer pages
- [ ] Review / AggregateRating schema for testimonials (with caution, Google requires real reviewers)
- [ ] Course schema for educational offerings
- [ ] No schema errors in Rich Results Test (search.google.com/test/rich-results)

P0 issues here: schema syntax errors, missing core types on homepage.

### Area 4: Site speed + performance

- [ ] Largest Contentful Paint (LCP) under 2.5 seconds
- [ ] First Input Delay (FID) under 100 ms
- [ ] Cumulative Layout Shift (CLS) under 0.1
- [ ] Images optimized (WebP where possible, properly sized)
- [ ] No render-blocking JavaScript above the fold
- [ ] No render-blocking CSS above the fold
- [ ] Fonts loaded with `font-display: swap`
- [ ] CDN active (Cloudflare or similar)
- [ ] Total page weight under 2 MB ideal

Run Lighthouse for the full report. Aim for Performance score 80+.

### Area 5: Internal linking + site structure

- [ ] Site has clear hierarchy (home > category > content)
- [ ] Important pages are within 3 clicks of the homepage
- [ ] Every important page has 2+ internal links pointing to it
- [ ] Anchor text is descriptive, not "click here"
- [ ] No orphan pages (pages with no inbound internal links)
- [ ] No broken internal links
- [ ] No redirect chains (A → B → C; should be A → C)

### Area 6: Trust + authority signals

- [ ] HTTPS enabled
- [ ] About page exists with author/founder bio
- [ ] Contact information visible
- [ ] Privacy policy + Terms exist
- [ ] Domain has been live for 6+ months (newer domains have less authority)
- [ ] At least a few inbound links from relevant sources (check via Search Console > Links)

## The output

The audit produces a prioritized list. NOT a 47-item checklist. The top 5 to 10 items the user should ship this Friday.

```
SEO AUDIT, {domain}, {date}

Overall health: {score / 100} based on standard rubric

P0 (CRITICAL, must fix this week):
1. {issue}: {what to do, ~time estimate}
2. {issue}: {what to do, ~time estimate}
[...]

P1 (HIGH, fix this month):
4. {issue}: {what to do}
5. {issue}: {what to do}
[...]

P2 (MEDIUM, fix this quarter):
[...]

P3 (LOW, nice to have):
[...]

QUICK WINS (under 30 min each):
- {item}
- {item}
- {item}

DEEP WORK (1-3 hours each):
- {item}

NOT WORTH DOING (would consume time, low impact):
- {item with reasoning}

VERIFIED CLEAN (already good, no action):
- {area}
```

End with: "Pick the top 3 P0 items. We can ship those Friday afternoon."

## Stage-aware adjustments

### Pre-Rev Builder

- Skip most areas
- Focus on: indexability (Area 1) + basic title/meta on homepage (Area 2 subset)
- Audit only when the user is consistently writing 1+ blog posts/week
- Don't audit a site with 1 page

### Early Operator

- Full Areas 1, 2, 3
- Light pass on Areas 4 (just Lighthouse score)
- Skip Areas 5, 6 (sample size too low to matter yet)
- Quarterly audit cadence

### Stable Solo

- Full audit across all 6 areas
- Monthly audit cadence
- Track Search Console impressions + clicks weekly
- Build internal linking strategy as content grows

### Scaling Solo

- Continuous audit (monthly P0/P1 reviews, quarterly deep audit)
- Track ranking changes weekly
- Possibly upgrade to paid tools (Ahrefs, SEMrush) at $99/mo when sample size justifies

## Free tools first

For every paid recommendation, document the free equivalent.

| Need | Free tool | Paid tool (Scaling Solo only) |
|---|---|---|
| Search performance | Google Search Console | Ahrefs ($99/mo), SEMrush ($129/mo) |
| Bing performance | Bing Webmaster Tools | Same as above |
| Page speed | PageSpeed Insights, Lighthouse (built into Chrome) | WebPageTest |
| Mobile-friendliness | Google Mobile-Friendly Test | (deprecated, use Search Console) |
| Schema validation | Rich Results Test (Google), Schema Validator (schema.org) | Schema App, others |
| Broken links | Free crawlers (Screaming Frog free up to 500 URLs) | Screaming Frog paid |
| Backlink check | Search Console (limited), free check at ahrefs.com/backlink-checker (limited) | Ahrefs, SEMrush, Moz |
| Keyword research | Google Keyword Planner, Answer the Public free, ChatGPT/Claude prompts | Ahrefs, SEMrush, Mangools |
| Rank tracking | Search Console (limited) | Ahrefs, SEMrush, AccuRanker |
| Site audit | Lighthouse, Screaming Frog free | Ahrefs Site Audit, Semrush, Sitebulb |

Bootstrap-Strict and Pre-Rev users stay free 100%. Stable Solo can consider paid at year 2 of SEO investment if the data is justifying the cost.

## Anti-patterns to refuse

### "Fix all 47 things"

Refuse. The user can't ship 47 things. Pick 5 to 10.

### "Buy backlinks"

Refuse. Black-hat tactics get sites penalized. Earn links through content + outreach.

### Keyword stuffing in title tags

Refuse. "B2B SaaS Sales Manager Coaching Coach for B2B SaaS Sales Managers" is gone. Write for humans.

### Hidden text or doorway pages

Refuse. Google catches and penalizes.

### Auto-generated content for ranking

Refuse. Algorithm targets thin AI content explicitly in 2024+.

### "Optimize this for [keyword]"

If the user is optimizing for a keyword the ICP doesn't search, refuse. Route to `content-strategy` to validate the keyword first.

### Excessive H1s

A page should have 1 H1. Multiple H1s are a 2018 myth. Stick to 1.

## Common quick wins (under 30 min)

These deliver high impact at low time cost. Always include 3-5 of these in the output when found.

1. Add missing title tags to 5+ pages → 15 min
2. Add missing meta descriptions to 5+ pages → 15 min
3. Submit sitemap to Search Console + Bing Webmaster → 10 min
4. Fix broken internal links → 20 min
5. Add alt text to images on the homepage → 15 min
6. Replace "Click here" anchor text → 15 min
7. Add OG meta tags to homepage and top 5 pages → 30 min
8. Add canonical tags where missing → 20 min
9. Fix duplicate title tags (Search Console shows them) → 20 min
10. Add basic Article schema to blog posts via template → 30 min

If the user can ship 3 of these on a Friday afternoon, the audit was worth running.

## Deep work items (1-3 hours)

These take longer but compound:

1. Rebuild internal linking strategy for content silos → 2-3 hours
2. Schema markup across all page types → 1-2 hours
3. Image optimization pipeline (WebP conversion, lazy loading) → 1-2 hours
4. Page speed overhaul (CSS, JS, font loading) → 2-4 hours
5. Backlink outreach campaign → ongoing, 1-2 hours/week

## Not worth doing (often)

These show up in audits but are usually distraction:

- Optimizing for "long-tail keywords" the ICP never searches → distraction
- Building dozens of "supporting articles" for hub pages without content strategy → use `content-strategy` first
- Fixing every minor Lighthouse warning → not all matter
- Schema for properties the user doesn't have (review schema with no real reviews) → refuse
- Reorganizing URL structure on an established site → high risk, low reward unless restructure is essential
- Disavow tool spam → mostly unnecessary now

## Family-floor + revenue tag

- SEO audit: $$ (leverage; SEO compounds over 3-12 months)
- SEO fixes: $$ if specific to important pages; $ if minor
- Endless SEO tweaking with no traffic: distraction (after 6 months of work with no movement, re-think strategy not tactics)

Cap SEO work at 2-4 hours/week at Stable Solo. Beyond that, returns diminish.

## Working with other skills

- Imports: `voice-rules` (meta descriptions + titles voice-scanned), `content-strategy` (which pages to prioritize), `ai-seo` (paired layer for AI search citation)
- Pairs with: `analytics-tracking` (measuring SEO impact), `copywriting` (rewriting titles + meta + H1s)
- Distinct from: `ai-seo` (separate skill for AI citation), `content-strategy` (the content layer above)

## When to re-audit

- After major site change (new theme, redesign, URL change)
- Quarterly at Stable Solo+
- After major Google algorithm update
- When Search Console shows abrupt drop
- When a competitor starts outranking the user on key terms

Don't audit monthly at Early Operator. Sample size is too low.

## Additional Resources

### Reference files

- **`references/audit-checklist-full.md`**, the full audit checklist (all 6 areas, every item, with explanations)
- **`references/free-tools-recipes.md`**, step-by-step recipes for each free tool (Search Console, Lighthouse, Rich Results Test, Schema Validator)
- **`references/common-fixes-cookbook.md`**, copy-paste code snippets for common fixes (canonical tags, schema templates, robots.txt examples)

### Example files

- **`examples/example-site-audit.md`**, full audit output for jaredlangley.cc as of May 2026, with prioritized fixes and timeline
- **`examples/p0-shipped-friday-afternoon.md`**, example of taking 5 P0 items and shipping them in one 3-hour Friday block

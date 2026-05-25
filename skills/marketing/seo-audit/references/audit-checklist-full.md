# SEO Audit Checklist (Full)

The complete audit checklist across all 6 areas. Use this as the source of truth when running an audit. Apply priorities (P0/P1/P2/P3) per item based on the user's stage and current state.

## Area 1: Indexability + crawl

### robots.txt

- [ ] File exists at `/robots.txt`
- [ ] Does not disallow important paths
- [ ] Explicit `Allow: /` for important crawlers (Googlebot, Bingbot)
- [ ] Sitemap URL listed (`Sitemap: https://domain.com/sitemap.xml`)
- [ ] Not blocking AI bots (GPTBot, ClaudeBot, etc.) unless intentional (see `ai-seo` skill for AI crawler strategy)
- [ ] Cloudflare managed-bot toggle is set correctly (see Langley memory `reference_cloudflare-robots-txt-gotcha.md`)

### sitemap.xml

- [ ] File exists at `/sitemap.xml` or referenced from robots.txt
- [ ] Valid XML format
- [ ] Lists current important URLs
- [ ] No 404 URLs included
- [ ] `<lastmod>` dates accurate
- [ ] Submitted to Google Search Console
- [ ] Submitted to Bing Webmaster Tools
- [ ] Sub-sitemaps used if site is large (1000+ URLs)

### Meta robots

- [ ] No `noindex` meta on important pages
- [ ] `noindex` correctly applied to thank-you pages, internal-only pages, drafts
- [ ] No conflicting directives (e.g., `index, noindex` on same page)

### X-Robots-Tag (HTTP header)

- [ ] Not blocking crawlers at server level
- [ ] Check via Chrome DevTools > Network tab > Response Headers for important pages

### Canonical tags

- [ ] `<link rel="canonical">` on every page
- [ ] Self-referencing canonical when no preferred URL
- [ ] Pages with parameters point canonical to the clean URL
- [ ] No conflicting canonical and self-referencing tags

### Mobile-friendliness

- [ ] Mobile Usability report in Search Console shows no issues
- [ ] Viewport meta tag present (`<meta name="viewport" content="width=device-width, initial-scale=1">`)
- [ ] Text legible without zoom
- [ ] Tap targets sized appropriately (8mm+)
- [ ] No horizontal scrolling on mobile

### hreflang

- [ ] Required only if multi-language
- [ ] `hreflang` tags include all language versions + x-default
- [ ] Reciprocal tags between versions
- [ ] Use Search Console's International Targeting report

## Area 2: On-page basics

### Title tags

- [ ] Every page has a unique `<title>` tag
- [ ] 50-60 characters (60-70 max)
- [ ] Primary keyword near the beginning
- [ ] Brand name at the end (e.g., "Title Here | Brand")
- [ ] Voice-scanned (no AI-tells, no banned phrases)
- [ ] Not duplicated across pages

### Meta descriptions

- [ ] Every important page has a unique meta description
- [ ] 140-160 characters (155 ideal)
- [ ] Written to earn the click (not keyword-stuffed)
- [ ] Includes primary keyword naturally
- [ ] Voice-scanned

### H1 tag

- [ ] Exactly one H1 per page
- [ ] H1 includes primary keyword or close variant
- [ ] H1 matches user intent + page promise

### Headings hierarchy

- [ ] H2s structure content into sections
- [ ] H3s nested under H2s
- [ ] No skipping levels (H1 → H3)
- [ ] Headings are descriptive (not "Section 1", "Section 2")

### Image alt text

- [ ] All important images have descriptive alt text
- [ ] Decorative images use `alt=""` (empty alt, not missing)
- [ ] Alt text is 100 characters max, descriptive
- [ ] Includes keyword naturally when relevant

### URL structure

- [ ] URLs are clean (no `?id=123` for important pages)
- [ ] Lowercase
- [ ] Hyphens, not underscores (`my-post` not `my_post`)
- [ ] Descriptive (`/three-reactive-triggers` not `/post-123`)
- [ ] No deep nesting (`/about` not `/pages/info/about`)

### Internal links

- [ ] Every important page has 2+ internal links pointing to it
- [ ] Anchor text is descriptive (not "click here", "read more")
- [ ] Footer + nav cover all important pages

### Open Graph + Twitter meta

- [ ] `og:title`, `og:description`, `og:image`, `og:url`, `og:type` on every important page
- [ ] `og:image` 1200x630 ideal
- [ ] `twitter:card` set to `summary_large_image`
- [ ] Test via opengraph.xyz or similar

### Duplicate content

- [ ] No identical content across multiple URLs
- [ ] Canonical tags resolve duplicates where unavoidable
- [ ] Trailing slash vs no-slash: consistent + canonical

## Area 3: Schema markup

### Required schema (homepage)

- [ ] `Organization` OR `Person` schema (depending on entity type)
- [ ] `WebSite` schema with `potentialAction` for sitelinks search box
- [ ] All schema validates in Rich Results Test

### Blog post schema

- [ ] `Article` (or `BlogPosting`) schema
- [ ] `headline`, `datePublished`, `dateModified`, `author`, `publisher`, `image`, `mainEntityOfPage`
- [ ] Author entity links to Person schema on About page (`@id` unification, see Langley `project_aeo-tier1-may20.md`)

### FAQPage schema

- [ ] Used only where FAQs are visible on the page
- [ ] Q + A both present in schema and on page
- [ ] No hidden FAQs

### Breadcrumbs

- [ ] `BreadcrumbList` schema where breadcrumbs visible
- [ ] Visible breadcrumbs match schema

### Service / Product / Offer

- [ ] `Service` or `Product` schema for offer pages
- [ ] `Offer` schema with price, currency, availability
- [ ] `aggregateRating` only if real reviews exist (Google enforces this)

### Course schema

- [ ] `Course` schema if user sells educational content
- [ ] `CourseInstance` for specific cohorts/dates

### Validation

- [ ] No errors in Rich Results Test
- [ ] Warnings reviewed (not all need fixing)
- [ ] No JSON syntax errors (smart quotes, trailing commas)

## Area 4: Site speed + performance

### Core Web Vitals

- [ ] Largest Contentful Paint (LCP) under 2.5s
- [ ] First Input Delay (FID) / Interaction to Next Paint (INP) under 200 ms
- [ ] Cumulative Layout Shift (CLS) under 0.1

Test via PageSpeed Insights or Search Console > Core Web Vitals report.

### Image optimization

- [ ] WebP format where supported (with fallback)
- [ ] Properly sized (no 4000px wide image rendered at 600px)
- [ ] Lazy loading on below-fold images (`loading="lazy"`)
- [ ] Explicit `width` and `height` attributes (prevents CLS)

### Render-blocking resources

- [ ] No render-blocking JavaScript above the fold
- [ ] Critical CSS inlined where possible
- [ ] Non-critical CSS deferred (`media="print"` swap trick)
- [ ] Async or defer attributes on JS

### Fonts

- [ ] `font-display: swap` to prevent FOUT/FOIT issues
- [ ] WOFF2 format
- [ ] Self-hosted OR preconnect to font CDN
- [ ] Limited weights loaded (don't ship all 9 Manrope weights)

### CDN + caching

- [ ] CDN active (Cloudflare, Vercel, Netlify, Fastly)
- [ ] Cache headers set correctly
- [ ] Static assets versioned (filename includes hash)

### Page weight

- [ ] Total page weight under 2 MB ideal
- [ ] Above-fold weight under 500 KB ideal
- [ ] No unused JS / CSS shipped (audit via Lighthouse)

## Area 5: Internal linking + site structure

### Hierarchy

- [ ] Clear hierarchy: home > category > content
- [ ] Important pages within 3 clicks of homepage
- [ ] No "buried" content 5+ clicks deep

### Orphan pages

- [ ] No pages with zero inbound internal links
- [ ] Run Screaming Frog free or similar to find orphans

### Broken links

- [ ] No broken internal links (Search Console > Coverage report)
- [ ] External links checked monthly

### Redirect chains

- [ ] No redirect chains (A → B → C)
- [ ] 301 redirects only (not 302) for permanent moves
- [ ] No redirect loops

### Anchor text variety

- [ ] Anchor text varies across pages
- [ ] Descriptive anchor text on important internal links
- [ ] Not over-optimized (every link to "/services" isn't "marketing services")

### Topic clusters / silos

- [ ] Content organized in topic clusters where applicable
- [ ] Hub pages link out to cluster pages
- [ ] Cluster pages link back to hub

## Area 6: Trust + authority signals

### HTTPS

- [ ] Entire site on HTTPS
- [ ] No mixed content warnings (HTTP assets on HTTPS pages)
- [ ] HSTS header set (advanced)

### Author + business identity

- [ ] About page exists with founder/author bio
- [ ] Author name + photo on blog posts
- [ ] LinkedIn / X / other profile links for the author
- [ ] Schema `sameAs` URLs linking to social profiles

### Contact + legal

- [ ] Contact information visible (email, phone OR form)
- [ ] Physical address if local business
- [ ] Privacy policy linked
- [ ] Terms of service linked
- [ ] Cookie banner if EU/UK traffic

### Domain age + authority

- [ ] Domain live 6+ months
- [ ] No DA-killing penalties (manual actions in Search Console)
- [ ] Some inbound links from relevant sources

### Reviews + testimonials

- [ ] Google Business Profile reviews for local business
- [ ] Real testimonials with attribution on site
- [ ] Schema review markup only if real reviews exist

### Sitemap of brand authority

- [ ] Author has presence on relevant platforms (LinkedIn, X, etc.)
- [ ] Brand schema `sameAs` confirms cross-platform identity
- [ ] No conflicting business information across platforms

## Prioritization rubric

Apply this rubric to every item:

### P0 (CRITICAL, fix this week)

- Site is uncrawlable
- Site is noindexed (intentionally or not)
- HTTPS broken or mixed content
- Title tags missing on important pages
- H1 missing on homepage or top landing pages
- Schema syntax errors blocking rich snippets
- Mobile usability blocking rankings
- Manual penalty in Search Console

### P1 (HIGH, fix this month)

- Slow Core Web Vitals
- Missing meta descriptions on top pages
- Broken internal links on important pages
- Schema markup missing where it would help (FAQPage, Article)
- OG meta tags missing
- Sitemap not submitted to Search Console + Bing
- Duplicate title tags

### P2 (MEDIUM, fix this quarter)

- Internal linking improvements
- Image optimization
- Schema improvements (Course, additional types)
- Alt text completeness
- URL cleanup for old pages
- Redirect chain consolidation

### P3 (LOW, nice to have)

- HSTS header
- Sub-sitemaps for large sites
- Schema for niche page types
- Author entity linking refinements
- Hreflang refinements (multi-language only)

## Stage-aware prioritization

| Stage | Focus areas |
|---|---|
| Pre-Rev Builder | Area 1 (indexability), Area 2 (basics on homepage only) |
| Early Operator | Areas 1, 2, 3 (full), skip 4-6 unless something is broken |
| Stable Solo | All 6 areas |
| Scaling Solo | All 6 areas + continuous monitoring + competitive analysis |

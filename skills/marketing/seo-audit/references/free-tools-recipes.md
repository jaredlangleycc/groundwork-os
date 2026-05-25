# Free Tools Recipes

Step-by-step recipes for the free SEO tools every audit uses. Use as the workflow scaffold when running an audit.

## Google Search Console

Free. Account required (Google). Set up by adding the domain via DNS verification.

### Setup recipe

1. Go to search.google.com/search-console
2. Add property (Domain or URL prefix)
3. Verify ownership (DNS TXT record is simplest)
4. Submit sitemap (Sitemaps menu > paste sitemap URL)
5. Wait 24 to 72 hours for first data

### Key reports to check

**Performance report:**
- Total clicks (last 28 days)
- Total impressions
- Average CTR
- Average position
- Top queries (queries the site appears for)
- Top pages (pages getting clicks)
- Country, device, search appearance breakdowns

**Coverage / Pages report:**
- Pages indexed (good)
- Pages not indexed and why (bad if important pages)
- Common issues: "Crawled, currently not indexed", "Duplicate without user-selected canonical", "Excluded by 'noindex' tag"

**Sitemaps report:**
- Submitted URLs vs Indexed URLs
- If gap is large, investigate why

**Core Web Vitals report:**
- Mobile + Desktop scores
- Pages with issues vs good URLs

**Mobile Usability report:**
- Pages with issues
- Common issues: text too small, clickable elements too close

**Rich Results report:**
- Pages with structured data
- Errors + warnings to address

**Manual Actions:**
- Should be empty
- If not empty, the site has a penalty (urgent)

### Audit usage

1. Run the audit AFTER 28 days of Search Console data has accumulated
2. Pull top queries → check if they match target ICP
3. Pull pages with high impressions but low CTR → meta description rewrite candidates
4. Check Coverage report for unindexed important pages
5. Check Core Web Vitals for performance issues

## Bing Webmaster Tools

Free. Account required. Equivalent of Search Console for Bing/Yahoo. Useful because IndexNow uses Bing for cross-engine push.

### Setup recipe

1. Go to www.bing.com/webmasters
2. Sign in with Microsoft account
3. Add site
4. Verify ownership (DNS, XML file, or meta tag)
5. Import data from Search Console (one-click migration)
6. Submit sitemap

### Audit usage

- Use for IndexNow API key verification (see Langley `reference_indexnow-langley.md`)
- Check Bing-specific impressions + queries (different from Google)
- Bing-specific crawler issues

## Google PageSpeed Insights / Lighthouse

Free. No login. Run on individual URLs.

### Recipe

1. Go to pagespeed.web.dev OR open Chrome DevTools > Lighthouse tab
2. Enter URL
3. Run audit (mobile + desktop)
4. Review Core Web Vitals + Lighthouse Performance score
5. Drill into Opportunities + Diagnostics sections

### What to check

- **LCP (Largest Contentful Paint):** under 2.5s good, 2.5-4s needs improvement, 4s+ poor
- **FID (First Input Delay) / INP:** under 100ms good
- **CLS (Cumulative Layout Shift):** under 0.1 good
- **Overall Performance score:** aim for 80+

### Common Opportunities

- Eliminate render-blocking resources
- Reduce unused CSS
- Reduce unused JavaScript
- Properly size images
- Use next-gen image formats (WebP)
- Efficiently encode images
- Enable text compression
- Preload key requests
- Avoid enormous network payloads

Each opportunity has an estimated impact in seconds. Prioritize high-impact ones.

## Google Rich Results Test

Free. No login. Validates structured data.

### Recipe

1. Go to search.google.com/test/rich-results
2. Enter URL OR paste JSON-LD code
3. Run test
4. Review detected items (Article, Person, FAQPage, etc.)
5. Address any errors or warnings

### What to check

- Detected items match what should be on the page
- No errors (errors block rich snippets)
- Warnings reviewed (not all need fixing)
- Test mobile + desktop separately (sometimes different)

### Audit usage

Run on every important page. Especially:
- Homepage (Organization + Person + WebSite)
- Blog posts (Article)
- FAQ pages (FAQPage)
- Product / service pages (Service / Product / Offer)

## Schema Markup Validator

Free at validator.schema.org. More strict than Rich Results Test.

### Recipe

1. Go to validator.schema.org
2. Enter URL OR paste JSON-LD
3. Run test
4. Review schema.org-spec validation (vs Google rich-results-specific)

Use for non-Google-rich-result schemas (e.g., Course, FAQPage variations Google doesn't render).

## Screaming Frog SEO Spider (Free Tier)

Free up to 500 URLs. Desktop application. Crawls a site and reports issues.

### Recipe

1. Download from screamingfrog.co.uk/seo-spider
2. Install (Windows / Mac / Linux)
3. Enter site URL
4. Run crawl
5. Review tabs: Internal, External, Response Codes, Page Titles, Meta Description, H1, Images

### Audit usage

- Find broken internal links (Response Codes > Client Error 4xx)
- Find pages missing title or meta description
- Find pages with duplicate titles or descriptions
- Find images missing alt text
- Find orphan pages (use "Crawl Analysis" mode)
- Generate XML sitemap (Sitemaps menu)

Free tier covers most solopreneur sites (<500 URLs).

## Mobile-Friendly Test

Deprecated by Google as a standalone tool. Use Search Console's Mobile Usability report instead.

## Answer the Public (free tier)

Free tier limits queries per day. Useful for keyword research and question discovery.

### Recipe

1. Go to answerthepublic.com
2. Enter seed keyword (e.g. "sales management")
3. Review the question wheel (questions, prepositions, comparisons)
4. Export to CSV

### Audit usage

- Find questions your ICP is searching
- Feed into content-strategy for topic clusters
- Inform FAQ schema (the questions to answer)

## Google Keyword Planner

Free with a Google Ads account (you don't need to spend to use it).

### Recipe

1. Go to ads.google.com > Tools and Settings > Keyword Planner
2. Choose "Discover new keywords"
3. Enter seed terms
4. Review search volumes + competition + suggested bids

### Audit usage

- Validate that target keywords have search volume
- Find related keyword opportunities
- Estimate paid traffic cost (if planning paid)

Note: Keyword Planner volumes are rounded broadly for free users. Use directionally.

## ChatGPT / Claude for SEO research

Free if user has basic access. Useful for:

- "What questions do new sales managers ask about leadership?"
- "What does {ICP} call this problem in their own words?"
- "Generate 20 long-tail keyword variations for {topic}"

Use as a brainstorming partner. Validate the output against actual search data via Search Console + Keyword Planner.

## Backlink check (free options)

Limited but useful.

### Ahrefs Free Backlink Checker

1. Go to ahrefs.com/backlink-checker
2. Enter domain
3. View top 100 backlinks (free limit)

### Search Console

1. Search Console > Links report
2. View top linking sites + top linked pages + top anchor text
3. Limited compared to paid tools but free

### Audit usage

- Identify the user's top backlinks
- Find new linking opportunities (sites linking to competitors)
- Spot toxic backlinks (rare for solopreneurs)

## OpenGraph debugger

### Facebook Sharing Debugger

debugger.facebook.com/sharing, paste URL, see OG card preview.

### LinkedIn Post Inspector

linkedin.com/post-inspector, paste URL, see OG preview as LinkedIn renders.

### opengraph.xyz

Free, multi-platform OG card check.

### Audit usage

- Verify OG tags work as expected
- Find issues (wrong image, wrong title, image too small)

## Browser DevTools (Chrome)

Free, built-in. Use for:

- **Network tab:** check resource sizes, response codes, headers
- **Lighthouse tab:** run audits locally
- **Application tab:** check structured data, manifest, service worker
- **Elements tab:** inspect HTML, CSS, alt text on images

## Audit workflow with these tools

A standard audit follows this tool sequence:

1. **Search Console + Bing Webmaster**, pull baseline data (impressions, clicks, errors)
2. **PageSpeed Insights / Lighthouse**, check Core Web Vitals on top 5 pages
3. **Screaming Frog Free**, crawl site, get full list of issues
4. **Rich Results Test**, validate schema on top 5 pages
5. **OpenGraph debugger**, check social card preview on top 5 pages
6. **Mobile Usability (Search Console)**, verify mobile issues
7. **Answer the Public + Keyword Planner**, validate target keywords have search demand

Total tool time: ~60-90 min for a Stable Solo site.

Output the prioritized findings per the SKILL.md format.

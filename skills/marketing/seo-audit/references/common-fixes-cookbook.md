# Common Fixes Cookbook

Copy-paste code snippets for the most common SEO fixes. Use as starting templates. Adapt to user's site.

## Robots.txt template

Basic permissive robots.txt for solopreneur sites:

```
# robots.txt for {domain}
# Allow all crawlers
User-agent: *
Allow: /

# Block sensitive paths
Disallow: /private/
Disallow: /admin/
Disallow: /api/

# Allow AI search engines (per ai-seo skill, adjust per user preference)
User-agent: GPTBot
Allow: /

User-agent: ChatGPT-User
Allow: /

User-agent: ClaudeBot
Allow: /

User-agent: Claude-Web
Allow: /

User-agent: PerplexityBot
Allow: /

User-agent: Google-Extended
Allow: /

# Sitemap
Sitemap: https://{domain}/sitemap.xml
```

## Sitemap.xml template

Minimal XML sitemap:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>https://{domain}/</loc>
    <lastmod>2026-05-23</lastmod>
    <changefreq>weekly</changefreq>
    <priority>1.0</priority>
  </url>
  <url>
    <loc>https://{domain}/about</loc>
    <lastmod>2026-05-23</lastmod>
    <changefreq>monthly</changefreq>
    <priority>0.8</priority>
  </url>
  <url>
    <loc>https://{domain}/blog</loc>
    <lastmod>2026-05-23</lastmod>
    <changefreq>weekly</changefreq>
    <priority>0.9</priority>
  </url>
  <url>
    <loc>https://{domain}/blog/three-reactive-triggers</loc>
    <lastmod>2026-05-23</lastmod>
    <changefreq>monthly</changefreq>
    <priority>0.7</priority>
  </url>
</urlset>
```

Generate dynamically when possible. Update lastmod when content changes.

## Canonical tag

```html
<link rel="canonical" href="https://{domain}/{path}">
```

Self-referencing on the same page (most common). Points elsewhere only when there's a preferred URL (parameter-stripped, www vs non-www, etc.).

## Title tag

```html
<title>{Page-Specific Headline | Brand Name}</title>
```

Examples:

```html
<title>Leadership Coaching for New Sales Managers | the example coaching business</title>
<title>The flagship offer: 90-Day Coaching for B2B SaaS Sales Managers</title>
<title>Three Reactive Triggers Most Managers Don't See | Groundwork</title>
```

Length: 50-60 characters. Voice-scanned.

## Meta description

```html
<meta name="description" content="One sentence framing the page, one sentence on what the reader gets, written to earn the click. Voice-scanned, 140-160 characters.">
```

Examples:

```html
<meta name="description" content="The 12-question lead-gen assessment shows which leadership pillar is carrying the most weight in your week. 5 minutes. Free. Direct.">
```

## Open Graph + Twitter card

```html
<!-- Open Graph -->
<meta property="og:type" content="website">
<meta property="og:url" content="https://{domain}/{path}">
<meta property="og:title" content="{Same as title or shorter}">
<meta property="og:description" content="{Same as meta description}">
<meta property="og:image" content="https://{domain}/images/og-{slug}.png">
<meta property="og:image:width" content="1200">
<meta property="og:image:height" content="630">

<!-- Twitter -->
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:site" content="@username">
<meta name="twitter:title" content="{Same as og:title}">
<meta name="twitter:description" content="{Same as og:description}">
<meta name="twitter:image" content="https://{domain}/images/og-{slug}.png">
```

OG image: 1200x630 ideal. Brand-aligned.

## Article schema (JSON-LD)

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Article",
  "headline": "Three Reactive Triggers Most Managers Don't See",
  "image": "https://{domain}/images/og-three-reactive-triggers.png",
  "datePublished": "2026-05-24T08:00:00-07:00",
  "dateModified": "2026-05-24T08:00:00-07:00",
  "author": {
    "@id": "https://{domain}/#author"
  },
  "publisher": {
    "@id": "https://{domain}/#publisher"
  },
  "mainEntityOfPage": {
    "@type": "WebPage",
    "@id": "https://{domain}/blog/three-reactive-triggers"
  }
}
</script>
```

The `@id` references unify author + publisher across the site (defined on homepage).

## Person schema (homepage)

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Person",
  "@id": "https://{domain}/#author",
  "name": "{User Full Name}",
  "url": "https://{domain}",
  "image": "https://{domain}/images/portrait.jpg",
  "jobTitle": "{Job Title}",
  "worksFor": {
    "@type": "Organization",
    "name": "{Business Name}",
    "url": "https://{domain}"
  },
  "sameAs": [
    "https://linkedin.com/in/{username}",
    "https://twitter.com/{username}",
    "https://instagram.com/{username}",
    "https://threads.net/{username}"
  ],
  "knowsAbout": [
    "Leadership Coaching",
    "Executive Coaching",
    "Sales Management"
  ],
  "alumniOf": {
    "@type": "EducationalOrganization",
    "name": "{Credential Granting Org}"
  },
  "hasCredential": {
    "@type": "EducationalOccupationalCredential",
    "name": "{Credential Name}",
    "recognizedBy": {
      "@type": "Organization",
      "name": "{Issuing Body}"
    }
  }
}
</script>
```

## Organization schema (homepage)

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Organization",
  "@id": "https://{domain}/#publisher",
  "name": "{Business Name}",
  "url": "https://{domain}",
  "logo": "https://{domain}/images/logo.png",
  "founder": {
    "@id": "https://{domain}/#author"
  },
  "sameAs": [
    "https://linkedin.com/company/{slug}",
    "https://twitter.com/{username}"
  ]
}
</script>
```

## WebSite schema (homepage)

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "WebSite",
  "url": "https://{domain}",
  "name": "{Business Name}",
  "potentialAction": {
    "@type": "SearchAction",
    "target": {
      "@type": "EntryPoint",
      "urlTemplate": "https://{domain}/search?q={search_term_string}"
    },
    "query-input": "required name=search_term_string"
  }
}
</script>
```

(Only include if site has a working search function.)

## FAQPage schema

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "What is The flagship offer coaching engagement?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "The flagship offer is a 90-day 1-on-1 coaching engagement that builds personalized leadership infrastructure across three pillars: Presence, Performance, and Wholeness."
      }
    },
    {
      "@type": "Question",
      "name": "How much does The flagship offer cost?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "$X,XXX total. Paid as $XXX/month for 3 months, or paid in full. 30-day money-back guarantee."
      }
    }
  ]
}
</script>
```

Use only when the FAQs are visible on the page.

## BreadcrumbList schema

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "BreadcrumbList",
  "itemListElement": [
    {
      "@type": "ListItem",
      "position": 1,
      "name": "Home",
      "item": "https://{domain}"
    },
    {
      "@type": "ListItem",
      "position": 2,
      "name": "Blog",
      "item": "https://{domain}/blog"
    },
    {
      "@type": "ListItem",
      "position": 3,
      "name": "Three Reactive Triggers"
    }
  ]
}
</script>
```

## Service schema (offer page)

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Service",
  "name": "The flagship offer",
  "description": "A 90-day 1-on-1 leadership coaching engagement for B2B SaaS sales managers.",
  "provider": {
    "@id": "https://{domain}/#publisher"
  },
  "serviceType": "Leadership Coaching",
  "areaServed": [
    "United States",
    "Canada",
    "United Kingdom",
    "Australia"
  ],
  "offers": {
    "@type": "Offer",
    "@id": "https://{domain}/#offer-foundation",
    "price": "4999.00",
    "priceCurrency": "USD",
    "availability": "https://schema.org/InStock",
    "url": "https://{domain}/foundation",
    "seller": {
      "@id": "https://{domain}/#publisher"
    }
  }
}
</script>
```

## H1 + heading hierarchy

```html
<h1>Three Reactive Triggers Most Managers Don't See</h1>

<h2>The Morning Slack Scroll</h2>
<p>Body text...</p>

<h2>The Interrupt One-on-One</h2>
<p>Body text...</p>

<h3>The 3-Question Replacement</h3>
<p>Body text...</p>

<h2>The 4 PM Deal Review</h2>
<p>Body text...</p>
```

Exactly one H1. H3s nested under H2s.

## Image alt text

```html
<!-- Descriptive image -->
<img src="/images/jared-portrait.jpg" alt="Jared Langley, ICF-trained leadership coach" width="800" height="800">

<!-- Decorative image -->
<img src="/images/decorative-line.svg" alt="" role="presentation">
```

Alt text: descriptive, 100 characters max. Empty for decorative.

## Lazy loading + dimensions

```html
<img src="/images/below-fold.jpg" alt="Description" loading="lazy" width="1200" height="800">
```

`loading="lazy"` for below-fold. Explicit width + height prevent CLS.

## Internal link with descriptive anchor

```html
<!-- Good -->
<a href="/blog/three-reactive-triggers">Read about the three reactive triggers</a>

<!-- Bad -->
<a href="/blog/three-reactive-triggers">Click here</a>
```

## Redirect (301 in Cloudflare _redirects)

```
# _redirects file (Cloudflare Pages)
/old-url /new-url 301
/scorecard /vibe-check 301
/blog/old-slug /blog/new-slug 301
```

301 = permanent. 302 = temporary (rare).

## Cloudflare AI bot allow

Disable Cloudflare's "Block AI bots" toggle in the dashboard. Also disable "Manage your robots.txt" if it's overriding the user's robots.txt.

See Langley memory `reference_cloudflare-robots-txt-gotcha.md` for the gotcha.

## Font loading

```html
<!-- In <head>, before stylesheet -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;700&display=swap" rel="stylesheet">
```

`display=swap` prevents FOIT.

## Critical CSS inline

```html
<head>
  <style>
    /* Critical above-fold CSS inline */
    body { font-family: 'Manrope', sans-serif; margin: 0; }
    /* etc. */
  </style>

  <!-- Non-critical CSS deferred -->
  <link rel="preload" href="/style.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
  <noscript><link rel="stylesheet" href="/style.css"></noscript>
</head>
```

## Compression + caching headers

Set in CDN or server config:

```
# Compression
Content-Encoding: gzip, br

# Caching
Cache-Control: public, max-age=31536000, immutable  # for versioned static assets
Cache-Control: public, max-age=3600  # for HTML pages
```

## Voice-scan reminder

Title tags, meta descriptions, alt text, and H1s all carry voice. Voice-scan before deploying:

- No em-dashes
- No banned phrases
- No "X, not Y" antipattern (in titles especially)
- No AI-tell openers in meta descriptions
- Match user's archetype

## How to use this cookbook in an audit

When the audit identifies a missing element, paste the relevant snippet from this file as the suggested fix. Tag the priority (P0/P1/P2) and the estimated time.

Most snippets here are 10 to 30 minutes of work per page. Quick wins in the audit output.

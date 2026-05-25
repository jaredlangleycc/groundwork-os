# MailerLite vs Kit vs Beehiiv (and others)

When to pick which email tool. Free-tier limits, automation feature comparison, the migration cost when you outgrow each.

## Quick verdict by stage

| Stage | Tool | Why |
|---|---|---|
| Pre-Rev Builder | MailerLite Free | Best free automation, 1000-sub cap, low ceiling but plenty for testing |
| Early Operator | MailerLite Free | Stay until you hit 1000 subs OR need branching automation |
| Stable Solo (under 1000 subs) | MailerLite Free | Stay free |
| Stable Solo (1000 to 2500) | MailerLite Starter or Beehiiv Scale | Choose based on whether you sell offers (ML) or write a paid newsletter (Beehiiv) |
| Scaling Solo | Kit (ConvertKit) Creator or HubSpot Marketing | Kit if creator-led, HubSpot if B2B sales-led |

## Tool-by-tool

### MailerLite Free

**Limits:** 1000 subscribers, 12000 emails/month, unlimited automations on free, all core features.

**Strengths:**
- Visual automation builder works at the free tier
- Multi-step automation, group-based triggers
- Clean transactional API (worker integration)
- Best free tier of any major ESP in 2026
- No "MailerLite" branding on emails at the free tier

**Weaknesses:**
- Reporting is shallow (no advanced cohort analysis)
- Forms are basic
- No native deep integration with Stripe, Shopify (use Zapier)
- Customer support is slow on the free tier

**Pick when:** under 1000 subscribers, lead-magnet-driven, simple offer ladder.

**Migrate when:** Past 1000 subs and you don't want the $10/mo upgrade, OR you need true behavior-based branching automations beyond MailerLite's capacity.

### Kit (formerly ConvertKit) Free

**Limits:** 10000 subscribers (yes, ten thousand) on the free tier, basic broadcasts + 1 automation, no advanced segmentation.

**Strengths:**
- 10000-sub cap is the highest free tier in 2026
- Creator-friendly (built for newsletter writers, coaches, course sellers)
- Excellent landing pages + opt-in forms
- Best deliverability of the creator-focused tools

**Weaknesses:**
- Only 1 automation on free (no parallel welcome series)
- Limited reporting
- Free tier doesn't include sales features

**Pick when:** newsletter-led business, building a list before launching a product, lots of opt-in surfaces.

**Migrate up when:** you hit 1000 to 3000 subs OR want multiple sequences running OR want to use Kit Commerce.

### Beehiiv Free

**Limits:** 2500 subscribers, basic features, some Beehiiv branding on free.

**Strengths:**
- Best newsletter-specific tool. Subscriber-facing experience (web archive, recommendation network) is excellent.
- Beehiiv Boost (paid recommendation network) drives sub growth
- Native newsletter monetization (ads, paid subs) when ready
- Mobile-first reader experience

**Weaknesses:**
- Automation is weaker than MailerLite
- Less general-purpose (you really want this to be your newsletter business, not your CRM)
- Branding on free tier

**Pick when:** the user is building a paid newsletter or content-led business where the newsletter is the product.

**Migrate up when:** at 1500+ subscribers, monetization on the horizon, want to grow via the Boost network.

### Substack

**Limits:** Unlimited subscribers on free.

**Strengths:**
- Lowest setup friction. Up in 10 minutes.
- Built-in audience (Notes, recommendations)
- Reader app drives engagement
- Built-in paid-subscription option

**Weaknesses:**
- No real automation. Welcome via pinned post only.
- No segmentation, no behavior triggers
- 10% revenue share when you turn on paid subs
- You don't own the subscriber relationship (export but not owned)
- Email deliverability is OK, not great

**Pick when:** the user wants to write and not think about tools. Acceptable for Pre-Rev Builder testing voice.

**Migrate off when:** you have an offer to sell beyond paid subs, OR you want behavior automation, OR you want to own the relationship long-term.

the example coaching business deprecated Substack on April 25, 2026 specifically for these reasons. The blog moved to jaredlangley.cc/blog. The list moved to MailerLite.

### HubSpot Marketing Hub Starter

**Limits:** Starts at ~$20/month, 1000 marketing contacts at Starter tier.

**Strengths:**
- True CRM-marketing alignment (lifecycle stages, deal tracking, lead scoring)
- Deep behavioral triggers (page visits, deal stage, form submission)
- Best for B2B sales-led businesses
- Connects to forms, calls, deals natively

**Weaknesses:**
- More expensive than alternatives
- Steep learning curve
- Overkill until you have actual sales pipeline complexity
- Easy to over-configure

**Pick when:** the user is selling B2B services, has a real sales motion, wants email + CRM in one place.

the example coaching business upgraded to HubSpot Starter on May 18, 2026 for this exact reason: needed CRM-marketing alignment, MailerLite alone wasn't enough.

**Migrate up when:** at $25K MRR+ with a real outbound sales motion AND you've outgrown the email-only tools.

### Other tools to mention but rarely recommend

- **Mailchimp:** UX dated, pricing crept up, no killer feature. Avoid for new builds in 2026.
- **ActiveCampaign:** Powerful automation, but overkill for solopreneur stage. Consider at Scaling Solo+.
- **Klaviyo:** Built for ecommerce. If the user isn't selling physical or DTC, skip.
- **Brevo (formerly Sendinblue):** Adequate free tier, but no compelling reason over MailerLite or Kit.
- **Loops:** Modern, dev-friendly, lean. Good for indie SaaS founders. Light on free tier (under 1000 contacts).

## Feature comparison matrix

| Feature | MailerLite Free | Kit Free | Beehiiv Free | Substack | HubSpot Starter |
|---|---|---|---|---|---|
| Subscriber cap (free) | 1000 | 10000 | 2500 | Unlimited | n/a (paid only) |
| Automations on free | Unlimited | 1 | Limited | Pinned welcome only | n/a |
| Forms / opt-ins | Basic | Excellent | Good | Native | Excellent |
| Segmentation | Basic | Basic | Basic | None | Excellent |
| Behavior triggers | Light | None | None | None | Excellent |
| Newsletter focus | Medium | High | Highest | Highest | Low |
| Deliverability | Good | Excellent | Good | OK | Excellent |
| Cost at 1000 subs | $0 | $0 | $0 | $0 | ~$20/mo |
| Cost at 5000 subs | $30 | $29 | $39 | $0 | $40 to $50 |

## Migration cost (the hidden tax)

Switching ESPs has a hidden cost most solopreneurs underestimate:

- Rebuilding all forms across the website (1 to 4 hours)
- Re-creating automations (4 to 12 hours depending on complexity)
- Re-warming deliverability on the new sender (2 to 4 weeks)
- Re-confirming subscribers if double-opt-in policy requires (lose 5 to 30%)
- Updating CRM integration (4 to 8 hours)
- Risk of broken transactional sends during cutover

For a Stable Solo user this is 1 to 3 weeks of distraction. Avoid switching unless the new tool unblocks a specific bottleneck.

## Decision rule

Default for NightShiftOS users: MailerLite Free.

Upgrade to MailerLite Starter when:

- You hit 900 subs and growing
- You want A/B testing
- Removing the 12000 email/month cap matters

Switch to Kit Creator when:

- You're a newsletter-first creator (course/community, not service)
- You're past 5000 subs

Switch to HubSpot Marketing Hub when:

- B2B service business
- Real outbound sales motion
- Want CRM + marketing in one place

Stay on Substack when:

- You're writing for the sake of writing (no funnel)
- You're testing voice at Pre-Rev stage
- You explicitly don't want to think about tools

Move OFF Substack when:

- You have an offer to sell
- You want behavior triggers
- You want to own the relationship

## The 1-question test

If the user is on the fence:

"Do you sell something for money, or are you primarily building an audience?"

- Sell → MailerLite or HubSpot
- Audience → Kit, Beehiiv, or Substack

Most solopreneurs are selling (or about to). MailerLite is the safe default.

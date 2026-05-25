---
name: boring-stack
description: This skill should be used when the user asks "what should I use for X", "what tool for Y", "what's the best Z", asks to add or switch a tool in their stack, or proposes a new function (CRM, email, scheduling, website, finance, storage, analytics, design, comms, automation). It recommends the lowest rung on a 4-step ladder (Free, ~$20/mo, ~$50/mo, custom build), with explicit tests required to climb. The ladder prevents stack creep and keeps the user shipping with boring tools that work. Active for every NightShiftOS user always.
version: 0.1.0
---

# Boring Stack

Boring tools win. The user's job is shipping the offer, talking to customers, and going home for dinner. The tools should disappear into the background.

The boring-stack ladder is a 4-rung framework that picks the lowest-friction tool for the function. Climb only when the rung below breaks at a documented limitation.

## When this skill triggers

Fire whenever:

- The user asks "what should I use for [function]"
- The user proposes adding a tool to their stack
- The user proposes switching from one tool to another
- The user wants to know the "best" tool for anything
- `free-first-checker` cleared a climb and needs a destination
- `customize-from-assessment` is building the initial stack
- The user's stated monthly stack cost exceeds their max_tool_spend_monthly

## The boring-stack ladder

Four rungs. Each rung has a specific role and a specific test to climb to the next.

### Rung 0: Free tier or DIY

The default. Free tools, hand-coded artifacts, or genuinely free DIY. No cost beyond setup time.

**Test to climb:** the free path has been tested for at least 14 days at meaningful volume, the break point has been named specifically, and `free-first-checker` has logged the test.

### Rung 1: Sub-$20/mo paid

Lightweight paid tier that fixes a specific limitation in the free path. Single subscription, low commitment, easy to cancel.

**Test to climb:** the user has used Rung 1 for at least 30 days, the limitation that justified Rung 1 still applies, AND a new specific limitation has emerged that Rung 1 cannot fix.

### Rung 2: $20 to $50/mo paid

Mid-tier paid product. Fixes more substantial limitations and often includes integrations, automations, or higher caps.

**Test to climb:** the user has used Rung 2 for at least 60 days, the business has crossed a revenue threshold (typically $5K MRR), and Rung 2 has a documented hard limit that Rung 3 fixes.

### Rung 3: Custom build or $50+/mo paid

Build it (custom code, self-hosted) or pay for the premium SKU. Reserved for genuine scale problems or functions where speed matters more than savings.

**Test to climb:** there is no climb. This is the top of the ladder for solopreneur use cases. Above this is enterprise territory.

## Function-by-function ladder

The full ladder per common function. Use this lookup when recommending a tool.

### CRM (contact management + pipeline)

| Rung | Tool | Cost | Best for |
|---|---|---|---|
| 0 | Google Sheet with 12-column schema | Free | Under 100 active contacts |
| 1 | HubSpot Free CRM | Free (but with marketing limits) | Up to a few hundred contacts, basic pipeline |
| 2 | HubSpot Starter | $20/mo | Two pipelines, marketing automations, Service Keys for webhook |
| 3 | HubSpot Pro or Pipedrive Pro | $90+/mo | Multi-user, advanced automations |

**Climb test rung 0 to 1:** Sheet maintenance time exceeds 30 min/wk OR contacts exceed 100.
**Climb test rung 1 to 2:** Need second pipeline OR webhook-driven dual-write OR Marketing emails.
**Climb test rung 2 to 3:** Multi-user team or revenue-attribution requirements.

### Email marketing

| Rung | Tool | Cost | Best for |
|---|---|---|---|
| 0 | Substack Free or hand-rolled (Cloudflare Pages + form) | Free | List under 100, no automations needed |
| 1 | MailerLite Free | Free up to 1,000 subs | Most early-stage businesses |
| 2 | MailerLite Growing or ConvertKit Creator | $10-29/mo | Up to 1,000-5,000 subs, advanced automations |
| 3 | ConvertKit Pro or Customer.io | $79+/mo | Behavioral triggers, advanced segmentation |

**Climb test rung 0 to 1:** List crossed 100 AND you want automations.
**Climb test rung 1 to 2:** Subscriber cap hit OR specific automation gated to paid.
**Climb test rung 2 to 3:** Behavioral data + scoring required (rare under $25K MRR).

### Scheduling

| Rung | Tool | Cost | Best for |
|---|---|---|---|
| 0 | Cal.com Free | Free | 1 event type, single user |
| 1 | Cal.com Team Essentials | $12/mo | Multiple event types, basic team features |
| 2 | Cal.com Team Pro or HubSpot Meetings | $30+/mo | Advanced routing, CRM integration |
| 3 | Chili Piper or Calendly Enterprise | $200+/mo | Round-robin team scheduling, dynamic forms |

**Climb test rung 0 to 1:** Need 2+ event types.
**Climb test rung 1 to 2:** Need advanced routing OR success redirects OR CRM-deep integration.
**Climb test rung 2 to 3:** Team scheduling required.

### Website hosting

| Rung | Tool | Cost | Best for |
|---|---|---|---|
| 0 | Cloudflare Pages (custom domain costs $10-15/yr separately) | Free | Static or framework-built sites |
| 1 | Cloudflare Pages Pro | $20/mo | Higher bandwidth, more concurrent builds |
| 2 | Netlify Pro or Vercel Pro | $20-40/mo | Better DX, more integrations |
| 3 | Custom AWS/GCP infrastructure or Webflow Workspace | $50+/mo | Specific scale or design needs |

**Climb test rung 0 to 1:** Free bandwidth cap hit (extremely rare for solopreneur sites).
**Climb test rung 1 to 2:** Specific platform feature needed (Vercel edge functions, Netlify Identity).
**Climb test rung 2 to 3:** Genuine scale or specific platform lock-in needed.

### Finance and bookkeeping

| Rung | Tool | Cost | Best for |
|---|---|---|---|
| 0 | Wave Free or Google Sheet finance log | Free | Most solopreneurs under $25K MRR |
| 1 | Wave Pro Payments | Per-transaction fees | When invoicing volume justifies |
| 2 | QuickBooks Simple Start | $30/mo | When CPA insists OR multi-account complexity |
| 3 | QuickBooks Online Plus or Xero | $90+/mo | Inventory, multi-state tax, payroll |

**Climb test rung 0 to 1:** Genuinely need payment processing through invoicing tool.
**Climb test rung 1 to 2:** CPA insists OR multi-state tax complexity.
**Climb test rung 2 to 3:** Payroll required OR multi-entity accounting.

### Storage and collaboration

| Rung | Tool | Cost | Best for |
|---|---|---|---|
| 0 | Google Drive Free (15GB) | Free | Most early-stage |
| 1 | Google One 100GB | $2/mo | When 15GB cap hit |
| 2 | Google Workspace Business Starter | $6/mo | Custom domain email + 30GB |
| 3 | Microsoft 365 Business Basic | $6/mo | When Microsoft-ecosystem matters (Teams, SharePoint) |

**Climb test rung 0 to 1:** 15GB cap hit.
**Climb test rung 1 to 2:** Need custom-domain email (most coaching businesses do).
**Climb test rung 2 to 3:** Need Microsoft 365 ecosystem (rare for solopreneur).

### Analytics

| Rung | Tool | Cost | Best for |
|---|---|---|---|
| 0 | Cloudflare Web Analytics | Free | Most sites |
| 1 | Plausible Hosted | $9/mo | Better event tracking, owned data |
| 2 | Fathom or PostHog | $14-39/mo | Funnels, conversion tracking |
| 3 | Mixpanel or Amplitude | $50+/mo | Behavioral analytics at scale |

**Climb test rung 0 to 1:** Need custom events or specific funnel reports.
**Climb test rung 1 to 2:** Need conversion tracking tied to revenue.
**Climb test rung 2 to 3:** Behavioral cohorts and segmentation required.

### Design

| Rung | Tool | Cost | Best for |
|---|---|---|---|
| 0 | Canva Free + Figma Free | Free | Most solopreneur design needs |
| 1 | Canva Pro | $13/mo | Brand kit features, premium templates |
| 2 | Figma Professional | $15/mo | Real design system work |
| 3 | Hire a designer or Designjoy retainer | $500+ | Genuine brand redesign |

**Climb test rung 0 to 1:** Brand kit features needed AND will be used.
**Climb test rung 1 to 2:** Doing real design system work (rare for solopreneur).
**Climb test rung 2 to 3:** Refreshing brand for major positioning shift.

### Communications

| Rung | Tool | Cost | Best for |
|---|---|---|---|
| 0 | Google Meet Free or Zoom Free | Free | 1:1 meetings, short group calls |
| 1 | Zoom Pro | $15/mo | Long group calls, recording |
| 2 | Microsoft Teams via M365 | Included in M365 Business Basic | Already paying for M365 |
| 3 | Custom video platforms | $50+/mo | Webinar hosting at scale |

**Climb test rung 0 to 1:** 40-min cap hit on group calls regularly.
**Climb test rung 1 to 2:** Already on M365 (bundled).
**Climb test rung 2 to 3:** Hosting webinars over 100 attendees.

### Automation

| Rung | Tool | Cost | Best for |
|---|---|---|---|
| 0 | Native integrations between tools | Free | Most use cases |
| 1 | Make.com Free or Zapier Free | Free with caps | Light automation across tools |
| 2 | Make.com Core or Zapier Starter | $9-20/mo | More tasks, more automations |
| 3 | n8n self-hosted or Make.com Pro | $25+/mo or hosting cost | Heavy automation, custom logic |

**Climb test rung 0 to 1:** Native integration missing for a critical flow.
**Climb test rung 1 to 2:** Task cap hit OR need scheduled scenarios.
**Climb test rung 2 to 3:** Heavy automation justifies devops time.

## The full-stack recommendation

When the user is setting up from scratch or doing a stack audit, output the recommended boring-stack at their stage:

### Pre-Rev Builder (under $10/mo target)

```
BORING STACK - Pre-Rev Builder
═══════════════════════════════
CRM ............... Google Sheet              $0
Email ............. MailerLite Free           $0
Scheduling ........ Cal.com Free              $0
Website ........... Cloudflare Pages          $0
Domain ............ Namecheap or Porkbun     $1/mo (annualized)
Email hosting ..... Cloudflare Email Routing  $0 (forwarding only)
Finance ........... Wave Free or Sheet        $0
Storage ........... Google Drive Free         $0
Analytics ......... CF Web Analytics          $0
Design ............ Canva Free                $0
Comms ............. Google Meet Free          $0

Total ............. ~$1/mo
```

### Early Operator (under $50/mo target)

```
BORING STACK - Early Operator
═══════════════════════════════
CRM ............... HubSpot Starter           $20
Email ............. MailerLite Free           $0
Scheduling ........ Cal.com Free              $0
Website ........... Cloudflare Pages          $0
Domain ............ Annualized                $1
Email hosting ..... Google Workspace Starter  $6 or M365 Business Basic $6
Finance ........... Wave Free                 $0
Storage ........... Included in Workspace     $0
Analytics ......... CF Web Analytics          $0
Design ............ Canva Free                $0
Comms ............. Included in Workspace     $0

Total ............. ~$27/mo
```

This matches the example coaching business's actual stack ($42/mo with a small overhead).

### Stable Solo (under $150/mo target)

```
BORING STACK - Stable Solo
═══════════════════════════════
CRM ............... HubSpot Starter           $20
Email ............. MailerLite Growing        $10
Scheduling ........ Cal.com Team Essentials   $12
Website ........... Cloudflare Pages          $0
Domain ............ Annualized                $1
Email hosting ..... M365 Business Basic       $6
Finance ........... Wave Free                 $0
Storage ........... Included                  $0
Analytics ......... Plausible Hosted          $9
Design ............ Canva Pro                 $13
Comms ............. Included in M365          $0
Automation ........ Make.com Core             $9

Total ............. ~$80/mo
```

### Scaling Solo (under $300/mo target)

```
BORING STACK - Scaling Solo
═══════════════════════════════
CRM ............... HubSpot Pro               $90
Email ............. ConvertKit Creator        $25
Scheduling ........ Cal.com Team Pro          $30
Website ........... Same as before            $1
Email hosting ..... M365 Business Standard    $12
Finance ........... QuickBooks Simple Start   $30
Storage ........... Included                  $0
Analytics ......... PostHog                   $25
Design ............ Canva Pro + Figma Pro     $28
Comms ............. Included                  $0
Automation ........ Make.com Core or Pro      $9-25

Total ............. ~$250/mo
```

## Anti-patterns to refuse

### Recommending the popular tool by default

ConvertKit is popular among creators. That does not make it the right rung for an Early Operator with 50 subscribers. Recommend the rung. The brand follows from the rung.

### Climbing two rungs at once

The user goes from Google Sheet to HubSpot Pro because "we'll grow into it." Refuse. Climb one rung. Use Rung 2 for at least 60 days before considering Rung 3.

### Tool stacking instead of tool swapping

The user adds HubSpot Starter for CRM but keeps the Google Sheet "for now." Six months later, the sheet is stale and HubSpot is the source of truth, but the sheet still gets manual updates because nobody decommissioned it. Always state the decommission step explicitly.

### Recommending paid before free has been documented

If `free-first-checker` has not run, refuse to recommend Rung 1 or higher. Run the check first.

### Recommending based on "future needs"

The user's "future" needs are speculative. Recommend for current usage. The ladder makes climbing easy when the future arrives.

## Working with other skills

- Imports from: `customize-from-assessment` (stage, max_tool_spend_monthly, current stack)
- Imports from: `free-first-checker` (test logs)
- Hands off to: `risk-gauge` when a climb exceeds the user's cap
- Hands off to: `decision-logger` when a climb decision is made
- Calibrates with: `business-coach` (coach posture wraps the recommendation)

## Stage-aware adjustments

Each stage has a different default rung per function. The full-stack recommendations above show typical stage configurations. Adjust for the user's actual usage profile. The stage label is a starting hypothesis.

A Stable Solo with 50 subscribers should still be on MailerLite Free. The label is a starting hypothesis, the tool comes from the usage profile.

## Output format

When the user asks "what should I use for X," output:

```
[boring-stack] Recommendation for: <function>

CURRENT RUNG (likely): <0 / 1 / 2 / 3 based on stage>
RECOMMENDED: <tool name + tier>
COST: $<N>/mo
WHY THIS RUNG: <one line>

CLIMB TEST PASSED: <yes / no / not applicable>
  See: decisions/free-first-attempts.md for documented test

NEXT RUNG: <tool + cost>
WHEN TO CLIMB: <specific test (a break-point), do not set a date>

DECOMMISSION REQUIRED: <yes / no>
  If yes: <what to deprecate from current stack>
```

## Additional Resources

### Reference files

- **`references/full-ladder.md`** covers extended ladder with niche functions (podcast hosting, course platforms, community tools) and edge cases

### Example files

- **`examples/stack-recommendations-by-stage.md`** covers full-stack examples for each of the 4 archetypes with cost breakdown and rationale

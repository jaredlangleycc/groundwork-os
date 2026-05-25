# Stack Recommendations by Stage

Full-stack examples for each of the 4 stage archetypes. Use as starting points, then calibrate to the user's actual usage.

## Pre-Rev Builder

**Profile.** No paying customers yet. 10-15 hrs/wk. Day job intact. Family floor protected. Cap: under $20/mo total stack.

**Recommended stack:**

```
Function          Tool                          Cost
─────────────────────────────────────────────────────
CRM               Google Sheet (12-col)         $0
Email marketing   MailerLite Free               $0
Scheduling        Cal.com Free                  $0
Website           Cloudflare Pages              $0
Domain            Cloudflare Registrar          ~$1/mo annualized
Email hosting     Cloudflare Email Routing      $0 (forwarding)
Finance           Wave Free                     $0
Storage           Google Drive Free (15GB)      $0
Analytics         CF Web Analytics              $0
Design            Canva Free                    $0
Comms             Google Meet Free              $0

TOTAL                                          ~$1/mo
```

**Rationale.**
- No subscriptions until the first customer pays. Every $20/mo subscription at pre-revenue is 5% of the median first month of revenue.
- Custom-domain email via forwarding is good enough until clients start paying. Then climb to Workspace Starter ($6/mo) to send-from custom domain.
- Wave Free covers invoicing + accounting through the first 50 transactions.
- The Google Sheet CRM forces the user to actually contact people instead of perfecting tooling.

**Climb triggers (when to leave this stage):**
- First paid client = climb to Workspace Starter for send-from custom domain
- 100+ active contacts = consider HubSpot Free
- Newsletter list at 500+ = double down on MailerLite Free (still on free tier)

---

## Early Operator (under $5K MRR)

**Profile.** First paying customers. $1K-5K MRR. 12-18 hrs/wk. Day job still intact. Cap: under $50/mo.

**Real example: the example coaching business at $5K MRR transitioning to Stable Solo, 2026-05-22.**

```
Function          Tool                          Cost
─────────────────────────────────────────────────────
CRM               HubSpot Starter               $20
Email marketing   MailerLite Free               $0
Scheduling        Cal.com Free                  $0
Website           Cloudflare Pages              $0
Domain            Cloudflare Registrar          ~$1/mo
Email hosting     M365 Business Basic           $6
Finance           Wave Free                     $0
Storage           Google Drive (paid Workspace) $0 (bundled)
Analytics         CF Web Analytics              $0
Design            Canva Free                    $0
Comms             Teams via M365                $0
Other             Cloudflare Pages env vars     $0

TOTAL                                          ~$27/mo
                  (actual Langley: $42/mo)
```

**Rationale.**
- HubSpot Starter unlocked 2 pipelines + Marketing automations + Service Keys for the Cloudflare Worker dual-write. Climbed from HubSpot Free after specific break (Cal webhook needed CRM auto-write).
- M365 Business Basic chosen over Google Workspace because of Teams integration with Cal.com bookings and Outlook calendar for client comms.
- MailerLite Free retained at 8 subscribers, no climb needed.
- Cal.com Free retained until a second event type becomes essential (flagship onboarding + ongoing-client check-ins).

**Climb triggers:**
- 1,000+ MailerLite subscribers = MailerLite Growing ($10/mo)
- 2+ Cal event types essential = Cal.com Team Essentials ($12/mo)
- $5K MRR threshold = consider Stable Solo stack below

---

## Stable Solo ($5K-$25K MRR)

**Profile.** Predictable revenue. $5K-$25K MRR. 15-25 hrs/wk. Day job optional or recently dropped. Cap: under $150/mo.

**Recommended stack:**

```
Function          Tool                          Cost
─────────────────────────────────────────────────────
CRM               HubSpot Starter or Sales Pro  $20-50
Email marketing   MailerLite Growing            $10
Scheduling        Cal.com Team Essentials       $12
Website           Cloudflare Pages              $0
Domain            Cloudflare Registrar          $1
Email hosting     M365 Business Basic           $6
Finance           Wave Free                     $0
Storage           Bundled in M365               $0
Analytics         Plausible Hosted              $9
Design            Canva Pro                     $13
Comms             Teams via M365                $0
Automation        Make.com Core                 $9

TOTAL                                          ~$80/mo
```

**Rationale.**
- HubSpot Starter still adequate for most Stable Solo. Climb to Sales Pro only if revenue-attribution dashboards are core to weekly review.
- MailerLite Growing at $10/mo unlocks more automations and supports up to 1,500 subs cheaply.
- Cal.com Team Essentials needed for 2-3 event types (intro / clarity / strategy or onboarding / check-in / strategy).
- Plausible Hosted at $9/mo when CF Web Analytics no longer answers questions about conversion funnels.
- Canva Pro at $13/mo if brand kit features actually get used.
- Make.com Core at $9/mo when native integrations leave 1-2 important flows uncovered.

**Climb triggers:**
- $25K MRR = consider Scaling Solo stack below
- Multi-user team = consider HubSpot Pro for multi-seat
- 10,000+ subscribers = MailerLite Advanced or ConvertKit Creator

---

## Scaling Solo ($25K+ MRR)

**Profile.** Mature business. $25K+ MRR. 25-35 hrs/wk. Day job dropped. Cap: under $300/mo.

**Recommended stack:**

```
Function          Tool                          Cost
─────────────────────────────────────────────────────
CRM               HubSpot Pro                   $90
Email marketing   ConvertKit Creator            $25
Scheduling        Cal.com Team Pro              $30
Website           Cloudflare Pages              $0
Domain            Cloudflare Registrar          $1
Email hosting     M365 Business Standard        $12
Finance           QuickBooks Simple Start       $30
Storage           Bundled in M365               $0
Analytics         PostHog Free or Cloud         $25
Design            Canva Pro + Figma Pro         $28
Comms             Teams via M365                $0
Automation        Make.com Core                 $9

TOTAL                                          ~$250/mo
```

**Rationale.**
- HubSpot Pro for advanced workflows + revenue attribution dashboards.
- ConvertKit Creator at $25/mo for behavioral automations (tag-triggered sequences, advanced segmentation).
- Cal.com Team Pro for routing forms and success redirects.
- QuickBooks Simple Start at $30/mo when CPA insists or multi-state tax complexity arrives.
- PostHog at $25/mo for funnel analysis tied to revenue. Microsoft Clarity Free can also work here.
- Figma Pro alongside Canva Pro when the user is producing brand assets at scale.

**Climb triggers (above this is enterprise territory):**
- $50K+ MRR with hires = consider HubSpot Marketing Hub Pro
- Multi-channel customer support = Help Scout or Zendesk
- Multi-product offering = pricing and bundling tool

---

## Stack audit example

When the user runs `/customize-from-assessment` or wants a stack review, output:

```
STACK AUDIT
═══════════

Current stack as reported:
  CRM: HubSpot Starter                    $20/mo
  Email: MailerLite Free                  $0
  Scheduling: Cal.com Free                $0
  Website: Cloudflare Pages               $0
  Email hosting: M365 Business Basic      $6/mo
  Finance: Wave Free                      $0
  Storage: Google Drive Free              $0
  Analytics: CF Web Analytics             $0
  Design: Canva Free                      $0
  Comms: Teams via M365                   $0
  Other: Cloudflare Pages env vars        $0

Total: $26/mo (reported $42/mo, $16/mo unaccounted)

Stage: Early Operator
Target cap: under $50/mo
Status: WITHIN CAP

Flagged for review:
  - $16/mo unaccounted - identify and decide

Climbs ready (free path documented broken):
  - None at this time

Decommissions recommended:
  - None at this time
```

This is honest, readable, and actionable. No filler.

## Anti-pattern: ladder ignored

When the user wants the popular tool and refuses the boring tool:

User: "I want ConvertKit, not MailerLite."

Response: "What does ConvertKit do that MailerLite Free does not, at your current usage? List the specific feature."

If the user can name a real feature need: log it, climb to MailerLite Growing or ConvertKit Creator, pick the cheaper of the two.

If the user cannot name a real feature: log the override, allow the user to climb anyway, note that the boring-stack ladder was bypassed. The user owns the call.

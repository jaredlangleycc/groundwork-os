---
date: 2026-05-18
slug: climb-crm-hubspot-starter
type: climb
status: active
revisit_date: 2026-06-18
related_decisions: document-google-sheet-crm-attempt
related_skills: free-first-checker, boring-stack, risk-gauge
---

# Climb CRM from Google Sheet to HubSpot Starter

## Decision

Climb the CRM tool from Google Sheet (free) to HubSpot Starter ($20/mo). Retain HubSpot Free CRM for contact storage. Upgrade to Starter for 2 pipelines (Organic Funnel + Accelerator Funnel) and Marketing automations + Service Keys for Cloudflare Worker dual-write.

Effective date: May 18, 2026. First billing: May 18, 2026. Annual cost: $240/yr (no annual prepay discount taken).

## Context

Google Sheet CRM ran from April 26 to May 18, 2026 (22 days). Tracked 67 contacts manually. Logged 12 Cal bookings by manually transcribing webhook notification emails into the sheet.

Manual write after each Cal booking consumed approximately 15 minutes per day. At $100/hr opportunity cost, this is approximately $375/mo of effective cost on a "free" tool.

Apps Script automation attempted twice to handle the Cal webhook writes. Both attempts broke within 48 hours due to service-account token refresh issues.

Cal webhook auto-write to CRM is the specific need that justified the climb.

## Alternatives considered

- **Option A: Stay on Google Sheet, accept 15 min/day manual write.** Rejected. The cost compounds, the writes slip, and stage updates lag reality by 2-3 days.

- **Option B: Climb to HubSpot Free CRM (still $0).** Considered. HubSpot Free has CRM but no Marketing automations and no Service Keys. The Cal webhook can write to HubSpot Free, but follow-up emails and pipeline routing automations are gated.

- **Option C: Climb to HubSpot Marketing Hub Professional at $XXX/mo.** Rejected. 40x over cap. Features needed are below Pro tier.

- **Option D (chosen): Climb to HubSpot Starter at $20/mo.** Unlocks 2 pipelines (Organic + Accelerator), Marketing automations, Service Keys for the Cloudflare Worker dual-write. Below the next-tier features I do not need (Sales Hub Pro at $90/mo, Marketing Hub Pro at $XXX/mo).

## Expected outcome

By 30 days (June 18):
- Cal webhook auto-writes to HubSpot Starter, eliminating the 15 min/day manual cost
- Both pipelines (Organic + Accelerator) actively used with stage routing per Cal event slug
- Marketing automations firing for at least one trigger (lead-gen assessment leads to nurture sequence)
- Service Key created and Cloudflare Worker successfully writing to HubSpot

By 60 days (July 18):
- Confidence that HubSpot Starter is the right rung (no need to climb to Pro)
- Google Sheet retained only for Gemini canvas visualization downstream
- Manual write time reduced to under 30 min/wk total

By 90 days (August 18):
- HubSpot is unambiguously the source of truth for contacts and deals
- Decision: continue, climb, or descend

## Kill signal

**Primary:** If at 30 days the paid features (2 pipelines, Service Keys, automations) have not been used in at least 3 distinct ways each, downgrade to HubSpot Free or switch.

**Secondary:** If the manual write time does not drop below 30 min/wk by 60 days, the climb did not solve the original problem. Reassess.

## Reasoning

The free path was tested for 22 days. The specific break point was named clearly: manual writes after Cal bookings = 15 min/day = ~$375/mo effective cost. Apps Script automation attempts failed at the auth-refresh layer twice, surfacing that the free path's "automation" is not reliable enough.

free-first-checker logged the free-path attempt with a clear break point. boring-stack recommended Rung 2 (HubSpot Starter at $20/mo) as the lowest rung that fixes the specific break (Cal webhook auto-write + Service Key).

risk-gauge ran: 1x over max_tool_spend_monthly ($50 cap, $20/mo new spend). Within cap. Free-path tried. Worst-case touch: no (well under rent-equivalent). Family-floor: protected (climb removes daily 15-min write task).

Quote from session: "Manual writes after Cal bookings consumed ~15 min/day. Stage updates slipped 2-3 days behind reality. Hot-lead notification emails required cross-referencing two tools."

## What I am avoiding

I am not avoiding anything material on this decision. The climb is honest, the break point is real, the rung is the lowest that fixes the break. This is the kind of decision the boring-stack ladder was built for.

One small note: I am retaining the Google Sheet for Gemini canvas viz, which means I have 2 tools doing overlapping work for 30-60 days while I migrate. I will commit to fully decommissioning the Google Sheet as a contact source by July 18 if HubSpot proves out.

## Revisit checklist

When this decision is revisited on 2026-06-18, check:

- [ ] Are both pipelines being used actively (deals moving through stages)?
- [ ] Did the Cal webhook auto-write replace manual writes?
- [ ] Is at least one Marketing automation firing reliably?
- [ ] Was the Service Key created and is the Cloudflare Worker writing?
- [ ] What's the actual time savings vs. the projected $375/mo?
- [ ] Was the climb worth $20/mo? (yes = continue, no = downgrade)
- [ ] Is the Google Sheet still needed for viz, or fully decommissionable?

## Tags

#climb #stack #crm #hubspot #boring-stack

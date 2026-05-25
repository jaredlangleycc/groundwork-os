# Decision Types

Taxonomy of decision types. Each type has typical revisit windows and required fields. Use to populate the `type` field consistently across logged decisions.

## Type: hire

**Definition.** Anyone the user pays for time (contractor, VA, agency, employee).

**Required fields beyond default:**
- Weekly defined output
- Management time expected
- Trial period or contract length
- Decommission plan (what happens if it does not work)

**Revisit windows.**
- 30 days: initial fit check
- 60 days: output-vs-expectation check
- 90 days: continue/end decision

**Common kill signals.**
- "If 30 days in, the defined weekly output has not been delivered consistently, end contract"
- "If management time exceeds 4 hrs/wk for the first month, renegotiate or end"
- "If the work product requires more QC time than the work it saved, end"

## Type: spend

**Definition.** Recurring subscription, one-time purchase over $500, or paid advertising budget.

**Required fields beyond default:**
- Monthly or one-time cost
- Cap context (relation to max_tool_spend_monthly)
- Function this serves
- Cheaper alternative considered

**Revisit windows.**
- 30 days: usage check (is the paid feature being used)
- 60 days: value check (was this worth it)
- 90 days: continue/downgrade/cancel decision

**Common kill signals.**
- "If at 30 days the paid feature has been used less than 4 times, downgrade or cancel"
- "If at 90 days no measurable revenue or saved-time benefit, cancel"

## Type: offer

**Definition.** Launching a new offer, retiring an existing offer, repositioning an offer, productizing a service.

**Required fields beyond default:**
- ICP for the new offer
- Pricing structure
- Delivery commitment
- Expected impact on existing offers

**Revisit windows.**
- 30 days: launch check (did anyone buy)
- 60 days: signal check (is demand repeatable)
- 90 days: scale/refine/retire decision

**Common kill signals.**
- "If 30 days post-launch zero qualified inquiries, pause"
- "If 90 days no sales, retire and revisit positioning"
- "If existing offer pipeline drops more than 25%, the new offer is cannibalizing, pause"

## Type: pricing

**Definition.** Raising or lowering prices, changing pricing structure (one-time leads to subscription, hourly leads to project), introducing a payment plan.

**Required fields beyond default:**
- Old pricing
- New pricing
- Effective date
- Grandfather policy for existing customers
- Sites and assets updated

**Revisit windows.**
- 30 days: immediate signal (did the close rate drop)
- 60 days: pipeline adjustment (is the new pricing producing the new ICP)
- 90 days: revenue impact assessment

**Common kill signals.**
- "If 30 days close rate drops more than 50%, the price is wrong, revisit"
- "If 90 days revenue is below the pre-change baseline, reverse"

## Type: channel

**Definition.** Launching a new marketing or sales channel (cold email, paid ads, podcast, newsletter, new platform).

**Required fields beyond default:**
- Channel name and platform
- Cadence commitment
- Resource requirement (hours/wk)
- Specific metric to track

**Revisit windows.**
- 30 days: kill signal check
- 90 days: scale decision

**Common kill signals.**
- "If 30 days post-launch the leading indicator (signups, replies, downloads) has not crossed N, pause"
- "If cadence commitment slips for 2 consecutive weeks, recalibrate or end"

## Type: quit

**Definition.** Quitting the day job, ending a major contract, pulling out of a partnership, retiring an offer.

**Required fields beyond default:**
- Timing
- Financial bridge plan
- Healthcare/benefits handling (if quitting day job)
- Communication plan (what to tell whom)
- Reversibility (can this be undone if needed)

**Revisit windows.**
- 30 days post-transition: settling check
- 90 days: financial reality check
- 180 days: identity check
- 365 days: was this right

**Common kill signals.**
- Quit decisions rarely have kill signals because they are often one-way. The revisit is honesty about whether the call was right, not whether to reverse.

## Type: climb

**Definition.** Moving from a free or lower-tier tool to a paid or higher-tier tool. Specific to the boring-stack ladder.

**Required fields beyond default:**
- Tool function
- Old rung (current setup)
- New rung (chosen climb)
- Specific break point that justified the climb (from free-first-checker log)
- Decommission of old tool

**Revisit windows.**
- 30 days: was the climb worth it
- 90 days: should I downgrade

**Common kill signals.**
- "If at 30 days the paid feature is not being used, downgrade"
- "If at 90 days the cheaper rung would have worked, switch"

## Type: other

**Definition.** Decisions that do not fit the above types. Use sparingly. Most "other" decisions can be retyped after thought.

**Required fields.** Default fields only.

**Revisit window.** User-set.

## Cross-type rules

### Compound decisions

A single decision sometimes spans multiple types. "Hire a sales-enablement agency for $X,XXX/mo" is both a `hire` and a `spend`. Pick the dominant type (the larger commitment), and use the `related_decisions` field to link.

### Decision chains

Some decisions exist to enable other decisions. "Climb to HubSpot Starter" enabled "Launch HubSpot Phase 4 worker." The first is a `climb`, the second is `other` or `channel` depending on framing. Use `related_decisions` to link the chain.

### Decisions about decisions

Sometimes the user decides "I will not decide X yet." That meta-decision is also worth logging. Use `type: other` and note the trigger that will activate the deferred decision. Example: "Defer decision about second offer until business hits $10K MRR x 3 months. Revisit when trigger fires."

## Tag conventions

Use these tags consistently for cross-referencing:

- `#offer` - any offer-related decision
- `#stack` - tool stack changes
- `#hire` - any hiring decision
- `#pricing` - pricing changes
- `#channel-<name>` - per channel (cold-email, linkedin, paid-ads)
- `#family-floor` - decisions that touch protected time
- `#risk-gauge` - decisions that triggered risk-gauge
- `#hard-call` - decisions that went through hard-call session
- `#challenge` - decisions that went through challenge / pre-mortem
- `#climb` - tool ladder climbs
- `#descent` - tool ladder descents (downgrade or switch)

Multiple tags per decision are fine. The tag index is built dynamically from log files.

## How to use this taxonomy

When logging a decision:

1. Pick the dominant type from the list above
2. Apply the type-specific required fields
3. Set revisit window based on type defaults (override if specific reason)
4. Add tags for cross-reference
5. Link related decisions via `related_decisions` field

When surfacing past decisions:

1. Search by type first (similar decisions in the same category)
2. Search by tags second (similar patterns across types)
3. Surface the 1-3 most relevant past decisions, not the full list

The taxonomy keeps the log searchable across months. Without it, the log becomes a pile.

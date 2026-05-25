# Stale Subscription Detection Rules

The stale-sub scan finds tools the user is still paying for but no longer using. Solopreneurs add tools faster than they remove them. The scan inverts that drift.

## What counts as stale

A subscription is stale if it meets one or more of these conditions.

### Condition 1: Replaced by another tool

The CSV has both subscriptions in the recurring set, and the user has flagged one as the active replacement.

Detection signal: look at the `note` field of the newer subscription. If it mentions "replaces [vendor name]" OR the user's CLAUDE.md Stack section lists only one of the two, flag the displaced one.

Example:

```
2026-05-02, expense, software, Cal.com, 0.00, USD, replaces Calendly, monthly,subscription
2026-05-22, expense, software, Calendly, 10.00, USD, paid annual, monthly,subscription
```

Flag: Calendly is paid but replaced.

### Condition 2: No usage signal in 30+ days

The user has not invoked the tool in 30 days. Usage signals (in priority order):

1. **CRM activity.** If the tool is in `Stack` as a CRM and the CRM has no new contacts/deals in 30 days, the CRM is at-risk (unless the user is in delivery mode with no new sales).
2. **Email send history.** If the tool is an ESP (MailerLite, ConvertKit), check sent-campaign count last 30 days. Zero sends = stale.
3. **File / asset references.** If the tool is design (Canva, Figma) or scheduling (Buffer, Typefully), check file modification timestamps in the user's working directory in last 30 days.
4. **Calendar mentions.** If the tool is a meeting or call tool (Loom, Riverside), check calendar for "Loom" or "Riverside" in event titles last 30 days.
5. **Login signal.** If the MCP for the tool exists, check last login (most MCPs do not expose this; skip if unavailable).

If no usage signal, flag.

### Condition 3: Functional duplicate

Two tools cover the same functional category and the user has not consciously chosen both. Look for duplicates in:

- Two ESPs (MailerLite + ConvertKit)
- Two CRMs (HubSpot + Notion CRM)
- Two schedulers (Cal.com + Calendly)
- Two project tools (Notion + Asana)
- Two document tools (Notion + Google Docs as primary writing)
- Two storage (Dropbox + Google Drive)

For each duplicate pair, flag the less-recently-used. Use Condition 2's usage signals.

### Condition 4: Free tier with no upgrade trigger

If a subscription is at $0/mo (free tier), it does not count as kill-candidate. It is noise. Skip in the kill-candidate list.

Exception: if the free tier sets up a paywall the user keeps hitting, flag as a different category (`upgrade-or-replace`), not as a kill candidate.

### Condition 5: Annual renewal in next 30 days

If a subscription is tagged `annual` and the renewal date (date + 365 days from last log) is within 30 days, flag it as a renewal decision moment. Include in the kill-candidate list with a "renewal decision" sub-tag.

### Condition 6: Discount-trap subscription

Annual prepays that locked in a discount at signup but never delivered renewal-tier value. Detection signal: tag `discount-trap` in notes (user marks these manually when reviewing).

## What does NOT count as stale

- Subscriptions actively used inside the last 30 days, even at low frequency
- Subscriptions the user has tagged `keep-anyway` in the note field
- Subscriptions where the cost is under $5/mo unless they appear in functional-duplicate pairs (small subs add up via category drift, not direct cost)
- Subscriptions that are dependencies of a tool the user is actively using (e.g., Stripe is required for Cal.com paid plan; do not flag Stripe as standalone)

## The flag output format

For each kill candidate, output one line:

```
- <Vendor> ($N/mo): <one-line rationale>. <Action>.
```

Examples:

```
- Calendly ($10/mo): replaced by Cal.com on 2026-05-02. Active in finance log
  but unused. Kill or cancel and save $120/yr.

- Loom Pro ($8/mo): last recorded use was 47 days ago. Free tier covers
  current need. Downgrade or kill.

- Notion ($10/mo): replaced by file system + memory tools. Kill or downgrade.

- ConvertKit ($29/mo): annual renewal in 18 days. Decision moment. Review
  campaigns shipped in last 90 days before renewal.
```

End with total potential annual savings:

```
Total kill candidates: $696/yr if all cancelled.
```

If zero candidates: "No stale subscriptions detected." Do not pad.

## Edge cases

### Tool downgraded but still in recurring set

User cancelled paid tier and dropped to free, but forgot to delete the CSV row. Flag for cleanup, not kill:

```
- Buffer ($0/mo, was $15): moved to free tier 2026-03-10. CSV row still
  tagged $15/mo. Update CSV to $0 or remove the row.
```

### Tool used but rarely (quarterly cadence)

User uses the tool 4 times a year (e.g., quarterly newsletter ESP). The 30-day rule would false-flag. Add the tag `quarterly-use` to the note. Stale scan respects this and uses 90-day usage window.

### Tool used for one specific delivery

User pays for a tool only during active client engagements. No usage in 30 days but a new engagement starts next month. User tags `engagement-dependent`. Stale scan checks pipeline for upcoming engagements and skips if any are within 30 days.

### Tool is the user's CRM and they are mid-delivery

The user is in heads-down delivery mode with no new sales. CRM activity is low because they are not selling. Do not flag the CRM as stale; surface a different question: "CRM activity low. Are you in delivery mode? When does sales mode resume?"

### Tool is a backup, not a primary

User uses Tool A primarily and Tool B as backup or for one specific use-case. Tag Tool B with `backup` in notes. Stale scan does not flag backups unless usage is zero for 90 days.

## Cross-reference with risk archetype

When the kill-candidate total is large relative to the user's monthly stack cap, the question changes.

### Bootstrap-Strict with $336/yr kill candidate

```
$336/yr is $28/mo. That is 56% of your stated $50/mo cap. The cap is
not the problem. The drift is the problem. Cancel two before this
finance check ends.
```

### Aggressive with $336/yr kill candidate

```
$336/yr is rounding error against your stack. The question is not the
money. The question is whether the tools you are paying for are creating
the leverage you said you wanted, or sitting in the recurring set as
operational comfort.
```

## How often the scan runs

- Once per month (last Friday of month, full scan)
- Once per quarter (deeper scan including 90-day window)
- On-demand when user runs `/finance-log` explicitly

Not weekly. The scan creates work (decisions, cancellations). Running it weekly creates decision fatigue, not better decisions.

## What the scan does NOT do

- Does not auto-cancel any subscription. Cancellation requires user action and is logged via `decision-logger`.
- Does not navigate vendor billing pages for the user.
- Does not predict which subscriptions might become useful again. The scan is about current state.
- Does not assign blame for buying a tool that did not work out. The scan is about deciding what to do now.

## The kill workflow

When the user picks a subscription to kill, the workflow:

1. User says: "Kill Calendly."
2. Skill confirms: "Calendly $10/mo, annual savings $120. Confirm?"
3. User confirms.
4. Skill writes a decision-logger entry (`decisions/YYYY-MM-DD-kill-calendly.md`).
5. Skill instructs the user: "Cancel in Calendly admin → Settings → Subscription. Log the cancellation date in finance-log.csv as a one-line note when complete."
6. Skill does NOT navigate to Calendly for the user. The user owns the cancellation.

This workflow preserves user agency (only user can cancel) and creates a logged record (decision + finance-log update) of the kill.

# Conversion Event Spec

Which events to track per stage. Where to write each event. What counts as a conversion. Use as the source of truth when wiring conversion tracking.

## The principle

Conversion tracking serves one purpose: tell the user which marketing produced which outcome. Without it, every channel feels equally valuable and the user can't prioritize.

For solopreneurs, 3 to 5 conversion events tracked well > 20 events tracked badly.

## The hierarchy of events

Pick events from the hierarchy. Higher in the list = more valuable to track.

### Tier 1: Revenue events (always track if applicable)

- **Purchase completed** (offer paid)
- **Subscription started**
- **Renewal completed**
- **Upsell purchased**

These are the dollar-attached events.

### Tier 2: Booking events

- **Free coaching session booked**
- **Strategy call booked**
- **Discovery call booked**
- **Sales call booked**

High-intent. The booking is one step from a sale.

### Tier 3: Lead magnet events

- **Email signup (newsletter)**
- **Lead magnet downloaded** (lead-gen assessment completed, ebook downloaded, scorecard taken)
- **Webinar registered**

Mid-intent. The signup is several steps from a sale.

### Tier 4: Engagement events (skip at solopreneur stage)

- **Page scrolled 75%**
- **Video played 50%**
- **CTA hovered**
- **Tab focused for 30s**

These are vanity at solopreneur scale. Skip unless Scaling Solo with specific funnel diagnosis.

## Stage-aware tracking

| Stage | Events to track |
|---|---|
| Pre-Rev Builder | Email signup only |
| Early Operator | Email signup + lead magnet completion + booking |
| Stable Solo | All Tier 1 + 2 + 3 events |
| Scaling Solo | All above + select Tier 4 events |

## Per-event implementation spec

### Email signup

**When it fires:** Form submission on the newsletter signup form (or lead magnet form that's effectively newsletter signup).

**Where to write:**
- MailerLite (subscriber added with custom fields)
- HubSpot (Contact created with lifecycle_stage=lead)
- Google Sheet (row added for backup attribution)
- Cloudflare Web Analytics (logged via Pages Function as page visit + form submit)

**Custom fields to include:**
- email (the subscriber)
- first_name (if collected)
- All 10 attribution fields (utm_*, gclid, fbclid, referrer_url, landing_page, first_touch_at)
- Source page (which page the form was on)

**Pixel events (if paid is running):**
- Meta: `fbq('track', 'Lead')`
- LinkedIn: `lintrk('track', { conversion_id: <LEAD_CONVERSION_ID> })`
- Google: `gtag('event', 'sign_up')`

**Implementation (Langley pattern):**

```javascript
// In _worker.js
async function handleFormSubmit(request, env) {
  const formData = await request.formData();

  // Build payload
  const email = formData.get('email');
  const customFields = extractAttributionFields(formData);

  // Write to MailerLite
  await fetch('https://connect.mailerlite.com/api/subscribers', {
    method: 'POST',
    headers: { 'Authorization': `Bearer ${env.MAILERLITE_API_KEY}` },
    body: JSON.stringify({ email, fields: customFields, groups: [LEAD_GROUP_ID] })
  });

  // Write to HubSpot
  await fetch('https://api.hubapi.com/crm/v3/objects/contacts', {
    method: 'POST',
    headers: { 'Authorization': `Bearer ${env.HUBSPOT_ACCESS_TOKEN}` },
    body: JSON.stringify({ properties: { email, ...customFields, lifecyclestage: 'lead' } })
  });

  // Optional: write to Sheet for backup
  // Optional: send notification email

  return new Response(JSON.stringify({ ok: true }), { status: 200 });
}
```

### Lead magnet completion (lead-gen assessment, scorecard, assessment)

**When it fires:** Form completion at the end of the lead magnet flow (NOT every page view).

**Where to write:** Same as Email signup PLUS:
- MailerLite: tag subscriber with lead_magnet_type (e.g. `vibe_check_completed`)
- HubSpot: deal NOT created at this stage (deal is created on Tier 2 events)
- Subscriber's MailerLite group: lead-gen assessment subscribers (specific group, not just newsletter)

**Pixel events:**
- Meta: `fbq('track', 'Lead')` (same event ID as email signup OR custom event)
- LinkedIn: `lintrk('track', { conversion_id: <LEAD_CONVERSION_ID> })`

**Customization:**
For the lead-gen assessment specifically, also save:
- lead-gen assessment score (numeric)
- Archetype name (categorical)
- Quietest pillar (categorical)

These flow to MailerLite custom fields for nurture sequence personalization.

### Booking event

**When it fires:** Cal.com webhook on BOOKING_CREATED OR confirmation page load with Cal.com booking ID.

**Where to write:**
- HubSpot: deal CREATED at stage `intro_booked` or `clarity_booked` or `strategy_booked` (per Cal.com event type slug)
- MailerLite: subscriber added to "Booked Calls" group
- Google Sheet: row added for backup
- Cloudflare Web Analytics: confirmation page view logged

**Pixel events:**
- Meta: `fbq('track', 'Schedule')` OR custom event "Booking"
- LinkedIn: `lintrk('track', { conversion_id: <BOOKING_CONVERSION_ID> })`

**Webhook implementation (Cal.com pattern):**

```javascript
// In _worker.js, route: /api/cal-booking
async function handleCalWebhook(request, env) {
  // Verify HMAC signature
  const signature = request.headers.get('x-cal-signature-256');
  // ... verify against CAL_WEBHOOK_SECRET

  const payload = await request.json();
  const { triggerEvent, payload: bookingData } = payload;

  if (triggerEvent === 'BOOKING_CREATED') {
    const slug = bookingData.eventType.slug;
    const attendeeEmail = bookingData.attendees[0].email;

    // Per-slug routing to HubSpot stage
    const stageMap = {
      'user-interview': 'interview_booked',
      'clarity-session': 'clarity_booked',
      'strategy-session': 'strategy_booked',
      'intro-call': 'discovery_booked'
    };
    const stage = stageMap[slug] || 'booked';

    // Create HubSpot deal in correct pipeline
    await hubspotCreateDeal({
      contact_email: attendeeEmail,
      pipeline_id: stage.startsWith('discovery') ? ORGANIC_PIPELINE_ID : ACCELERATOR_PIPELINE_ID,
      dealstage: stage,
      cal_booking_uid: bookingData.uid
    });

    // Add to MailerLite Booked Calls group
    await mailerLiteAddToGroup(attendeeEmail, BOOKED_CALLS_GROUP_ID);

    // Send notification email to hello@ via Resend
    await sendNotification({ to: 'hello@jaredlangley.cc', subject: `New booking: ${slug}`, body: ... });
  }

  // Handle MEETING_ENDED → advance stage to *_held
  // Handle CANCELLED → set stage to 'lost'
  // Handle RESCHEDULED → update meeting_at

  return new Response(JSON.stringify({ ok: true }), { status: 200 });
}
```

### Purchase event

**When it fires:** Payment confirmation (Stripe, ThriveCart, etc. webhook OR confirmation page).

**Where to write:**
- HubSpot: deal advanced to `proposal_sent` then `closed_won` (with amount + close date)
- MailerLite: subscriber tagged with `customer=true`, added to "Customers" group, removed from "Leads" group
- Google Sheet: row added with revenue + product + date
- Customer onboarding sequence (separate skill `email-sequence` > Customer onboarding)

**Pixel events:**
- Meta: `fbq('track', 'Purchase', { value: <amount>, currency: 'USD' })`
- LinkedIn: `lintrk('track', { conversion_id: <PURCHASE_CONVERSION_ID> })`
- Google: `gtag('event', 'purchase', { value: <amount>, currency: 'USD', transaction_id: <id> })`

### Subscription renewal (recurring offer)

**When it fires:** Renewal payment confirmation (Stripe webhook on `invoice.paid`).

**Where to write:**
- HubSpot: deal created for renewal amount, or LTV updated on existing contact
- MailerLite: subscription_status field updated

### Cancellation / churn

**When it fires:** Subscription cancelled OR customer requested refund.

**Where to write:**
- HubSpot: deal stage set to `closed_lost` with loss reason
- MailerLite: customer tag removed, optional: added to "Past Customers" group for win-back

## Cross-event identity matching

The hard part: matching the email signup at week 1 to the booking at week 4 to the purchase at week 12.

### How it works

- All events keyed by email address
- HubSpot consolidates by email (creates contact on first event, advances on subsequent events)
- MailerLite consolidates by email (single subscriber record updated)
- First_touch_at on the contact survives all subsequent events (set on contact creation, never overwritten)
- Last_touch_at on the contact updates with each event (overwritten)

This gives true first-touch attribution: the email signup's utm_source becomes the canonical "first touch" for that contact forever. Subsequent bookings and purchases are attributed to that first touch.

## Conversion event mistakes

### Tracking pageviews as conversions

Wrong. Pageviews are engagement, not conversions. Only count signups, bookings, purchases.

### Counting the same event twice

If the user submits the form twice (refresh or accidental double-submit), HubSpot should dedupe by email. MailerLite handles this natively. Test for double-counts in your worker.

### Forgetting to write attribution

If the worker creates the contact but doesn't pass the UTM custom fields, attribution data is lost. Always include the 10 attribution fields on every conversion event write.

### Setting up events but never reading the data

Most common failure. Pair every event with a "where I'll see this" plan:

- Email signup → MailerLite reports + HubSpot contacts created this week
- Booking → HubSpot deals dashboard
- Purchase → HubSpot revenue dashboard + accounting

If there's no "where I'll see this," skip the event.

## Stage-aware deferral

### What to defer

| Event | Stage to defer until |
|---|---|
| Page-scroll percentage | Scaling Solo |
| Video-play percentage | Scaling Solo |
| Time-on-page | Scaling Solo |
| Multi-step funnel tracking | Stable Solo+ |
| Cross-device tracking | Scaling Solo |
| Behavioral segmentation | Scaling Solo |

### Why

Each event = code that runs, data to interpret, a potential bug. Solopreneurs benefit from fewer, higher-signal events.

## Test plan for any conversion event

Before declaring an event "live":

1. **Submit a test event manually.** Fill the form, submit, watch the event flow.
2. **Verify in each downstream tool.** MailerLite has the subscriber. HubSpot has the contact. Sheet has the row. Notification email arrived.
3. **Verify attribution.** The utm_source, utm_campaign fields populated correctly.
4. **Verify the email notification works.** Hot-lead alert hits the user's inbox within 60 seconds.
5. **Verify the test event was cleaned up.** Delete the test contact from all downstream tools (avoid polluting metrics, per Langley memory `feedback_no-prod-smoke-test-leftovers.md`).

Document the test in CLAUDE.md or the project memory.

## When to add a new conversion event

Trigger:

- The user asks a question the current events can't answer
- A new funnel stage emerges (e.g. webinar added, requires "webinar registered")
- A new product / offer launches

Don't add events because they "might be useful." Add them because they answer a specific question.

## Event-to-channel attribution

Per the SKILL.md > monthly attribution review:

1. Pull last 30 days of each event type
2. Group by utm_source
3. Compute conversion rates per source

Example (Langley):

| Source | Email signups | Bookings | Bookings/signups |
|---|---|---|---|
| linkedin | 28 | 5 | 18% |
| threads | 12 | 0 | 0% |
| direct | 18 | 3 | 17% |
| meta (cpc) | 14 | 1 | 7% |
| referral | 4 | 2 | 50% |

Insight: Threads drives signups but no bookings. Referrals drive few but high-converting. Adjust accordingly.

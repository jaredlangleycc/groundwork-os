# CRM Adapter Rules

How the skill adapts to the user's specific CRM. Field mapping, query patterns, write patterns.

## Adapter selection

Read CLAUDE.md > Stack > CRM. Match the tool name to one of the adapters below.

### HubSpot (Free, Starter, Pro)

Use the HubSpot MCP if connected. Tool functions used:

- `search_objects` for contacts and deals
- `get_properties` to confirm property availability
- `manage_crm_objects` for updates (with explicit user confirmation per object)
- `search_owners` for ownership clarity (Stable Solo and later)

Pipeline-aware queries: if the user has multiple pipelines (e.g., organic + accelerator), query each separately and aggregate.

### Google Sheets

Use the Google Sheets MCP if connected. If not connected, ask the user for the sheet URL and either:

- Open the sheet via Drive MCP and read range, OR
- Ask user to export current view as CSV.

Expected column names (canonical, case-insensitive match):

```
contact_id, name, email, company, role, source, first_touch_at,
last_touch_at, stage, owner, next_action, next_action_date,
deal_value, notes, lost_reason
```

If the user's sheet has different column names, ask once at first run, write the mapping to CLAUDE.md > Stack > CRM > field_mapping, and use the mapping on subsequent runs.

### Notion

Use the Notion MCP if connected. Database query via the database ID stored in CLAUDE.md > Stack > CRM > notion_db_id.

Field types in Notion are typed (text, select, date, number). Map check rules to Notion property types:

- `last_touch_at` → Notion Date property
- `stage` → Notion Select property
- `deal_value` → Notion Number property
- `next_action` → Notion Text property

If a check requires a property that does not exist in the user's Notion database, prompt: "Property `lost_reason` not found. Add to database before this check runs."

### Manual fallback

If no CRM is connected or available:

```
Skill: "Drop your top 20 active prospects in this format, one per line:
name | email | stage | last_touch_date | next_action

I'll run the hygiene on what you share. Manual mode skips dedup
and field-drift checks (need write access for those)."
```

Run Checks 1, 2, 4 (with finance-log only), and 5 on manual data.

## Field-name mapping rules

CRMs use different conventions for the same concept. Build a canonical map and respect the user's CRM names underneath.

### Canonical → HubSpot

```
last_touch_at         → hs_lastmodifieddate (default) OR notes_last_contacted
next_action           → next_step (HubSpot Pro+) OR notes_next_activity
next_action_date      → notes_next_activity_date
stage                 → dealstage (deal object) OR lifecyclestage (contact object)
deal_value            → amount
source                → original_traffic_source OR hs_analytics_source
lost_reason           → closed_lost_reason (custom property, must be created)
owner                 → hubspot_owner_id
```

### Canonical → Google Sheets

Use the column names as-is. If the user has non-canonical names, prompt once and write mapping to CLAUDE.md.

### Canonical → Notion

```
last_touch_at         → "Last Touch" date property
next_action           → "Next Action" text property
next_action_date      → "Next Action Date" date property
stage                 → "Stage" select property
deal_value            → "Value" number property
source                → "Source" select property
lost_reason           → "Lost Reason" select property
owner                 → "Owner" people property
```

If the user has different property names, document the mapping at first run.

## Query patterns by CRM

### HubSpot: stale deals query

```
search_objects(
  object_type="deals",
  filters=[
    {"property": "hs_lastmodifieddate", "op": "older_than", "days": 14},
    {"property": "dealstage", "op": "not_in", "values": [<terminal stage IDs>]}
  ],
  properties=["dealname", "dealstage", "amount", "hs_lastmodifieddate", "pipeline"],
  limit=50
)
```

### HubSpot: duplicate detection

HubSpot duplicates require a two-step approach:

1. Pull all contacts created in the last 90 days.
2. Compare by lowercase email; flag any group with >1 contact.
3. Compare names within the group for nickname variants.

### Google Sheets: stale deals query

Read the entire sheet. Filter rows where:

- `stage` is not in terminal list
- `last_touch_at` parses as date and is older than 14 days

If `last_touch_at` is empty, flag separately as "no last-touch logged" (a dirty-data condition).

### Notion: stale deals query

```
database.query(
  filter={
    "and": [
      {"property": "Last Touch", "date": {"before": "<14-days-ago ISO>"}},
      {"property": "Stage", "select": {"does_not_equal": "Won"}},
      {"property": "Stage", "select": {"does_not_equal": "Lost"}}
    ]
  },
  page_size=50
)
```

## Write patterns by CRM

All writes require explicit user confirmation per object. No bulk auto-writes.

### HubSpot: update deal stage

```
manage_crm_objects(
  object_type="deals",
  object_id="<deal_id>",
  action="update",
  properties={"dealstage": "<new stage ID>"}
)
```

### HubSpot: merge contacts

HubSpot has a native merge API. Use it via the MCP if available. If not, prompt the user to merge in the HubSpot UI and confirm completion.

### Google Sheets: update row

Use Google Sheets MCP to write to specific cell ranges. Match by `contact_id` column. If `contact_id` is missing, use `email` as the match key.

### Notion: update page

Update Notion page properties via the Notion MCP. Match by page ID stored in the `contact_id` field (Notion page IDs are persistent and queryable).

## Read-only vs read-write modes

Some users might want to run hygiene in read-only mode to see the report without granting write access.

Default mode: read-write (with confirmation per write).

Read-only mode: set in CLAUDE.md > Skills > crm-hygiene > mode = "read-only". Skill outputs the report and lists fixes the user can apply manually in their CRM UI.

## Cross-CRM consistency checks

If the user has multiple CRMs (a Google Sheet for one funnel and HubSpot for another), run checks per CRM separately. Surface drift between them:

```
CROSS-CRM DRIFT
  Google Sheet shows: 4 contacts in "customer" stage
  HubSpot shows: 5 contacts in "customer" lifecycle

  Off-by-one. The contact in HubSpot but not in Sheet: Taylor Foster.
  Action: confirm Taylor's status in your finance-log, then sync Sheet to match.
```

## Adapter for non-CRMs (Airtable, Coda, others)

For tools not in the canonical list:

1. Ask the user: "Your CRM is [X]. The skill has not been tested against [X]. Two options:"
   - Export the current state to CSV and run hygiene on the CSV.
   - Map field names to canonical schema and write the mapping to CLAUDE.md so future runs use it.
2. Document the mapping in `references/crm-adapter-rules.md` (this file) so subsequent users do not have to re-discover.

## Schema discovery on first run

The first time the skill runs against a CRM, it should:

1. Pull a small sample (10 records) to see what fields exist.
2. Match fields to canonical schema.
3. Surface any unmappable fields ("Your CRM has a field `pipeline_color`. The skill does not use this field. Confirm okay to ignore.").
4. Write the resolved schema to CLAUDE.md > Stack > CRM > resolved_schema.
5. Subsequent runs use the resolved schema directly.

This avoids re-discovery on every run and lets the user customize the mapping once.

## Skill writes back to CLAUDE.md

The skill writes to CLAUDE.md only for:

- First-run schema mapping (Stack > CRM > field_mapping)
- Disabled-checks list (Skills > crm-hygiene > disabled_checks)
- Custom thresholds (Skills > crm-hygiene > stale_threshold_days)

Never writes business data (contacts, deals) to CLAUDE.md. The CRM is the source.

# Worked Example: File Sweep Log

A real-shaped sweep log for Week 21 of an Early Operator user (the example coaching business pattern). Friday May 23, 2026, end of day.

File written to: `reports/file-sweep-2026-W21.md`

```markdown
# File Sweep: Week 21 (2026-05-23)

## Inbox sorted

- moved: `2026-05-22-confidence-affirmation.md` → `content/voice-memos/`
- moved: `crm-export-2026-05-21.csv` → `business-setup-playbook/prospect-lists/2026-05-21/`
- moved: `IG-discernment-carousel-final.png` → `content/graphics/inbox/`
- moved: `draft-trust-the-process-v2.md` → `drafts/`
- moved: `example-prospect-prep-form.pdf` → `client-experience/example-prospect/`
- moved: `bobbie-os-cowork-v1.zip` → `langley-site/private/` (matched private slug rule)
- moved: `signed-contract-flagship.pdf` → `client-experience/signed-contracts/example-client/`
- ambiguous (left in inbox): `notes-from-tuesday.md` (no date prefix, no draft prefix, no project tag)
- empty inbox: no

## Stale drafts flagged

- `drafts/landing-pages/for-new-sales-managers-preview.html`
  Last modified: 4 days ago. Within threshold, included for context.

- `drafts/social/2026-W21-backfill-2026-05-20.md`
  Last modified: 3 days ago. Within threshold, but 2 slots still unshipped (slot 11, slot 6 IG).
  Suggested action: ship slot 11 Friday or move to next week.

- `drafts/follow-ups/2026-05-09/`
  Folder last modified: 14 days ago.
  Suggested action: send the 3 follow-ups inside, or move to `archive/deprecated-content/`.

- `drafts/leadership-stories/2026-W21/`
  Folder last modified: 16 days ago.
  Suggested action: pick 1 to ship Sunday, archive the other 3.

## Backups rotated

- rotated: `backups/2026-05-04/` → `archive/backups/cold-archive-2026-W18.tar.gz` (12 MB)
- rotated: `backups/2026-05-05/` → bundled into `cold-archive-2026-W18.tar.gz`
- rotated: `backups/2026-05-08/` → bundled into `cold-archive-2026-W18.tar.gz`

Verification: tarball exists, size 12 MB, `tar -tzf` returned 0. Original hot folders deleted.

## Loose root files surfaced

- `notes-from-tuesday.md` (also in inbox, see above)
- `Screen Shot 2026-05-22 at 11.47.43.png` (at working directory root, not in inbox)
  Suggested: `inbox/screenshots/` for next sweep sort.

## Cloud sync (SharePoint)

- uploaded: `client-experience/example-prospect-battle-card-2026-05-22.html`
  → `Documents/clients/example-prospect/05-resources/`
- uploaded: `client-experience/signed-contracts/example-client/flagship-signed.pdf`
  → `Documents/clients/example-client/01-intake/`

## Project hub health

- projects/site/             last touched 1 day ago.  active.
- projects/content/          last touched 2 days ago. active.
- projects/outbound/         last touched 5 days ago. active.
- projects/client-delivery/  last touched 1 day ago.  active.

## Sweep summary

- Inbox files sorted: 7
- Ambiguous (left in inbox): 1 (`notes-from-tuesday.md`)
- Stale drafts flagged: 4 (2 within window for context, 2 over threshold)
- Backups rotated: 3 daily folders into 1 weekly tarball (W18)
- Loose root files surfaced: 2
- Cloud uploads: 2
- Project hubs healthy: 4 of 4

## Closing question

`drafts/leadership-stories/2026-W21/` has 4 drafts and 16 days of no movement.
Pick 1 to ship Sunday in the newsletter spine. Archive the other 3. Do not
let the leadership stories archive of unshipped become a graveyard.
```

## What this log models

### Specificity over summary

Every moved file has a name and a target. Future-Jared scrolling back through sweep logs can reconstruct the working state of week 21 from this log.

### Ambiguous files preserved, not lost

`notes-from-tuesday.md` did not match a routing rule. The skill left it in inbox and surfaced it. Sweep logs over time will show "notes-from-tuesday.md still in inbox" and the skill will eventually surface as a pattern.

### Backup rotation reports the grouping decision

The log notes that 3 daily folders bundled into 1 weekly tarball. Future-Jared knows what is inside `cold-archive-2026-W18.tar.gz` without unpacking.

### Stale drafts include "within threshold" context

The skill shows both fresh-but-incomplete drafts and over-threshold drafts. The over-threshold ones are the action items; the fresh-but-incomplete ones are context for the closing question.

### Closing question ties to the largest pattern

The 4 unshipped leadership stories are the most actionable pattern in this sweep. The closing question targets that one pattern instead of recapping the whole log.

## Alternate output: light week

If the user had a slow week (1 file in inbox, 1 stale draft, no backup rotation needed):

```markdown
# File Sweep: Week 22 (2026-05-30)

## Inbox sorted

- moved: `daily-brief-2026-05-30.md` → `reports/`
- empty inbox: yes (only the 1 file)

## Stale drafts flagged

None over threshold.

## Backups rotated

None due this week (last rotation was 7 days ago, next due in 7 days).

## Loose root files surfaced

None.

## Cloud sync (SharePoint)

Nothing in deferred upload lane.

## Project hub health

- projects/site/             last touched 3 days ago. active.
- projects/content/          last touched 4 days ago. active.
- projects/outbound/         last touched 1 day ago.  active.
- projects/client-delivery/  last touched 3 days ago. active.

## Sweep summary

- Inbox files sorted: 1
- Stale drafts: 0
- Backups rotated: 0
- Loose root files: 0
- Cloud uploads: 0
- Project hubs healthy: 4 of 4

## Closing question

Quiet week on files. Was the work consolidated or paused?
```

The log stays short. The skill does not pad a slow week with fake activity.

## Alternate output: backed-up week

If the user has not run a sweep in 3 weeks and inbox has 47 files:

```markdown
# File Sweep: Week 23 (2026-06-06)

NOTE: Last sweep was 21 days ago. This is a catch-up sweep. Batching where
possible.

## Inbox sorted

(47 files in inbox; 38 auto-routed by rule, 9 surfaced as ambiguous)

Batched moves:
- 12 voice memos → `content/voice-memos/`
- 7 CSV CRM exports → `business-setup-playbook/prospect-lists/<dates>/`
- 6 PNGs (graphics) → `content/graphics/inbox/`
- 5 markdown drafts → `drafts/`
- 4 PDFs (signed contracts) → `client-experience/signed-contracts/<clients>/`
- 4 reports → `reports/`

Ambiguous (left in inbox, full list):
- `notes-from-tuesday.md`
- `random-thoughts.md`
- `idea-list.md`
- `2026-05-30-thing.md`
- `screenshot.png`
- `IMG_5544.heic`
- `IMG_5545.heic`
- `IMG_5546.heic`
- `download.csv`

Action: pick targets for the 9 ambiguous before next sweep.

## Backups rotated

3 weeks of daily backups (≈21 folders) into 3 weekly tarballs:
- `cold-archive-2026-W20.tar.gz` (38 MB)
- `cold-archive-2026-W21.tar.gz` (52 MB)
- `cold-archive-2026-W22.tar.gz` (47 MB)

## Stale drafts flagged

(8 drafts over 14-day threshold; listing top 5)

- `drafts/social/2026-W19-backfill.md`: 28 days
- `drafts/social/2026-W20-spine.md`: 21 days
- `drafts/follow-ups/2026-05-09/`: 28 days
- `drafts/leadership-stories/2026-W19/`: 28 days
- `drafts/leadership-stories/2026-W20/`: 21 days
- (+ 3 more)

Pattern: leadership stories and social drafts are aging without ship.
The skill suggests: pick 2 to ship this week, archive the rest.

## Closing question

3 weeks without a sweep means the weekly file rhythm broke. What got in
the way, and what is the floor that the broken rhythm crossed?
```

The skill handles the backed-up state by batching, summarizing, and asking a direct question about the broken cadence.

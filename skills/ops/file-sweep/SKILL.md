---
name: file-sweep
description: This skill should be used when the user asks for a "file sweep", "friday sweep", "clean up files", "organize my files", "inbox sort", "rotate backups", or "what's stale in my folders". Runs the weekly file management routine: sorts the 00-inbox/ folder, flags stale drafts (>14 days), rotates hot backups (>14 days) into cold archive, detects loose files at project root, writes a log to reports/file-sweep-YYYY-WW.md. Cross-platform (Mac/Linux). Active for every NightShiftOS user from week 2.
version: 0.1.0
---

# File Sweep

The weekly file management ritual. Sorts the inbox. Rotates the backups. Flags stale drafts. Closes the loose-file gap. Writes a log.

Solopreneurs without a Friday file routine spend Monday hunting for things they touched on Wednesday. File-sweep is the friction that keeps the working directory shaped for next week. Last week's shape goes to archive.

## When this skill triggers

- `/file-sweep`
- `/friday-sweep`
- "Clean up files"
- "Organize my files"
- "Inbox sort"
- "Rotate backups"
- "What's stale in my drafts"
- Inside `ship-it-friday` as Step 2
- Optional: scheduled task on the user's cron, default Friday 5pm local

## The folder model

The skill operates against a folder structure that `customize-from-assessment` set up. Default structure:

```
<working-directory>/
  00-inbox/                  ← new files land here, sorted weekly
  backups/                   ← hot backups, rolling 14 days
    YYYY-MM-DD/
  archive/                   ← cold archive, kept 6 months then deletable
    backups/
      cold-archive-YYYY-MM-DD.tar.gz
    deprecated-content/
  content/                   ← active content, drafts and shipped
  drafts/                    ← work-in-progress drafts
  reports/                   ← skill output logs
  client-experience/         ← client-facing assets and ops
  business-setup-playbook/   ← ops + course foundation
```

If the user's folder model differs, read CLAUDE.md > File Storage > folder_map for their canonical structure.

## The six sweep tasks

Run all six in order. Each writes a section in the log.

### Task 1: Inbox sort

List every file in `00-inbox/`. For each file:

1. Determine the target folder by file pattern (extension + name).
2. Move to the target folder.
3. Log the move (from → to).

Default routing rules:

```
*.md (draft prefix)         → drafts/
*.md (final, no prefix)     → content/
*.html (private slug)       → langley-site/private/ (project-specific)
*.html (other)              → drafts/landing-pages/
*.csv (CRM export)          → business-setup-playbook/prospect-lists/YYYY-MM-DD/
*.csv (finance row export)  → business-setup-playbook/
*.png|*.jpg|*.heic (asset)  → brand-assets/inbox/ or content/graphics/inbox/
*.pdf (signed contract)     → client-experience/signed-contracts/
*.pdf (other)               → drafts/ or archive/deprecated-docs/
*.zip (backup)              → backups/<today>/
*.m4a|*.wav|*.mp3 (voice)   → content/voice-memos/raw/
*.mov|*.mp4 (video)         → content/video/raw/
```

If a file does not match any rule, surface to the user with three options:

1. Suggested target folder based on filename heuristic.
2. New folder name suggestion.
3. Leave in inbox for next sweep.

Do NOT auto-move files that do not match a rule. Ambiguous files become misfiled files become lost files.

### Task 2: Stale draft flag

Scan `drafts/` for files where the modification timestamp is older than 14 days.

For each stale draft, output:

```
- drafts/social/2026-W21-backfill-2026-05-20.md
  Last modified: 14 days ago. Filename suggests social spine for W21 (May 18-24).
  Suggested action: ship, archive, or discard.
```

Group by subfolder for readability. Cap output at top 10 stales; if more, summarize ("+ 12 more stales").

The skill does NOT auto-archive stales. The user decides.

### Task 3: Backup rotation

Scan `backups/` for date-named subfolders older than 14 days.

For each old backup folder:

1. Tar + gzip into `archive/backups/cold-archive-YYYY-MM-DD.tar.gz` (named for the rotation date).
2. Verify the tarball is non-zero bytes.
3. Delete the original hot backup folder.
4. Log: "Rotated YYYY-MM-DD → archive/backups/cold-archive-YYYY-MM-DD.tar.gz (N bytes)."

Group multiple same-week old backups into a single tarball when possible to reduce archive sprawl:

```
cold-archive-2026-W19.tar.gz   # contains: 2026-05-04, 2026-05-05, 2026-05-08 backups
```

Cold archive retention: 6 months. After 6 months, output a one-line flag at the next sweep: "Cold archive `cold-archive-2025-11-W47.tar.gz` is 6+ months old. Safe to delete." User runs the delete; the skill does not auto-delete archive.

### Task 4: Loose-root-file detection

Scan the project root (working directory) for files that should not be at root.

Allowed root files:

```
CLAUDE.md
README.md (if present)
.gitignore (if present)
.claude/ (folder)
```

Anything else at root is loose. For each loose file:

1. Suggest a target folder based on file type.
2. Surface to user for confirmation before move.

Loose root files are the single biggest source of "where did I put that" later. Surface them every sweep.

### Task 5: SharePoint / cloud upload sync (if configured)

If the user has cloud storage configured in CLAUDE.md > File Storage > cloud_target (e.g., SharePoint, Google Drive specific folder, Dropbox), check the deferred upload lane.

Default deferred upload lane: `00-inbox/_sharepoint-upload/` (or similar).

For each file in the deferred lane:

1. Upload to the configured cloud target using the appropriate MCP.
2. Verify upload via response status.
3. Move the local file to `archive/uploaded-to-cloud/YYYY-MM-DD/`.

If no cloud target is configured, skip Task 5 silently.

### Task 6: Project hub sweep (if multi-project structure)

If the user has multiple project hubs (e.g., `projects/site/`, `projects/content/`, etc.), do a one-line health check per project:

```
PROJECT HUB HEALTH
  projects/site/         last touched 2 days ago.  active.
  projects/content/      last touched 8 days ago.  active.
  projects/outbound/     last touched 31 days ago. STALE: flag.
  projects/client-delivery/ last touched 1 day ago. active.
```

Surface stale projects (>30 days untouched) but do not auto-archive. Some projects legitimately go dormant for a quarter and return.

## The sweep log

After all six tasks, write a single log file to `reports/file-sweep-YYYY-WW.md` (ISO week number).

Log structure:

```markdown
# File Sweep: Week WW (YYYY-MM-DD)

## Inbox sorted

- moved: <file> → <target>
- moved: <file> → <target>
- ambiguous (left in inbox): <file>
- empty inbox: yes/no

## Stale drafts flagged

- <relative path>: last modified <days> days ago
- ...

## Backups rotated

- rotated: <date folder> → <archive tarball> (<bytes>)
- ...

## Loose root files surfaced

- <file>: suggested → <target>
- ...

## Cloud sync (if configured)

- uploaded: <file> → <cloud path>
- ...

## Project hub health

- projects/site/         <last touched>
- projects/content/      <last touched>

## Sweep summary

- Inbox files sorted: N
- Stale drafts: N
- Backups rotated: N
- Loose files surfaced: N
- Cloud uploads: N

## Closing question

<one open question tied to the largest pattern surfaced>
```

The log is the historical record. Sweeping the inbox without logging produces motion without memory.

## Cross-platform compatibility

The skill runs on Mac (Darwin) and Linux. Path handling:

- Use absolute paths via the working directory root. Avoid `~` shorthand because it breaks across shells.
- Use `os.path.join` patterns (or Python `pathlib`) rather than hardcoded slashes.
- Avoid Mac-specific tools (e.g., `mdfind`, `pbcopy`) in the default flow. If a Mac-specific tool is the right call, gate behind a platform check.

For Tar + Gzip rotation, use platform-native `tar -czf` (works on both). Avoid Apple's compression utilities (`hdiutil`, `aa`) which do not portably round-trip.

## Stage-aware adjustments

### Pre-Rev Builder

Few files, lower volume. Sweep weekly is overkill; surface this to the user:

```
PRE-REV NOTE
  Inbox has 2 files this week. Drafts folder has 4 files, all touched in
  last 7 days. The sweep is light at this stage. Consider biweekly cadence
  until volume grows.
```

### Early Operator

Most common stage for file-sweep adoption. Volume is real but manageable. Run the full sweep weekly.

### Stable Solo

Higher volume, more file types, more contractor-shared folders. Add a sub-check for permissions drift if the user uses shared folders:

```
PERMISSIONS DRIFT
  - shared/clients/example-client/: 1 file shared with sarah@vendor.com
    granted 67 days ago. Re-confirm access still needed.
```

### Scaling Solo

Volume is high enough that auto-rules cover 95%+ of moves. Surface only the ambiguous 5%. Adjust default routing rules to match the user's repeatedly-confirmed patterns.

## Anti-patterns to refuse

### Auto-moving ambiguous files

If a file does not match a routing rule, surface to the user. Auto-guessing creates the lost-file class of bug.

### Auto-deleting anything

The skill never deletes files. Backup rotation moves to cold archive (still on disk). Cold-archive cleanup is user-initiated. Stale drafts get flagged. The user decides what to delete.

### Hiding loose-root files

If a loose file at root has been there for 4 weeks running, surface it every sweep. Some files belong at root despite looking loose; user confirms with "keep at root" tag.

### Sweeping more than weekly

Daily sweeps create churn for no benefit. The 7-day window is the cadence; faster sweeps move files before the user has finished using them.

### Skipping the log

Sweeping without a log entry means the skill cannot detect patterns ("inbox grew 3 weeks running"). Always write the log, even if all six tasks return zero.

### Treating SharePoint/cloud as "real" storage

The cloud target is a destination. The local working directory is the source of truth. If a cloud upload fails, the local file stays in place; the skill does not delete local copies on cloud upload failure.

## Working with other skills

- **`ship-it-friday`**: calls file-sweep as Step 2 of the Friday close-out.
- **`finance-log`**: on last Friday of month, file-sweep checks for new finance-log CSV exports in the inbox and routes to `business-setup-playbook/`.
- **`crm-hygiene`**: if a CRM export ZIP lands in inbox, file-sweep routes to `business-setup-playbook/prospect-lists/YYYY-MM-DD/` so crm-hygiene can pick it up.
- **`weekly-brief`**: references the latest sweep log for "what shipped" context.
- **`decision-logger`**: if the user kills a draft (Task 2), the kill is logged as a decision.
- **`family-floor`**: sweep runs in a 30-90 minute block typically; ensure the block is not inside protected time.

## Cold-archive cleanup

Cold archive tarballs older than 6 months get flagged at sweep time. Cleanup workflow:

1. Skill lists archive tarballs older than 6 months.
2. User picks: delete-all, individual-review, or skip.
3. If delete-all, skill confirms once ("Delete N tarballs totaling N MB?"), then deletes.
4. Logs deletions in the sweep log.

If the user has CLAUDE.md > File Storage > archive_retention_months set to a different value (e.g., 12), use that.

## Multi-project sweeps

If the user has multiple project hubs and runs `/file-sweep --project=content`, scope the sweep to that one project. Default is whole-working-directory sweep.

Scoped sweep tasks:

- Inbox sort: only the project's `inbox/`
- Stale drafts: only the project's `drafts/`
- Backups: only the project's `backups/`
- Loose-root: only the project's root (not the working-directory root)

## What file-sweep does NOT do

- Does not auto-delete any file.
- Does not modify file contents.
- Does not rename files (except gzip extension on tarball creation).
- Does not write to cloud storage without verification.
- Does not assume which folder schema is right. Reads from CLAUDE.md or user.
- Does not run during family floor time (the skill respects the conflict surface from family-floor).

## Optional: scheduled task

Some users want file-sweep to run automatically. Default is on-demand, but the skill can be configured to run on cron.

User opt-in via CLAUDE.md > Skills > file-sweep > schedule = "Friday 17:00 local".

When scheduled:

1. Skill runs at the scheduled time.
2. If any task requires user input (ambiguous file in inbox), the skill writes a pending-decisions section to the log and waits for the user to clear it on next interactive session.
3. If no decisions are needed, the skill completes the sweep and writes the log.

Scheduled mode is more friction for users with lots of ambiguous files, less friction for users with high regularity.

## Output format

### Default explicit call

Run all six tasks, write the log, print a short summary to the user:

```
FILE SWEEP: Week 21 (2026-05-23)
  Inbox sorted: 7 files
  Stale drafts flagged: 4
  Backups rotated: 3 days → archive
  Loose root files: 1 (auto-suggested)
  Project hub health: 4 hubs, 1 stale (outbound)

Log written: reports/file-sweep-2026-W21.md

THE QUESTION
  projects/outbound/ has not been touched in 31 days. Pause project
  or restart the prospect-list workflow this week?
```

### Light call (from ship-it-friday)

Same execution, condensed summary, no closing question (ship-it-friday handles the closing question for the whole ritual):

```
[file-sweep] Sorted 7, rotated 3, flagged 4 stales. Log: reports/file-sweep-2026-W21.md
```

## Why this skill exists

Solopreneurs do not lose work to bad backups. They lose work to bad sorting. The Monday version of "where did I put that brand brief" is the same brain trying to remember what Friday-evening you was thinking. File-sweep makes Friday-evening you write down the answer.

Three classes of bug the skill prevents:

1. **The lost-file bug.** A file lands in `00-inbox/` on Wednesday, gets used once, and slides off the inbox view by Tuesday. Without a sweep, the file is alive but invisible.

2. **The drift bug.** Two versions of the same file exist in two folders. The user edits one, ships from the other. The ship is stale. This is the bug that motivates File Safety Rule in CLAUDE.md.

3. **The cold-archive corruption bug.** Hot backups pile up unbounded. Disk fills. The user runs out of space mid-edit. By the time they notice, recovery is harder than it should have been.

The sweep ritual takes 15 to 45 minutes weekly. The cost of NOT sweeping for a quarter is closer to 4 hours of recovery time plus the cost of any work lost to the drift bug.

## Working with calendar cadence

File-sweep runs Friday by default because that is when ship-it-friday calls it. Users who prefer a different cadence (Sunday evening, Monday morning) can set the schedule in CLAUDE.md > Skills > file-sweep > schedule.

Some users want a quick mid-week sweep (Tuesday or Wednesday). The skill supports `/file-sweep --light` which runs only Task 1 (inbox sort) and Task 4 (loose-root-file detection). The other tasks defer to the next full sweep.

Light sweeps do not produce a separate log; the activity rolls into the next full sweep's log under a "Mid-week additions" section.

## Additional Resources

### Reference files

- **`references/folder-routing-rules.md`**: full routing rules table for file type + naming pattern → target folder, with examples and edge cases
- **`references/backup-rotation-recipe.md`**: exact `tar -czf` + verification + delete recipe, cross-platform considerations, recovery instructions when a tarball goes corrupt

### Example files

- **`examples/file-sweep-log-example.md`**: worked example of a `reports/file-sweep-YYYY-WW.md` log for a busy Early Operator week

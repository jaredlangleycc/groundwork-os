# Backup Rotation Recipe

How file-sweep moves hot backups into cold archive. Reliable, cross-platform, reversible.

## The model

Hot zone: `backups/YYYY-MM-DD/`: last 14 days of daily or per-edit backups.
Cold zone: `archive/backups/cold-archive-<key>.tar.gz`: older than 14 days, compressed.
Glacier zone: deletable after 6 months, never auto-deleted.

## The rotation step (per old hot folder)

For each `backups/YYYY-MM-DD/` folder older than 14 days:

1. Compute the cold-archive key (default: `cold-archive-YYYY-MM-DD` for daily, or `cold-archive-YYYY-WW` if grouping by week).
2. Tar + gzip the hot folder into the cold archive path.
3. Verify the tarball: size > 0 bytes AND `tar -tzf <archive> > /dev/null` returns 0.
4. Only after verification: remove the original hot folder.
5. Log the rotation.

## The tar command (cross-platform)

```
tar -czf "archive/backups/cold-archive-2026-W19.tar.gz" \
  --directory "backups" \
  "2026-05-04" "2026-05-05" "2026-05-08"
```

Notes:

- `-c` create, `-z` gzip, `-f` file.
- `--directory` (or `-C`) changes to the parent so the tarball does not embed the full absolute path. This makes restore-to-different-location possible.
- On macOS, the system `tar` is BSD tar but supports `-czf` and `-C` identically.
- On Linux (most distros), GNU tar is default; same flags work.
- Do not use `--xattrs` or `--posix` unless the user explicitly needs metadata preservation. Default behavior is sufficient.

## The verify command

```
tar -tzf "archive/backups/cold-archive-2026-W19.tar.gz" > /dev/null
echo $?  # 0 = valid tarball, non-zero = corrupt
```

If verify fails, the skill does NOT delete the hot folder. It logs the failure and surfaces to the user.

## Grouping rotations by week

When 3+ hot folders are within the same ISO week and all older than 14 days, group them into one weekly tarball to reduce archive sprawl.

Decision tree:

- 1 folder old → individual rotation, `cold-archive-YYYY-MM-DD.tar.gz`
- 2 folders old in same week → individual rotations OR one weekly bundle (skill picks based on average size)
- 3+ folders old in same week → one weekly bundle, `cold-archive-YYYY-WW.tar.gz`

The skill prefers fewer larger archives over many small ones for retrieval efficiency.

## Restore-from-archive flow

If the user needs to restore from cold archive:

1. Locate the tarball: `archive/backups/cold-archive-<key>.tar.gz`.
2. Extract to a temporary directory:
   ```
   mkdir -p /tmp/restore-2026-W19
   tar -xzf "archive/backups/cold-archive-2026-W19.tar.gz" -C /tmp/restore-2026-W19
   ```
3. Inspect contents.
4. Copy needed files to the working directory.
5. Do NOT extract directly to `backups/`: that pollutes the hot zone.

The skill does not auto-restore. Restore is user-driven.

## Corruption recovery

If a tarball corrupts (verify fails), recovery options:

### Option 1: GNU tar `--ignore-zeros`

```
tar -xzf "archive/backups/cold-archive-2026-W19.tar.gz" --ignore-zeros -C /tmp/restore
```

Recovers what is recoverable, skips corrupt blocks. Works on GNU tar; BSD tar (macOS) does not have `--ignore-zeros`.

### Option 2: gunzip + tar

```
gunzip -c "archive/backups/cold-archive-2026-W19.tar.gz" > /tmp/restore.tar
tar -xf /tmp/restore.tar -C /tmp/restore
```

Separates gzip step from tar step. If gzip is the corruption point, this might still extract partial.

### Option 3: Google Drive / cloud version history

If the local working directory is synced (Google Drive, Dropbox), the cloud's version history is the emergency fallback. The skill flags this when verifying a corrupt tarball: "Tarball corrupt. Check Google Drive Manage Versions for the source folder."

## Glacier-zone (6+ months) cleanup

At each weekly sweep, scan `archive/backups/` for tarballs with names older than 6 months from today.

For each old tarball:

1. Surface to user with size and date.
2. Default action: keep (do not auto-delete).
3. Offer batch delete option: "Delete all 14 tarballs older than 6 months? Total: 287 MB."

The user opts in to deletion. Do not auto-delete.

If the user wants 6-month deletion automated, they can set CLAUDE.md > Skills > file-sweep > auto_delete_glacier = true. Even then, log all deletions in the sweep log.

## Compression effectiveness

For text-heavy projects (HTML, MD, CSV), gzip compresses 5-10x. For image-heavy projects (PNG, HEIC), compression is minimal (already compressed).

If the skill detects an archive that did NOT compress well (final size > 90% of input size), log a one-time note: "Archive 2026-W19 compressed to 95% of input. Largely images. Consider separate image-bucket archive."

This does not block the rotation. It signals only.

## Backup folder hygiene

The hot zone should look like:

```
backups/
  2026-05-09/   ← within 14 days, kept
  2026-05-15/   ← within 14 days, kept
  2026-05-20/   ← within 14 days, kept
  2026-05-22/   ← today's, kept
```

Anything older than 14 days should not be in the hot zone after a sweep. If it is, the sweep failed or was skipped.

Surface on next sweep: "Backups older than 14 days still in hot zone (last sweep was N weeks ago). Rotating now."

## Backup folder naming conventions

The skill expects daily folders named `YYYY-MM-DD/`.

Tolerated variants:

- `YYYY-MM-DD-<reason>/` (e.g., `2026-05-22-pre-redesign/`): kept as-is; the reason is preserved in the cold archive filename.
- `YYYY-MM-DD-HHMM/` (per-edit timestamping): rotated into daily bundles for cold archive.

NOT tolerated:

- `backup-final-v2/` (no date): surface to user, ask for date.
- `Tuesday Backup/` (no ISO date): surface to user, ask for date.

The ISO date is the only way to compute age automatically.

## Edge case: backup currently being written

If a backup folder has a file modified in the last 60 seconds, skip rotation this sweep. Some backup workflow is still active. Re-check next sweep.

This prevents tarring a partial backup mid-write.

## Edge case: very large hot backup

If a hot folder is >500 MB, the skill surfaces before rotating:

```
- 2026-05-09/ is 487 MB. Large for a daily backup. Rotate to cold or
  investigate why this day's backup ballooned?
```

User decides.

## What backup rotation does NOT do

- Does not re-compress already-compressed cold archives.
- Does not deduplicate across cold archives.
- Does not encrypt cold archives by default. (Users can opt in via CLAUDE.md > Skills > file-sweep > encrypt_archives = true + a key path.)
- Does not push archives to a remote backup target. The cold zone is local; remote backup is a separate skill.
- Does not auto-delete cold archives older than 6 months unless explicitly opted in.

## Recovery testing

Once per quarter, the skill suggests a recovery test:

```
RECOVERY TEST DUE (last test: 92 days ago)

Pick a recent cold archive. Extract to /tmp. Confirm contents match
expectation. This is the only way to know your backups work
when you need them.

Want to run the test now?
```

The test is the only way to know the rotation is producing real archives, not corrupt ghosts.

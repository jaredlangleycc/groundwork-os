# Folder Routing Rules

How files in `00-inbox/` get moved to their target folder during the weekly sweep. Pattern matches by extension first, then by filename hints.

## Match order

For each file in inbox:

1. Check filename for explicit project tag (e.g., `[outbound]`, `[content]`, `[site]`).
2. If tagged, route to the project hub root.
3. Otherwise, check filename pattern (next sections).
4. Otherwise, surface to user as ambiguous.

## Markdown (.md)

### Draft prefix pattern

Files starting with `draft-`, `WIP-`, `wip-`, or `_` route to `drafts/`.

Example:
- `draft-trust-the-process.md` → `drafts/`
- `WIP-newsletter-essay-3.md` → `drafts/`

### Date-prefix essay pattern

Files matching `YYYY-MM-DD-<slug>.md` route to `content/voice-memos/` if the body starts with a voice-memo header, otherwise to `content/`.

Example:
- `2026-05-22-confidence-affirmation.md` → `content/voice-memos/`
- `2026-05-22-essay-grounding.md` → `content/`

### Report pattern

Files starting with `file-sweep-`, `weekly-brief-`, `daily-brief-`, `hygiene-`, `finance-check-` route to `reports/`.

Example:
- `file-sweep-2026-W21.md` → `reports/`
- `daily-brief-2026-05-22.md` → `reports/`

### Decision pattern

Files matching `decisions/YYYY-MM-DD-<slug>.md` shape route to `decisions/`. If they land in inbox, move to `decisions/`.

### Default markdown fallback

If no pattern matches, surface to user with three suggested targets:

- `drafts/` (if you are still working on it)
- `content/` (if it's done)
- `notes/` (if it's reference, not content)

## HTML (.html)

### Private slug pattern

Files matching `[a-f0-9]{8}.html` (8-char hex slug) route to `langley-site/private/` (or the project's private folder).

Example:
- `3bcf1311.html` → `langley-site/private/`

### Public page pattern

Files matching common page names (`index.html`, `about.html`, `contact.html`, `privacy.html`, `<topic>.html`) route to `langley-site/` (or the project's public folder).

### Landing page draft pattern

Files matching `*-preview.html`, `for-*-landing.html`, `*-lp.html` route to `drafts/landing-pages/`.

### Email template pattern

Files in `<topic>-email.html` shape route to `drafts/emails/`.

### Default HTML fallback

Surface to user.

## CSV (.csv)

### CRM export pattern

Files matching `crm-export-*.csv`, `hubspot-export-*.csv`, `contacts-*.csv` route to `business-setup-playbook/prospect-lists/YYYY-MM-DD/`.

### Finance row export pattern

Files matching `finance-*.csv`, `transactions-*.csv`, `bank-export-*.csv` route to `business-setup-playbook/`. If the user has a date-folder convention, append the date.

### Generic CSV

Surface to user with suggested targets based on first column header.

## Images (.png, .jpg, .jpeg, .heic, .gif, .svg, .webp)

### Brand asset pattern

Files in `brand-*.png`, `logo-*.png`, `og-*.png`, `favicon-*.ico` shape route to `brand-assets/inbox/`.

### Content graphic pattern

Files in `IG-*.png`, `threads-*.png`, `LI-*.png`, `tt-*.png`, `carousel-*.png`, `quote-*.png` shape route to `content/graphics/inbox/`.

### Photo from camera/phone

Files matching `IMG_*.heic`, `IMG_*.jpg`, `Screen Shot *.png` route to `inbox/photos/` (a sub-bucket of inbox for later sorting).

### Generic image

Surface to user.

## PDF (.pdf)

### Signed contract pattern

Files matching `*-signed.pdf`, `*-contract.pdf`, `*-agreement.pdf` route to `client-experience/signed-contracts/<client-name>/`.

If the filename does not include a client name, surface to user for the client name before move.

### Proposal pattern

Files matching `proposal-*.pdf`, `*-proposal.pdf` route to `client-experience/proposals/sent/<client-name>/`.

### Reference / read-later

Files matching `*.pdf` with no other match prompt the user: "PDF that is not a contract or proposal. Save to `reference/`, archive to `archive/deprecated-docs/`, or delete?"

## Archive / backup (.zip, .tar.gz)

### Date-named backup pattern

Files matching `backup-YYYY-MM-DD.tar.gz` or `backup-YYYY-MM-DD.zip` route to `backups/YYYY-MM-DD/`.

### Plugin / source code ZIP

Files matching `*-cowork-v*.zip`, `*-plugin.zip`, `*-source.zip` route to the relevant project folder under `drafts/<topic>/` if they are work-in-progress, or to `archive/uploaded-to-cloud/` if they were already shipped.

### Other ZIPs

Surface to user.

## Audio (.m4a, .wav, .mp3, .aac)

### Voice memo pattern

Files matching `New Recording*.m4a`, `Voice Memo*.m4a`, `voicememo-*.m4a` route to `content/voice-memos/raw/`.

### Podcast / interview pattern

Files matching `podcast-*.mp3`, `interview-*.mp3` route to `content/audio/interviews/raw/`.

### Music / sound effects

Files matching `bgm-*.mp3`, `sfx-*.wav`, `music-*.mp3` route to `brand-assets/audio/`.

### Default audio fallback

Surface to user.

## Video (.mov, .mp4, .m4v, .webm)

### Talking-head / face video

Files matching `selfie-*.mp4`, `headshot-*.mov`, `talking-*.mp4` route to `content/video/raw/`.

### Screen recording

Files matching `screen-recording-*.mov`, `loom-*.mp4`, `screencast-*.mov` route to `content/video/screen-recordings/`.

### Reel / shorts pattern

Files matching `reel-*.mp4`, `short-*.mp4`, `tt-*.mp4` (TikTok), `ig-reel-*.mp4` route to `content/video/social-cuts/`.

### Default video fallback

Surface to user.

## Filename hints

Beyond extensions, watch for these hint patterns:

| Hint in filename | Suggested route |
|---|---|
| `client-<name>-` | `client-experience/<name>/` |
| `prospect-` | `business-setup-playbook/prospect-lists/` |
| `essay-` | `content/` or `drafts/` based on completeness |
| `social-` | `content/social/` or `drafts/social/` |
| `newsletter-` | `content/newsletters/` or `drafts/newsletters/` |
| `accelerator-` | `business-setup-playbook/accelerator-attachments/` |
| `template-` | `templates/<category>/` |
| `signed-` | `client-experience/signed-contracts/` |
| `og-card-` | `brand-assets/og-cards/` |
| `screenshot-` | `inbox/screenshots/` (a holding bucket; sweep again next week) |
| `(2)`, `(3)` (duplicate suffix) | Surface as likely duplicate; ask user to compare and pick |

## Edge cases

### File has no extension

If the file has no extension (e.g., `draft-notes`), peek at the first 200 bytes:

- ASCII text → treat as `.md`
- Binary → surface to user with hex preview for identification

### File is a directory

If `00-inbox/` contains a subdirectory (e.g., from drag-drop of a folder), treat the directory as a unit and surface to user with the contents listed.

### File appears in inbox more than once across sweeps

If the same filename appears in inbox week-over-week, surface this pattern:

```
- 2026-05-08-research-notes.md has appeared in inbox for 3 sweeps.
  Pattern: user adds to inbox but does not act. Pick a target or delete.
```

This prevents inbox squatting.

### Very large file in inbox (>50 MB)

Surface size and ask explicitly:

```
- raw-video-2026-05-22.mov is 487 MB. Confirm target:
  a. content/video/raw/ (keep local)
  b. archive/uploaded-to-cloud/ (after cloud upload)
  c. external storage (provide path)
```

Large files inflate backups and slow sync; the user should make the call deliberately.

### File matches multiple patterns

If a file matches multiple patterns (e.g., `2026-05-22-essay-grounding-draft.md` matches both "draft-prefix" and "date-prefix essay"), apply this precedence:

1. Project tag (highest)
2. Status indicator (draft / final)
3. Type pattern (essay, social, etc.)
4. Default fallback (lowest)

For the example above: contains `-draft`, so route to `drafts/`.

## How to add new routing rules

When the user has a recurring pattern not covered, the skill writes a new rule to CLAUDE.md > Skills > file-sweep > routing_rules.

Workflow:

1. After 3 ambiguous files in a row with the same pattern, surface to user: "I see 3 files matching `<pattern>` in inbox. Add a routing rule for this pattern?"
2. If yes, capture: pattern + target folder + optional notes.
3. Write the rule to CLAUDE.md.
4. Apply the rule on subsequent sweeps.

This makes the skill learn the user's project shape over time.

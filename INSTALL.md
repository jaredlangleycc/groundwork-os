# Install NightShiftOS

Three options. Pick the one that fits.

## Option 1: Clone into Claude Code plugins folder (recommended)

```bash
git clone https://github.com/jaredlangleycc/nightshift-os ~/.claude/plugins/nightshift-os
```

Open Claude Code. The plugin auto-loads on next session. Verify with `/help` — you should see `customize-from-assessment` listed.

## Option 2: Clone anywhere, point Claude at it

```bash
git clone https://github.com/jaredlangleycc/nightshift-os ~/somewhere/nightshift-os
claude code --plugin-dir ~/somewhere/nightshift-os
```

Useful if you want to keep the plugin somewhere specific or test changes locally.

## Option 3: Download as ZIP

1. Go to [github.com/jaredlangleycc/nightshift-os](https://github.com/jaredlangleycc/nightshift-os)
2. Click Code > Download ZIP
3. Unzip to `~/.claude/plugins/nightshift-os`
4. Open Claude Code

---

## First run

Whichever install path you took, your first command should be:

```
/customize-from-assessment
```

If you've done the assessment at [nightshift.jaredlangley.cc](https://nightshift.jaredlangley.cc), paste your `assessment-output.md` when prompted. The plugin will customize itself to you.

If you haven't done the assessment yet, the skill will route you there. It takes ~12 minutes and is what makes the difference between "AI that helps generically" and "AI that knows your business."

---

## Requirements

- **Claude Code** — [install guide](https://docs.claude.com/claude-code)
- **Git** — for clone-based install
- Nothing else. The plugin is plain markdown + JSON. No npm install, no env vars, no Docker.

Optional integrations (the plugin works without these, just leans on sheets/notes instead):

- **HubSpot CRM** (free tier works) — for CRM-aware skills
- **MailerLite** (free tier works) — for email-sequence skill
- **Google Sheets** — for finance-log + CRM templates
- **Cal.com** — for booking-aware skills

Each skill that uses an integration will tell you what it needs and what the free fallback is.

---

## Updating

```bash
cd ~/.claude/plugins/nightshift-os
git pull
```

Then restart Claude Code. New skills and refinements load automatically.

---

## Uninstall

```bash
rm -rf ~/.claude/plugins/nightshift-os
```

Restart Claude Code. Your `CLAUDE.md` and any data you created stay where you saved them.

---

## Troubleshooting

**Plugin doesn't appear in /help** — verify path: `ls ~/.claude/plugins/nightshift-os/.claude-plugin/plugin.json`. If that file doesn't exist, the clone went wrong. Re-clone.

**`/customize-from-assessment` not found** — run `/help` and confirm Claude Code loaded the plugin. If still missing, restart Claude Code.

**Assessment site won't load** — check [nightshift.jaredlangley.cc](https://nightshift.jaredlangley.cc) status. If down, [open an issue](https://github.com/jaredlangleycc/nightshift-os/issues) on this repo.

**Voice rules feel wrong after install** — your `voice-rules` skill is generated from your assessment Section 4 answers. Retake the assessment with better samples + re-run `/customize-from-assessment`.

---

*Built by Jared Langley. MIT licensed.*

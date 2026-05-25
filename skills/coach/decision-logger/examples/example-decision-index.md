# Decision Index - the example coaching business

Chronological list of logged decisions. Each entry: date, slug, status, revisit date.

Read top-down for recent context. Search by tag or slug for specific patterns.

```
2026-05-22 | launch-bobbie-os-claude-projects     | active     | revisit 2026-06-22
2026-05-22 | discovery-form-via-cf-pages-beacon   | active     | closed (one-off)
2026-05-22 | trendradar-langley-fork-activation   | active     | revisit 2026-06-22
2026-05-20 | aeo-tier1-batch-shipped              | active     | revisit 2026-06-20
2026-05-20 | vibe-check-results-gated-email       | active     | revisit 2026-06-20
2026-05-19 | hubspot-tracking-script-site-wide    | active     | revisit 2026-08-19
2026-05-19 | leadership-stories-engine-launched   | active     | revisit 2026-06-19
2026-05-18 | climb-crm-hubspot-starter            | active     | revisit 2026-06-18
2026-05-18 | launch-cold-email-channel-v1         | active     | revisit 2026-07-15
2026-05-17 | leadership-coaching-new-managers-essay | active   | revisit 2026-06-17
2026-05-16 | ai-seo-pass-may16                    | active     | revisit 2026-08-16
2026-05-16 | wrangler-deploy-infra-primary        | active     | closed
2026-05-08 | memo-multiformat-v1-thesis-lock      | active     | revisit 2026-08-08
2026-05-05 | video-stack-may5                     | active     | revisit 2026-06-05
2026-05-02 | switch-scheduling-to-calcom          | active     | revisit 2026-06-02
2026-05-02 | cal-cta-swap-site-wide               | active     | closed
2026-05-01 | accelerator-collateral-v1            | active     | revisit 2026-08-01
2026-04-30 | testimonial-3-nhi-anonymized         | active     | closed
2026-04-29 | outreach-readiness-apr29             | active     | revisit 2026-05-29
2026-04-28 | pricing-locked-flagship-4500       | active     | revisit 2026-07-28
2026-04-27 | programs-pillars-rewrite-alt-c-b     | active     | closed
2026-04-27 | seo-audit-meta-pass                  | active     | revisit 2026-07-27
2026-04-26 | groundwork-blog-naming-first-essay   | active     | revisit 2026-07-26
2026-04-26 | private-pages-system-launched        | active     | closed
2026-04-26 | agency-lead-readiness-phase-1        | active     | revisit 2026-05-26
2026-04-25 | substack-out-site-blog-in            | reversed   | n/a
2026-04-25 | sunday-spine-cadence-model           | active     | revisit 2026-07-25
2026-04-25 | content-management-rules-v1          | active     | revisit 2026-07-25
2026-04-25 | social-strategy-v1                   | active     | revisit 2026-07-25
2026-04-24 | source-of-truth-consolidation        | active     | closed
2026-04-24 | site-refresh-april-24                | active     | closed
2026-04-21 | vibe-wave-overlay-tool               | active     | closed
2026-04-11 | blotato-setup                        | reversed   | superseded 2026-05-17
2026-04-05 | document-mailerlite-free-attempt     | active     | revisit 2026-06-05
2026-04-05 | favicon-shipped                      | active     | closed
2026-04-05 | folder-reorganization                | active     | closed
2026-04-05 | form-backend-migration               | active     | revisit 2026-07-05
2026-04-05 | brand-assets-april-redesign          | active     | closed
2026-04-04 | copy-refresh-naming-overhaul         | active     | closed
2026-04-04 | email-setup-m365                     | active     | closed
2026-04-03 | site-redesign-deployed               | active     | closed
```

## Tag index

Tags used across logged decisions:

- `#offer` (3): pricing-locked-flagship-4500, programs-pillars-rewrite-alt-c-b, source-of-truth-consolidation
- `#stack` (7): climb-crm-hubspot-starter, form-backend-migration, switch-scheduling-to-calcom, hubspot-tracking-script-site-wide, wrangler-deploy-infra-primary, video-stack-may5, blotato-setup
- `#hire` (0): none yet
- `#pricing` (1): pricing-locked-flagship-4500
- `#channel-cold-email` (1): launch-cold-email-channel-v1
- `#channel-substack` (1): substack-out-site-blog-in (reversed)
- `#channel-blog` (3): groundwork-blog-naming-first-essay, leadership-coaching-new-managers-essay, ai-seo-pass-may16
- `#channel-li` (2): leadership-stories-engine-launched, social-strategy-v1
- `#family-floor` (1): outreach-readiness-apr29
- `#risk-gauge` (1): launch-cold-email-channel-v1
- `#hard-call` (0): none yet (one was discussed, not logged via skill)
- `#challenge` (1): launch-cold-email-channel-v1
- `#climb` (3): climb-crm-hubspot-starter, switch-scheduling-to-calcom, video-stack-may5
- `#descent` (1): substack-out-site-blog-in (reverse of climb)

## Patterns the index surfaces

Reading the index over 7 weeks of decisions reveals:

1. **Most decisions are about stack and channels.** That's the Early Operator pattern. Decisions at this stage are about building the system and adding distribution.

2. **Few decisions are hires.** Zero hires logged. Consistent with Low-Burn risk archetype and Early Operator stage.

3. **One reversal so far.** Blotato setup reversed when subscription was cancelled May 17. Reversal cost: 4 weeks of paid use ~$116, plus migration time to alternative schedulers.

4. **One channel reversal.** Substack-to-blog reversed in spirit (decision to deprecate Substack still active, but your blog now the primary, not a replacement-only path).

5. **Most "closed" decisions are tactical.** Favicon shipped, brand assets updated, source-of-truth consolidation. These are decisions that did what they were supposed to do and need no revisit.

6. **The active-revisit queue is the working memory.** ~20 active decisions with revisit dates ahead. This is the queue the weekly-brief surfaces.

## How to maintain this index

When a new decision is logged:

1. Add one line at the top of the chronological list
2. Update tag counts in the tag index
3. Note any pattern that emerges across 3+ decisions (these become candidates for self-improve memory)

When a decision is revisited:

1. Update status (active, revisited, reversed, superseded, closed)
2. Set new revisit date or mark closed
3. Move to "Closed in YYYY-MM" section if no further revisit needed

When a decision is reversed or superseded:

1. Update status, leave the file
2. New decision links via `related_decisions` field
3. The history is preserved

The index is the table of contents. The files are the detail. Both stay in version control.

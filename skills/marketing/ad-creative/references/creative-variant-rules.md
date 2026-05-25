# Creative Variant Rules

Single-variable testing structure. Common test patterns. Sample-size math. Use as the framework when generating variants.

## The single-variable rule

Each variant tests exactly one variable. Hold the rest constant.

If you change headline + visual + CTA in the same variant, you cannot diagnose what drove the result. The variant is unusable.

| Variable to test | Hold constant |
|---|---|
| Headline | Primary text, visual, CTA, audience, budget |
| Visual | Headline, primary text, CTA, audience, budget |
| Primary text | Headline, visual, CTA, audience, budget |
| CTA button | Headline, visual, primary text, audience, budget |
| Audience | All creative held constant |

## Common test patterns

### Test 1: Hook (Variant A vs B)

**Baseline (A):** Specific moment hook

> Saturday morning. Coffee. Notebook. The hour I write best is the hour I almost trade for one more meeting every week.

**Test (B):** Counterintuitive claim hook

> Most new sales managers think the problem is time management. It's not.

Hypothesis: which hook style resonates with cold Meta traffic to the lead-gen assessment?

### Test 2: Visual style (Variant A vs C)

**Baseline (A):** Branded card (no person, brand palette, text on image)

**Test (C):** Creator-led photo (Jared portrait, brand frame)

Hypothesis: does the user's face on the ad improve trust signal vs branded card?

### Test 3: CTA (Variant A vs D)

**Baseline (A):** CTA "Sign Up"

**Test (D):** CTA "Get Offer"

Hypothesis: which framing converts better for a free assessment?

### Test 4: Audience slice (cohort test)

Same creative, different targeting:

- Cohort 1: B2B SaaS sales managers (Job Title: Sales Manager, Industry: Software, Company size: 50 to 500)
- Cohort 2: BDR / SDR Managers (Job Title: BDR Manager, similar size/industry)
- Cohort 3: Director of Sales (Job Title: Director Sales, similar size/industry)

Hypothesis: which slice of the broader ICP resonates with the lead-gen assessment?

## Sample-size math

Don't call a winner until you've hit minimum impressions per variant.

| Conversion event | Min impressions per variant | Min conversions per variant |
|---|---|---|
| Lead magnet signup (high intent) | 5000 | 50 |
| Calendar booking | 10000 | 20 |
| Purchase under $50 | 8000 | 30 |
| Purchase over $50 | 15000 | 15 |

These are floor numbers for directional reads. Statistical significance requires more (usually 2x to 5x), but solopreneur budgets rarely support full significance testing.

### Time floor

Beyond impressions, run each test at least:

- 7 days for cold traffic (week-of-week variation matters)
- 14 days for warm/retargeting traffic

Don't kill a variant before day 4 unless the loss rate is catastrophic.

## Variant naming convention

Name variants for tracking. Convention:

```
{campaign-slug}-{variant-letter}-{variable-tested}
```

Examples:

- `vibe-check-w22-A-baseline`
- `vibe-check-w22-B-hook-counterintuitive`
- `vibe-check-w22-C-visual-creator-led`
- `vibe-check-w22-D-cta-get-offer`

These names propagate into UTM `utm_content` parameter so traffic is traceable.

## Variant ship structure

Ship variants in waves to manage budget and diagnose properly.

### Wave 1 (week 1 to 2): Baseline + Hook test

- Variant A (baseline)
- Variant B (hook change)

Why: hook drives the most variance. Test it first.

### Wave 2 (week 3 to 4): Visual + CTA test

- Variant A (baseline, continued or refreshed)
- Variant C (visual change)
- Variant D (CTA change)

Why: visual and CTA are smaller variance variables. Layer them after hook is locked.

### Wave 3 (week 5 to 6): Audience test

- Winning variant from waves 1-2
- Run against 2 to 3 audience cohorts

Why: audience is the largest variance once creative is locked.

## Variant kill rules

Kill a variant immediately if:

- Day 3+: CPL is 3x baseline OR cohort average
- Day 7+: CTR is under 0.4% on Meta or under 0.3% on LinkedIn
- Day 7+: Frequency over 4 (audience is saturated)
- Engagement (saves, comments) is 0 after 5000 impressions

Promote a variant immediately if:

- Day 3+: CPL is 50%+ better than baseline AND impressions over 2000
- Day 7+: Conversion rate on landing page is 3x organic baseline

## Variant lifecycle

A variant goes through 4 stages:

1. **Testing (week 1-2):** initial spend, low budget, observation
2. **Scaling (week 3-4):** if winning, increase budget 50% per week, watch frequency
3. **Plateau (week 5-8):** budget steady, monitor for fatigue (CPC creep, CTR drop)
4. **Fatigue / refresh (week 8+):** swap creative element, restart test cycle

Static creative typically fatigues at week 4 to 6. Video at week 6 to 8. Refresh ahead of fatigue, not after.

## Multi-variant cost discipline

Total budget across variants = the user's pilot budget cap from `paid-ads`.

For a $5/day Early Operator pilot:

- 3 variants × $5/day = $15/day total (BUDGET EXCEEDED, refuse)
- 1 variant × $5/day = $5/day (within budget)

For a $5/day Early Operator pilot to test 3 variants:

- Option A: Run 1 variant at a time, 7 days each = 21-day test
- Option B: Increase budget to $15/day (must align with `paid-ads` strategy)
- Option C: Cut variant count to 1 baseline

Don't split a $5/day budget across 3 variants. Each variant gets $1.67/day, which produces zero signal.

## Voice integration in variant testing

Every variant carries voice-rules check. A variant that violates voice (em-dash, banned phrase) is invalid before launch.

When variants pass voice + format check, ship.

## Output format for a variant set

```
VARIANT SET, {campaign name}

Test variable: {what differs across variants}
Hold constant: {what's the same across variants}

VARIANT A, baseline ({modeled on: organic post X})
- Primary text: {text}
- Headline: {text}
- Description: {text}
- Visual: {direction}
- CTA: {preset}
- UTM: utm_content=A-baseline
- VOICE CHECK: clean

VARIANT B, {what differs}
- (same fields, B variation)
- VOICE CHECK: clean

VARIANT C, {what differs}
- (same fields, C variation)
- VOICE CHECK: clean

LAUNCH PLAN:
- Total budget: {amount}
- Run time: {days} or {until impressions hit Y}
- Kill criteria: {per variant kill rules}
- Win criteria: {per variant promote rules}

NEXT STEP:
- If winner emerges by day {X}, launch Wave 2 (visual + CTA tests)
- If no winner, return to organic and re-test offer
```

## Common variant testing mistakes

### Testing too many things at once

Don't change headline + visual + CTA in the same variant. You learn nothing.

### Testing too few impressions

Don't kill a variant at 500 impressions. Wait for the floor (5000 impressions for lead magnets).

### Testing the wrong variable

Don't test CTA color before hook. Hook drives 70% of variance, CTA drives 5%.

### Ignoring statistical significance

Solopreneur budgets rarely hit true significance. Use directional reads + 2x impression buffer. Don't declare a winner with 10 conversions and a 20% delta.

### Testing without organic baseline

Don't test ad variants if you have no organic post in the same vein that worked. Free amplifies what works; ad spend amplifies broken creative just as fast.

### Testing different audiences in the same wave

Audience is a separate variable. Lock creative first, then test audience.

## When to refuse a test entirely

- User has no organic baseline = refuse
- User's budget can't support 1 variant at platform minimum × 7 days = refuse
- Tracking isn't set up = refuse until tracked
- Lead magnet has under 5% organic landing-page conversion = refuse (creative won't fix a bad LP)
- User has not yet locked offer + ICP = refuse, route to `offer-design` or `icp-discovery`

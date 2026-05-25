# Move Classification

Taxonomy of expansion moves with default risk weight per archetype. Use this to decide whether a proposed move triggers the gauge, and how heavy the sequence runs.

## Class A: Recurring subscriptions

Anything monthly or annual that auto-renews.

| Sub-class | Examples | Default trigger |
|---|---|---|
| Free-to-paid tool upgrade | HubSpot Starter, MailerLite Growing, Cal.com Team | Bootstrap + Low-Burn = full gauge. Calculated + Aggressive = steps 1-2-5. |
| New tool added | Loom, Calendly, ConvertKit | All archetypes = step 3 first (free path) |
| Stack expansion | Adding a tool that overlaps with an existing one | All archetypes = full gauge plus consolidation prompt |
| Long-term commit | Annual plan paid upfront for discount | All archetypes = full gauge plus 30-day money-back check |

**Common failure pattern.** The user accumulates subscriptions because each one looks small. The gauge surfaces the total, not the marginal cost.

```
[risk-gauge] PROPOSED: ConvertKit $29/mo
            EXISTING EMAIL TOOL: MailerLite Free
            STACK TOTAL IF YOU ADD: $71/mo (cap is $50)
```

## Class B: Paid advertising

Any spend that turns off when the money stops.

| Sub-class | Examples | Default trigger |
|---|---|---|
| Test budget | $50 to $500/mo | All archetypes = full gauge |
| Scale budget | $500 to $5,000/mo | All archetypes = full gauge plus weekly review cadence |
| Long-tail commit | Quarterly retainer with agency | All archetypes = full gauge plus exit clause check |

**Common failure pattern.** Hope-based scaling. The user runs $500 for 6 weeks, gets 1 lead, and decides "I need to scale to $2,000 to really test it." The gauge forces the kill signal definition before the second commit.

## Class C: Hires

Anyone the user pays for time.

| Sub-class | Examples | Default trigger |
|---|---|---|
| Project-based contractor | One-off design, copy, dev work under $500 | Bootstrap + Low-Burn = steps 1-2-5. Calculated + Aggressive = pass with note. |
| Recurring contractor | VA, social manager, podcast editor | All archetypes = full gauge plus management-time check |
| First employee | W-2 or full-time contractor | All archetypes = full gauge plus payroll cap check plus 12-month commitment math |
| Agency retainer | Marketing, dev, design | All archetypes = full gauge plus exit clause |

**Common failure pattern.** Hiring before defining the work. The user hires a VA "to handle admin" with no specific weekly task list. Three months later the VA costs $XXX/mo and the user is still doing the admin.

```
[risk-gauge] PROPOSED HIRE: VA $400/mo
            DEFINED WEEKLY OUTPUT: <missing>
            MANAGEMENT TIME REQUIRED: <unknown>
            
Define the weekly output and the management time before signing.
```

## Class D: Offer changes

Anything that changes what the user sells.

| Sub-class | Examples | Default trigger |
|---|---|---|
| Price increase on existing offer | $X,XXX to $3,000 | All archetypes = full gauge plus pipeline check |
| New offer alongside | Add group program to 1:1 | All archetypes = full gauge plus attention check |
| Pivot the offer | Stop 1:1, only do group | All archetypes = full gauge plus revenue-bridge math |
| Productize a service | Service to course or template | All archetypes = full gauge plus production-time check |

**Common failure pattern.** Splitting attention before the first offer is stable. New offer launched while the current offer still has 3 active leads. The new offer steals all the runway energy.

## Class E: Time commitments

Anything that books the calendar at a cost.

| Sub-class | Examples | Default trigger |
|---|---|---|
| Conference attendance | Industry events, summits | All archetypes = full gauge plus scheduled-meetings check |
| Retreat or workshop | Founder retreats, masterminds | All archetypes = full gauge plus family floor impact |
| Long-form content commit | "Daily for 90 days," "weekly podcast for a year" | All archetypes = full gauge plus capacity check against revenue mix |
| Speaking engagement (unpaid) | Conference talks, podcast guesting | All archetypes = steps 1-2-5 |

**Common failure pattern.** Saying yes when the slot is empty and regretting when the week arrives. The family floor and the protected time get eaten by a commitment the user made 6 weeks ago.

## Class F: Operating model changes

Anything that changes the way the business runs day-to-day.

| Sub-class | Examples | Default trigger |
|---|---|---|
| Open a separate business bank account | First time business is an LLC | All archetypes = pass with note (this is hygiene) |
| Form an LLC / S-corp | Tax move | All archetypes = pass with note plus accountant referral |
| Sign an office lease | Coworking, sublease, full lease | All archetypes = full gauge plus protected-time impact |
| Move from contractor to W-2 employer | Hiring with benefits | All archetypes = full gauge plus payroll service check |
| Quit the day job | Full-time on business | All archetypes = hard hold plus 12-month-runway math |

**Common failure pattern.** Quitting too early because revenue had two good months in a row. The gauge requires the runway math to span the worst-case scenario, not the current good streak.

## Class G: Personal development with business expense

Things the user buys for themselves that they classify as business expense.

| Sub-class | Examples | Default trigger |
|---|---|---|
| Cohort program | 8 to 12 week paid course with group | All archetypes = full gauge plus opportunity-cost check |
| 1:1 coaching for the user | Business coach, executive coach | All archetypes = full gauge plus outcome-clarity check |
| Mastermind membership | Paid peer group | All archetypes = full gauge plus active-participation check |
| Conference + travel | Industry conference with hotel | All archetypes = full gauge plus scheduled-meetings check |

**Common failure pattern.** Buying confidence instead of selling. The user spends $2,000 on a course while sitting on 4 cold prospects they have not followed up with. The gauge surfaces the displacement.

```
[risk-gauge] PROPOSED: $2,000 cohort, 8 weeks, 4 hrs/wk
            DISPLACES: ~32 hours of business time
            CURRENT PIPELINE: 4 prospects no follow-up
            
What does the cohort produce that the 32 hours of follow-up does not?
```

## Move classification quick lookup

When the user proposes a move, classify it first, then run the gauge sequence appropriate to that class plus archetype.

If the move spans multiple classes (e.g., "hire an agency AND increase ad budget"), run the gauge for each class separately. Cumulative bets get a portfolio check at the end.

## Edge cases

**One-off vs. recurring.** A $500 one-off design hire is class A-light. A $500/mo agency retainer is class C-heavy. Same dollar amount, completely different risk profile. Always check the recurrence.

**Hidden recurrences.** "It's a one-time $97 course" but the course pushes into a $497/mo mastermind. Look 12 months ahead, not just at the immediate dollar.

**Bundled commits.** "If I sign the annual I save 20%." Annual pre-pay is a 12-month commit at the moment of click. Run the gauge as if it were a 12-month subscription, not a one-time charge.

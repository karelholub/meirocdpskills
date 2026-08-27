---
name: paid-media-activation-auditor
description: Audit Meiro paid-media activation readiness for Meta CAPI, anonymous event routing, Meta Custom Audiences, Google Ads and Sklik using public-site and read-only instance evidence. Use for consent, identity, event quality, deduplication, audience export, suppression, measurement and destination governance without enabling, exporting or changing ad-platform state.
---

# Paid Media Activation Auditor

Read `references/review-framework.md`. Use existing `$web-tracking-recon`, `$meiro-investigator` and `$engage-auditor` artifacts when available. For fresh Meiro evidence, use only those skills' guarded GET scripts; never use raw `mpcli` or bypass their allowlists.

Treat destination names and enabled flags as configuration evidence, not proof of valid credentials, platform acceptance, lawful processing, complete delivery or advertising performance. Treat public scripts and static event code as observable signals, not proof that events fired or were received.

## Boundaries

- Never enable, disable, create, update, test, retry or trigger a destination or Pipe.
- Never export an audience, upload identifiers, connect an ad account, attach credentials, open platform test consoles, create conversions or change campaign budgets/bids.
- Never retrieve or reproduce tokens, secrets, cookies, click identifiers, raw user identifiers, customer lists, payload examples or individual profiles.
- Do not infer consent, lawful basis, platform eligibility, audience overlap, match rate, event quality, attribution lift or revenue impact from object names.
- Current ad-platform product and policy requirements are time-sensitive. When precise current requirements are necessary, verify them against official platform documentation and label policy/legal conclusions for owner review.

## Method

Audit each activation path independently:

1. purpose and business owner;
2. source event/audience and canonical schema;
3. consent/lawful-basis and regional policy;
4. identity or anonymous eligibility and data minimization;
5. destination/Pipe readiness and delivery evidence;
6. deduplication, suppression, retention and deletion behavior;
7. measurement design, attribution limitations and holdout/incrementality;
8. approval boundary and smallest safe validation.

Classify each path as exactly one of:

- `READY_FOR_OFFLINE_DESIGN`
- `PARTIAL_FOUNDATION`
- `BLOCKED_CONSENT_OR_POLICY`
- `BLOCKED_IDENTITY_OR_MATCHING`
- `BLOCKED_DESTINATION`
- `BLOCKED_EVENT_QUALITY`
- `BLOCKED_OWNER_APPROVAL`
- `NOT_APPLICABLE`
- `UNKNOWN`

Separate confirmed, probable, possible and unknown findings. Propose only inactive/offline specifications, synthetic test fixtures and aggregate validation. Any customer-data export, paid-media activation or production event delivery requires a separate exact implementation plan and `$meiro-implementation-gate` review.

End with `Paid-media audit only. No audience export, ad-platform activation, or Meiro state was changed.`

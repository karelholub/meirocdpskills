# Paid-media activation review framework

Use only the sections relevant to requested channels.

## Shared evidence

Require or mark unknown:

- named business, privacy/consent, data, channel and technical owners;
- canonical source/environment and event or audience definition;
- purpose, eligible regions and consent/lawful-basis decision;
- data fields, minimization, hashing location, retention and deletion contract;
- suppression rules for purchasers, ineligible profiles and competing activations;
- destination account ownership and non-secret readiness indicator;
- aggregate delivery status, rejection categories and freshness;
- holdout or geo/audience experiment, attribution window and source-of-truth outcome;
- rollback that stops new delivery/export and preserves audit evidence.

Enabled/configured is not the same as healthy. A destination with no traffic is unknown until expected traffic and routing conditions are established.

## Meta CAPI / anonymous event routing

Review browser versus server event ownership, canonical event mapping, event ID deduplication, value/currency semantics, consent eligibility, purchase/refund reconciliation, delivery status, and a synthetic test-event plan. Do not claim anonymous CAPI is privacy-free.

## Meta Custom Audiences

Review audience purpose, inclusions/exclusions, refresh and expiry, approved identifiers, normalization/hashing boundary, consent, suppression, replacement/removal behavior, aggregate size and explicit data/channel-owner approval. Do not infer user-level overlap or match rate without platform evidence.

## Google Ads

Review website tags, enhanced conversions, offline conversions and customer matching separately. Check conversion ownership, transaction deduplication, value/currency, refund adjustments, consent-mode decision, matching eligibility, upload/rejection monitoring, suppression and incrementality.

## Sklik

Review website retargeting/conversion measurement and customer-list activation separately. Check consent category, tag/event coverage, identifier policy, refresh/expiry/removal, conversion deduplication, aggregate destination health and explicit owner approval.

## Output

For every activation path provide classification, purpose, observed evidence, blockers, proposed inactive objects/mappings, synthetic or aggregate validation, suppression and rollback concept, owner decisions and approval stage. Never translate technical readiness into permission to spend, export or activate.

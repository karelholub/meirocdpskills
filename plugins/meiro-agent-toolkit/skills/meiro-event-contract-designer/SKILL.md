---
name: meiro-event-contract-designer
description: Design governed Meiro web, app and backend event contracts from observed tracking, business requirements and supplied schemas. Use for event names, properties, identifiers, consent, deduplication and QA specifications before SDK, GTM or Pipes implementation; never deploy tracking.
---

# Meiro Event Contract Designer

Use `$meiro-agent-toolkit:web-tracking-recon` evidence for public sites and supplied backend/API documentation when available. Copy `assets/event-contract.template.json` and validate with `scripts/validate-event-contract.sh`.

For every event define canonical name, producer, trigger, evidence state, fields and types, nullability, synthetic examples, identifiers, consent category, purpose, retention owner, deduplication key, timestamp semantics, version and QA assertions.

Separate observed fields from proposals. GTM variables, DOM markup and analytics events are not a stable Meiro contract without an explicit mapping. Never put email, phone, click identifiers or other personal data into examples. Flag anonymous-to-known identity transitions and server/browser deduplication for owner review.

Output an offline contract plus an implementation mapping. Never change a website, container, consent manager, SDK or Meiro instance.

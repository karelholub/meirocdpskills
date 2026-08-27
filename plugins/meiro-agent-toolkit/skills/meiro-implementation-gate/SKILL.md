---
name: meiro-implementation-gate
description: Review authorization, evidence, diffs, payload hashes, environment, rollback, and approval records for proposed Meiro configuration changes. Use explicitly before any sandbox or production implementation. This skill currently contains no write capability and must not implement or activate changes.
---

# Meiro Implementation Gate

Read `references/approval-policy.json`. Default to deny.

This version is review-only. It has no Meiro write script or tool. Never implement, connect credentials, create secrets, attach data, test-send, schedule, enable, export, publish, launch, or activate.

For a proposed change, require:

- named instance and environment;
- exact objects/actions and before/after diff;
- immutable payload SHA-256;
- dependencies and data/consent owners;
- expected reach and channel/schedule when applicable;
- idempotency and rollback plan;
- audit destination;
- explicit approval matching the current payload and stage.

Approval expires when the payload, environment, object, dependency, reach, schedule, or action changes. Draft approval never authorizes activation. Non-production approval never authorizes production. Broad phrases such as “go ahead” are insufficient for production activation.

Return `APPROVED_FOR_REVIEW_ONLY`, `MISSING_EVIDENCE`, `MISSING_APPROVAL`, or `DENIED_BY_POLICY`. Never return an implementation success status.

End with `Gate review only. No Meiro state was changed.`


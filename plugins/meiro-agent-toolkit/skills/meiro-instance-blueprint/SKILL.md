---
name: meiro-instance-blueprint
description: Convert website, feed, playbook and read-only Meiro evidence into a machine-readable desired-state blueprint and current-versus-desired object diff. Use before implementation planning; never create or change instance objects.
---

# Meiro Instance Blueprint

Copy `assets/instance-blueprint.template.json` into the task output and fill only evidence-backed or explicitly proposed fields. Validate it with `scripts/validate-instance-blueprint.sh`.

Model dependencies in this order: sources and consent, event types, identifiers, attributes/models, pipes, destinations, audiences, Engage objects, measurement, QA. Give every proposed object a stable logical key, owner, evidence state, dependencies, idempotency key, rollback concept and activation policy.

For existing instances, include `currentObjectId` only when observed and classify the action as `retain`, `create`, `update_proposed`, `deprecate_review`, or `unknown`. Never recommend deletion merely because an object appears unused.

Do not include secrets, raw payloads, customer values or executable writes. A blueprint is not an API payload or approval. Route exact payloads through `$meiro-agent-toolkit:meiro-implementation-gate`.

End with `Blueprint only. No Meiro state was changed.`

---
name: ecommerce-playbook-planner
description: Apply governed ecommerce use-case playbooks to website reconnaissance and read-only Meiro evidence. Use to produce dependency, readiness, sequencing, proposed-object, validation, brand-input, and approval blueprints without implementing or activating anything.
---

# Ecommerce Playbook Planner

Read `references/manifest.json`, `references/use-case.schema.json`, and `references/approval-policy.json`. Validate the catalogue with `scripts/validate-playbook.sh`. Treat each playbook as a conditional recipe, not proof that prerequisites exist.

Use `$meiro-agent-toolkit:web-tracking-recon`, `$meiro-agent-toolkit:retail-attribute-auditor`, `$meiro-agent-toolkit:meiro-investigator`, and `$meiro-agent-toolkit:engage-auditor` evidence when relevant. Never infer private CRM, OMS, DWH, margin, identity, consent, catalog, or delivery contracts from a public site.

Classify each playbook as:

- `READY_FOR_OFFLINE_DESIGN`
- `READY_FOR_SANDBOX_DRAFT_APPROVAL`
- `PARTIAL_FOUNDATION`
- `BLOCKED_DATA`
- `BLOCKED_CONSENT_OR_POLICY`
- `BLOCKED_CHANNEL_OR_DESTINATION`
- `NOT_APPLICABLE`
- `UNKNOWN`

For each, provide evidence, missing dependencies, proposed inactive objects, sequencing, synthetic validation, owner decisions, rollback concept, and approval gates. Group work into foundation, behavioral, catalog, OMS/identity, and DWH/model waves.

Never implement, validate by execution, connect credentials/data, test-send, schedule, enable, export, publish, or launch. All proposed objects must remain offline/inactive.

End with `Planning only. No website, GTM, data source, or Meiro state was changed.`

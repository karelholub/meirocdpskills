# Workflow routing

## New instance

1. `$meiro-agent-toolkit:web-tracking-recon` and, when available, `$meiro-agent-toolkit:meiro-product-feed-auditor`.
2. `$meiro-agent-toolkit:meiro-event-contract-designer` and `$meiro-agent-toolkit:meiro-identity-consent-auditor`.
3. Use `$meiro-agent-toolkit:retail-attribute-auditor` when retail attributes apply. Select `$meiro-agent-toolkit:ecommerce-playbook-planner` for ecommerce or `$meiro-agent-toolkit:industry-playbook-planner` for Travel/BFSI.
4. When a commercial opportunity model is requested, `$meiro-agent-toolkit:ecommerce-roi-modeler`; keep it illustrative until required inputs are client-confirmed.
5. `$meiro-agent-toolkit:meiro-instance-blueprint` for the desired-state object graph.
6. `$meiro-agent-toolkit:meiro-change-bundle-builder`, then `$meiro-agent-toolkit:meiro-implementation-gate`.
7. `$meiro-agent-toolkit:meiro-qa-validator` after implementation within separately approved scope.
8. `$meiro-agent-toolkit:engage-auditor` and `$meiro-agent-toolkit:paid-media-activation-auditor` before activation planning.

## Existing instance

1. `$meiro-agent-toolkit:meiro-investigator` and `$meiro-agent-toolkit:engage-auditor`.
2. `$meiro-agent-toolkit:meiro-data-quality-auditor`, `$meiro-agent-toolkit:retail-attribute-auditor`, and relevant activation auditors.
3. Select `$meiro-agent-toolkit:ecommerce-playbook-planner` for ecommerce or `$meiro-agent-toolkit:industry-playbook-planner` for Travel/BFSI to prioritize improvements.
4. When requested, `$meiro-agent-toolkit:ecommerce-roi-modeler` to quantify an evidence-labeled opportunity range.
5. `$meiro-agent-toolkit:meiro-instance-blueprint` as current-versus-desired diff.
6. Gate, target-locked change, and QA as separate stages.

## Focused improvement

Use only the relevant auditor, blueprint the smallest change, gate it, then validate. Do not broaden scope without explicit authorization.

## Activation creative

When the user requests email or web creative for a Meiro activation:

1. Start from an existing governed campaign or journey brief. If none exists, use `$meiro-agent-toolkit:campaign-builder` to create an offline proposal first.
2. Use `$meiro-agent-toolkit:meiro-activation-design-studio` with the governed brief and approved or public brand evidence. Preserve audience, purpose, consent, exclusions, timing, measurement, rollback and approval state from the brief.
3. Route the offline creative bundle through separate brand, business, content and legal/compliance review. A selected direction is not an implementation approval.
4. Keep target-locked implementation outside this shared plugin. Use `$meiro-agent-toolkit:meiro-qa-validator` only after a separately approved draft exists, with synthetic or explicitly allowlisted evidence.
5. Never test-send, publish, expose, schedule, enable or activate as part of creative design.

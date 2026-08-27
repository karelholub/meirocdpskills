# Workflow routing

## New instance

1. `$meiro-agent-toolkit:web-tracking-recon` and, when available, `$meiro-agent-toolkit:meiro-product-feed-auditor`.
2. `$meiro-agent-toolkit:meiro-event-contract-designer` and `$meiro-agent-toolkit:meiro-identity-consent-auditor`.
3. `$meiro-agent-toolkit:retail-attribute-auditor` and `$meiro-agent-toolkit:ecommerce-playbook-planner`.
4. `$meiro-agent-toolkit:meiro-instance-blueprint` for the desired-state object graph.
5. `$meiro-agent-toolkit:meiro-change-bundle-builder`, then `$meiro-agent-toolkit:meiro-implementation-gate`.
6. `$meiro-agent-toolkit:meiro-qa-validator` after implementation within separately approved scope.
7. `$meiro-agent-toolkit:engage-auditor` and `$meiro-agent-toolkit:paid-media-activation-auditor` before activation planning.

## Existing instance

1. `$meiro-agent-toolkit:meiro-investigator` and `$meiro-agent-toolkit:engage-auditor`.
2. `$meiro-agent-toolkit:meiro-data-quality-auditor`, `$meiro-agent-toolkit:retail-attribute-auditor`, and relevant activation auditors.
3. `$meiro-agent-toolkit:ecommerce-playbook-planner` to prioritize improvements.
4. `$meiro-agent-toolkit:meiro-instance-blueprint` as current-versus-desired diff.
5. Gate, target-locked change, and QA as separate stages.

## Focused improvement

Use only the relevant auditor, blueprint the smallest change, gate it, then validate. Do not broaden scope without explicit authorization.

---
name: retail-attribute-auditor
description: Compare a recommended retail CDP attribute catalogue with a connected Meiro instance using read-only metadata. Use to classify exact, equivalent, partial, derivable, blocked, unsuitable-as-single-attribute, and unknown coverage and to propose unexecuted creation specifications.
---

# Retail Attribute Auditor

Read `references/retail-attribute-checklist.tsv` completely. Use `$meiro-agent-toolkit:meiro-investigator` and its guarded script for live metadata.

Inspect only `/api/attributes`, `/api/event-types`, `/api/identifier-types`, `/api/event-streams`, `/api/cloud-apps`, `/api/models`, and `/api/data-warehouses`. Never retrieve profile values, event samples, payloads, secrets, tokens, settings, or execute SQL.

Assign exactly one state to every checklist row:

- `PRESENT_EXACT`
- `PRESENT_EQUIVALENT`
- `PRESENT_PARTIAL`
- `DERIVABLE_CONFIRMED`
- `DERIVABLE_CANDIDATE`
- `BLOCKED_MISSING_INPUT`
- `NOT_RECOMMENDED_AS_SINGLE_ATTRIBUTE`
- `UNKNOWN`

Do not match by name alone. Exact means the same grain, type, time window, and business definition. List every required input for derivability. Predictive attributes require a named model, target, features, cadence, owner, validation, and monitoring; otherwise classify candidate or unknown.

For useful gaps, propose canonical name, type, grain, realtime/batch mode, inputs, formula/model need, window/timezone, null handling, privacy constraints, cadence, validation, dependencies, owner, confidence, and decisions. Never invent SQL for an unknown schema.

Write a ten-column TSV matching the checker in `scripts/check-retail-coverage-report.sh`. Preserve duplicate checklist rows and report consolidation opportunities.

End with `No attributes were created and no Meiro state was changed.`


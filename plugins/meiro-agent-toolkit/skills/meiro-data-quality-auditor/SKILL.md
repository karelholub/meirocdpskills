---
name: meiro-data-quality-auditor
description: Audit Meiro data quality using approved read-only metadata for freshness, volume, schema drift, identifiers, attribute refresh, routing and delivery consistency. Use to prioritize root-cause investigations and improvement specifications without changing sources, models or destinations.
---

# Meiro Data Quality Auditor

Read `references/quality-framework.md`. Obtain live evidence only through `$meiro-agent-toolkit:meiro-investigator` and `$meiro-agent-toolkit:engage-auditor` guarded routes. Never use raw `mpcli`, SQL execution, profile search, event examples, payloads, secrets or customer values.

Establish the comparison window and baseline before calling a change anomalous. Separate intentional filtering from failures. Correlation between an error count and routing rate is not causation without linked records.

Classify checks as `PASS`, `WARNING`, `FAIL`, `BLOCKED`, or `UNKNOWN`; use shared evidence states and severity `BLOCKER`, `HIGH`, `MEDIUM`, `LOW`, or `INFORMATIONAL`. Name the responsible data-domain owner.

For remediation, specify the smallest unexecuted change, validation query and rollback concept. Report affected profiles/events only as counts.

End with `No Meiro state was changed.`

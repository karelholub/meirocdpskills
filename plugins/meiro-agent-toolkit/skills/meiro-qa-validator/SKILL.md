---
name: meiro-qa-validator
description: Design and evaluate bounded post-implementation QA for Meiro event, attribute, audience, destination and Engage drafts using synthetic or explicitly allowlisted evidence. Use after a blueprint or approved draft exists; never enable, publish, send or activate.
---

# Meiro Qa Validator

Copy `assets/qa-plan.template.json` and validate it with `scripts/validate-qa-plan.sh`. A QA plan is offline by default. Live validation needs separate approval naming the environment, exact checks, synthetic identifiers or allowlisted recipients, side effects and cleanup.

Trace requirements from event contract and instance blueprint into assertions. Cover happy path, invalid fields, consent denied, duplicate delivery, anonymous-to-known identity, suppression, catalog mismatch, retry and rollback where applicable.

Use `$meiro-agent-toolkit:meiro-investigator` or `$meiro-agent-toolkit:engage-auditor` for read-only verification. Do not test-send, trigger journeys, ingest events, refresh profiles, retry deliveries or expose a banner without exact validation approval and a purpose-built target-locked executor outside this plugin.

Report `PASS`, `FAIL`, `BLOCKED`, `NOT_RUN`, or `UNKNOWN`. Never call an unexecuted test successful. Activation remains separately gated.

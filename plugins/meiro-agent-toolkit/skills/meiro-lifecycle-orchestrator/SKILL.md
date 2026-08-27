---
name: meiro-lifecycle-orchestrator
description: Route and sequence governed Meiro skills for a new-instance build, existing-instance audit, or focused improvement program. Use when the user wants an end-to-end workflow or is unsure which Meiro skill to run next; it coordinates evidence and gates but never writes to Meiro.
---

# Meiro Lifecycle Orchestrator

Read `references/workflows.md`. Select the smallest workflow matching the objective. Do not run every skill automatically.

Start by recording the objective, named environment, allowed evidence sources, available authentication, industry/playbook, owners, and whether any mutation is requested. Proceed with safe discovery when details are missing and mark them `UNKNOWN`.

Use shared evidence states: `OBSERVED`, `DERIVED`, `PROPOSED`, `BLOCKED`, `UNKNOWN`. Maintain one lifecycle register containing artifacts, verification dates, current findings, desired dependencies, decisions, owners, blockers, next skill, and stage: `DISCOVER`, `BLUEPRINT`, `APPROVAL`, `DRAFT`, `VALIDATE`, or `ACTIVATE`.

Read-only authentication authorizes only the relevant auditor. Planning never authorizes implementation. Draft approval never authorizes testing or activation. Route mutation proposals through `$meiro-agent-toolkit:meiro-implementation-gate`; target-locked writers remain outside this shared plugin.

End with the current stage, completed artifacts, blockers, and the single best next action.

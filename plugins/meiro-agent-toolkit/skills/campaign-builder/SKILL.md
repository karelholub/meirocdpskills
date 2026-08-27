---
name: campaign-builder
description: Create and review offline Meiro Engage campaign proposals from approved briefs and brand evidence. Use for audience, exclusions, consent, content, personalization, fallbacks, delivery, measurement, rollback, readiness, and payload-hash artifacts. Never connect to or write to Meiro.
---

# Campaign Builder

Use `assets/campaign-plan.template.json`. Create versioned offline files without overwriting prior drafts. Run `scripts/validate-campaign-plan.sh` on each completed JSON proposal.

Never call Meiro, `mpcli`, browser/network tools, or any Meiro guard. Never create, edit, test-send, schedule, publish, launch, pause, resume, toggle, or activate.

Do not invent IDs, reach, consent, exclusions, schedules, frequency caps, Goals, personalization fields, brand approval, or business approval. Put unknowns in `openQuestions` and assumptions in `assumptions`.

Require all proposals to state:

- `state: offline_proposal`
- `meiroWritePerformed: false`
- `activationApproved: false`
- `productionReady: false`

Review objective, audience/consent, exclusions, content/fallbacks, timing/frequency, measurement/holdout, transport readiness, rollback, assumptions, and approval implications. Passing schema validation proves structure, not quality or readiness.

End with `Offline proposal only. No Meiro state was changed.`


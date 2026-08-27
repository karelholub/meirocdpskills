---
name: meiro-identity-consent-auditor
description: Audit Meiro identity and consent readiness from public consent behavior and approved read-only configuration metadata. Use for identifier design, anonymous-to-known transitions, merge risks, channel opt-ins, suppression and governance without retrieving identities or changing consent state.
---

# Meiro Identity Consent Auditor

Read `references/framework.md`. Use `$meiro-agent-toolkit:web-tracking-recon` for public CMP behavior and `$meiro-agent-toolkit:meiro-investigator` or `$meiro-agent-toolkit:engage-auditor` for guarded configuration metadata.

Never inspect raw identifier values, profiles, cookies, consent strings, message recipients, suppression lists or deletion requests. Configuration presence does not prove lawful basis, consent correctness or operational enforcement; identify the accountable privacy/data owner for each conclusion.

Assess identifier purpose and scope, normalization, precedence, uniqueness assumptions, anonymous-to-known transitions, cross-device policy, consent capture and timestamps, per-channel opt-ins, withdrawal propagation, suppression, deletion and paid-media export boundaries.

Classify evidence as `OBSERVED`, `DERIVED`, `PROPOSED`, `BLOCKED`, or `UNKNOWN`. Produce a risk register, desired identity/consent contract, owner decisions and offline validation scenarios. Never change consent, merge profiles or export identities.

End with `Identity and consent audit only. No profile, consent or Meiro state was changed.`

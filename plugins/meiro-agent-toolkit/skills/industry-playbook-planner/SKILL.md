---
name: industry-playbook-planner
description: Apply governed Travel or BFSI CDP and engagement playbooks to public reconnaissance, supplied documentation, and read-only Meiro evidence. Use for readiness, dependency, sequencing, measurement, proposed-object and approval blueprints outside ecommerce; never implement, activate, or make regulated customer decisions.
---

# Industry Playbook Planner

Select one catalogue and read it completely:

- Travel, tour operators, airlines, hotels or booking businesses: `references/travel.catalog.json` and `references/travel-policies.md`.
- Banking, insurance, wealth, investment or other regulated financial services: `references/bfsi.catalog.json` and `references/bfsi-policies.md`.

Read `references/use-case.schema.json` and `references/approval-policy.json`. Validate the catalogue with `scripts/validate-industry-playbooks.sh`. Treat every playbook as a conditional recipe, never evidence that its prerequisites exist.

When adding another industry, read `references/extending-catalogues.md` and preserve the shared governance fields and approval boundary.

Use public website, supplied-source, and authorized read-only Meiro evidence when relevant. Never infer private booking, policy, claim, account, transaction, portfolio, identity, consent, eligibility, risk, suitability, health, vulnerability, or financial-status data from a public site.

Classify each playbook as:

- `READY_FOR_OFFLINE_DESIGN`
- `READY_FOR_SANDBOX_DRAFT_APPROVAL`
- `PARTIAL_FOUNDATION`
- `BLOCKED_DATA`
- `BLOCKED_IDENTITY_OR_CONSENT`
- `BLOCKED_POLICY_OR_LEGAL_REVIEW`
- `BLOCKED_CHANNEL_OR_DESTINATION`
- `NOT_APPLICABLE`
- `UNKNOWN`

For each applicable playbook, provide objective, evidence, missing dependencies, proposed inactive objects, sequencing, measurement and holdout design, stop conditions, owner decisions and approval gates. Separate transactional/service communications from marketing. Respect jurisdiction, language, time zone, accessibility and vulnerable-customer requirements.

For BFSI, the CDP may support governed communications and advisor/service workflows, but it must not become an unapproved decision engine. Never propose automated credit, underwriting, eligibility, pricing, fraud, investment suitability, portfolio allocation or claims decisions from CDP profiles or inferred attributes. Route such decisions to approved systems, legal/compliance review and human oversight.

Never implement, connect credentials or data, inspect raw customer records, test-send, schedule, enable, export, publish or launch. All proposed objects remain offline and inactive.

End with `Planning only. No website, source system, customer record, or Meiro state was changed.`

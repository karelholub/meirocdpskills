# Bundle contract

The validator expects these files in one directory:

1. `brand-evidence.json`
2. `activation-creative-brief.json`
3. `personalization-matrix.json`
4. `exact-content-ledger.json`
5. `design-qa.json`

Copy the corresponding templates from `assets/` and fill them without changing the safety flags.

Optional files include `copy-deck.md`, mockup images, HTML/MJML/CSS, and an artifact manifest. Reference optional artifacts from `activation-creative-brief.json`.

The validator checks required shapes, evidence states, offline status, false approvals/writes, dynamic-field fallbacks, QA statuses, and likely credential strings. It does not validate visual quality, brand fidelity, legal correctness, accessibility conformance, email-client compatibility, or production readiness.

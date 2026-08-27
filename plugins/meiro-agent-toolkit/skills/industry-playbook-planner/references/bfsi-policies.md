# BFSI planning guardrails

Use this reference with `bfsi.catalog.json`. It is an operational safety baseline, not legal, compliance, credit, underwriting or investment advice. The client's legal and compliance owners must map the workflow to its entity, jurisdiction, product and customer segment.

## Hard boundary

The CDP may select approved communications, apply consent and suppression rules, and create human-service or advisor handoffs. It must not independently determine or materially influence:

- credit approval, limits, affordability or collections treatment;
- insurance eligibility, underwriting, price or claim outcome;
- investment suitability, risk profile, portfolio allocation or personalized advice;
- fraud or AML disposition, account restriction or adverse action;
- treatment based on health, vulnerability or other special-category data.

Any such output must come from an approved authoritative system with documented governance, explainability, access control, human oversight and customer-rights handling. Do not recreate its logic from CDP attributes.

## Data and communication controls

- Separate contractual/service, security, regulatory and marketing purposes.
- Keep raw transactions, balances, portfolios, claim narratives, documents, credentials, authentication factors and health data out of prompts, planning artifacts and general marketing payloads.
- Prefer categorical status references and secure deep links over sensitive content.
- Maintain purpose/channel-specific consent, source precedence, withdrawal propagation and an auditable policy version.
- Use declared interests rather than inferring sensitive or regulated traits from behavior.
- Apply vulnerable-customer, complaint, bereavement, fraud-investigation and legal-hold suppressions from authoritative sources without exposing their underlying details.
- Require fairness and disparate-impact review for segmentation that could affect access, treatment or opportunity.
- Use human review for advisor, service and regulated-process handoffs.

## Legal and policy review anchors

- GDPR, especially special-category data and solely automated decisions with legal or similarly significant effects: https://eur-lex.europa.eu/eli/reg/2016/679/oj
- EU AI Act, including prohibited practices and high-risk-system obligations where applicable: https://eur-lex.europa.eu/eli/reg/2024/1689/oj
- Digital Operational Resilience Act for applicable EU financial entities and ICT governance: https://eur-lex.europa.eu/eli/reg/2022/2554/oj
- MiFID II for applicable investment services, communications and suitability processes: https://eur-lex.europa.eu/eli/dir/2014/65/oj
- Insurance Distribution Directive for applicable insurance distribution and customer requirements: https://eur-lex.europa.eu/eli/dir/2016/97/oj
- PSD2 for applicable payment services and security requirements: https://eur-lex.europa.eu/eli/dir/2015/2366/oj

Do not assume these are the only applicable rules. Record the responsible legal entity, regulator, country, product governance, retention, outsourcing/cloud, recordkeeping and customer-communication requirements.

## Minimum owner approvals

- Product/process owner: authoritative eligibility and status boundaries.
- Data owner: field minimization, lineage, quality and retention.
- Privacy owner/DPO: purpose, lawful basis, consent, rights and sensitive data.
- Compliance/legal owner: financial-promotion, conduct, suitability/underwriting boundary and recordkeeping.
- Security/risk owner: access, secrets, third parties, incident and operational resilience.
- Channel owner: approved templates, secure links and delivery controls.
- Model risk/fairness owner when scoring or prioritization is proposed.
- Human service/advisor owner for handoff capacity and review.

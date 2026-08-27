# Extending the industry catalogue

Add a new industry only when its use cases share the planner's output and approval model but need distinct domain dependencies or policy boundaries. A materially different workflow should be a separate skill.

1. Add the industry enum to `use-case.schema.json` and the validator's accepted catalogue list.
2. Create `<industry>.catalog.json` with a version, principles and at least eight distinct use cases.
3. Create `<industry>-policies.md` containing data exclusions, purpose boundaries, authoritative-system boundaries, stop conditions, required owners and current primary legal/policy references.
4. For every use case, define the business objective, KPIs, channels, events, fields, identifiers, attributes, assets, policies, journey outline, incremental measurement, stop conditions and activation blockers.
5. Keep events and fields canonical but vendor-neutral. Do not invent evidence or imply that public observations prove private-system readiness.
6. Separate service/transactional communications from marketing and identify decisions that must remain in authoritative systems or human review.
7. Add routing and example prompts to the repository README and lifecycle orchestrator.
8. Extend `validate-industry-playbooks.sh`, run the full repository validation, and review the catalogue with the industry's legal, data, product and operational owners before release.

Do not copy Travel or BFSI policies into another industry without checking whether their purpose, terminology and regulatory assumptions apply.

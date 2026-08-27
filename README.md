# Meiro Agent Toolkit for Codex

A governed set of Codex skills for two common jobs:

1. Inspect a prospective client's website and feeds, then design a new Meiro CDP and Engage instance.
2. Audit an existing Meiro instance, compare it with retail attributes and ecommerce playbooks, and propose prioritized improvements.

The shared plugin is intentionally safe by default. It supports public reconnaissance, read-only instance inspection, offline design, QA planning and approval review. It contains no general-purpose Meiro writer and never stores credentials.

## Install

```bash
git clone https://github.com/karelholub/meirocdpskills.git
cd meirocdpskills
codex plugin marketplace add "$PWD"
codex plugin add meiro-agent-toolkit@meiro-team
```

Start a new Codex task after installation or update.

For authenticated read-only audits, set `MPCLI_URL` and `MPCLI_TOKEN` only in the local terminal session. Never paste tokens into Codex chat or commit them to this repository.

## Choose a workflow

| Goal | Start with | Typical sequence |
|---|---|---|
| Plan a new instance from a website | `$meiro-agent-toolkit:meiro-lifecycle-orchestrator` | website → feed → event contract → attributes/playbooks → blueprint → gate → QA |
| Audit an existing instance | `$meiro-agent-toolkit:meiro-lifecycle-orchestrator` | instance/Engage inventory → data quality → attributes/playbooks → desired-state diff |
| Inspect website tracking before SDK deployment | `$meiro-agent-toolkit:web-tracking-recon` | public observations → event plan → QA and unknowns |
| Diagnose a current operational issue | `$meiro-agent-toolkit:meiro-investigator` | read-only evidence → cause classification → smallest next check |
| Review campaigns and journeys | `$meiro-agent-toolkit:engage-auditor` | inventory → dependencies → delivery/readiness risks |
| Compare recommended retail attributes | `$meiro-agent-toolkit:retail-attribute-auditor` | exact/equivalent/derivable/blocked/unknown coverage |
| Apply ecommerce use cases | `$meiro-agent-toolkit:ecommerce-playbook-planner` | dependencies → readiness → sequencing → offline objects |
| Design a safe campaign | `$meiro-agent-toolkit:campaign-builder` | brief → offline content/audience plan → readiness review |

## End-to-end lifecycle

```text
DISCOVER
  website + product feed + existing instance
      ↓
DESIGN
  event contract + identity/consent + attributes + playbooks
      ↓
BLUEPRINT
  current state → desired state → dependencies
      ↓
APPROVAL
  immutable change bundle + exact environment + payload hashes + rollback
      ↓
DRAFT
  separate target-locked execution bundle, outside this plugin
      ↓
VALIDATE
  read-only checks or separately approved synthetic QA
      ↓
ACTIVATE
  separate approval; never implied by draft creation
```

## Skill catalogue

### Coordination and design

#### `$meiro-agent-toolkit:meiro-lifecycle-orchestrator`

Chooses the smallest safe workflow and maintains the lifecycle register, owners, blockers and next action.

> Use `$meiro-agent-toolkit:meiro-lifecycle-orchestrator` to plan a new ecommerce Meiro instance from https://example.com. Start with public evidence only.

#### `$meiro-agent-toolkit:meiro-instance-blueprint`

Produces a validated machine-readable desired-state object graph or current-versus-desired diff covering sources, events, identifiers, attributes, pipes, destinations, audiences and Engage objects.

> Use `$meiro-agent-toolkit:meiro-instance-blueprint` to turn these audit artifacts and playbook priorities into an offline desired-state specification.

#### `$meiro-agent-toolkit:meiro-event-contract-designer`

Converts observed GTM/data-layer/backend evidence into versioned events, fields, identifiers, consent behavior, deduplication and QA assertions.

> Use `$meiro-agent-toolkit:meiro-event-contract-designer` with the website recon to define the proposed SDK and Pipes event contract.

#### `$meiro-agent-toolkit:meiro-identity-consent-auditor`

Reviews identifier design, anonymous-to-known transitions, merge assumptions, consent capture, channel opt-ins, withdrawal, suppression and export boundaries without retrieving profile values.

> Use `$meiro-agent-toolkit:meiro-identity-consent-auditor` to assess whether the proposed identity and consent design supports these playbooks.

#### `$meiro-agent-toolkit:ecommerce-playbook-planner`

Applies the structured ecommerce catalogue to evidence, classifying each use case by readiness and dependencies without implementing it.

> Use `$meiro-agent-toolkit:ecommerce-playbook-planner` to rank the ecommerce use cases that this instance can support in the next 90 days.

### Public and supplied-source reconnaissance

#### `$meiro-agent-toolkit:web-tracking-recon`

Passively inspects public GTM, data-layer, ecommerce markup, consent defaults and brand signals before Meiro SDK deployment.

> Use `$meiro-agent-toolkit:web-tracking-recon` to inspect https://example.com without changing consent, submitting forms or writing to the site.

#### `$meiro-agent-toolkit:meiro-product-feed-auditor`

Audits a public or supplied product feed for stable IDs, variants, taxonomy, prices, availability, URLs, images and behavioral-event matching.

> Use `$meiro-agent-toolkit:meiro-product-feed-auditor` on the supplied XML feed and assess recommendation readiness.

### Existing-instance audits

#### `$meiro-agent-toolkit:meiro-investigator`

Uses guarded read-only Meiro metadata to investigate health, queues, routing, errors, models, attributes, audiences and destinations.

> Use `$meiro-agent-toolkit:meiro-investigator` to explain the routing-rate drop during the last hour. Do not change anything.

#### `$meiro-agent-toolkit:engage-auditor`

Audits campaigns, journeys, audiences, transports, destinations, Goals and runtime dependencies without editing, sending or activation.

> Use `$meiro-agent-toolkit:engage-auditor` to find active journeys with unhealthy or unverifiable dependencies.

#### `$meiro-agent-toolkit:meiro-data-quality-auditor`

Assesses freshness, completeness, type validity, schema drift, identity design, attribute refresh and delivery consistency using aggregate read-only evidence.

> Use `$meiro-agent-toolkit:meiro-data-quality-auditor` to prioritize the current sources of profile-refresh and destination errors.

#### `$meiro-agent-toolkit:retail-attribute-auditor`

Compares the recommended retail attribute catalogue with the connected instance and proposes unexecuted specifications for derivable gaps.

> Use `$meiro-agent-toolkit:retail-attribute-auditor` to compare this instance with the bundled retail checklist.

#### `$meiro-agent-toolkit:paid-media-activation-auditor`

Reviews Meta CAPI, anonymous routing, Meta Custom Audiences, Google Ads and Sklik readiness across consent, identity, deduplication and destination governance.

> Use `$meiro-agent-toolkit:paid-media-activation-auditor` to review paid-media readiness without enabling or exporting anything.

### Campaigns, validation and governance

#### `$meiro-agent-toolkit:campaign-builder`

Creates and reviews offline campaign proposals covering audience, exclusions, consent, content, personalization, measurement, rollback and readiness.

> Use `$meiro-agent-toolkit:campaign-builder` to create an offline cart-recovery banner proposal from this approved brief and brand evidence.

#### `$meiro-agent-toolkit:meiro-qa-validator`

Creates traceable post-implementation QA plans and assesses only actually executed, approved checks. It never treats an unexecuted test as passed.

> Use `$meiro-agent-toolkit:meiro-qa-validator` to create synthetic QA scenarios for this event contract and instance blueprint.

#### `$meiro-agent-toolkit:meiro-change-bundle-builder`

Converts a validated blueprint into an offline manifest containing exact target, actions, diffs, payload hashes, owners, reach, rollback and approval fields. It does not connect or write.

> Use `$meiro-agent-toolkit:meiro-change-bundle-builder` to prepare an immutable sandbox-draft approval package from this blueprint.

#### `$meiro-agent-toolkit:meiro-implementation-gate`

Reviews environment, evidence, exact diffs, immutable payload hashes, rollback and approval. It has no write capability.

> Use `$meiro-agent-toolkit:meiro-implementation-gate` to review this exact sandbox draft batch and its SHA-256.

## Shared evidence and status language

All workflows should distinguish:

- `OBSERVED` — directly supported by the cited evidence.
- `DERIVED` — calculated from observed evidence with the method shown.
- `PROPOSED` — desired behavior or object, not currently verified.
- `BLOCKED` — cannot proceed because a named dependency is missing.
- `UNKNOWN` — current evidence cannot answer the question.

Audit checks use `PASS`, `WARNING`, `FAIL`, `BLOCKED`, or `UNKNOWN`. QA uses `PASS`, `FAIL`, `BLOCKED`, `NOT_RUN`, or `UNKNOWN`. Findings use `BLOCKER`, `HIGH`, `MEDIUM`, `LOW`, or `INFORMATIONAL` severity.

## Safety and approval model

- Public reconnaissance does not prove private CRM, OMS, DWH, consent or identity contracts.
- Read-only authentication does not authorize writes.
- Offline proposals are not Meiro payloads or approvals.
- Draft approval does not authorize testing, publishing, scheduling, enabling or activation.
- Production and activation require separate exact approvals.
- A writer must be generated for one named environment and immutable batch outside this shared plugin.
- Secrets, customer profiles, raw payloads and unsanitized API responses must not enter this repository.

## Ecommerce playbooks

The playbook catalogue and schema live under:

```text
plugins/meiro-agent-toolkit/skills/ecommerce-playbook-planner/references/
```

Each use case describes required events, fields, attributes, assets, policies, channels, journey outline and activation blockers. Extend the catalogue by preserving these dependencies and running the repository validation.

## Validate changes

```bash
sh scripts/validate-toolkit.sh
```

The check validates plugin and marketplace structure, skill metadata, JSON, shell syntax, offline templates, the ecommerce catalogue, unsafe writer inclusion, placeholders and common secret/client leakage patterns. Pull requests also run it automatically.

## Release and update

Use reviewed semantic-version tags. After pulling a new release, reinstall and start a new Codex task:

```bash
git pull --ff-only
codex plugin add meiro-agent-toolkit@meiro-team
```

See [TEAM_INSTALL.md](TEAM_INSTALL.md) for the short installation handoff.

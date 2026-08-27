# Meiro Agent Toolkit — Team Installation

This repository distributes reusable Codex skills. It intentionally excludes client credentials, raw API responses, approval records, audit outputs and instance-locked writers.

## Install

1. Clone this repository to a stable local path:

   ```bash
   git clone https://github.com/karelholub/meirocdpskills.git
   cd meirocdpskills
   ```

2. Add its marketplace root:

   ```bash
   codex plugin marketplace add /absolute/path/to/meiro-codex-toolkit
   ```

3. Install the plugin:

   ```bash
   codex plugin add meiro-agent-toolkit@meiro-team
   ```

4. Start a new Codex task so the installed skills are loaded.

## Authenticate for live read-only audits

Set the target and token only in the local terminal session used for the audit:

```bash
export MPCLI_URL="https://your-meiro-instance.example"
export MPCLI_TOKEN="REPLACE_LOCALLY"
```

Never put credentials in this repository, prompts, task messages, audit artifacts or shell history. Follow your team's secret-management policy when obtaining the token.

## Included skills

The complete catalogue and example prompts are documented in [README.md](README.md).

- `meiro-investigator`
- `engage-auditor`
- `retail-attribute-auditor`
- `web-tracking-recon`
- `ecommerce-playbook-planner`
- `ecommerce-roi-modeler`
- `paid-media-activation-auditor`
- `campaign-builder`
- `meiro-implementation-gate`
- `meiro-lifecycle-orchestrator`
- `meiro-instance-blueprint`
- `meiro-event-contract-designer`
- `meiro-product-feed-auditor`
- `meiro-data-quality-auditor`
- `meiro-qa-validator`
- `meiro-identity-consent-auditor`
- `meiro-change-bundle-builder`

The package contains no general Meiro writer. Instance changes require a separate target-locked execution bundle, an immutable payload hash and explicit approval for the named environment and stage.

## Update

Pull the desired reviewed release, reinstall the plugin, and start a new Codex task:

```bash
git pull --ff-only
codex plugin add meiro-agent-toolkit@meiro-team
```

Use tagged releases for team distribution rather than installing unreviewed working branches.

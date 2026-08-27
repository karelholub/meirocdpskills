---
name: meiro-change-bundle-builder
description: Build an offline immutable Meiro change manifest from a validated blueprint, with exact target, actions, diffs, payload hashes, dependencies, rollback and approval fields. Use before the implementation gate; never connect to or write to Meiro.
---

# Meiro Change Bundle Builder

Copy `assets/change-bundle.template.json`, fill it from the validated blueprint and run `scripts/validate-change-bundle.sh`. Keep payloads in separate files, calculate SHA-256 from exact bytes and reference their relative paths and hashes.

Name one environment and exact base URL. List every create/update action and before/after diff. Updates require an observed current object/version. Include owners, dependencies, reach, idempotency, stop condition, rollback, audit destination and explicit exclusions.

The bundle must remain `offline_bundle` with every approval false. Do not authenticate, inspect live state, create execution code, embed credentials, or mark approval on the user's behalf. After validation, route the immutable bundle hash to `$meiro-agent-toolkit:meiro-implementation-gate`.

Any later target-locked executor is a separate client artifact outside this plugin. A bundle change invalidates previous approval.

End with the bundle SHA-256 and `Offline bundle only. No Meiro state was changed.`

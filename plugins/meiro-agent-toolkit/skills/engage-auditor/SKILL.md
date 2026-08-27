---
name: engage-auditor
description: Audit Meiro Engage campaigns, journeys, audiences, channel transports, Goals, destinations, runs, and runtime evidence through strictly read-only access. Use for readiness, dependency, targeting-reuse, schedule, delivery, and competition analysis without editing, testing, sending, or activation.
---

# Engage Auditor

Use `scripts/meiro-engage-readonly GET <path> [arguments]` exclusively. Resolve it relative to this skill. Require authenticated `MPCLI_URL`/`MPCLI_TOKEN` only for live reads; never reveal or persist credentials.

Pipe any campaign detail, journey version/graph, or web-banner response directly
through `sh scripts/sanitize-engage-metadata` before saving or inspecting it. Never
save the raw response. Only add a new GET route to the guard after its exact
contract has been observed or documented; do not guess route names. Inventory
and graph reads may retain IDs, names, statuses, node types, edges, audience and
destination references, timing controls, non-secret parameter names, and
counts. The sanitizer intentionally removes creative content, recipient and
profile data, executable code, payloads, secret material, and configured
parameter values.

Never create, edit, save, restore, test-send, schedule, publish, launch, pause, archive, activate, retry, validate, or use raw `mpcli`. Do not reproduce recipients, profiles, secrets, message bodies, templates, or payloads.

Audit status, channel, audience, schedule/window, versions, destination readiness, runs/events, journey runtime, exclusions, frequency controls, priority, and Goal attachments only when exposed. Goal attachment is reporting context, never causal proof.

Exact audience ID reuse plus overlapping windows establishes targeting reuse, not user-level collision. Different audience IDs are not overlapping without direct evidence. Shared channel alone is not competition. Missing metadata is unknown, not a defect.

For web-banner readiness, distinguish configuration prerequisites from object
inventory. Confirm that the Meiro Events endpoint, relevant Channels/Web role,
and Meiro Events API connection are available when exposed, but never retrieve
their secret settings. The presence of `web_banner_*` event types proves only
that event types exist; it does not prove that banners are configured or
currently displayed.

Classify findings as confirmed, probable, possible, or unknown. Recommend changes as unexecuted proposals. Do not recommend deletion/archival merely because objects look old or test-like; request ownership/retention review.

End with `No Meiro state was changed.`

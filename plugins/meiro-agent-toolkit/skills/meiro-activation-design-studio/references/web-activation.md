# Web activation design

Use this reference when the requested output includes native web modules, banners, popups, overlays, sticky elements, or authenticated service placements.

## Placement-first design

Define before visual exploration:

- public or authenticated context;
- exact page type and placement/container;
- native, embedded, popup, sticky, or full-width format;
- desktop/mobile viewport assumptions;
- generic DOM fallback;
- eligibility and consent-denied behavior from the governed brief;
- priority/competition relationship with other activations;
- close/minimize behavior when applicable;
- destination and secure-navigation constraints.

Prefer native/embedded modules for service, education, and early personalization pilots. Use interruptions only when the brief establishes a proportionate reason and frequency/close policy.

## Required states

Design the eligible personalized state, generic/no-consent state, missing/stale/conflicted personalization state, source-unavailable state, dismissed/minimized state where applicable, mobile state, focus/hover/active states, and long localized-copy state.

Do not expose policy, application, claim, identity, destination, health or companion details in public or shared-device surfaces. Authenticated context still needs minimum-necessary content and logout/shared-device review.

## Implementation handoff

When implementation is requested, specify stable DOM hooks, semantic hierarchy, CSS isolation, responsive behavior, asset loading, content security constraints, analytics event names, and generic fallback. Do not create or inject code into the live site.

For Meiro web banners, the campaign/journey plan remains the source for audience and frequency. The design bundle defines visual behavior and event intent, not configured IDs or activation.

## QA focus

Check contrast, reflow, zoom, keyboard order, focus visibility, close control, reduced motion, labels, tap targets, layout shift, source failure, overflow, overlap with chat/accessibility widgets, consent-denied fallback, competition priority, and exact CTA/event mapping.

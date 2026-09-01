# Email activation design

Use this reference when the requested output includes email.

## Required states and artifacts

Design the message as a system, not only a hero image:

- subject and preheader variants;
- from-name/reply-route assumptions marked unknown unless supplied;
- desktop and narrow-mobile layout;
- plain-text content order;
- image-off and missing-personalization behavior;
- alt text and decorative-image treatment;
- broken-image and blocked-remote-content states;
- primary CTA plus any permitted secondary/help action;
- required legal, preference and unsubscribe/service footer treatment;
- localization expansion and character-set support;
- dark-mode risk notes when colors or logos may invert.

## Composition

- Use one clear primary action unless the brief requires a comparison.
- Keep essential meaning in live text, not only in images.
- Put contractual/service information before optional education.
- Avoid sensitive or identifying content in subject lines, preheaders, lock-screen-visible text, or image filenames.
- Do not embed raw profile values in URLs. Secure destinations and token behavior are implementation questions.
- Provide generic copy when a personalization field is missing, stale, conflicted, or disallowed.

## Implementation handoff

When implementation is requested, prefer semantically structured, table-safe email HTML or MJML appropriate to the user's stack. Keep CSS assumptions explicit and test in the named client matrix; do not claim compatibility without rendering evidence.

Record responsive stacking, tap-target behavior, asset dimensions, live-text versus image content, dynamic block conditions, fallbacks, exact-content dependencies, and localization behavior.

## QA focus

Check text-only meaning, contrast, link labels, image blocking, long localized copy, missing fields, duplicated modules, service/marketing separation, preference links, and rendering in the approved client set.

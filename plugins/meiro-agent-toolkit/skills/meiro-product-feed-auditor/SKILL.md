---
name: meiro-product-feed-auditor
description: Audit a public or explicitly supplied ecommerce product feed for Meiro catalog, recommendation and activation readiness. Use for product IDs, variants, taxonomy, price, availability, URLs, images and event-to-feed matching; never modify or import the feed.
---

# Meiro Product Feed Auditor

Read `references/field-framework.md`. Inspect only a public feed URL or a file the user supplied. Do not discover private endpoints, bypass authentication or retrieve customer/order feeds.

Sample proportionally when the feed is large and record the method. Assess coverage, uniqueness, type consistency, variants, taxonomy, price/currency, availability, URLs, images, timestamps and localization.

Compare behavioral product IDs with feed IDs only when both evidence sets exist. Report match rate and unmatched product identifiers only; never include profiles or customer events. Use `OBSERVED`, `DERIVED`, `PROPOSED`, `BLOCKED`, and `UNKNOWN`.

Produce inventory, field coverage, quality findings, event/feed join readiness, playbook dependencies, mapping and owner questions. Do not upload, modify, connect or schedule a feed.

End with `Feed audit only. No feed, website or Meiro state was changed.`

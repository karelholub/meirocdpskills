# Travel planning guardrails

Use this reference with `travel.catalog.json`. It is an operational checklist, not legal advice. Confirm the countries, products, traveler types and controller/processor roles with the client's privacy and legal owners.

## Required distinctions

- Separate booking/service communications from marketing by purpose, lawful basis, template, suppression and measurement.
- Treat price, taxes, fees, availability, itinerary and disruption information as time-sensitive. Revalidate against an authoritative source immediately before display or send.
- Do not place payment-card data, passport/document contents, health information, accessibility details, precise location, minor data or companion-traveler details in general marketing attributes.
- Use a booking or alert reference rather than copying full itinerary or traveler data into campaign payloads.
- Suppress confirmed, cancelled, refunded, disputed, expired or materially changed bookings according to the playbook.
- Localize language, currency, departure market and time zone. Provide accessible content and a human support route.
- Do not infer religion, ethnicity, health, family status, sexual orientation or other sensitive traits from destinations, party composition, browsing or special requests.
- Paid-media exports require separate consent/purpose, destination governance and audience-size safeguards.

## Legal and policy review anchors

- GDPR, including purpose limitation, data minimization, special-category data, transparency, rights and automated decisions: https://eur-lex.europa.eu/eli/reg/2016/679/oj
- ePrivacy rules for electronic communications and storage/access on user devices: https://eur-lex.europa.eu/eli/dir/2002/58/oj
- EU Package Travel Directive for applicable package and linked-travel arrangements: https://eur-lex.europa.eu/eli/dir/2015/2302/oj

These sources are starting points. Record the client's approved interpretation, market-specific consumer rules, retention policy and incident/service communication policy before activation.

## Minimum owner approvals

- Digital/product owner: event and booking-state semantics.
- Inventory/revenue owner: price and availability freshness.
- CRM/channel owner: channel readiness, frequency and content.
- Privacy/legal owner: purpose, consent/lawful basis, sensitive data and cross-border use.
- Customer service/operations owner: disruption, cancellation, refund and complaint suppressions.
- Analytics owner: holdout, confirmed-booking outcome and incrementality definition.

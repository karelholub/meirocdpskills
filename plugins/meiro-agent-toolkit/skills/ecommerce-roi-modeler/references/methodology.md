# Governed ecommerce ROI methodology

## Intended use

Use the model to prioritize an ecommerce CDP and activation program, frame a prospect discussion, or build a client-confirmed business case. It is not an accounting forecast, valuation, guarantee, or substitute for client finance approval.

## Evidence hierarchy

1. `Client-confirmed`: approved client finance, commerce, analytics or commercial evidence with owner and date.
2. `Observed-readonly`: aggregate metadata retrieved from an authorized read-only system route.
3. `Observed-public`: directly visible website, feed or public documentation evidence.
4. `Benchmark-verified`: exact current source with metric definition, population, market and date.
5. `Benchmark-unverified`: a candidate source or inherited reference that must be checked before delivery.
6. `Derived`: arithmetic from named inputs, with the formula visible.
7. `Illustrative`: a transparent placeholder used only to show model mechanics.

Required financial assumptions must be `Client-confirmed` before the workbook can be labeled `CLIENT-CONFIRMED`. Public or read-only evidence can support applicability and readiness but cannot substitute for the client financial baseline.

## Core equations

For each use case and scenario:

```text
annual contribution = addressable base
                    × incremental uplift
                    × contribution factor
                    × implementation readiness
                    × evidence confidence
```

Revenue effects use gross or contribution margin as their contribution factor. Direct, avoidable cost savings may use 100%. Do not combine revenue and cost savings before applying their different contribution treatment.

Portfolio contribution deducts a documented overlap factor once. Three-year contribution applies the year-specific adoption ramp. Annual cash flow subtracts all incremental costs for that year.

```text
net cash flow = ramped portfolio contribution − annual and one-time costs
NPV = sum(net cash flow year t ÷ (1 + discount rate)^t)
ROI = (three-year contribution − three-year cost) ÷ three-year cost
```

Payback is indicative unless calculated from a monthly cash-flow schedule. Preserve negative periods.

## Addressable-base examples

- cart recovery: annual abandoned-cart value, not total revenue;
- email lifecycle: email-addressable revenue or consented reachable customers;
- paid-media optimization: paid-acquisition or new-customer revenue/cost base;
- recommendations: recommendation-eligible product or session revenue;
- returns reduction: annual avoidable handling, logistics and write-off cost;
- discount optimization: annual discount spend or margin leakage;
- onsite exit intervention: eligible sessions or revenue, with experimental incrementality.

## Readiness and confidence

Readiness reflects implementability: events, identifiers, consent, attributes, feed, destination and channel dependencies. Confidence reflects evidence quality and causal uncertainty. They are separate reductions; neither should be silently set to 100%.

Use case readiness from another skill does not prove uplift. Uplift should come from client experiments, comparable verified evidence or an explicitly illustrative scenario.

## Benchmark rules

Prefer primary research or directly documented vendor studies. Record URL, publication/access date, geography, sample, metric definition and whether the study measures incremental lift or attribution. Do not reuse a benchmark when the client channel, market, eligibility rule or outcome differs materially.

## Review checklist

- Every required input has an evidence state and owner.
- No use case uses an unjustifiably broad addressable base.
- Revenue is converted to contribution before ROI.
- Costs include implementation and internal operating effort.
- Overlap and ramp are explicit.
- Scenario ordering is conservative ≤ realistic ≤ optimistic.
- Model status matches evidence quality.
- Sources are current enough for the decision.
- Measurement includes holdout or other incrementality design.
- Workbook checks pass or warnings are explained.

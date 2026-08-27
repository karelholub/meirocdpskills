---
name: ecommerce-roi-modeler
description: Create governed ecommerce ROI opportunity models from website, feed, playbook, read-only Meiro, benchmark, and client financial evidence. Use for prospect business cases, scenario ranges, contribution economics, NPV, ROI, payback, assumptions and source logs; never present a website-only estimate as a forecast or write to Meiro.
---

# Ecommerce ROI Modeler

Read `references/methodology.md` before modeling. Copy `assets/ecommerce-roi-template.xlsx` to the requested output location and preserve its five-sheet structure. Use the spreadsheet tooling to edit and verify the workbook. Run `scripts/validate-roi-model.sh` on the finished file.

## Evidence boundary

Classify every material input as `Observed-public`, `Observed-readonly`, `Client-confirmed`, `Benchmark-verified`, `Benchmark-unverified`, `Derived`, or `Illustrative`. Record its source, as-of date, market or population, owner and notes in the Sources tab.

A public website may establish visible pricing, categories, promotions, product-feed availability, tracking observations and use-case applicability. It does not establish revenue, margin, orders, conversion, customer counts, consented reach, channel performance, implementation cost or incremental uplift. Do not infer those values from site traffic estimators or category averages without labeling them as benchmarks.

Keep the model status `ILLUSTRATIVE` until every assumption marked Required is `Client-confirmed`. A read-only Meiro audit may provide aggregate operational evidence, but it does not authorize profile retrieval or changes.

## Model construction

1. Start from prioritized use cases supported by `$meiro-agent-toolkit:ecommerce-playbook-planner` and readiness evidence from the relevant auditors.
2. Use an addressable base specific to each use case. Do not apply every uplift to total ecommerce revenue.
3. Calculate annual contribution as `addressable base × uplift × contribution factor × readiness × confidence`.
4. Apply gross or contribution margin to revenue effects. Use a 100% contribution factor only for genuine direct cost savings.
5. Model conservative, realistic and optimistic uplifts explicitly. Cite current exact benchmark definitions or keep them illustrative.
6. Deduct portfolio overlap once to reduce double counting between interacting use cases.
7. Apply the adoption ramp before computing annual cash flow.
8. Include platform, implementation, internal operating, channel/creative and known upgrade costs.
9. Report contribution-based ROI, NPV using the client discount rate, and indicative payback. Keep revenue opportunity separate from ROI.
10. Retain holdout or incrementality testing as the post-launch validation method; attributed conversions alone do not prove lift.

Do not use precision that the evidence does not support. Prefer ranges and sensitivity notes. Never turn a benchmark into a promise, claim that Meiro alone causes the modeled result, or omit negative cash-flow periods.

## Deliverables

Provide the completed workbook and a short decision summary containing:

- model status and evidence cutoff;
- conservative, realistic and optimistic annual net contribution;
- realistic three-year NPV, ROI and indicative payback;
- the three assumptions with the greatest sensitivity;
- excluded benefits and costs;
- data still required from the client;
- recommended validation or holdout design;
- a clear statement that no Meiro state was changed.

If required inputs are missing, deliver an illustrative opportunity range and an input request, not a forecast.

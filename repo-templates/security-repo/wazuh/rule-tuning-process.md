# Rule Tuning Process

## Goal

Reduce unactionable noise while preserving the detection outcome. Tuning is a controlled detection-engineering change, not an analyst shortcut.

## Process

1. **Measure.** Record alert count, unique assets and sources, business impact, analyst time, true-positive rate, duplicate rate, and representative sanitized examples.
2. **Verify collection and decoding.** Fix timestamp, rotation, field extraction, format drift, or duplicate-ingest problems before changing rule logic.
3. **State the detection intent.** Define the behavior, assets, outcome, confidence, and response the rule is meant to support.
4. **Classify noise.** Separate expected business activity, health checks, trusted scanners, application routing behavior, WAF misclassification, and genuine low-risk hostile traffic.
5. **Choose the narrowest control.** Prefer field normalization, a child rule, an asset/environment condition, a frequency window, deduplication, or an expiring approved list.
6. **Test.** Re-run known true positives, false positives, boundary cases, malformed events, and representative volume in non-production.
7. **Review and approve.** Require the detection owner and affected service owner; add privacy, compliance, or incident-response review where material.
8. **Roll out gradually.** Observe alert volume, missed-event indicators, rule performance, and analyst outcomes by controlled group.
9. **Document and revisit.** Version the rule, link evidence and approval, identify the owner, and set a review date.

## Safe Tuning Order

Use this order to minimize detection loss:

1. correct the source and decoder;
2. remove duplicate ingestion;
3. normalize stable benign categories;
4. add precise asset, path, method, action, or status context;
5. aggregate repeated events and route summaries;
6. adjust frequency or timeframe using measured traffic;
7. change severity or notification threshold;
8. suppress only the narrow, documented exception.

Do not globally disable a rule merely because it is noisy. Broad exclusions, source-IP allowlists, and user-agent matching are fragile and can be attacker-controlled.

## Environment-Aware Tuning

Development scanners, staging test paths, production health checks, and internet-facing services have different baselines. Keep shared detection intent stable, then layer reviewed environment-specific conditions. Never let a development exception silently apply to production.

Evaluate:

- asset criticality and exposure;
- normal request methods, paths, response codes, and rates;
- deployment and test windows;
- trusted proxy and source attribution behavior;
- WAF action semantics and policy mode;
- known automation with strong, non-user-controlled identity;
- seasonality and expected campaign traffic.

## Ownership and Review

Every rule or rule family needs:

- a detection owner responsible for intent and quality;
- a service owner who understands expected behavior;
- source repository path, rule ID range, version, and change history;
- test fixtures and expected outcomes;
- review cadence and measurable health indicators;
- deprecation and rollback criteria.

Review high-volume or high-severity rules more frequently and after WAF upgrades, log-schema changes, architecture changes, incidents, major releases, or ownership changes.

## Exception Record

| Field | Required content |
| --- | --- |
| Exception ID | `<EXCEPTION_ID>` |
| Rule and scope | `<RULE_ID>` plus exact assets, paths, methods, or identities |
| Reason and evidence | Business reason and approved private evidence references |
| Risk | Detection loss and plausible abuse case |
| Compensating control | Monitoring or prevention that remains in place |
| Owner and approver | Named roles, not an unowned team queue |
| Start and expiry | Bounded dates; no silent permanent exception |
| Validation | Positive and negative tests after applying the exception |
| Review outcome | Renew, narrow, replace, or remove |

Track exceptions in an auditable system and alert before expiry. Removing a noisy alert from a notification channel does not remove the obligation to retain, review, or replace the underlying detection when required.

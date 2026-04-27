# Quality Gates

## Purpose

Define minimum quality checks before code or configuration moves toward production.

## Application Gates

- formatting and linting pass
- unit tests pass
- integration tests pass where applicable
- dependency review completed
- container image builds reproducibly
- release metadata is generated

## Deployment Gates

- manifests render successfully
- environment overlays are reviewed
- image digest is pinned where required
- rollback target is known
- production change approval is recorded

## Infrastructure Gates

- formatting and validation pass
- plan output is reviewed in private implementation context
- state backend is configured outside this blueprint
- access impact is understood
- rollback or remediation plan is documented

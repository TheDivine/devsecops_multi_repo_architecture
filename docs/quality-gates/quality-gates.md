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
- build handoff metadata satisfies the approved artifact policy
- required policy tests pass before publication

## Deployment Gates

- manifests render successfully
- environment overlays are reviewed
- image digest is pinned where required
- rollback target is known
- production change approval is recorded
- rendered manifests satisfy deployment policy tests
- policy exceptions are narrow, approved, and unexpired

## Infrastructure Gates

- formatting and validation pass
- plan output is reviewed in private implementation context
- state backend is configured outside this blueprint
- access impact is understood
- rollback or remediation plan is documented
- Terraform/OpenTofu plan JSON satisfies provider and organization policies
- destructive changes require explicit review and an approved exception where required

## Platform And Policy Gates

- policy syntax and schema validation pass
- positive, negative, and exception tests pass
- the policy-engine version is pinned and compatible with the target platform
- audit results and false positives are reviewed before enforcement
- admission and CI enforcement produce observable results

## Monitoring Gates

- alert and recording rules pass native tool validation
- alert rules include approved severity, owner, summary, description, and runbook metadata
- routing changes are tested without exposing private contacts in public repositories
- noisy or unactionable rules are not promoted as blocking controls

## Policy Failure Behavior

Each gate must declare whether a violation reports, warns, or blocks. New controls start in report or audit mode unless an existing approved baseline requires immediate enforcement. A blocking gate requires an owner, remediation guidance, an exception path, and a rollback or break-glass procedure.

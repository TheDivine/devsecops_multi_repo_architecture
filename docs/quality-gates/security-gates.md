# Security Gates

## Purpose

Define security checks expected before release or promotion.

## Required Gates

- dependency vulnerability scan
- container image scan
- infrastructure-as-code scan where applicable
- repository sensitive-data scan
- policy-as-code validation for Kubernetes resources
- review of privileged permissions
- review of exposed network surfaces

## Environment Gate Policy

| Environment | Required Behavior |
|---|---|
| Learning lab | collect findings, import reports to DefectDojo, do not fail immediately on every finding |
| Staging | fail on critical findings, warn on high findings initially, track medium and low findings by SLA |
| Production | fail on critical and high findings unless documented risk acceptance exists |

Production promotion also requires a known-good immutable image tag, successful staging deployment, successful DAST, reviewed DefectDojo findings, confirmed rollback path, monitoring and alert checks, separate production secrets, restricted security context, NetworkPolicy, ServiceAccount/RBAC, and resource requests/limits.

See [DefectDojo Setup And Integration Guide](../implementation/defectdojo-setup-and-integration-guide.md) and [Demo App Kubernetes Deployment Plan](../implementation/demo-app-kubernetes-deployment-plan.md).

## Exception Handling

Security exceptions must include:

- affected component
- risk summary
- compensating control
- expiry date
- owner
- approval reference

Do not store sensitive vulnerability evidence in public blueprint repositories.

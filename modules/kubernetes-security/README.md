# Kubernetes Security Module

## Purpose

Define reusable Kubernetes security controls for internal Kubernetes deployments and mature clients.

## Baseline Controls

- non-root workloads
- resource requests and limits
- readiness and liveness probes
- no `latest` image tags
- restricted privileges
- NetworkPolicies
- scoped ServiceAccounts
- RBAC review
- Pod Security admission labels or equivalent
- Kyverno or OPA/Gatekeeper policy-as-code

Start policy enforcement in audit mode and move to enforce after staging validation.

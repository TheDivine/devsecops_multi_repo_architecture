# ADR-009: Split Policy-As-Code Between CI And Runtime Admission

## Status

Accepted

## Context

The blueprint supports Kubernetes and non-Kubernetes clients. Some policies can run in CI for all repositories, while Kubernetes admission policies only apply to cluster environments.

## Decision

Policy-as-code is split into two layers:

- CI policy checks for repository content before merge.
- Runtime admission checks for Kubernetes workloads where a policy controller is installed.

Reusable examples belong in the platform repository template. Client-specific exceptions belong in private implementation repositories.

## Consequences

- VM/Docker Compose clients can still use CI policy checks without Kubernetes.
- Kubernetes clients can add Kyverno, Gatekeeper, or equivalent admission controls.
- Policy exceptions need owner, expiry, scope, and approval reference.
- Admission policies should start in audit mode unless the implementation team has already tested enforcement impact.

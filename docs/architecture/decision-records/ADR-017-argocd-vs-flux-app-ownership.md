# ADR-017: Argo CD First For Application Deployment Visibility

## Status

Accepted.

## Context

The cluster has both Argo CD and Flux/Weave GitOps capabilities. The lab needs one primary application deployment path to avoid conflicting controllers managing the same resources.

## Decision

Use Argo CD first for demo application deployment because it provides clear application inventory, sync status, diff visibility, and rollback-friendly operational workflows.

Flux may remain available for platform-level reconciliation or future use cases, but it must not own the same Kubernetes objects as Argo CD.

## Consequences

- Demo application repositories define Argo CD Applications.
- Argo CD owns the `demo-client-dev`, `demo-client-staging`, and `demo-client-prod` application resources.
- Flux ownership is kept separate unless a later architecture explicitly assigns it a non-overlapping scope.
- Operators can use Argo CD health and sync status as part of the release readiness evidence.

## Alternatives Considered

- Flux first: strong GitOps controller, but less beginner-friendly for visual application ownership.
- Both Argo CD and Flux for the same app: rejected because overlapping ownership can cause reconciliation conflicts.
- Manual `kubectl apply` only: useful for first validation, but not enough for production-shaped GitOps.

## When To Revisit

Revisit if the organization standardizes on Flux, if multi-cluster fleet management requires Flux patterns, or if Argo CD no longer fits operational requirements.

# ADR-004: Separate Application and Deployment Repositories

## Status

Accepted

## Context

Application repositories and deployment repositories change for different reasons. Application repositories change when source code, tests, dependencies, or build logic changes. Deployment repositories change when an approved artifact is promoted, environment overlays are updated, or runtime configuration is adjusted.

Combining these concerns gives application contributors unnecessary access to production deployment state and makes rollback history harder to reason about.

## Decision

Keep application source, tests, CI, and image publishing in application repositories.

Keep runtime manifests, GitOps definitions, overlays, environment promotion, and rollback history in deployment repositories.

## Consequences

This improves separation of duties, review clarity, and production control.

The tradeoff is that releases require coordination between the application repository and deployment repository.

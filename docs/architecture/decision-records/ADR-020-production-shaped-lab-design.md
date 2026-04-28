# ADR-020: Production-Shaped Lab Design From Day One

## Status

Accepted.

## Context

The repository must function as a public portfolio/reference blueprint and as an internal standard for future client projects. A toy lab would need to be redesigned before it could support professional implementation.

## Decision

Design the lab as production-shaped from day one while keeping implementation manual-first and staging-first.

Production-shaped means the templates and guides include environment overlays, immutable tags, non-root containers, probes, resource limits, ServiceAccounts, RBAC, NetworkPolicy, image pull secrets, observability, DAST, DefectDojo, rollback, release gates, and incident response expectations.

## Consequences

- The first staging deployment teaches the same patterns needed for production.
- Production is supported structurally but not enabled blindly.
- The repository remains reusable for client work because the architecture does not depend on shortcuts that must later be removed.
- Documentation must clearly label what is required for the learning lab, staging, production, and optional advanced production hardening.

## Alternatives Considered

- Toy lab first: easier to start, but creates rework and poor habits.
- Full production implementation first: too risky without evidence from staging.
- Documentation-only blueprint: useful as reference, but not enough for hands-on learning.

## When To Revisit

Revisit if the lab becomes too complex for onboarding, or if client delivery requires a narrower implementation profile for a specific environment.

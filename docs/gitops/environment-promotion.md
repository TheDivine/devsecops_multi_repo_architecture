# Environment Promotion

## Purpose

Describe how a release moves from lower environments to production using repository-reviewed changes.

## Promotion Sequence

1. CI produces a scanned image.
2. Staging overlay is updated with the image digest.
3. Staging validation confirms functional, security, and operational gates.
4. Production overlay is updated through a separate reviewed change.
5. GitOps reconciles the approved production state.
6. Release notes and rollback reference are recorded.

## Required Controls

- immutable image references
- environment-specific overlays
- approval gates for production
- rollback instructions
- audit trail in Git

## Anti-Patterns

- rebuilding images between staging and production
- deploying directly from developer workstations
- storing environment values in application repositories
- mixing infrastructure provisioning with application promotion

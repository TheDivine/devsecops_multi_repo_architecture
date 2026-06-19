# Deployment Flow

## Purpose

Describe how application artifacts become runtime changes.

## Standard Flow

1. Application CI publishes an immutable image.
2. Deployment owner updates the staging overlay.
3. Manifest and policy checks run.
4. Staging is validated.
5. Production overlay is updated in a separate reviewed change.
6. GitOps reconciles the merged desired state.

## Ownership

Application teams provide image metadata. Deployment owners control environment promotion.

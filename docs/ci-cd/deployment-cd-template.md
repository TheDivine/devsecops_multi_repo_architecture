# Deployment CD Template

## Purpose

Deployment CD updates environment state through reviewed repository changes and GitOps reconciliation.

## Standard Stages

1. Receive or select an approved image reference.
2. Update the target environment overlay.
3. Validate manifests with policy and schema checks.
4. Open a reviewed change for the target environment.
5. Merge after approval.
6. Allow GitOps tooling to reconcile the desired state.
7. Record deployment metadata and rollback target.

## Rules

- CD does not rebuild application images.
- Production promotion requires explicit approval.
- Manifest validation must run before merge.
- Rollback must be possible from Git history.

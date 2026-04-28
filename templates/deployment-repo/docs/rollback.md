# Rollback

## Purpose

Document how to restore a known-good runtime state.

## Application Rollback

1. Identify the previous approved image digest.
2. Update the affected environment overlay.
3. Run manifest validation.
4. Merge the reviewed rollback change.
5. Verify service health after GitOps reconciliation.

## Notes

Rollback may not be safe if database migrations, external dependencies, or incompatible configuration changes were introduced.

# Rollback Strategy

## Purpose

Define a predictable rollback approach for application and platform changes.

## Application Rollback

Application rollback should use the deployment repository to restore a previously approved image digest or manifest version.

## Infrastructure Rollback

Infrastructure rollback is handled as a separate operational process. Do not assume every infrastructure change can be safely reverted automatically.

## Platform Rollback

Platform rollback requires compatibility checks for CRDs, controllers, policies, and shared dependencies.

## Rollback Readiness

- Previous image digest is known.
- Database migration impact is understood.
- Configuration compatibility is reviewed.
- Observability confirms the failure mode.
- Incident owner approves the rollback.

# Deployment Runbook

## Purpose

Standard procedure for deploying an application to an environment.

## Steps

1. Confirm image tag exists in registry.
2. Confirm security scans passed.
3. Confirm DefectDojo findings have no blocking issues.
4. Update deployment repo environment overlay.
5. Apply deployment through Compose, Helm, or GitOps.
6. Verify health endpoint.
7. Verify logs and metrics.
8. Record deployment result.

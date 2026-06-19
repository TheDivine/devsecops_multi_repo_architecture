# Policy-As-Code Module

## Purpose

Provide reusable policy examples for CI and Kubernetes admission control.

## Layers

- Docker Compose CI checks for images, privilege, health checks, and restart policy.
- Kubernetes CI checks for manifests before merge.
- Kyverno admission policies in audit mode first, enforcement later.

Policy exceptions need owner, expiry, scope, compensating control, and approval reference.

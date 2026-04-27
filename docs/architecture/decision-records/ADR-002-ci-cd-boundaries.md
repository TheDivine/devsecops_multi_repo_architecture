# ADR-002: CI Lives With the App, CD Lives With Deployment

## Status

Accepted

## Context

Application teams need fast feedback for builds, tests, and security scans. However, production deployment should be controlled separately from application development.

## Decision

CI belongs in the application repository.

CI responsibilities:
- test application
- build container image
- run SAST
- run SCA
- run secret scanning
- run Docker image scan
- generate SBOM
- push image to registry
- publish scan reports
- optionally notify deployment repository of new image tag

CD belongs in the deployment repository.

CD responsibilities:
- deploy image version to dev/staging/prod
- apply Docker Compose or Kubernetes manifests
- manage environment overlays
- enforce deployment approvals
- handle rollback
- update GitOps desired state

## Consequences

Benefits:
- developers control build feedback
- platform team controls environment promotion
- production changes are auditable
- deployment logic is not hidden inside application repos

Tradeoffs:
- requires image tagging standard
- requires deployment trigger convention
- requires clear promotion workflow

# Image Promotion Model

## Purpose

Separate image creation from environment promotion.

## Flow

1. The application repository builds and scans an immutable image.
2. The image is published with a version tag and digest.
3. The deployment repository updates environment manifests to reference the approved image.
4. GitOps tooling reconciles the target environment from the deployment repository.
5. Rollback uses a previous approved image reference from Git history.

## Rules

- Application CI does not directly deploy to production.
- Deployment changes are reviewed in the deployment repository.
- Environments promote by changing image references, not by rebuilding images.
- Production promotion requires release-readiness approval.

## Metadata To Track

- source commit
- image tag
- image digest
- scan result
- target environment
- approver
- rollback candidate

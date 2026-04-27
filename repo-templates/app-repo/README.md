# Application Repository Template

This repository contains application code, local development setup, CI, and security scanning.

## Responsibilities

This repo owns:
- application source code
- Dockerfile
- tests
- CI workflow
- security scanning
- SBOM generation
- image build and push

This repo does not own:
- production infrastructure
- production deployment manifests
- Terraform state
- production secrets

## Standard Flow

1. Developer opens pull request.
2. CI runs tests and scans.
3. If successful, image is built and pushed to the registry.
4. Deployment repo promotes the image to an environment.

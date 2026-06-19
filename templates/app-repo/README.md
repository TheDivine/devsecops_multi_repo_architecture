# Application Repository Template

This repository contains application code, local development setup, CI, image build, SBOM generation, and security scanning. It is intentionally production-shaped but does not own production deployment state.

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

## Required Private CI Values

Set these in the private CI system, not in the repository:

| Name | Purpose |
|---|---|
| `IMAGE_NAME` | Repository/image name used for local CI image tags |
| `REGISTRY_HOST` | Private registry host when push is enabled |
| `REGISTRY_USERNAME` | Registry username for protected push jobs |
| `REGISTRY_PASSWORD` | Registry password or token for protected push jobs |
| `DEFECTDOJO_URL` | Optional private DefectDojo URL |
| `DEFECTDOJO_API_KEY` | Optional private DefectDojo API key |

## Production Handoff

The application repository publishes immutable images and scan evidence. The deployment repository decides when an image moves to staging or production by changing Compose image tags, Helm values, or Kustomize image patches.

## Local Development

```sh
docker compose up --build
curl http://localhost:8000/health
curl http://localhost:8000/ready
```

Production secrets, deployment manifests, and rollout scripts do not belong in this repository.

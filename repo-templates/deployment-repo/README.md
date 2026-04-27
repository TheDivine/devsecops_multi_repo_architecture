# Deployment Repository Template

This repository owns environment deployment state.

## Responsibilities

- Docker Compose production/staging manifests
- Kubernetes Helm charts and values
- environment overlays
- release promotion
- rollback
- deployment runbooks
- GitOps desired state

## Modes

This repo can support either:

1. Docker Compose mode
2. Kubernetes mode

Use only the mode required by the target environment.

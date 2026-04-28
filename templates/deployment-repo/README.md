# Deployment Repository Template

This repository owns environment deployment state for VM/Docker Compose clients and Kubernetes-based clients.

## Responsibilities

- Docker Compose production/staging manifests
- Kubernetes Helm charts and values
- environment overlays
- release promotion
- rollback
- deployment runbooks
- GitOps desired state
- DAST after staging deployment
- manual production approval gate

## Modes

This repo can support either:

1. Docker Compose mode
2. Kubernetes mode

Use only the mode required by the target environment in the private implementation repo. Keep both examples in this public template so teams can choose based on client maturity.

## Docker Compose Mode

Use this mode for VM-based clients.

Production ownership:

- `docker-compose/` stores service definitions and Traefik labels.
- `overlays/environments/` stores environment-specific non-secret values.
- Private `.env` files, registry credentials, TLS material, and host-specific data stay out of Git.
- Rollback means pinning the previous immutable image tag and running the documented Compose rollback command.

See `docs/vm-docker-compose/production-runbook.md`.

## Kubernetes Mode

Use this mode for clients with a cluster and GitOps platform.

Production ownership:

- `kubernetes/base/` stores shared desired state.
- `kubernetes/overlays/` stores environment image tags, replica counts, patches, and namespace-specific differences.
- `kubernetes/chart/` stores the Helm packaging option for teams that deploy through Helm values.
- `argocd/` stores GitOps application references.
- Runtime secrets come from a private secret manager integration, not committed YAML.

See `docs/kubernetes/gitops-runbook.md`.

## Promotion Rule

App repositories publish images. Deployment repositories promote images.

Do not rebuild application images in this repo. Change only immutable image references, values, overlays, and runtime configuration.

## CD Flow

1. Promote an immutable image tag to dev or staging.
2. Run deployment health checks.
3. Run OWASP ZAP or equivalent DAST against staging.
4. Require a manual approval gate for production.
5. Deploy production.
6. Roll back with the previous immutable image tag, previous Helm revision, or previous GitOps revision.

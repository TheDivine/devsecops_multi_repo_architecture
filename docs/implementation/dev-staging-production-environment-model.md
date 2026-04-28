# Dev, Staging, Production Environment Model

## Recommendation

Start with staging first. Staging validates the complete E2E DevSecOps flow: CI, registry, deployment repo, Argo CD, Traefik, observability, DAST, DefectDojo, and rollback.

Then add dev for fast iteration.

Then add production only after staging is stable, rollback works, observability works, DAST works, DefectDojo imports work, and the manual release gate is documented.

## Namespace Model

Use the same cluster for the lab:

- `demo-client-dev`
- `demo-client-staging`
- `demo-client-prod`

Each namespace has its own:

- imagePullSecret
- Kustomize overlay
- Argo CD Application
- hostname
- release gate
- security strictness
- secrets

## Environment Responsibilities

Dev:

- fast iteration
- lower gates
- short-lived testing
- relaxed DAST expectations

Staging:

- full E2E validation
- production-like manifests
- DAST required
- DefectDojo import required
- observability and rollback validated

Production:

- separate namespace
- separate secrets
- immutable known-good image tag
- manual approval gate
- no latest tag
- confirmed rollback
- confirmed monitoring and alerts
- security findings reviewed

## When Separate Clusters Become Necessary

Use separate clusters when:

- client isolation requires it
- compliance requires physical or administrative separation
- production blast radius cannot share cluster control plane
- noisy dev workloads affect production
- network/security policy complexity becomes unmanageable


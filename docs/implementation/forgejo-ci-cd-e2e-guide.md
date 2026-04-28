# Forgejo CI/CD E2E Guide

## Forgejo Role

Forgejo is the preferred source control, registry, and CI/CD coordination point for this lab.

Required for staging:

- Forgejo repository for `demo-client-app`
- Forgejo repository for `demo-client-deployment`
- Forgejo runner
- Forgejo package/container registry
- repository secrets

## Required Secrets

Use real values only in private Forgejo repositories:

```text
FORGEJO_REGISTRY_HOST
FORGEJO_REGISTRY_USERNAME
FORGEJO_REGISTRY_PASSWORD
DEFECTDOJO_URL
DEFECTDOJO_API_KEY
DEFECTDOJO_PRODUCT_NAME
DEFECTDOJO_ENGAGEMENT_NAME
```

## Image Naming

```text
forgejo.example.com/org/demo-client-app:<git-sha>
forgejo.example.com/org/demo-client-app:<semver>
```

Do not use `latest` for staging or production.

## Pipeline Stages

Required for learning lab:

- checkout
- unit tests
- secret scanning
- SAST
- SCA/dependency scan
- container build
- container image scan
- report artifacts

Required for staging:

- push image to Forgejo registry
- import reports to DefectDojo
- manually update deployment repo image tag

Required for production:

- immutable image tag or digest
- successful staging evidence
- DefectDojo review
- manual approval gate

## Recommended Stage Logic

Use this order for the first app pipeline:

1. Checkout source. Required for learning lab.
2. Install dependencies. Required for learning lab.
3. Run unit tests. Required for learning lab.
4. Run secret scanning. Required for staging.
5. Run SAST. Required for staging.
6. Run dependency/SCA scan. Required for staging.
7. Build image with a commit SHA tag. Required for staging.
8. Run container image scan. Required for staging.
9. Upload reports as CI artifacts. Required for staging.
10. Import reports to DefectDojo. Required for staging.
11. Push image to Forgejo registry only after build and scan stages complete. Required for staging.
12. Manually update deployment repo image tag. Required for learning lab.

Beginner logic:

- Tests prove the app still behaves as expected.
- Secret scanning prevents accidental credential exposure.
- SAST looks for insecure code patterns.
- SCA checks third-party dependencies.
- Container scanning checks the final runtime image.
- DefectDojo keeps findings after the CI job log disappears.
- The deployment repo update is the release handoff.

## Deployment Trigger Models

Model A: CI updates deployment repo image tag.

- Useful later.
- Faster and more automated.
- Requires careful credentials and branch protections.

Model B: Human manually updates deployment repo image tag.

- Recommended first.
- Teaches the app-to-deployment handoff.
- Makes promotion review explicit.

Production must require manual approval even when Model A is implemented.

## Branch And Tag Policy

Required for staging:

- `main` can build staging candidates.
- release tags can build production candidates later.
- image tags must use commit SHA, semantic version, or digest.
- `latest` is blocked for staging and production.

Required for production:

- protected main branch
- protected release tags
- manual approval
- review of DefectDojo findings
- successful staging evidence
- rollback commit identified

## Staging Deployment Trigger Recommendation

Use Model B first:

1. CI publishes `forgejo.example.com/org/demo-client-app:<git-sha>`.
2. Operator opens deployment repo.
3. Operator updates staging overlay image tag.
4. Operator runs `kustomize build kubernetes/overlays/staging`.
5. Operator commits the deployment repo change.
6. Argo CD syncs staging.

Only move to Model A after this manual flow is repeatable and reviewed.

# CI/CD Workflow

## Application CI

1. Pull request opens.
2. Tests, secret scan, SAST, dependency scan, container scan, IaC scan, and SBOM generation run.
3. Scan reports are uploaded as artifacts and optionally imported into DefectDojo.
4. Main branch builds and pushes an immutable image tag based on commit SHA.

## Deployment CD

1. Deployment repo promotes an immutable image tag to dev or staging.
2. Health checks run after deployment.
3. DAST runs against staging.
4. Production requires manual approval.
5. Rollback uses the previous immutable image tag or previous Helm/GitOps revision.

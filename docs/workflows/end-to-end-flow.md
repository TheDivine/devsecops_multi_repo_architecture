# End-to-End Workflow

## Application Change Flow

1. Developer commits code in application repo.
2. App CI runs:
   - tests
   - Gitleaks
   - Semgrep
   - Trivy fs
   - Checkov
   - Docker build
   - Trivy image scan
   - SBOM generation
3. Image is pushed to registry.
4. Security reports are uploaded to DefectDojo when the project uses centralized AppSec triage.
5. Deployment repo is updated with image tag.
6. Deployment pipeline or GitOps sync deploys to environment.

## Infrastructure Change Flow

1. Platform engineer opens PR in infrastructure repo.
2. IaC scanning runs.
3. Terraform/OpenTofu plan is reviewed.
4. Approval required for staging/prod.
5. Apply is executed by authorized pipeline or platform engineer.

## Deployment Change Flow

1. Deployment repo receives image tag update.
2. Environment overlay is reviewed.
3. Deployment checks run.
4. Compose/Helm/GitOps applies the change.
5. Monitoring confirms health.

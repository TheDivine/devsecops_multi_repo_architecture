# Demo Client Implementation Guide

This guide shows how to turn the platform template into a working client setup.

## 1. Create `demo-client-app`

Copy `templates/app-repo` into a new application repository.

Replace:

- `demo-client-app`
- `registry.example.com`
- `app.example.com`

Keep production deployment files out of the app repo.

## 2. Run Locally

```sh
docker compose up --build
curl http://localhost:8000/health
curl http://localhost:8000/ready
```

## 3. Configure Gitea Secrets

Set these in the application repository:

- `REGISTRY_HOST`
- `REGISTRY_USERNAME`
- `REGISTRY_PASSWORD`
- `DEFECTDOJO_URL`
- `DEFECTDOJO_API_KEY`

Set safe repo variables:

- `IMAGE_NAME`
- `DEFECTDOJO_PRODUCT_NAME`
- `DEFECTDOJO_ENGAGEMENT_NAME`

## 4. Run CI

Open a pull request. CI should run:

- tests
- Gitleaks
- Semgrep
- Trivy filesystem scan
- Checkov
- Docker image build
- Trivy image scan
- SBOM generation
- artifact upload

On `main`, CI pushes an immutable image tag based on commit SHA to the Gitea registry.

## 5. Configure DefectDojo

Create a product and engagement in DefectDojo.

Use:

```sh
scripts/defectdojo/reimport-scan.sh trivy trivy-image.json main <commit-sha>
scripts/defectdojo/reimport-scan.sh semgrep semgrep.json main <commit-sha>
scripts/defectdojo/reimport-scan.sh gitleaks gitleaks.json main <commit-sha>
scripts/defectdojo/reimport-scan.sh checkov checkov.json main <commit-sha>
scripts/defectdojo/reimport-scan.sh zap zap-staging.json main <commit-sha>
```

## 6. Create `demo-client-deployment`

Copy `templates/deployment-repo` into a new deployment repository.

Choose runtime path:

- Docker Compose for VM clients.
- Kubernetes Helm/Kustomize for cluster clients.

## 7. Deploy With Docker Compose

Create private files from:

- `docker-compose/.env.staging.example`
- `docker-compose/.env.prod.example`

Deploy staging:

```sh
scripts/deploy.sh staging <commit-sha>
```

Verify Traefik routing:

```sh
curl https://staging.app.example.com/health
```

## 8. Run DAST On Staging

```sh
docker run --rm -t owasp/zap2docker-stable zap-baseline.py \
  -t https://staging.app.example.com \
  -J zap-staging.json \
  -r zap-staging.html
```

Import the ZAP report into DefectDojo. Do not run DAST against production unless explicitly approved.

## 9. Production Gate

Production requires:

- green app CI
- staging deployment verified
- DAST results reviewed
- monitoring enabled
- rollback tag known
- manual approval in the deployment repo

Deploy production:

```sh
scripts/deploy.sh prod <commit-sha>
```

Rollback:

```sh
scripts/rollback.sh prod <previous-commit-sha>
```

## 10. Enable Monitoring

Use `modules/monitoring` and `templates/monitoring-repo` to configure:

- Prometheus scrape targets
- Grafana dashboard
- Loki/Alloy log flow
- Alertmanager routes
- optional Wazuh integration

## 11. Add Kubernetes Later

When the client moves to Kubernetes:

1. Use `templates/deployment-repo/kubernetes/chart`.
2. Set `values-dev.yaml`, `values-staging.yaml`, and `values-prod.yaml`.
3. Configure image pull secrets privately.
4. Enable NetworkPolicy, RBAC, Pod Security, and Kyverno.
5. Promote image tags through pull requests.

## 12. Adapt For A Trading Dashboard App

Use the same split:

- trading dashboard code in the app repo
- image build and SBOM in app CI
- Docker Compose or Kubernetes deployment in deployment repo
- market data credentials only in private runtime secrets
- monitoring for app health, ingestion lag, 5xx rate, and disk pressure
- docs repo for runbooks, data-flow decisions, and incident response

Do not put broker credentials, API keys, production hostnames, or customer data in the public platform template.

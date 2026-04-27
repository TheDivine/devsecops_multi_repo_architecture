# Recommended Repositories

## 1. Application Repository

Example:

```text
client-a-web-api/
```

Contains:
- application source code
- Dockerfile
- local docker-compose for developer use
- unit/integration tests
- CI workflow
- security scanning workflow
- `.env.example`
- application README
- app-specific runbook
- AGENTS.md / SKILLS.md

Does not contain:
- production infrastructure credentials
- Terraform state/config
- production compose or Kubernetes manifests, except optional examples
- privileged deployment secrets

## 2. Infrastructure Repository

Example:

```text
client-a-infrastructure/
```

Contains:
- Terraform/OpenTofu modules
- Ansible playbooks
- VM provisioning
- DNS records as code if applicable
- firewall/security group rules
- backup infrastructure
- registry/proxy/monitoring infrastructure definitions

Does not contain:
- application business logic
- developer-facing application code

## 3. Deployment Repository

Example:

```text
client-a-deployment/
```

Contains:
- Docker Compose production/staging manifests
- Kubernetes Helm charts or values
- environment overlays
- deployment runbooks
- release manifests
- GitOps definitions if using Argo CD or Flux

For Docker Compose clients:
```text
deploy/
  docker-compose/
    app/
    defectdojo/
    monitoring/
  overlays/
    dev/
    staging/
    prod/
```

For Kubernetes:
```text
deploy/
  helm/
    app/
  values/
    dev.yaml
    staging.yaml
    prod.yaml
  gitops/
    argocd/
    flux/
```

## 4. Documentation Repository

Example:

```text
client-a-docs/
```

Contains:
- architecture decisions
- diagrams
- onboarding docs
- runbooks
- operational procedures
- incident response docs
- security model
- access model
- environment documentation

## 5. Platform / DevSecOps Repository

Example:

```text
platform-devsecops/
```

Contains:
- reusable CI templates
- scanner policies
- DefectDojo scripts
- AppSec modules
- monitoring templates
- Kubernetes security modules
- policy-as-code modules
- starter templates

This repo acts as the internal product for platform engineering.

## 6. Security Repository

Example:

```text
client-a-security/
```

Contains:
- host hardening baselines
- audit rules
- malware scanning standards
- endpoint monitoring guidance
- security onboarding checklists
- exception workflow templates

Does not contain:
- real incident evidence
- customer-specific indicators
- live enrollment credentials
- private host inventories

## 7. Monitoring Repository

Example:

```text
client-a-monitoring/
```

Contains:
- Prometheus rules and scrape templates
- Grafana dashboard templates
- Loki logging standards
- Alertmanager routing templates
- observability ownership documentation

Does not contain:
- live datasource credentials
- private contact details
- real production logs
- customer-specific alert history

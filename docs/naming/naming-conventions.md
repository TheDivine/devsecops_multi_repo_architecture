# Naming Conventions

## Repositories

```text
client-a-app-name
client-a-infrastructure
client-a-deployment
client-a-docs
platform-devsecops
```

## Images

```text
<registry-url>/<project-name>/app-name:<git-sha>
<registry-url>/<project-name>/app-name:staging
<registry-url>/<project-name>/app-name:prod
```

## Environments

- dev
- staging
- prod

## DefectDojo

Product Type:
- Client or organization name

Product:
- application/repository/service name

Engagement:
- dev
- staging
- prod

Tests:
- Gitleaks
- Semgrep
- Trivy FS
- Trivy Image
- Checkov
- DAST

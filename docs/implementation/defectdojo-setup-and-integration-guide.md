# DefectDojo Setup And Integration Guide

## Deployment Recommendation

Start with DefectDojo on a separate VM. Kubernetes deployment can come later after the team understands upgrade, storage, backup, and access requirements.

## Minimal VM Shape

Learning lab:

- 2 vCPU
- 4 GB RAM
- 40 GB disk

Staging or team use:

- 4 vCPU
- 8 GB RAM
- 100 GB disk
- backup policy

## Access Model

Use VPN or restricted network access first. Expose through DNS and TLS only after authentication, backup, and update procedures are clear.

Required placeholders:

```text
DEFECTDOJO_URL
DEFECTDOJO_API_KEY
DEFECTDOJO_PRODUCT_NAME
DEFECTDOJO_ENGAGEMENT_NAME
```

## Naming Model

Product type:

```text
Demo Client
```

Product:

```text
demo-client-app
```

Engagement:

```text
demo-client-staging
```

## Report Types

Supported import candidates:

- Gitleaks
- Semgrep
- Trivy filesystem scan
- Trivy image scan
- Dependency scan
- OWASP ZAP baseline

## Severity Policy

Learning lab:

- do not fail immediately on every finding
- import and review findings

Staging:

- fail on critical
- warn on high initially

Production:

- fail on critical and high unless documented risk acceptance exists
- medium and low findings tracked by SLA

## Ownership

Security owns severity policy and risk acceptance. App teams own fixes. Platform owns CI integration patterns.


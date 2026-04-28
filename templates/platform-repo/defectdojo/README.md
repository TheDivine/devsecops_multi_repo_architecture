# DefectDojo Integration

This directory standardizes how CI jobs import security scan reports into DefectDojo.

## Ownership

The platform repository owns:

- import scripts
- scan-type naming
- required CI variables
- severity gating defaults
- product and engagement naming conventions

Application, deployment, and infrastructure repositories own producing scan reports.

## Required Private CI Variables

Set these in the private CI system. Do not commit real values.

| Variable | Purpose |
|---|---|
| `DEFECTDOJO_URL` | Base URL for the private DefectDojo instance |
| `DEFECTDOJO_API_KEY` | API key with permission to import scans |
| `DEFECTDOJO_PRODUCT_NAME` | Product name, for example `<project-name>` |
| `DEFECTDOJO_ENGAGEMENT_NAME` | Engagement name, for example `<environment-name>-ci` |

## Example Import

```sh
DEFECTDOJO_URL="https://defectdojo.internal.example" \
DEFECTDOJO_API_KEY="<private-ci-secret>" \
DEFECTDOJO_PRODUCT_NAME="<project-name>" \
DEFECTDOJO_ENGAGEMENT_NAME="<environment-name>-ci" \
./scripts/import-scan.sh \
  --scan-type "Trivy Scan" \
  --report-file trivy-image.sarif \
  --branch main \
  --commit "<git-sha>"
```

Replace the placeholder URL and token in private CI only.

## Recommended Scan Types

| Tool | Output | DefectDojo Scan Type |
|---|---|---|
| Gitleaks | JSON | `Gitleaks Scan` |
| Semgrep | JSON or SARIF | `Semgrep JSON Report` |
| Trivy filesystem | SARIF or JSON | `Trivy Scan` |
| Trivy image | SARIF or JSON | `Trivy Scan` |
| Checkov | SARIF or JSON | `Checkov Scan` |
| Grype | JSON | `Anchore Grype` |
| CycloneDX SBOM | JSON | `CycloneDX Scan` |

## Gate Policy

DefectDojo should centralize triage and trend tracking. CI may still fail before import for clearly blocking issues such as:

- exposed secrets
- critical exploitable dependency findings
- critical container image findings
- privileged Kubernetes workload policy violations

Exceptions must include owner, scope, expiry, compensating control, and approval reference.

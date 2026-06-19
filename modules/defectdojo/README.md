# DefectDojo Module

## Purpose

Centralize security report import patterns for Gitea/GitHub-compatible CI.

## Environment Variables

- `DEFECTDOJO_URL`
- `DEFECTDOJO_API_KEY`
- `DEFECTDOJO_PRODUCT_NAME`
- `DEFECTDOJO_ENGAGEMENT_NAME`

Use private CI secrets for all values except product and engagement names when those are safe to expose.

## Supported Inputs

- Trivy JSON
- Semgrep JSON or SARIF
- Gitleaks JSON
- Checkov JSON or SARIF
- OWASP ZAP JSON

Use [scripts/defectdojo/reimport-scan.sh](../../scripts/defectdojo/reimport-scan.sh).

# AppSec Scanning Module

## Purpose

Standardize application security scanning across application repositories.

## Baseline Tools

- Gitleaks for secret scanning
- Semgrep for SAST
- Trivy for filesystem and container scanning
- Checkov for IaC scanning
- OWASP ZAP for staging DAST
- Trivy or Syft for SBOM generation

## Gate Strategy

- Secrets: fail immediately.
- Critical: report first, then block after baseline is established.
- High: report initially, then block production after baseline is established.
- Medium: track.
- Low: optional tracking.

New projects start with stricter gates. Legacy projects use a no-worse-than-baseline approach.

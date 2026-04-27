# Security Policy

This repository is a public-safe DevSecOps architecture blueprint. It must never contain real credentials, customer identifiers, private infrastructure details, or live deployment configuration.

## Supported Scope

Security feedback is accepted for:

- unsafe example patterns
- missing repository boundary guidance
- documentation that could encourage unsafe operations
- template files that could accidentally expose sensitive data
- quality-gate or review checklist gaps

## Reporting

Open an issue or contact the repository maintainers through the approved internal channel for the organization using this blueprint. Do not include real credentials, logs containing sensitive data, or private customer details in reports.

## Public-Safety Rules

- Use placeholders such as `<registry-url>`, `<environment-name>`, and `<project-name>`.
- Do not commit kubeconfig files, Terraform state, Ansible vaults, private keys, real tokens, or provider credentials.
- Keep client-specific topology, domains, and incident details in private implementation repositories.
- Run the repository sanitization checklist before publishing or sharing externally.

See [docs/security/repository-sanitization-checklist.md](docs/security/repository-sanitization-checklist.md).

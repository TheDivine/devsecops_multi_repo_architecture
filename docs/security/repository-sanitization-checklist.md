# Repository Sanitization Checklist

Use this checklist before publishing, sharing, or converting a private project into a public reference.

## Content Review

- No real customer names, domains, IP addresses, account IDs, or hostnames.
- No private topology diagrams.
- No provider-specific live identifiers.
- No production logs, incident data, or screenshots.
- No generated state files or local cache artifacts.

## Credential Review

- No private keys or certificates.
- No kubeconfig files.
- No Ansible vault files.
- No Terraform/OpenTofu state files.
- No live CI variables or registry credentials.
- No copied terminal output containing sensitive headers.

## Template Review

- Example values use placeholders.
- Risky commands are documented as manual private-repo activities, not included as runnable automation.
- Deployment examples are clearly non-production.
- README files explain ownership and boundaries.

## Final Local Checks

Run safe local scans before publishing:

```sh
git status --short
find . -maxdepth 3 -type f | sort
make check-placeholders
make grep-secrets
```

# GitHub Publishing Checklist

Use this checklist before publishing this blueprint as a public GitHub repository.

## Repository Shape

- `README.md` is at the Git repository root.
- `docs/` and `templates/` are at the Git repository root.
- No nested duplicate project directory exists.
- Local artifacts such as `.codex` are not staged.

## Public Safety

- No real credentials, domains, IP addresses, customer names, or provider identifiers are present.
- No Terraform/OpenTofu state files are present.
- No Ansible vault files are present.
- No kubeconfig files are present.
- Placeholder values use angle-bracket format such as `<project-name>`.

## Recommended GitHub Settings

- Add repository description: `Public-safe DevSecOps multi-repo architecture blueprint and templates.`
- Add topics such as `devsecops`, `gitops`, `kubernetes`, `sre`, `platform-engineering`, `terraform`, `ansible`, `traefik`.
- Enable secret scanning if available.
- Enable branch protection after the first push.
- Confirm the license is appropriate for the intended reuse model.

## Final Local Checks

```sh
git status --short
make validate-docs
make check-placeholders
make grep-secrets
```

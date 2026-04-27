# Local Development Tooling

## Purpose

Define safe local tooling expectations for contributors using this blueprint.

## Recommended Local Tools

- Git
- Docker
- a Markdown editor
- a YAML-aware editor
- shellcheck or equivalent shell linting where scripts exist
- Terraform/OpenTofu formatter for infrastructure repositories
- Ansible syntax validation for infrastructure or security repositories

## Safety Rules

- Local commands in this blueprint should not deploy or mutate external systems.
- Real environment values must stay in private implementation repositories.
- Use examples for structure only.
- Review generated files before committing.

## Suggested Checks

```sh
git status --short
find . -maxdepth 3 -type f | sort
make check-placeholders
make grep-secrets
```

# Repository Separation Model

## Recommended Organization Layout

```text
organization/
  platform-devsecops/
  docs-platform/
  client-or-product-app/
  client-or-product-infra/
  client-or-product-deploy/
  client-or-product-security/
  client-or-product-monitoring/
```

For larger organizations:

```text
organization/
  platform/
    devsecops-platform
    ci-templates
    security-policies
    monitoring-platform
  docs/
    architecture-docs
    runbooks
    security-docs
  clients/
    client-a-app
    client-a-infra
    client-a-deploy
    client-a-security
    client-a-monitoring
    client-b-app
    client-b-infra
    client-b-deploy
```

## Why split repositories?

The split exists to enforce ownership, access control, and blast-radius reduction.

Application developers need access to:
- application source code
- application Dockerfile
- application CI pipeline
- development environment examples

Platform/DevOps engineers need access to:
- Terraform/OpenTofu
- Ansible
- cloud/provider credentials
- production secrets
- deployment manifests
- environment overlays

Security engineers need access to:
- policies
- scanner configuration
- DefectDojo integration
- security baselines
- exception tracking

Operations/monitoring engineers need access to:
- metrics and alert rules
- dashboard templates
- log aggregation configuration
- alert routing standards
- service health documentation

Documentation can be shared more broadly without granting access to production infrastructure.

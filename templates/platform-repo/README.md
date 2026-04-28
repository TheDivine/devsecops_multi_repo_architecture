# Platform DevSecOps Repository Template

This repository contains reusable platform modules and standards consumed by app, deployment, infrastructure, security, and monitoring repositories.

## Contents

- CI templates
- security scanner policies
- DefectDojo integration scripts
- monitoring modules
- Kubernetes security modules
- policy-as-code templates
- starter templates

This is the internal platform product.

## Production-Hardening Modules

| Module | Purpose |
|---|---|
| `ci-templates/` | reusable CI fragments for scanning and evidence generation |
| `scanner-policies/` | tool-specific severity, exception, and output standards |
| `defectdojo/` | central import script, scan type map, and CI variable contract |
| `policies/` | policy-as-code examples for CI and Kubernetes admission |
| `gitops/` | Argo CD or Flux project boundary examples |
| `observability/` | shared observability standards consumed by monitoring repos |
| `security/` | platform security baseline references |

## Does Not Own

- application source code
- private client secrets
- production Terraform state
- client-specific exception approvals
- live incident evidence

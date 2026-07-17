# Infrastructure Repository Template

This repository owns infrastructure provisioning and configuration.

## Responsibilities

- VM provisioning
- cloud resources
- DNS records
- firewalls/security groups
- Terraform/OpenTofu modules
- Ansible playbooks
- backup infrastructure
- registry or monitoring infrastructure provisioning

## Access

Restrict this repository to platform/DevOps engineers only.

Developers should not need access unless explicitly required.

## Policy As Code

Infrastructure repositories own plan-time policy integration and provider-specific guardrails. Evaluate Terraform/OpenTofu plan JSON before apply, keep real plans private, and require explicit review for destructive or high-impact changes.

See [`policies/README.md`](policies/README.md) for a provider-neutral destructive-change example and the boundary for provider-specific controls.

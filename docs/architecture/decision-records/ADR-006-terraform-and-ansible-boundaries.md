# ADR-006: Separate Terraform/OpenTofu and Ansible Boundaries

## Status

Accepted

## Context

Terraform/OpenTofu and Ansible operate at different lifecycle layers. Terraform/OpenTofu provisions infrastructure resources and tracks state. Ansible configures hosts, applies baselines, and manages post-provisioning configuration.

Mixing these responsibilities without clear boundaries makes state, drift, and change review harder to manage.

## Decision

Use Terraform/OpenTofu for provisioning and resource lifecycle management.

Use Ansible for host configuration, baseline application, and operational configuration tasks.

Document state management separately from configuration management.

## Consequences

This creates clearer ownership and reduces accidental state changes.

The tradeoff is that teams must coordinate provisioning outputs and configuration inventory.

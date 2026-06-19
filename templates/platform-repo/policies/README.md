# Policy Standards

This directory contains reusable policy-as-code guidance and severity gating rules.

## Examples

- admission policy standards
- image policy rules
- namespace constraints
- exception workflow templates
- CI policy examples for Kubernetes YAML and Dockerfiles

## Rule

Policies should be reusable and generic. Client-specific exceptions belong in private implementation repositories.

## Runtime Split

Use `conftest/` for CI checks that run before merge. Use `kyverno/` for Kubernetes admission controls after the platform team has validated the rules in audit mode.

Policy exceptions must include owner, expiry, scope, compensating control, and approval reference.

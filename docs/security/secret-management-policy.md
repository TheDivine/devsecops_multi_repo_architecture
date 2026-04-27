# Secret Management Policy

## Purpose

Define how sensitive configuration is handled across the multi-repo model without placing real values in public or broadly shared repositories.

## Policy

- Store real sensitive values only in approved private systems such as a vault, cloud manager, sealed object workflow, or external operator integration.
- Keep application repositories limited to `.env.example` files and documented variable names.
- Keep deployment repositories limited to references, sealed payloads, or external bindings where approved.
- Keep infrastructure repositories free of local state and provider credentials.
- Do not place production kubeconfig files, private keys, or vault files in any repository.
- Rotate exposed values immediately if they are accidentally committed.

## Repository Expectations

Application repositories document required variables but do not store live values.

Deployment repositories reference runtime configuration by name and environment, not by exposing values.

Infrastructure repositories document backend configuration and access patterns, but do not include local state artifacts.

Security repositories define scanning, detection, and exception-handling standards.

## Review Questions

- Does the repository contain only placeholders?
- Are sensitive values stored in an approved external system?
- Are rotation and revocation responsibilities documented?
- Are scanning tools included in CI or pre-release checks?

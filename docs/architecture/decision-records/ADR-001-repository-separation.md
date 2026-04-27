# ADR-001: Separate Application, Infrastructure, Deployment, Documentation, and Platform Repositories

## Status

Accepted

## Context

A single repository containing application code, infrastructure code, production deployment manifests, and operational documentation creates several risks:

- too many users can access sensitive infrastructure logic
- production deployment changes can be mixed with application changes
- developers may accidentally modify infrastructure or deployment files
- secrets and environment-specific configuration become harder to isolate
- client environments become harder to standardize

## Decision

Use a multi-repository architecture:

- app repository for application code and CI
- infrastructure repository for provisioning
- deployment repository for runtime manifests and environment overlays
- documentation repository for architecture and runbooks
- platform repository for reusable DevSecOps templates and modules

## Consequences

Benefits:
- stronger separation of duties
- clearer access control
- safer production operations
- reusable platform modules
- cleaner client onboarding

Tradeoffs:
- more repositories to manage
- requires clear naming conventions
- requires workflow documentation
- requires version coordination between app and deployment repos

## Implementation Rule

Developers usually work in the app repository.

Platform/DevOps engineers own the infrastructure and deployment repositories.

Security/platform engineers own shared policies and platform modules.

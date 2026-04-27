# Operating Model

## Purpose

Describe how teams use the multi-repo blueprint during normal delivery and operations.

## Team Responsibilities

Application teams own code quality, tests, app CI, and image publishing.

Platform teams own shared GitOps patterns, cluster platform standards, policies, and reusable modules.

Infrastructure teams own provisioning, state-management rules, and host or cloud configuration.

Security teams own baselines, scanning policy, exceptions, and hardening guidance.

Operations teams own monitoring, alert routing, incident response, and service health review.

## Change Flow

Changes should happen in the repository that owns the responsibility. Cross-repo changes require linked pull requests and explicit release notes.

## Review Cadence

- Review quality gates before enabling production promotion.
- Review access boundaries before onboarding new contributors.
- Review rollback procedures before the first production release.
- Review incident and support ownership after each major delivery phase.

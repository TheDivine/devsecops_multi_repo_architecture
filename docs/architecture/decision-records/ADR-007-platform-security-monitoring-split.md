# ADR-007: Split Platform, Security, and Monitoring Responsibilities

## Status

Accepted

## Context

Platform, security, and monitoring concerns are related but have different owners and review requirements. Platform teams manage shared runtime standards. Security teams define baselines and risk controls. Monitoring teams define telemetry, dashboards, and alert routing.

Combining all three can hide ownership and make review paths unclear.

## Decision

Use separate repositories for platform, security, and monitoring when each area has independent ownership or lifecycle requirements.

For smaller environments, these concerns may start in a shared platform repository, but the documentation must still describe the responsibility boundaries.

## Consequences

This improves ownership, access control, and lifecycle management.

The tradeoff is additional repository coordination and the need for linked change management across shared standards.

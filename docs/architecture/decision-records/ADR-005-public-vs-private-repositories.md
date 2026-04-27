# ADR-005: Define Public and Private Repository Boundaries

## Status

Accepted

## Context

Blueprint repositories can be public-safe, but real implementation repositories often contain operational details that must remain private. Without a clear boundary, teams may accidentally expose sensitive environment data or customer-specific information.

## Decision

Public repositories may contain generic documentation, templates, checklists, diagrams, and placeholder-only examples.

Private repositories must contain real environment values, customer-specific topology, provider identifiers, private runbooks, and operational evidence.

## Consequences

This allows the blueprint to be shared publicly while preserving safe handling of implementation details.

Teams must run sanitization checks before publishing derived materials.

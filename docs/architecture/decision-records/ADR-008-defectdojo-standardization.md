# ADR-008: Standardize DefectDojo Import Ownership

## Status

Accepted

## Context

The blueprint references DefectDojo across repository recommendations, security gates, and end-to-end flow documentation. Without a concrete ownership model, each application or deployment repo can invent a different import pattern.

## Decision

DefectDojo import scripts, scan-type mappings, severity gating defaults, and CI snippets belong in the platform repository template.

Application, deployment, and infrastructure repositories may produce scan reports, but they should call the shared platform pattern rather than maintaining separate import logic.

## Consequences

- Scan import behavior is easier to standardize across clients and tools.
- DefectDojo credentials remain private CI/runtime values and are never committed.
- Product, engagement, branch, commit, and scan-type naming must be documented per implementation.
- Smaller clients can skip DefectDojo until scan volume justifies central triage.

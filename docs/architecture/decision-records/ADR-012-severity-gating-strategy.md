# ADR-012: Severity Gating Strategy

## Status

Accepted

## Context

New projects can start strict. Legacy projects often need baseline-first adoption so existing findings do not block all delivery immediately.

## Decision

Secrets fail immediately. Critical and high findings are reported first, then become blocking after an agreed baseline. New projects use stricter gates from the start. Existing projects use no-worse-than-baseline until remediation catches up.

## Consequences

- Teams can adopt scanning without freezing legacy delivery.
- Production gates become stricter over time.
- Exceptions need owner, expiry, scope, compensating control, and approval reference.
- DefectDojo is used for trend tracking and triage where available.

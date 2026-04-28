# ADR-019: Manual-First E2E Lab Before Full Automation

## Status

Accepted.

## Context

Automation is valuable only when the manual process is understood, safe, observable, and repeatable. The lab is intended for learning, validation, portfolio demonstration, and future client rollout standards.

## Decision

Implement the first E2E lab manually. Use manual image tag updates, manual Argo CD sync verification, manual DAST execution, and manual release evidence collection before automating promotion.

## Consequences

- The operator learns every boundary in the flow from code commit to security evidence and deployment.
- Automation is added only after staging proves build, scan, deploy, observe, DAST, rollback, and DefectDojo import.
- Production approval remains manual even after automation is introduced.
- The deployment repo remains the source of truth for runtime state.

## Alternatives Considered

- Full automation immediately: faster after setup, but hides failure modes and makes troubleshooting harder.
- Manual forever: useful for learning, but not scalable for client rollout.
- CI deploys directly to Kubernetes: simple, but weakens GitOps auditability and separation of duties.

## When To Revisit

Revisit after staging is stable and the same manual steps have been repeated successfully enough to define safe automation.

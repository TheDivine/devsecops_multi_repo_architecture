# ADR-010: Support VM/Docker Compose And Kubernetes Runtime Paths

## Status

Accepted

## Context

Clients may run on existing VMs with Docker Compose or on Kubernetes platforms. Restarting the blueprint for one runtime would reduce reuse and create unnecessary forks.

## Decision

The deployment repository template supports both runtime paths:

- VM/Docker Compose for clients with smaller VM-based estates.
- Kubernetes with Helm, Kustomize, and GitOps definitions for cluster-based environments.

The selected runtime path must be documented per implementation. Unused runtime examples may remain as references or be removed in the private implementation repo after the decision is recorded.

## Consequences

- The public blueprint remains flexible for different client maturity levels.
- Production runbooks must be runtime-specific.
- Monitoring and security controls must include both VM-level and Kubernetes-level examples.
- Deployment ownership stays in the deployment repository regardless of runtime path.

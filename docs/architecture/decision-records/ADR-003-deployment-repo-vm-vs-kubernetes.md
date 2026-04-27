# ADR-003: Deployment Repository Supports Docker Compose and Kubernetes

## Status

Accepted

## Context

Some clients run applications on separate VMs using Docker Compose and Traefik. Internal or more mature platforms may run applications on Kubernetes.

## Decision

The deployment repository must support deployment mode as a first-class choice.

Supported modes:

1. Docker Compose mode
2. Kubernetes mode

Docker Compose mode:
- production compose files
- Traefik labels
- VM firewall assumptions
- backup scripts
- service-specific environment files

Kubernetes mode:
- Helm chart or Kustomize base
- environment values
- IngressRoute/Ingress
- NetworkPolicy
- RBAC
- Pod Security labels
- GitOps integration

## Consequences

A client does not need Kubernetes modules if the target architecture is VM-based.

A Kubernetes platform does not need Compose deployment manifests except for local developer use.

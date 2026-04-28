# ADR-015: Traefik ACME First, Cert-Manager When Needed

## Status

Accepted.

## Context

The cluster already uses Traefik for ingress and reverse proxy. Certificate automation can be handled by Traefik-native ACME or by cert-manager. Running both against the same hostname can create ownership conflicts and operational confusion.

## Decision

Use Traefik-native ACME first for the demo lab when Traefik already manages the routed hostname.

Introduce cert-manager later when certificate lifecycle requirements become broader than simple Traefik-routed applications.

## Consequences

- cert-manager is not mandatory for the first staging demo.
- Missing cert-manager is a warning, not a blocker, in readiness checks.
- Do not manage the same hostname with both Traefik ACME and cert-manager.
- cert-manager becomes recommended for wildcard certificates, multiple ingress controllers, multi-namespace certificate reuse, service mesh integrations, or reusable certificate workflows.

## Alternatives Considered

- cert-manager from day one: more flexible, but adds moving parts before the basic E2E flow is proven.
- Manual certificates: simple for a one-off test, but not production-shaped.
- External load balancer TLS only: useful in some client environments, but does not teach Kubernetes-native certificate ownership.

## When To Revisit

Revisit when applications span multiple namespaces, wildcard certificates are needed, certificate reuse becomes common, or Traefik ACME cannot satisfy renewal and issuer requirements.

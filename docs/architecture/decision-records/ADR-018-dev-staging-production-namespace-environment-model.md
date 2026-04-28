# ADR-018: Dev, Staging, And Production Namespaces In One Lab Cluster

## Status

Accepted.

## Context

The lab has one existing Kubernetes cluster. It needs to demonstrate environment separation without requiring multiple clusters on day one. The design must still support future production isolation.

## Decision

Use separate namespaces in the same cluster for the lab:

- `demo-client-dev`
- `demo-client-staging`
- `demo-client-prod`

Start with staging, then add dev, then add production only after gates are proven.

## Consequences

- Each environment gets separate overlays, domains, image tags, secrets, Argo CD Applications, and release gates.
- Staging validates the full production-shaped flow before lower-friction dev is added.
- Production is not deployed blindly; it requires manual approval, known-good image tags, rollback, monitoring, DAST, and reviewed DefectDojo findings.
- Separate clusters become necessary when compliance, blast-radius, tenant isolation, or availability requirements exceed namespace isolation.

## Alternatives Considered

- Separate clusters from day one: stronger isolation, but more cost and complexity for the learning lab.
- One namespace for all environments: simpler, but not production-shaped.
- Start with dev first: common in small projects, but it does not validate the full release chain early enough.

## When To Revisit

Revisit when production workloads require stronger isolation, independent upgrade windows, different cluster-level policies, or formal compliance boundaries.

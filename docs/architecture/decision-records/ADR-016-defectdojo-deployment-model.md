# ADR-016: DefectDojo Separate VM First

## Status

Accepted.

## Context

DefectDojo is required to centralize scan results from SAST, dependency scanning, container scanning, and DAST. It can run on Kubernetes or a VM. The lab already has a Kubernetes cluster, but adding DefectDojo to the same cluster increases operational coupling during the first E2E implementation.

## Decision

Run DefectDojo on a separate VM first for the manual lab. Kubernetes deployment remains an optional later phase after the E2E application flow is stable.

## Consequences

- Security findings remain available even if the application namespace has issues.
- DefectDojo can be protected with DNS, TLS, firewall, and VPN controls independently.
- CI only needs placeholder configuration for `DEFECTDOJO_URL` and `DEFECTDOJO_API_KEY`.
- Kubernetes deployment of DefectDojo can be evaluated later when backup, upgrade, storage, and access models are proven.

## Alternatives Considered

- Deploy DefectDojo inside Kubernetes first: closer to platform consolidation, but adds dependency and persistence complexity early.
- Use CI artifacts only: simpler, but does not provide portfolio-grade vulnerability lifecycle management.
- Use a SaaS vulnerability platform: viable for some clients, but less useful for self-hosted lab learning.

## When To Revisit

Revisit after staging is stable, DefectDojo import works, backups are defined, and the team can operate DefectDojo upgrades and persistence safely.

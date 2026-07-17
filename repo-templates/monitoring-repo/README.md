# Monitoring Repository Template

This repository template contains observability standards, dashboards, alert rules, and routing documentation.

## Owns

- metrics collection standards
- dashboard templates
- log aggregation guidance
- alert routing
- service health documentation

## Does Not Own

- application source code
- infrastructure state
- security incident evidence
- production-only credentials

## Policy As Code

Monitoring repositories own machine-verifiable alert quality, routing metadata, and telemetry configuration requirements. Native validators remain the first check; organization-specific policy adds ownership, severity, runbook, retention, and public-safety requirements.

See [`policies/README.md`](policies/README.md) for a tested Prometheus alert metadata example.

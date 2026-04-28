# Monitoring Repository Template

This repository template contains observability standards, dashboards, alert rules, scrape targets, and routing documentation for VM and Kubernetes clients.

## Owns

- metrics collection standards
- dashboard templates
- log aggregation guidance
- alert routing
- service health documentation
- VM scrape target examples
- Kubernetes ServiceMonitor examples

## Does Not Own

- application source code
- infrastructure state
- security incident evidence
- production-only credentials

## Runtime Paths

Use `vm-scrape/` for VM/Docker Compose clients and `servicemonitor/` for Kubernetes clients with Prometheus Operator.

Application teams must expose useful metrics and health endpoints. Monitoring repositories own scrape configuration, dashboard standards, and alert ownership.

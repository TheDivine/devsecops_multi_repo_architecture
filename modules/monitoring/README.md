# Monitoring Baseline Module

## Purpose

Define common observability expectations for VM/Docker Compose and Kubernetes deployments.

## Baseline

- Prometheus scrape config or ServiceMonitor.
- Grafana dashboard folder per service.
- Loki, Promtail, or Grafana Alloy notes for logs.
- Alertmanager routing in private implementation repos.
- Optional Wazuh integration for endpoint/security telemetry.

## Minimum Alerts

- application down
- high 5xx error rate
- container or pod restart loop
- disk pressure
- certificate expiry
- backup age

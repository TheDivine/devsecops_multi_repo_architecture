# ADR-013: Monitoring And SIEM Strategy

## Status

Accepted

## Context

The platform must support small VM/Docker Compose clients and Kubernetes environments. Some clients may also require endpoint/security telemetry.

## Decision

Prometheus, Grafana, Loki/Alloy, and Alertmanager form the default monitoring baseline. Wazuh is optional when endpoint security or compliance telemetry is required.

Monitoring templates live in the monitoring repo template and shared monitoring module. Client-specific alert routes, datasource credentials, logs, and evidence stay private.

## Consequences

- VM clients can use file service discovery and node exporter.
- Kubernetes clients can use ServiceMonitor and platform-managed logging.
- Optional Wazuh integration does not replace application metrics, logs, or Kubernetes policy controls.

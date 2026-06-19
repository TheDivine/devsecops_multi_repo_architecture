# Central Monitoring VM Plan

## Purpose

Plan a monitoring VM for VM/Docker Compose clients or small environments.

## Components

- Prometheus
- Grafana
- Loki or Grafana Alloy
- Alertmanager
- optional Wazuh manager or Wazuh forwarding integration

## Minimum Controls

- restricted dashboard access
- persistent encrypted storage
- backup and restore procedure
- alert route test after deployment
- disk pressure alerting
- TLS certificate renewal alerting

Do not store real datasource credentials, contact points, or logs in this public template.

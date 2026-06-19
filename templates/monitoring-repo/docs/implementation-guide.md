# Monitoring Implementation Guide

## Purpose

Use this guide to connect application, deployment, infrastructure, and monitoring repositories.

## Application Requirements

Application repositories should expose:

- `/health` for liveness
- `/ready` for readiness
- `/metrics` when Prometheus metrics are available
- structured logs suitable for the selected log collector

## VM/Docker Compose Clients

Use `vm-scrape/file-sd-targets.yml.example` as the pattern for Prometheus file service discovery.

The infrastructure repository owns installing node exporter or log shipping agents. The monitoring repository owns scrape target shape, alert rules, dashboard templates, and routing.

## Kubernetes Clients

Use `servicemonitor/application-servicemonitor.yaml.example` when Prometheus Operator is installed.

The deployment repository owns service labels and ports. The monitoring repository owns ServiceMonitor conventions, alert rules, dashboards, and routing.

## Alert Ownership

Every production alert should define:

- owning team
- severity
- impact
- first response action
- escalation path in the private on-call system
- runbook link

Do not commit private contact details or on-call tokens to this repository.

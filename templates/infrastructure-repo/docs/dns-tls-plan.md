# DNS And TLS Plan

## Purpose

Plan DNS ownership and TLS certificate flow for VM/Docker Compose and Kubernetes clients.

## Required Decisions

- public domain owner
- internal domain owner
- DNS provider and change approval process
- certificate issuer
- ACME challenge type
- certificate renewal monitoring
- break-glass certificate replacement procedure

## Example Records

| Record | Target | Purpose |
|---|---|---|
| `app.example.com` | Traefik endpoint | production app |
| `staging.app.example.com` | Traefik endpoint | staging app and DAST |
| `defectdojo.example.com` | platform endpoint | internal AppSec triage |
| `grafana.example.com` | monitoring endpoint | internal dashboards |

Use private implementation repos for real domains, zone IDs, and provider credentials.

# Docker Compose Security Module

## Purpose

Define production expectations for VM-based clients using Docker Compose and Traefik.

## Baseline Controls

- immutable image tags
- `restart: unless-stopped` or stricter equivalent
- health checks
- Traefik labels in deployment repo only
- private `.env` files outside Git
- host hardening through the infrastructure repo
- monitoring through node exporter, application metrics, and log shipping

No manual SSH deployment should be required except break-glass troubleshooting.

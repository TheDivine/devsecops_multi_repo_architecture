# VM Docker Compose Production Runbook

## Purpose

Use this runbook when the client deploys onto VMs with Docker Compose.

## Required Inputs

- immutable application image tag
- private `.env` file on the target host
- VM baseline applied by the infrastructure repository
- Traefik or approved reverse proxy network available
- backup and restore procedure documented

## Deploy

1. Confirm the image tag passed app CI security gates.
2. Update `APP_IMAGE` in the private environment configuration or release manifest.
3. Pull the image on the target host.
4. Start or update the Compose project.
5. Verify `/health` and `/ready`.
6. Confirm metrics are scraped and alerts are not firing unexpectedly.

## Rollback

1. Select the previous known-good immutable image tag.
2. Restore the previous private environment file if runtime configuration changed.
3. Recreate the Compose service with the previous tag.
4. Verify health checks and logs.
5. Open a follow-up incident or change record if rollback was user-impacting.

## Production Notes

- Do not store real `.env` files in Git.
- Do not use mutable tags such as `latest`.
- Keep host hardening, patching, firewall, and backup ownership in the infrastructure repository.
- Keep alert routing, dashboards, and log collection in the monitoring repository.

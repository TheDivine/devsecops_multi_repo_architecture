# Environment Inventory

## Purpose

Track sanitized environment ownership and operational dependencies.

| Environment | Runtime | Deployment Repo | Infra Repo | Monitoring Repo | Owner |
|---|---|---|---|---|---|
| staging | Docker Compose or Kubernetes | `<project-deployment>` | `<project-infra>` | `<project-monitoring>` | `<team>` |
| production | Docker Compose or Kubernetes | `<project-deployment>` | `<project-infra>` | `<project-monitoring>` | `<team>` |

Keep private hostnames, IP addresses, account IDs, and credentials in private implementation systems only.

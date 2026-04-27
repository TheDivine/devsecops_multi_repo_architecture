# Cybelynxcore Production-Like Runbook

## Scope

This runbook applies to the dummy `cybelynxcore-production` example environment.

## Health Checks

- Application health endpoint: `https://api.cybelynxcore.test/health`
- Kubernetes namespace: `cybelynxcore-production`
- Workload: `cybelynxcore-api`

## Rollback Model

Rollback should be performed by reverting the GitOps desired-state change that introduced the failed image or manifest.

Do not rebuild the image during rollback. Restore the previous approved image tag or digest.

## Incident Triage

1. Check application availability and recent rollout history.
2. Review pod readiness and liveness probe failures.
3. Review Traefik routing and TLS state.
4. Review recent GitOps commits.
5. Review alert context and logs in the private implementation environment.

## Public Safety

This runbook uses only dummy values. Real escalation paths, contacts, logs, domains, IP addresses, and customer details must stay in private repositories.

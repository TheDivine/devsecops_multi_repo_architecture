# Kubernetes GitOps Runbook

## Purpose

Use this runbook when the client deploys through Kubernetes, Helm, Kustomize, and Argo CD or Flux.

## Required Inputs

- immutable application image tag
- target namespace and environment overlay
- GitOps application definition
- policy-as-code results
- monitoring rules and dashboards
- secret manager integration in the target cluster

## Promote

1. Confirm the app image passed CI security gates and SBOM generation.
2. Update the image tag in the environment overlay or Helm values.
3. Open a pull request in the deployment repository.
4. Run manifest rendering and policy checks.
5. Merge after release approval.
6. Let GitOps reconcile the desired state.
7. Verify rollout status, `/health`, `/ready`, ServiceMonitor targets, logs, and alerts.

## Rollback

1. Revert the image tag change or apply the previous GitOps revision.
2. Confirm the workload returns to the previous ReplicaSet or release revision.
3. Verify health, logs, metrics, and alert state.
4. Document the rollback in the docs or incident repository.

## Production Notes

- Use direct `kubectl apply` only for learning or break-glass recovery.
- Start new admission policies in audit mode before enforcement.
- Keep cluster credentials, kubeconfigs, and secret values out of Git.
- Confirm required CRDs exist before enabling Traefik, Argo CD, ServiceMonitor, or Kyverno examples.

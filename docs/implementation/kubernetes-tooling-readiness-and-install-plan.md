# Kubernetes Tooling Readiness And Install Plan

## Already Expected Or Observed

- Traefik
- MetalLB
- Calico
- Longhorn
- local-path storage
- Argo CD
- Flux or Weave GitOps
- AWX
- Drone
- Prometheus, Grafana, Alertmanager

## Must Validate Now

- `kubectl` access
- node health
- CoreDNS
- Traefik CRDs
- MetalLB IP pools
- Argo CD health
- registry pull secret
- ServiceMonitor CRD
- storage classes
- NetworkPolicy support
- failed pods
- high restart counts
- backup job failures

Use:

```sh
make k8s-check-all
```

Readiness interpretation:

- `PASS` means the check found the expected capability.
- `WARN` means the learning lab can continue, but the item must be reviewed before production.
- `FAIL` means the basic lab path is blocked or the current kubeconfig cannot validate the cluster.

Do not use readiness scripts to install, upgrade, or modify resources. They are read-only inventory checks.

## Install Now Or Soon

- DefectDojo
- Forgejo runner if missing
- imagePullSecrets per namespace
- Loki/Alloy if logs are not available
- Kyverno if policy audit/enforcement is desired

## Install Later

- cert-manager if Traefik ACME is insufficient
- Vault
- External Secrets Operator
- Wazuh
- OpenSearch or Elastic
- image signing
- SBOM/provenance tooling

## cert-manager Decision

Traefik ACME is enough for simple Traefik-routed public apps.

cert-manager is recommended for:

- multi-namespace certificate workflows
- wildcard certificates
- multi-ingress environments
- service mesh certificates
- reusable certificate ownership outside Traefik

cert-manager is not mandatory for the first demo if Traefik ACME already works.

Do not manage the same hostname with both Traefik ACME and cert-manager.

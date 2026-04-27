# Recommended Tools

## Version Control

- Git for source control.
- GitHub, Forgejo, or Gitea for repository hosting.

## CI/CD

- GitHub Actions or Drone CI for application CI.
- Argo CD or Flux CD for GitOps reconciliation.

## Infrastructure

- Terraform or OpenTofu for provisioning.
- Ansible for host configuration and operational baselines.
- Docker for local container workflows and image build standards.

## Security

- Trivy for dependency, filesystem, and container scanning.
- Gitleaks for repository sensitive-data scanning.
- SOPS, Sealed Secrets, or External Secrets Operator for managed runtime value workflows.
- Falco and Kyverno for runtime and policy controls where Kubernetes is used.

## Observability

- Prometheus for metrics.
- Grafana for dashboards.
- Loki for logs.
- Wazuh for endpoint and security monitoring where appropriate.

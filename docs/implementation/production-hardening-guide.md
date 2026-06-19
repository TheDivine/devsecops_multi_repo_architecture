# Production Hardening Guide

This guide turns the blueprint into an implementation sequence that works for both VM/Docker Compose clients and Kubernetes-based environments.

## Repository Handoff Model

| Repository | Primary Owner | Production Responsibility | Hands Off To |
|---|---|---|---|
| App | Application team | code, tests, image, SBOM, scan reports | deployment repo |
| Deployment | DevOps/platform team | Compose files, Helm charts, Kustomize overlays, promotion, rollback | platform and monitoring repos |
| Infrastructure | Platform/DevOps team | VMs, cloud resources, DNS, firewalls, backups, Ansible baselines | deployment repo |
| Platform | Platform engineering | reusable CI, scanner policies, DefectDojo imports, policy-as-code, GitOps standards | app/deployment/security repos |
| Security | Security/platform team | host baselines, audit rules, endpoint monitoring, exceptions | platform and infra repos |
| Monitoring | SRE/platform team | Prometheus, Alertmanager, Grafana, Loki, scrape standards | app/deployment repos |
| Docs | Shared ownership | ADRs, runbooks, access model, inventory, incident procedures | all repos |

## Implementation Sequence

1. Start with the docs repo template and record the client/project boundary, repo owners, environment names, and access model.
2. Create the app repo from `templates/app-repo/` and keep production deployment data out of it.
3. Enable CI security gates for unit tests, secret scanning, SAST, filesystem scan, image scan, SBOM generation, and optional DefectDojo report import.
4. Create the deployment repo from `templates/deployment-repo/` and choose the runtime path:
   - VM/Docker Compose for smaller clients or existing VM estates.
   - Kubernetes with Helm/Kustomize/GitOps for cluster-based clients.
5. Create the infra repo from `templates/infrastructure-repo/` and separate Terraform/OpenTofu provisioning from Ansible configuration.
6. Create or reuse the platform repo from `templates/platform-repo/` for shared scanner policies, DefectDojo scripts, reusable CI fragments, and policy-as-code.
7. Add security and monitoring repos when those responsibilities need separate ownership or lifecycle.
8. Promote the first release only after quality gates, environment values, backup coverage, rollback, monitoring, and incident routing are reviewed.

## VM And Docker Compose Path

Use this path when the client deploys onto one or more VMs without Kubernetes.

Minimum production controls:

- Ansible-managed baseline hardening, package updates, users, SSH controls, firewall rules, and audit logging.
- Docker Engine or compatible runtime installed and patched through the infrastructure repo.
- Deployment repo owns Compose files, `.env.example`, upgrade commands, rollback commands, and Traefik routing labels.
- Monitoring repo owns VM scrape targets, node exporter conventions, application alerts, dashboards, and Alertmanager routing.
- Security repo owns auditd, malware scanning, Wazuh/endpoint enrollment guidance, and exception process.
- Secrets are injected from a private environment file, secret manager, or CI/CD runtime. They are never committed.

## Kubernetes Path

Use this path when the client has a Kubernetes platform or will adopt one.

Minimum production controls:

- Deployment repo owns Helm chart, Kustomize overlays, Argo CD or Flux application definitions, rollout policy, and rollback notes.
- Platform repo owns admission policy defaults, namespace standards, GitOps project boundaries, scanner policies, and shared CI fragments.
- Infrastructure repo owns cluster provisioning and node configuration where applicable.
- Monitoring repo owns ServiceMonitor or PodMonitor patterns, alert rules, dashboards, and log collection standards.
- Security repo owns pod security expectations, exception workflow, audit/event collection, and endpoint controls.
- Secrets are handled through a private secret manager integration such as External Secrets, SOPS, Vault, or sealed secrets.

## DefectDojo Flow

Use DefectDojo when scan results come from more than one repo or more than one tool.

Standard flow:

1. CI produces SARIF, CycloneDX, JSON, or scanner-native reports.
2. CI uploads reports as build artifacts.
3. A private CI job imports reports into DefectDojo with `DEFECTDOJO_URL`, `DEFECTDOJO_API_KEY`, product name, engagement name, scan type, branch, and commit.
4. Blocking gates fail the pipeline only on agreed severity thresholds.
5. Exceptions are documented with owner, expiry, compensating control, and approval reference.

The public-safe implementation lives under `scripts/defectdojo/` and `modules/defectdojo/`.

## Policy-As-Code Flow

Policy-as-code should run before deployment and, for Kubernetes, also at admission time.

Recommended split:

- CI policy checks: validate Kubernetes YAML, Terraform/OpenTofu plans, Dockerfiles, and Compose files before merge.
- Admission policy checks: enforce or audit runtime rules through Kyverno, Gatekeeper, or another controller.
- Exception workflow: store private, time-limited exceptions in the implementation repo, not this public blueprint.

## Release Readiness

Before production release, confirm:

- Application image is immutable and scan results are available.
- SBOM exists and is attached to the build or release record.
- Deployment repo has rollback commands for the selected runtime path.
- Infrastructure repo has backup, restore, and patching responsibilities documented.
- Monitoring repo has service health, error-rate, saturation, and certificate/expiry alerts.
- Security repo has endpoint/audit controls and an exception process.
- Docs repo has current ADRs, runbooks, inventory, access model, and incident contact flow.

## Public-Safety Rule

Use placeholders and reserved test domains in this blueprint. Real client names, domains, account IDs, IP addresses, credentials, tokens, kubeconfigs, Terraform state, and incident evidence belong only in private implementation repositories.

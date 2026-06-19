# Platform Modules

Reusable modules owned by the `platform-devsecops` repository.

| Module | Purpose |
|---|---|
| `appsec/` | scanner baseline, CI evidence, severity gates |
| `defectdojo/` | centralized vulnerability report import and triage integration |
| `monitoring/` | Prometheus, Grafana, Loki/Alloy, alerting baseline |
| `policy-as-code/` | CI and admission policy examples |
| `docker-compose/` | Compose security checks and deployment baseline |
| `kubernetes-security/` | Kubernetes security controls and Kyverno examples |
| `cloud-aws/` | optional AWS baseline planning |

Client-specific values and exceptions belong in private implementation repositories.

# Modular Roadmap Matrix

| Topic | Module | Include When | Status | Priority | Artifact |
|---|---|---|---|---|---|
| App starter | app repo | every project | ready | P1 | app repo template |
| CI security | app repo | every project | ready | P1 | ci-security.yml |
| Deployment repo | deployment | every project | ready | P1 | compose/helm templates |
| Infrastructure repo | infra | new VMs/cloud/resources | ready | P1 | terraform/ansible templates |
| DefectDojo | platform | scanning > one repo | partial | P1 | standardization pack |
| Monitoring | platform | multiple services/VMs | partial | P2 | monitoring module |
| Manual E2E lab | platform/app/deployment | learning and validation | ready | P1 | implementation guide |
| Forgejo CI/CD | app repo | self-hosted Git/registry flow | ready | P1 | Forgejo E2E guide |
| DefectDojo integration | appsec | scan centralization required | ready | P1 | setup and integration guide |
| DAST | appsec | staging web app exists | ready | P2 | ZAP plus DefectDojo flow |
| License policy | appsec | external/client work | partial | P2 | license allow/deny |
| Kubernetes security | infra/platform | K8s deployments | partial | P2/P3 | RBAC/NetworkPolicy/Kyverno |
| AWS baseline | infra/cloud | AWS resources | planned | P3 | IAM/VPC/logging baseline |
| Wazuh/SIEM | platform security | compliance/security monitoring | planned | P3 | Wazuh module |
| Vault | platform security | mature secret lifecycle needed | planned | P3 | Vault module |
| Service mesh | platform | microservices/K8s complexity | optional | P4 | mesh module |

## Implementation Phases

| Phase | Goal | Primary Evidence |
|---|---|---|
| Phase 1 | Manual staging-first E2E lab | working staging deployment, scans, DAST, DefectDojo import, observability checks |
| Phase 2 | Production hardening | release gate, rollback runbook, resource/security controls, alerting evidence |
| Phase 3 | Automation and client rollout | automated deployment repo updates, reusable onboarding process, client-specific private repos |

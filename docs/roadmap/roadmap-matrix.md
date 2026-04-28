# Modular Roadmap Matrix

| Topic | Module | Include When | Status | Priority | Artifact |
|---|---|---|---|---|---|
| App starter | app repo | every project | ready | P1 | app repo template |
| CI security | app repo | every project | ready | P1 | ci-security.yml |
| Deployment repo | deployment | every project | ready | P1 | compose/helm templates |
| Infrastructure repo | infra | new VMs/cloud/resources | ready | P1 | terraform/ansible templates |
| DefectDojo | platform | scanning > one repo | partial | P1 | standardization pack |
| Monitoring | platform | multiple services/VMs | partial | P2 | monitoring module |
| DAST | appsec | staging web app exists | planned | P2 | DAST module |
| License policy | appsec | external/client work | partial | P2 | license allow/deny |
| Kubernetes security | infra/platform | K8s deployments | planned | P2/P3 | RBAC/NetworkPolicy/Kyverno |
| AWS baseline | infra/cloud | AWS resources | planned | P3 | IAM/VPC/logging baseline |
| Wazuh/SIEM | platform security | compliance/security monitoring | planned | P3 | Wazuh module |
| Vault | platform security | mature secret lifecycle needed | planned | P3 | Vault module |
| Service mesh | platform | microservices/K8s complexity | optional | P4 | mesh module |

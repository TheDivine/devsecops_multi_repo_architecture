# DevSecOps Platform Roadmap Matrix

| Topic | Module | Covered | Partial | Missing | Next Artifact | Priority | When To Include |
|---|---|---|---|---|---|---|---|
| App starter | templates/app-repo | yes | no | no | framework-specific variants | P1 | every project |
| Gitea CI security | appsec | yes | no | no | reusable workflow docs | P1 | every app repo |
| Gitea registry | platform | yes | no | no | registry retention guide | P1 | every app repo |
| DefectDojo import | defectdojo | yes | no | no | CI copy/paste snippets | P1 | multiple scanners or repos |
| Severity gates | policies | yes | no | no | baseline exception template | P1 | every project |
| Docker Compose deployment | docker-compose | yes | no | no | production runner example | P1 | VM clients |
| Kubernetes deployment | kubernetes-security | yes | no | no | canary/blue-green examples | P2 | Kubernetes clients |
| DAST staging | appsec | yes | partial | no | Gitea workflow job | P2 | web apps with staging |
| Monitoring baseline | monitoring | yes | no | no | richer Grafana dashboard | P2 | production services |
| Loki/Alloy logging | monitoring | yes | partial | no | Alloy config example | P2 | production services |
| Wazuh | monitoring | yes | partial | no | enrollment playbook | P3 | compliance/security monitoring |
| AWS baseline | cloud-aws | yes | partial | no | Terraform module skeletons | P3 | AWS clients |
| Canary/blue-green | deployment | no | partial | yes | rollout strategy module | P3 | mature Kubernetes clients |

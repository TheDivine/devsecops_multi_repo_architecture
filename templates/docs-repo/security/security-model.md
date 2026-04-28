# Security Model

## Control Ownership

| Control | Owning Repo | Evidence Location |
|---|---|---|
| secret scanning | app/platform | CI artifacts or DefectDojo |
| image scanning | app/platform | CI artifacts or DefectDojo |
| host hardening | infra/security | Ansible run output in private systems |
| admission policy | platform/deployment | policy reports in private systems |
| alert routing | monitoring | monitoring repo and private on-call system |

## Exception Rule

Every exception needs owner, scope, expiry, compensating control, and approval reference.

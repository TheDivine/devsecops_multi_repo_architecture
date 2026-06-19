# Repository Separation Model

| Repo | Owns | Does Not Own |
|---|---|---|
| app | source, tests, Dockerfile, CI, scans, SBOM, image push | production deployment internals |
| deployment | Compose, Helm, Kustomize, overlays, rollout, rollback, DAST | app source, infrastructure state |
| infrastructure | Terraform/OpenTofu, Ansible, VMs, cloud, DNS, firewall, hardening | app code |
| platform | reusable templates, modules, policies, scanner standards | client secrets |
| docs | ADRs, runbooks, access, inventory, process | Terraform state or credentials |

# Infrastructure Repository Template

This repository owns infrastructure provisioning and host or platform configuration.

## Responsibilities

- VM provisioning
- cloud resources
- DNS records
- firewalls/security groups
- Terraform/OpenTofu modules
- Ansible playbooks
- backup infrastructure
- registry or monitoring infrastructure provisioning
- DefectDojo VM planning
- Gitea runner VM planning
- central monitoring VM planning

## Terraform/OpenTofu Boundary

Terraform/OpenTofu owns infrastructure resources:

- networks, subnets, security groups, firewalls, DNS records, and load balancers
- VMs, managed databases, object storage, registries, and backup resources
- Kubernetes clusters or node pools where the client uses Kubernetes
- remote state backend configuration in private implementation repositories

Do not store state files, provider credentials, private IP inventories, or account identifiers in this public template.

## Ansible Boundary

Ansible owns configuration after resources exist:

- OS package baseline
- SSH hardening
- users and groups
- Docker/runtime installation
- auditd, endpoint monitoring, and malware scanning agents
- node exporter or log shipping agents

Do not mix application deployment logic into the infrastructure repository unless the client has explicitly chosen a VM-only operational model.

## Planning Documents

- `docs/firewall-matrix.md`
- `docs/dns-tls-plan.md`
- `docs/defectdojo-vm-plan.md`
- `docs/gitea-runner-vm-plan.md`
- `docs/central-monitoring-vm-plan.md`

## Access

Restrict this repository to platform/DevOps engineers only.

Developers should not need access unless explicitly required.

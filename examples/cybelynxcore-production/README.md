# Cybelynxcore Production-Like Example

This example shows how the blueprint can be adapted into a concrete, testable production-shaped environment using a dummy organization and reserved test domain.

## Dummy Values

- Organization: `cybelynxcore`
- Environment: `production`
- Namespace: `cybelynxcore-production`
- Application: `cybelynxcore-api`
- Domain: `api.cybelynxcore.test`
- Registry: `registry.cybelynxcore.test/cybelynxcore/cybelynxcore-api`
- GitOps project: `cybelynxcore`

The `.test` domain is reserved for testing and documentation. Do not replace it with a real domain in this public repository.

## What This Example Includes

- Kubernetes production-like desired state with Traefik `IngressRoute`.
- HPA, PDB, NetworkPolicy, resource requests, probes, and non-root security context.
- Argo CD Application and AppProject examples.
- Terraform/OpenTofu environment skeleton with remote-state guidance.
- Ansible inventory, roles, bootstrap playbook, and validation playbook examples.
- Security examples for auditd, ClamAV, Wazuh, Kyverno, and pod security expectations.
- Monitoring examples for Prometheus, Alertmanager, ServiceMonitor, and Grafana.
- Operational runbook and validation notes.

## What This Example Does Not Do

- It does not deploy anything.
- It does not contain real infrastructure identifiers.
- It does not contain real secrets.
- It does not assume a real registry, cluster, or DNS zone exists.

## Local Validation

Use these as safe local checks where the tools are installed:

```sh
kustomize build examples/cybelynxcore-production/kubernetes
helm lint repo-templates/deployment-repo/kubernetes/chart
ansible-playbook --syntax-check -i examples/cybelynxcore-production/infra/ansible/inventory.ini.example examples/cybelynxcore-production/infra/ansible/playbooks/bootstrap.yml
ansible-playbook --syntax-check -i examples/cybelynxcore-production/infra/ansible/inventory.ini.example examples/cybelynxcore-production/infra/ansible/playbooks/validate-baseline.yml
```

Do not run deployment, apply, or sync commands from this repository.

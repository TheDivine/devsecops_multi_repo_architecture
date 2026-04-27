# Cybelynxcore Validation Notes

## Safe Local Validation

These commands only render or validate local files when the tools are installed:

```sh
kustomize build examples/cybelynxcore-production/kubernetes
ansible-playbook --syntax-check -i examples/cybelynxcore-production/infra/ansible/inventory.ini.example examples/cybelynxcore-production/infra/ansible/playbooks/bootstrap.yml
terraform -chdir=examples/cybelynxcore-production/infra/terraform fmt -check
terraform -chdir=examples/cybelynxcore-production/infra/terraform validate
```

Do not run commands that mutate infrastructure from this repository.

## Required Private Follow-Up

- Replace dummy `.test` DNS names.
- Configure real state backend in private infrastructure repositories.
- Configure real registry and image digest promotion.
- Configure real secret-management integration.
- Validate Traefik CRDs and middleware in the target cluster.
- Validate NetworkPolicy behavior with the target CNI.

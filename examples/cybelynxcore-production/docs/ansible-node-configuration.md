# Ansible Node Configuration

This example provides a production-shaped Ansible baseline for node configuration.

## What It Configures

- common packages
- timezone
- SSH password-authentication policy
- root-login policy
- auditd package and baseline rules
- node exporter package and service

## Safe Validation

Syntax-only validation:

```sh
ansible-playbook --syntax-check -i examples/cybelynxcore-production/infra/ansible/inventory.ini.example examples/cybelynxcore-production/infra/ansible/playbooks/bootstrap.yml
```

Variable validation:

```sh
ansible-playbook --syntax-check -i examples/cybelynxcore-production/infra/ansible/inventory.ini.example examples/cybelynxcore-production/infra/ansible/playbooks/validate-baseline.yml
```

## Real Use Boundary

Do not run the playbooks against real nodes until:

- inventory uses private hostnames or IPs
- SSH access is approved
- rollback access is confirmed
- maintenance window is agreed
- OS compatibility is tested

# Infrastructure Policy as Code

## Purpose

Infrastructure policies evaluate planned changes before an authorized apply. They should complement formatting, validation, IaC scanning, human plan review, provider controls, and runtime configuration checks.

## Required Policy Areas

Select controls after the real provider and architecture are known:

- destructive changes and replacements;
- public network exposure and administrative ports;
- identity, role, and policy privilege;
- encryption and key ownership;
- logging, monitoring, backup, and recovery;
- approved regions, instance classes, images, and services;
- mandatory ownership, environment, data-classification, and cost tags;
- state backend and locking requirements;
- provider and module source/version restrictions;
- exception ownership and expiry.

Do not claim that one provider-neutral policy can validate every cloud or virtualization platform. Keep shared lifecycle and test requirements generic, and place AWS, Azure, GCP, DigitalOcean, Cloudflare, Proxmox, or other provider policies in clearly named packs.

## Terraform/OpenTofu Plan Flow

Run in a private implementation environment:

```bash
terraform fmt -check -recursive
terraform init -backend=false
terraform validate
terraform plan -out=<PLAN_FILE>
terraform show -json <PLAN_FILE> > <PLAN_JSON_FILE>
conftest test <PLAN_JSON_FILE> \
  --policy policies/conftest \
  --data <APPROVED_POLICY_DATA_FILE>
```

Never publish real plan JSON. It can contain resource identifiers, topology, values marked sensitive incorrectly by providers, and other implementation detail.

## Reference Policy

The sample policy blocks a Terraform plan containing a delete action unless an exact resource address has an approved exception record supplied as private Conftest data.

Example private data shape:

```yaml
approved_destroy:
  - resource_address: <EXACT_TERRAFORM_RESOURCE_ADDRESS>
    approved: true
    exception_id: <EXCEPTION_ID>
    expires_on: <YYYY-MM-DD>
```

The example checks presence, not cryptographic authenticity or date validity. Real integration must validate the approval source and reject expired records before evaluation.

## Local Policy Tests

```bash
conftest verify --policy repo-templates/infra-repo/policies/conftest
```

Add positive, negative, replacement, deletion, exception, and provider-specific fixtures before enforcement.

## Ownership

- Infrastructure owner: plan correctness, provider policy integration, and remediation.
- Platform owner: reusable CI and policy distribution.
- Security owner: control intent, severity, and exception requirements.
- Change/risk owner: destructive-change and production-impact approval.

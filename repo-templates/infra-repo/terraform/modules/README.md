# Terraform/OpenTofu Modules

Reusable modules belong here when they are generic enough to share across environments.

## Module Rules

- Keep modules parameterized.
- Do not hardcode customer-specific values.
- Do not embed credentials.
- Document inputs, outputs, and expected ownership.

## Promotion

Module changes should be tested in lower environments before production usage.

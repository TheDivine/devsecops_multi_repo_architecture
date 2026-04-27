# Cybelynxcore Terraform/OpenTofu Skeleton

This directory is a production-shaped skeleton for infrastructure code. It is intentionally provider-neutral and does not include real backend details.

## Files

- `versions.tf`: tool version constraints.
- `variables.tf`: expected environment inputs.
- `main.tf`: module wiring placeholder.
- `terraform.tfvars.example`: dummy values for the test profile.
- `backend.hcl.example`: remote-state shape using dummy values.

## Production Rule

Do not store real backend addresses, state files, provider credentials, or account identifiers in this public example.

# State Management

## Purpose

Document Terraform/OpenTofu state expectations without including real backend configuration.

## Rules

- Use a remote state backend for shared environments.
- Restrict state access to infrastructure owners.
- Do not commit state files.
- Do not expose provider credentials in repository files.
- Review state migrations as operational changes.

## Required Documentation

Private implementation repositories should document backend type, access owner, recovery process, and state-locking behavior.

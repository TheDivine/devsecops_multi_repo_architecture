# Provisioning Flow

## Purpose

Define how infrastructure changes move from design to approved implementation.

## Flow

1. Capture architecture decision and ownership.
2. Prepare Terraform/OpenTofu changes.
3. Validate formatting and configuration.
4. Review plan output in private implementation context.
5. Apply only through approved operational process.
6. Run post-provisioning configuration through approved automation.
7. Update documentation and runbooks.

## Boundary

This template repository documents the flow only. It must not contain commands that mutate real infrastructure.

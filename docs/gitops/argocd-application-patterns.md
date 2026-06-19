# Argo CD Application Patterns

## Purpose

Define safe patterns for representing applications in GitOps without coupling this blueprint to a live cluster.

## Recommended Patterns

- Use one Application per service per environment for clear ownership.
- Use App of Apps only when platform teams need centralized bootstrap control.
- Keep environment overlays in the deployment repository.
- Keep cluster bootstrap and shared platform components in the platform repository.
- Use sync waves only for dependency ordering that cannot be avoided.

## Boundaries

The deployment repository owns application runtime manifests.

The platform repository owns cluster-wide controllers, shared policies, and platform add-ons.

The application repository owns build inputs and image publishing, not production sync behavior.

## Placeholder Example

See `templates/deployment-repo/argocd/application.yaml.example`.

# Kubernetes Manifests In App Repositories

Application repositories may contain minimal Kubernetes examples for developer education, test fixtures, or local preview environments.

## Allowed Here

- non-production examples
- sample Deployment or Service manifests
- local development manifests
- documentation showing required ports, probes, or labels

## Should Live In The Deployment Repository

- staging and production overlays
- Argo CD or Flux definitions
- Helm values for real environments
- production ingress, routing, scaling, and policy configuration
- environment-specific runtime configuration

## Rule

If a manifest represents desired state for a shared or production-like environment, it belongs in the deployment repository.

# Kubernetes Base

Base manifests define shared application runtime shape without environment-specific values.

## Typical Content

- Deployment
- Service
- ConfigMap templates without sensitive values
- common labels and annotations
- default probes and resource requests

## Rules

- Keep environment-specific values in overlays.
- Do not place credentials in base manifests.
- Prefer image digest pinning in promoted overlays.

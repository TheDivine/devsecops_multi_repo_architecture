# Kubernetes Chart

This chart is a minimal deployment template for applications that are routed through Traefik.

## Assumptions

- Traefik is installed in the target Kubernetes cluster.
- `IngressRoute` CRDs are available.
- TLS termination is handled by Traefik.
- Runtime environment values are provided by the deployment repository or an approved external configuration workflow.

## Security Defaults

The workload is configured to run as a non-root user with UID/GID `10001`.

The matching application image template creates the same user in `repo-templates/app-repo/Dockerfile`.

## Boundary

This chart is a template. Real environment overlays, certificate issuer details, middleware references, and domain names belong in private deployment repositories.

# Kubernetes Chart

This chart is a minimal deployment template for applications that are routed through Traefik.

## Assumptions

- Traefik is installed in the target Kubernetes cluster.
- `IngressRoute` CRDs are available.
- TLS termination is handled by Traefik.
- Runtime environment values are provided by the deployment repository or an approved external configuration workflow.

## Security Defaults

The workload is configured to run as a non-root user with UID/GID `10001`.

The matching application image template creates the same user in `templates/app-repo/Dockerfile`.

## Image Pull Secrets

Set `imagePullSecrets` in private values files when the Gitea registry requires authentication:

```yaml
imagePullSecrets:
  - name: gitea-registry-pull
```

Do not commit registry credentials.

## Values Files

- `values-dev.yaml`
- `values-staging.yaml`
- `values-prod.yaml`

Use immutable image tags based on commit SHA. Do not deploy `latest`.

## Rollback

Use the previous immutable image tag or Helm revision:

```sh
helm rollback <release-name> <revision> --namespace <namespace>
```

For GitOps-managed environments, prefer reverting the deployment repo change that promoted the image tag.

## Boundary

This chart is a template. Real environment overlays, certificate issuer details, middleware references, and domain names belong in private deployment repositories.

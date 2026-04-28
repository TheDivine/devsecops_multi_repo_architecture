# Pod Security Standards

The `cybelynxcore-production` namespace should follow the Kubernetes restricted pod security profile where practical.

## Expected Controls

- Run as non-root.
- Drop Linux capabilities.
- Disable privilege escalation.
- Use `RuntimeDefault` seccomp.
- Avoid automounting service account tokens unless required.
- Define CPU and memory requests.
- Use immutable image references for real production promotion.

These controls are represented in the Kubernetes manifests and Kyverno policy examples.

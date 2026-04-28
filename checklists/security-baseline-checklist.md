# Security Baseline Checklist

- [ ] Secret scanning blocks pipeline.
- [ ] SAST runs on pull requests.
- [ ] Dependency and filesystem scanning runs on pull requests.
- [ ] Container image scanning runs before push.
- [ ] SBOM is generated for production images.
- [ ] IaC scanning runs where relevant.
- [ ] DefectDojo receives scan reports.
- [ ] No `latest` image tags in deployment.
- [ ] Docker Compose services define health checks and restart policies.
- [ ] Kubernetes workloads run non-root, define probes, and set requests/limits.
- [ ] Exceptions include owner, expiry, scope, compensating control, and approval reference.

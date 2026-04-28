# End-to-End Workflow

This workflow is Forgejo-first for the manual lab, while remaining compatible with GitHub, GitLab, and Gitea-style delivery patterns.

For the full manual implementation path, see [E2E Kubernetes DevSecOps Lab Guide](../implementation/e2e-kubernetes-devsecops-lab-guide.md) and [Demo App Kubernetes Deployment Plan](../implementation/demo-app-kubernetes-deployment-plan.md).

## Application Change Flow

1. Developer commits code in application repo.
2. Forgejo Actions CI runs tests, secret scanning, SAST, SCA, container scanning, image build, and report artifact upload.
3. Image is pushed to registry.
4. Security reports are uploaded to DefectDojo.
5. Deployment repo is updated with an immutable image tag.
6. Argo CD syncs the deployment repo overlay into the target namespace.
7. Traefik exposes the environment URL.
8. Prometheus/Grafana and logs are checked.
9. OWASP ZAP DAST is run against staging and imported into DefectDojo.
10. Production promotion requires manual approval and evidence from staging.

## Environment Order

1. Start with `demo-client-staging` because staging validates the complete production-shaped flow.
2. Add `demo-client-dev` after staging works so iteration can be faster with lower gates.
3. Add `demo-client-prod` only after rollback, observability, DAST, DefectDojo import, and release approval are documented.

## Infrastructure Change Flow

1. Platform engineer opens PR in infrastructure repo.
2. IaC scanning runs.
3. Terraform/OpenTofu plan is reviewed.
4. Approval required for staging/prod.
5. Apply is executed by authorized pipeline or platform engineer.

## Deployment Change Flow

1. Deployment repo receives image tag update.
2. Environment overlay is reviewed.
3. Deployment checks run.
4. Kustomize output is validated.
5. Argo CD applies the change for Kubernetes environments.
6. Monitoring confirms health.

Docker Compose remains supported for local or VM-based implementations, but the E2E lab guide focuses on Kubernetes.

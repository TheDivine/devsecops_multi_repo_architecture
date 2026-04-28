# Demo App Kubernetes Deployment Plan

This plan is the operational checklist for the first real staging deployment. It intentionally shows manual commands so the operator learns the process before automation is added.

Do not run these commands against production until the production gate in this document is complete.

## Phase 1: Prepare App Repo

Required for learning lab:

1. Create `demo-client-app`.
2. Run tests locally.
3. Build Docker image locally.
4. Configure Forgejo Actions.
5. Configure repository secrets.
6. Run CI.
7. Verify image exists in Forgejo registry.

Why this exists:

- The app repo proves the code can be tested, scanned, packaged, and published without touching Kubernetes.
- The image tag becomes the immutable artifact that deployment repos promote.

Manual commands:

```sh
mkdir ../demo-client-app
rsync -av repo-templates/app-repo/ ../demo-client-app/
cd ../demo-client-app
git init
git add -A
git commit -m "Initial demo client app from DevSecOps template"
docker build -t forgejo.example.com/org/demo-client-app:<git-sha> .
docker push forgejo.example.com/org/demo-client-app:<git-sha>
```

Replace `<git-sha>` with the real commit SHA or a versioned tag in the private demo repo. Do not use `latest` for staging or production.

## Phase 2: Prepare Deployment Repo

Required for staging:

1. Create `demo-client-deployment`.
2. Configure `demo-client-staging` overlay.
3. Configure namespace.
4. Configure imagePullSecret.
5. Configure immutable image tag.
6. Configure Traefik IngressRoute.
7. Configure probes, resources, securityContext, NetworkPolicy, ServiceAccount, and RBAC.
8. Validate Kustomize build.

Why this exists:

- The deployment repo is the desired-state source of truth.
- Environment overlays let dev, staging, and production differ without duplicating all manifests.
- Kustomize validation catches broken YAML before Kubernetes or Argo CD sees it.

Manual commands:

```sh
mkdir ../demo-client-deployment
rsync -av repo-templates/deployment-repo/ ../demo-client-deployment/
cd ../demo-client-deployment
git init
git add -A
git commit -m "Initial demo client deployment from DevSecOps template"
kustomize build kubernetes/overlays/staging
```

Staging overlay must include:

- namespace: `demo-client-staging`
- image: `forgejo.example.com/org/demo-client-app:<immutable-tag>`
- Traefik hostname: `demo-client-staging.example.com`
- imagePullSecret reference
- readiness and liveness probes
- resource requests and limits
- non-root `securityContext`
- ServiceAccount and minimal RBAC
- NetworkPolicy

## Phase 3: Manual Apply First

Required for learning lab:

```sh
kubectl create namespace demo-client-staging
kubectl create secret docker-registry <image-pull-secret-name> --namespace demo-client-staging
kubectl apply -k kubernetes/overlays/staging
kubectl -n demo-client-staging get pods,svc
kubectl -n demo-client-staging get ingressroute
kubectl -n demo-client-staging rollout status deployment/<app-name>
```

This proves Kubernetes can run the app before GitOps takes ownership.

Verification:

```sh
kubectl -n demo-client-staging describe pod <pod-name>
kubectl -n demo-client-staging logs deploy/<app-name>
curl -k https://demo-client-staging.example.com/health
```

Stop here if pods fail, image pulls fail, probes fail, or the Traefik route does not work. Fix staging before adding dev or production.

## Phase 4: Argo CD

Required for staging:

1. Create Argo CD Application for staging.
2. Sync app.
3. Verify health.
4. Verify rollback.

Why this exists:

- Argo CD makes Git the source of truth after the first manual Kubernetes validation.
- Sync status, diff, and health become release evidence.

Manual checks:

```sh
kubectl -n argocd get applications.argoproj.io
kubectl -n argocd describe application <demo-client-staging-app>
```

Rollback model:

1. Revert the image tag commit in the deployment repo.
2. Let Argo CD sync the previous known-good state.
3. Confirm rollout status and health endpoint.

## Phase 5: Observability

Required for staging:

1. Verify Prometheus target or ServiceMonitor.
2. Verify Grafana dashboard expectations.
3. Verify logs if Loki/Alloy exists.
4. Define basic alert expectations.

Why this exists:

- A deployment is not ready just because pods are running.
- Staging must prove that metrics, logs, and alerts can detect failure.

Minimum checks:

- request rate
- error rate
- latency
- pod restarts
- CPU and memory usage
- HTTP 5xx alert expectation
- pod crashloop alert expectation

## Phase 6: DAST

Required for staging:

1. Run OWASP ZAP baseline against staging URL.
2. Export report.
3. Import report to DefectDojo.
4. Review findings.

Example command:

```sh
docker run --rm -t owasp/zap2docker-stable zap-baseline.py \
  -t https://demo-client-staging.example.com \
  -r zap-staging-report.html
```

Use the report as security evidence. Do not point DAST at production until staging testing, allowlists, rate limits, and ownership are defined.

## Phase 7: Add Dev

Required after staging is stable:

- create `demo-client-dev`
- create dev overlay
- use dev domain
- lower gates
- faster iteration flow

Dev should be useful for fast feedback, not as a dumping ground for unreviewed production-like changes. Scans still run, but severity gates can be less strict than staging and production.

## Phase 8: Add Production

Required only after approval:

- create `demo-client-prod`
- create production overlay
- create production Argo CD Application
- use immutable known-good image tag
- require successful staging evidence
- verify rollback
- verify monitoring and alerts
- verify security gates

Production gate:

- staging deployment succeeded
- staging rollback tested
- DAST completed
- DefectDojo findings reviewed
- critical and high findings resolved or risk accepted
- immutable image tag selected
- no `latest`
- production secrets created separately
- imagePullSecret exists in `demo-client-prod`
- readiness/liveness probes verified
- resources and securityContext verified
- NetworkPolicy verified
- ServiceAccount/RBAC verified
- monitoring and alerts verified
- incident and rollback runbook reviewed

## Phase 9: Repeat For Trading Dashboard

Account for:

- app-specific dependencies
- environment variables
- database/cache requirements
- auth and secrets
- dashboard-specific health checks
- production readiness checklist

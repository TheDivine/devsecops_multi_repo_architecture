# New Project Checklist

## 1. Create Repositories

- [ ] app repo
- [ ] infra repo if new infrastructure is required
- [ ] deployment repo
- [ ] docs repo or docs folder in organization docs
- [ ] register project in platform/devsecops tracking

## 2. Configure App Repo

- [ ] add Dockerfile
- [ ] add `.env.example`
- [ ] add CI workflow
- [ ] enable secret scanning
- [ ] enable SAST/SCA/IaC scans
- [ ] generate SBOM
- [ ] push image to registry

## 3. Configure Deployment Repo

- [ ] choose Docker Compose or Kubernetes mode
- [ ] configure environment overlays
- [ ] configure Traefik/Ingress
- [ ] configure rollout/rollback
- [ ] configure environment secrets outside Git

## 4. Configure Security Platform

- [ ] create DefectDojo product
- [ ] create engagements
- [ ] configure reimport
- [ ] define severity gates
- [ ] assign vulnerability owners

## 5. Configure Operations

- [ ] monitoring target
- [ ] logging target
- [ ] backup plan
- [ ] access control
- [ ] runbooks

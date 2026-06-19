# Gitea Runner VM Plan

## Purpose

Plan self-hosted Gitea Actions runners for app CI and deployment workflows.

## Baseline

- dedicated runner VM or runner pool
- no broad production infrastructure credentials on app CI runners
- Docker build capability for application images
- isolated cache directories
- restricted network access to Gitea and registry
- runner labels for app, deployment, and infrastructure jobs

## Separation Rule

Application CI runners may build and push images. Deployment runners may deploy to staging or production. Production deployment runners require manual approval and should not be available to application developers.

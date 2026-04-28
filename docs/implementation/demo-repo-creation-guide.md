# Demo Repository Creation Guide

This guide creates local demo repositories from the platform templates. These should eventually become separate Forgejo repositories.

## Repository Set

Required for learning lab:

- `demo-client-app`
- `demo-client-deployment`

Optional later:

- `demo-client-infrastructure`
- `demo-client-docs`

## Create App Repo

```sh
mkdir ../demo-client-app
rsync -av repo-templates/app-repo/ ../demo-client-app/
cd ../demo-client-app
git init
git add -A
git commit -m "Initial demo client app from DevSecOps template"
git remote add origin ssh://git@forgejo.example.com/org/demo-client-app.git
```

Why:

- App repo owns source code, tests, Dockerfile, CI, scans, and image publishing.

## Create Deployment Repo

```sh
mkdir ../demo-client-deployment
rsync -av repo-templates/deployment-repo/ ../demo-client-deployment/
cd ../demo-client-deployment
git init
git add -A
git commit -m "Initial demo client deployment from DevSecOps template"
git remote add origin ssh://git@forgejo.example.com/org/demo-client-deployment.git
```

Why:

- Deployment repo owns Kubernetes desired state, Kustomize overlays, Argo CD Applications, Traefik routes, and runbooks.

## Create Optional Infrastructure Repo

```sh
mkdir ../demo-client-infrastructure
rsync -av repo-templates/infra-repo/ ../demo-client-infrastructure/
cd ../demo-client-infrastructure
git init
git add -A
git commit -m "Initial demo client infrastructure from DevSecOps template"
git remote add origin ssh://git@forgejo.example.com/org/demo-client-infrastructure.git
```

Why:

- Infrastructure repo later owns VM setup, DefectDojo VM, monitoring VM, firewall, VPN, DNS, TLS, and infrastructure docs.

## Create Optional Docs Repo

```sh
mkdir ../demo-client-docs
rsync -av repo-templates/docs-repo/ ../demo-client-docs/
cd ../demo-client-docs
git init
git add -A
git commit -m "Initial demo client docs from DevSecOps template"
git remote add origin ssh://git@forgejo.example.com/org/demo-client-docs.git
```

## Forgejo Notes

Forgejo should be treated as the source of truth for this lab. Forgejo/Gitea compatibility patterns are similar, but use Forgejo terminology going forward.

Use placeholders until real private repositories exist:

```text
ssh://git@forgejo.example.com/org/demo-client-app.git
ssh://git@forgejo.example.com/org/demo-client-deployment.git
```


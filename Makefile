.PHONY: help tree validate validate-docs grep-secrets check-placeholders k8s-check k8s-check-traefik k8s-check-metallb k8s-check-monitoring k8s-check-gitops k8s-check-forgejo k8s-check-defectdojo k8s-check-tooling k8s-check-all

help:
	@printf '%s\n' 'Safe local commands:'
	@printf '%s\n' '  make tree                Show repository files up to depth 4'
	@printf '%s\n' '  make validate            Run local-only blueprint validation'
	@printf '%s\n' '  make validate-docs       Check markdown files are non-empty'
	@printf '%s\n' '  make grep-secrets        Search for assignment-like sensitive values'
	@printf '%s\n' '  make check-placeholders  Search for placeholder markers'
	@printf '%s\n' '  make k8s-check-all       Run read-only Kubernetes readiness checks'

tree:
	@find . -maxdepth 4 -type f | sort

validate: validate-docs grep-secrets check-placeholders
	@bash -n scripts/kubernetes/*.sh
	@echo 'Local validation complete'

validate-docs:
	@find . -name '*.md' -type f -size 0 -print -quit | grep -q . && { echo 'Empty markdown file found'; exit 1; } || echo 'Markdown files are non-empty'

grep-secrets:
	@grep -RInE "(password|secret|token|client_secret|private_key|access_key)[[:space:]]*[:=][[:space:]]*['\"]?[^<'\"{}[:space:]]+" . --exclude-dir=.git || true

check-placeholders:
	@grep -RInE "(CHANGE_ME|example.com|TODO)" docs repo-templates README.md SECURITY.md CONTRIBUTING.md || true

k8s-check:
	@bash scripts/kubernetes/check-cluster-readiness.sh

k8s-check-traefik:
	@bash scripts/kubernetes/check-traefik-readiness.sh

k8s-check-metallb:
	@bash scripts/kubernetes/check-metallb-readiness.sh

k8s-check-monitoring:
	@bash scripts/kubernetes/check-monitoring-readiness.sh

k8s-check-gitops:
	@bash scripts/kubernetes/check-gitops-readiness.sh

k8s-check-forgejo:
	@bash scripts/kubernetes/check-forgejo-registry-readiness.sh

k8s-check-defectdojo:
	@bash scripts/kubernetes/check-defectdojo-readiness.sh

k8s-check-tooling:
	@bash scripts/kubernetes/check-tooling-inventory.sh

k8s-check-all: k8s-check k8s-check-traefik k8s-check-metallb k8s-check-monitoring k8s-check-gitops k8s-check-forgejo k8s-check-defectdojo k8s-check-tooling
	@echo 'Read-only Kubernetes readiness checks complete'

#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. "$SCRIPT_DIR/lib-readiness.sh"

need_kubectl
check_cluster
kubectl get ns argocd >/dev/null 2>&1 && pass "argocd namespace exists" || warn "argocd namespace not found"
has_crd "applications.argoproj.io" && pass "Argo CD Application CRD exists" || warn "Argo CD Application CRD missing"
kubectl get pods -A | grep -Ei 'flux|source-controller|kustomize-controller|helm-controller|weave' >/dev/null 2>&1 && pass "Flux/Weave GitOps components found" || warn "Flux/Weave GitOps components not found by name"
explain_warn_policy

#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. "$SCRIPT_DIR/lib-readiness.sh"

need_kubectl
check_cluster
has_crd "ingressroutes.traefik.io" && pass "Traefik IngressRoute CRD exists" || fail "Traefik IngressRoute CRD missing"
kubectl get ns traefik >/dev/null 2>&1 && pass "traefik namespace exists" || warn "traefik namespace not found"
kubectl -n traefik get pods >/dev/null 2>&1 && pass "Traefik pods are listable" || warn "Traefik pods not listable in namespace traefik"
explain_warn_policy

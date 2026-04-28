#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=scripts/kubernetes/lib-readiness.sh
. "$SCRIPT_DIR/lib-readiness.sh"

need_kubectl
check_cluster
kubectl get nodes >/dev/null 2>&1 && pass "nodes are listable" || fail "cannot list nodes"
kubectl -n kube-system get deployment coredns >/dev/null 2>&1 && pass "CoreDNS deployment exists" || warn "CoreDNS deployment not found"
kubectl get storageclass >/dev/null 2>&1 && pass "storage classes are listable" || warn "storage classes unavailable"
has_api "networking.k8s.io" && pass "NetworkPolicy API is available" || fail "NetworkPolicy API unavailable"
check_namespace "$TARGET_NAMESPACE"
check_failed_pods "$TARGET_NAMESPACE"
check_high_restarts "$TARGET_NAMESPACE"
explain_warn_policy

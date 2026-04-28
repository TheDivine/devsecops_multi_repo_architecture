#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. "$SCRIPT_DIR/lib-readiness.sh"

need_kubectl
check_cluster
kubectl get ns metallb-system >/dev/null 2>&1 && pass "metallb-system namespace exists" || warn "metallb-system namespace not found"
has_crd "ipaddresspools.metallb.io" && pass "MetalLB IPAddressPool CRD exists" || warn "MetalLB IPAddressPool CRD missing"
has_crd "l2advertisements.metallb.io" && pass "MetalLB L2Advertisement CRD exists" || warn "MetalLB L2Advertisement CRD missing"
kubectl get ipaddresspools.metallb.io -A >/dev/null 2>&1 && pass "MetalLB IP pools are listable" || warn "MetalLB IP pools not listable"
explain_warn_policy

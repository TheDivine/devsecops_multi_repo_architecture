#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. "$SCRIPT_DIR/lib-readiness.sh"

need_kubectl
check_cluster
has_crd "servicemonitors.monitoring.coreos.com" && pass "ServiceMonitor CRD exists" || warn "ServiceMonitor CRD missing"
kubectl get pods -A | grep -Ei 'prometheus|grafana|alertmanager' >/dev/null 2>&1 && pass "monitoring pods found" || warn "Prometheus/Grafana/Alertmanager pods not found by name"
kubectl top nodes >/dev/null 2>&1 && pass "metrics API responds to kubectl top nodes" || warn "metrics API unavailable; HPA may not function"
explain_warn_policy

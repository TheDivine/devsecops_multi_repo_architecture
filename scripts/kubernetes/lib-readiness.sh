#!/usr/bin/env bash
set -euo pipefail

TARGET_NAMESPACE="${TARGET_NAMESPACE:-demo-client-staging}"
FORGEJO_REGISTRY_HOST="${FORGEJO_REGISTRY_HOST:-}"
DEFECTDOJO_URL="${DEFECTDOJO_URL:-}"
IMAGE_PULL_SECRET_NAME="${IMAGE_PULL_SECRET_NAME:-forgejo-registry}"
HIGH_RESTART_THRESHOLD="${HIGH_RESTART_THRESHOLD:-10}"

pass() { printf 'PASS %s\n' "$*"; }
warn() { printf 'WARN %s\n' "$*"; }
fail() { printf 'FAIL %s\n' "$*"; }
info() { printf 'INFO %s\n' "$*"; }

need_kubectl() {
  if ! command -v kubectl >/dev/null 2>&1; then
    fail "kubectl is not installed or not in PATH"
    exit 1
  fi
  pass "kubectl is available"
}

check_cluster() {
  if kubectl version --request-timeout=5s >/dev/null 2>&1; then
    pass "cluster API is reachable"
  else
    fail "cluster API is not reachable with current kubeconfig"
    exit 1
  fi
}

has_api() {
  kubectl api-resources --api-group="$1" >/dev/null 2>&1
}

has_crd() {
  kubectl get crd "$1" >/dev/null 2>&1
}

check_namespace() {
  local ns="${1:-$TARGET_NAMESPACE}"
  if kubectl get namespace "$ns" >/dev/null 2>&1; then
    pass "namespace exists: $ns"
  else
    warn "namespace missing: $ns"
  fi
}

check_failed_pods() {
  local ns="${1:-$TARGET_NAMESPACE}"
  if kubectl get namespace "$ns" >/dev/null 2>&1; then
    local failed
    failed="$(kubectl get pods -n "$ns" --field-selector=status.phase=Failed --no-headers 2>/dev/null | wc -l | tr -d ' ')"
    if [ "$failed" = "0" ]; then
      pass "no failed pods in $ns"
    else
      warn "$failed failed pod(s) found in $ns"
    fi
  else
    warn "cannot check failed pods because namespace is missing: $ns"
  fi
}

check_high_restarts() {
  local ns="${1:-$TARGET_NAMESPACE}"
  if ! kubectl get namespace "$ns" >/dev/null 2>&1; then
    warn "cannot check restarts because namespace is missing: $ns"
    return
  fi
  local rows
  rows="$(kubectl get pods -n "$ns" -o jsonpath='{range .items[*]}{.metadata.name}{" "}{range .status.containerStatuses[*]}{.restartCount}{" "}{end}{"\n"}{end}' 2>/dev/null || true)"
  if [ -z "$rows" ]; then
    warn "no pods found in $ns"
    return
  fi
  local bad=0
  while read -r pod rest _; do
    [ -z "${pod:-}" ] && continue
    if [ "${rest:-0}" -gt "$HIGH_RESTART_THRESHOLD" ]; then
      warn "high restart count in $ns: $pod has $rest restarts"
      bad=1
    fi
  done <<< "$rows"
  if [ "$bad" = "0" ]; then
    pass "no pod restart count above $HIGH_RESTART_THRESHOLD in $ns"
  fi
}

explain_warn_policy() {
  info "WARN is acceptable for learning lab but must be reviewed before production"
}

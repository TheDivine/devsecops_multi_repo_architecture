#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. "$SCRIPT_DIR/lib-readiness.sh"

for tool in kubectl kustomize helm ansible-playbook terraform docker curl; do
  if command -v "$tool" >/dev/null 2>&1; then
    pass "$tool is installed"
  else
    warn "$tool is not installed"
  fi
done

if command -v kubectl >/dev/null 2>&1 && kubectl version --request-timeout=5s >/dev/null 2>&1; then
  has_crd "certificates.cert-manager.io" && pass "cert-manager CRDs exist" || warn "cert-manager CRDs missing; OK for first demo if Traefik ACME works"
fi
explain_warn_policy

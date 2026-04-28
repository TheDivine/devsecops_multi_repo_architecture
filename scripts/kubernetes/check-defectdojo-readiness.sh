#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. "$SCRIPT_DIR/lib-readiness.sh"

if [ -n "$DEFECTDOJO_URL" ]; then
  pass "DEFECTDOJO_URL is set"
  if command -v curl >/dev/null 2>&1; then
    curl -k -sSf --max-time 5 "$DEFECTDOJO_URL" >/dev/null 2>&1 && pass "DefectDojo URL responds" || warn "DefectDojo URL did not respond successfully"
  else
    warn "curl missing; cannot test DefectDojo URL"
  fi
else
  warn "DEFECTDOJO_URL is not set"
fi
explain_warn_policy

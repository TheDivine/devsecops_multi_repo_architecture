#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. "$SCRIPT_DIR/lib-readiness.sh"

need_kubectl
check_cluster
if [ -n "$FORGEJO_REGISTRY_HOST" ]; then
  pass "FORGEJO_REGISTRY_HOST is set: $FORGEJO_REGISTRY_HOST"
else
  warn "FORGEJO_REGISTRY_HOST is not set"
fi
check_namespace "$TARGET_NAMESPACE"
if kubectl -n "$TARGET_NAMESPACE" get secret "$IMAGE_PULL_SECRET_NAME" >/dev/null 2>&1; then
  pass "imagePullSecret exists in $TARGET_NAMESPACE: $IMAGE_PULL_SECRET_NAME"
else
  warn "imagePullSecret missing in $TARGET_NAMESPACE: $IMAGE_PULL_SECRET_NAME"
fi
explain_warn_policy

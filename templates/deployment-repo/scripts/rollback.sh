#!/usr/bin/env bash
set -euo pipefail

environment="${1:-}"
previous_image_tag="${2:-}"

if [[ -z "${environment}" || -z "${previous_image_tag}" ]]; then
  echo "Usage: $0 <staging|prod> <previous-immutable-image-tag>" >&2
  exit 2
fi

if [[ "${previous_image_tag}" == "latest" ]]; then
  echo "Refusing to roll back to mutable image tag: latest" >&2
  exit 2
fi

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
"${script_dir}/deploy.sh" "${environment}" "${previous_image_tag}"

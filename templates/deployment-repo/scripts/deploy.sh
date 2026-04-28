#!/usr/bin/env bash
set -euo pipefail

environment="${1:-}"
image_tag="${2:-}"

if [[ -z "${environment}" || -z "${image_tag}" ]]; then
  echo "Usage: $0 <staging|prod> <immutable-image-tag>" >&2
  exit 2
fi

case "${environment}" in
  staging)
    compose_file="docker-compose/docker-compose.staging.yml"
    env_file="docker-compose/.env.staging"
    ;;
  prod)
    compose_file="docker-compose/docker-compose.prod.yml"
    env_file="docker-compose/.env.prod"
    ;;
  *)
    echo "Unsupported environment: ${environment}" >&2
    exit 2
    ;;
esac

if [[ ! -f "${env_file}" ]]; then
  echo "Missing private environment file: ${env_file}" >&2
  echo "Create it from ${env_file}.example in the private deployment repository." >&2
  exit 2
fi

if [[ "${image_tag}" == "latest" ]]; then
  echo "Refusing to deploy mutable image tag: latest" >&2
  exit 2
fi

export APP_IMAGE
APP_IMAGE="$(grep '^APP_IMAGE=' "${env_file}" | cut -d= -f2- | sed "s/:<commit-sha>$/:${image_tag}/")"

docker compose --env-file "${env_file}" -f "${compose_file}" pull
docker compose --env-file "${env_file}" -f "${compose_file}" up -d

health_url="https://$(grep '^APP_DOMAIN=' "${env_file}" | cut -d= -f2-)/health"
for attempt in {1..20}; do
  if curl --fail --silent --show-error "${health_url}" >/dev/null; then
    echo "Deployment healthy: ${health_url}"
    exit 0
  fi
  sleep 5
done

echo "Health check failed after deployment: ${health_url}" >&2
exit 1

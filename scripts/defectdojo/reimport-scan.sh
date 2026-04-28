#!/usr/bin/env bash
set -euo pipefail

scanner="${1:-}"
report_file="${2:-}"
branch_name="${3:-}"
commit_sha="${4:-}"

if [[ -z "${scanner}" || -z "${report_file}" ]]; then
  echo "Usage: $0 <trivy|semgrep|gitleaks|checkov|zap> <report-file> [branch] [commit]" >&2
  exit 2
fi

for required in DEFECTDOJO_URL DEFECTDOJO_API_KEY DEFECTDOJO_PRODUCT_NAME DEFECTDOJO_ENGAGEMENT_NAME; do
  if [[ -z "${!required:-}" ]]; then
    echo "Missing required environment variable: ${required}" >&2
    exit 2
  fi
done

if [[ ! -s "${report_file}" ]]; then
  echo "Report file does not exist or is empty: ${report_file}" >&2
  exit 2
fi

case "${scanner}" in
  trivy)
    scan_type="Trivy Scan"
    ;;
  semgrep)
    scan_type="Semgrep JSON Report"
    ;;
  gitleaks)
    scan_type="Gitleaks Scan"
    ;;
  checkov)
    scan_type="Checkov Scan"
    ;;
  zap)
    scan_type="ZAP Scan"
    ;;
  *)
    echo "Unsupported scanner: ${scanner}" >&2
    exit 2
    ;;
esac

curl --fail --show-error --silent \
  --request POST "${DEFECTDOJO_URL%/}/api/v2/reimport-scan/" \
  --header "Authorization: Token ${DEFECTDOJO_API_KEY}" \
  --form "scan_type=${scan_type}" \
  --form "product_name=${DEFECTDOJO_PRODUCT_NAME}" \
  --form "engagement_name=${DEFECTDOJO_ENGAGEMENT_NAME}" \
  --form "active=true" \
  --form "verified=false" \
  --form "close_old_findings=false" \
  --form "branch_tag=${branch_name}" \
  --form "commit_hash=${commit_sha}" \
  --form "file=@${report_file}"

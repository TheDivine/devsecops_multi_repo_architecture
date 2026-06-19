#!/usr/bin/env sh
set -eu

scan_type=""
report_file=""
branch_name=""
commit_sha=""

while [ "$#" -gt 0 ]; do
  case "$1" in
    --scan-type)
      scan_type="$2"
      shift 2
      ;;
    --report-file)
      report_file="$2"
      shift 2
      ;;
    --branch)
      branch_name="$2"
      shift 2
      ;;
    --commit)
      commit_sha="$2"
      shift 2
      ;;
    *)
      echo "Unknown argument: $1" >&2
      exit 2
      ;;
  esac
done

for required in DEFECTDOJO_URL DEFECTDOJO_API_KEY DEFECTDOJO_PRODUCT_NAME DEFECTDOJO_ENGAGEMENT_NAME; do
  eval "value=\${$required:-}"
  if [ -z "$value" ]; then
    echo "Missing required environment variable: $required" >&2
    exit 2
  fi
done

if [ -z "$scan_type" ] || [ -z "$report_file" ]; then
  echo "Usage: $0 --scan-type <type> --report-file <path> [--branch <name>] [--commit <sha>]" >&2
  exit 2
fi

if [ ! -s "$report_file" ]; then
  echo "Report file does not exist or is empty: $report_file" >&2
  exit 2
fi

curl --fail --show-error --silent \
  --request POST "${DEFECTDOJO_URL%/}/api/v2/import-scan/" \
  --header "Authorization: Token ${DEFECTDOJO_API_KEY}" \
  --form "scan_type=${scan_type}" \
  --form "product_name=${DEFECTDOJO_PRODUCT_NAME}" \
  --form "engagement_name=${DEFECTDOJO_ENGAGEMENT_NAME}" \
  --form "active=true" \
  --form "verified=false" \
  --form "close_old_findings=false" \
  --form "minimum_severity=${DEFECTDOJO_MINIMUM_SEVERITY:-Info}" \
  --form "branch_tag=${branch_name}" \
  --form "commit_hash=${commit_sha}" \
  --form "file=@${report_file}"

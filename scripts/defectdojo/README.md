# DefectDojo Scripts

## Required Environment Variables

- `DEFECTDOJO_URL`
- `DEFECTDOJO_API_KEY`
- `DEFECTDOJO_PRODUCT_NAME`
- `DEFECTDOJO_ENGAGEMENT_NAME`

## Usage

```sh
DEFECTDOJO_URL="https://defectdojo.example.com" \
DEFECTDOJO_API_KEY="<private-ci-secret>" \
DEFECTDOJO_PRODUCT_NAME="demo-client-app" \
DEFECTDOJO_ENGAGEMENT_NAME="staging-ci" \
scripts/defectdojo/reimport-scan.sh trivy trivy-image.json main <commit-sha>
```

Supported scanner keys:

- `trivy`
- `semgrep`
- `gitleaks`
- `checkov`
- `zap`

Use CI secrets for the API key. Do not commit scan reports from real clients to public repositories.

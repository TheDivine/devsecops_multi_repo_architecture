# OWASP ZAP Staging Baseline

Run DAST only against staging or explicitly approved test environments.

```sh
docker run --rm -t owasp/zap2docker-stable zap-baseline.py \
  -t https://staging.app.example.com \
  -J zap-staging.json \
  -r zap-staging.html
```

Import `zap-staging.json` into DefectDojo as `ZAP Scan`.

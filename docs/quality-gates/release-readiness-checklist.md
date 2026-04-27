# Release Readiness Checklist

Use this checklist before promoting a release to production.

## Build and Test

- Application CI passed.
- Image was built from the expected source commit.
- Image scan results are reviewed.
- Release notes are prepared.

## Deployment

- Deployment repository change is reviewed.
- Environment overlay references the approved image.
- Manifest validation passed.
- Rollback reference is known.

## Operations

- Monitoring is in place.
- Alert routing is understood.
- Support owner is assigned.
- Incident response path is documented.

## Security

- Required security gates passed.
- Exceptions are documented and approved.
- No real sensitive values are present in repository files.

# CI Pipeline

## Purpose

The application CI pipeline proves that code is testable, buildable, and safe to hand off to the deployment repository.

## Recommended Stages

- lint
- unit tests
- integration tests where applicable
- dependency scanning
- container build
- container scanning
- SBOM generation where required
- image publish for trusted branches or release tags

## Handoff

The pipeline should publish image metadata including tag, digest, source commit, and scan status. Deployment promotion happens in the deployment repository.

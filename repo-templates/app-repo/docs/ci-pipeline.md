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
- policy evaluation of build, scan, SBOM, provenance, and handoff metadata
- image publish for trusted branches or release tags

## Handoff

The pipeline should publish image metadata including tag, digest, source commit, scan status, SBOM reference, and provenance reference. A trusted release job should evaluate the handoff policy before publication. Deployment promotion happens in the deployment repository.

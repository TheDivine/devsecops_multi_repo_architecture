# Application CI Template

## Purpose

Application CI validates source code, builds artifacts, and publishes deployable images. It does not directly mutate production infrastructure.

## Standard Stages

1. Checkout and dependency setup.
2. Linting and formatting checks.
3. Unit and integration tests.
4. Static analysis.
5. Dependency and container scanning.
6. SBOM generation where required.
7. Image build and push for trusted branches or release tags.
8. Metadata handoff to the deployment repository.

## Required Outputs

- test result
- scan result
- image tag
- image digest
- source commit
- release notes or changelog entry

## Ownership

Application teams own this pipeline with platform-provided templates and security-provided gates.

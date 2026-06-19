# ADR-011: Use Gitea Registry For Application Images

## Status

Accepted

## Context

Application repositories need a standard place to push images after successful CI.

## Decision

Use the Gitea container registry as the default registry for client starter projects. Images are tagged with immutable commit SHAs. Deployment repositories promote those immutable tags to environments.

## Consequences

- App CI owns image build and push.
- Deployment repos do not rebuild images.
- Runtime credentials must be configured as private secrets.
- `latest` tags are not used for deployment.

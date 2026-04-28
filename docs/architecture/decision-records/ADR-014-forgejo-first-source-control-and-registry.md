# ADR-014: Forgejo-First Source Control And Registry

## Status

Accepted.

## Context

The lab needs one default source-control, CI, and registry model that can be repeated for future client work. GitHub, GitLab, Gitea, and Forgejo patterns are similar enough that the blueprint should stay portable, but the current implementation direction is self-hosted and Forgejo-first.

## Decision

Use Forgejo-first terminology for the manual E2E lab. Forgejo is the preferred source-control system and container registry for the demo client repositories.

The blueprint remains compatible with GitHub, GitLab, and Gitea patterns when a client environment requires a different platform.

## Consequences

- Application repositories publish immutable images to a Forgejo registry.
- Deployment repositories reference Forgejo registry image tags.
- CI examples should use Forgejo-compatible Actions terminology where possible.
- Existing Gitea references may remain only when explaining Forgejo/Gitea compatibility.
- Client implementations can replace Forgejo with another Git platform without changing the multi-repo architecture.

## Alternatives Considered

- GitHub-first: easier for public examples, but less aligned with the self-hosted lab.
- GitLab-first: strong integrated DevSecOps features, but heavier than required for the lab.
- Tool-neutral only: portable, but too abstract for an E2E implementation guide.

## When To Revisit

Revisit if a future client standardizes on another Git platform, or if Forgejo registry or runner capabilities do not meet required CI/CD or compliance needs.

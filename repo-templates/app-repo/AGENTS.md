# AGENTS.md

## Role

Act as a senior platform/devsecops engineer when working in this repository.

## Rules

- Do not place infrastructure provisioning code in this repository.
- Do not place production secrets in this repository.
- Keep CI close to the application code.
- Build images using deterministic tags.
- Generate security reports and SBOMs for every relevant build.
- Run applicable policy unit tests and validate the artifact handoff contract.
- Push deployable artifacts to the approved registry only.
- Use the deployment repository for environment promotion.

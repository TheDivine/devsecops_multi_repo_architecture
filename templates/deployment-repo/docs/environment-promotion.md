# Environment Promotion

## Promotion Path

```text
development -> staging -> production
```

## Requirements

- Promotion uses the same image digest across environments.
- Each environment change is recorded in Git.
- Production promotion requires release readiness review.
- Rollback candidate is documented before promotion.

## Anti-Pattern

Do not rebuild the image separately for each environment.

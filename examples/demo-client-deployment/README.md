# Demo Client Deployment

This example represents the deployment repository created from `templates/deployment-repo`.

## Flow

1. Promote immutable image tags to dev or staging.
2. Run health checks.
3. Run OWASP ZAP against staging.
4. Require manual approval for production.
5. Roll back by restoring the previous immutable image tag or Helm revision.

Supports VM/Docker Compose and Kubernetes paths.

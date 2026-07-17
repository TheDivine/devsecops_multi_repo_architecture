# Policy Standards

This directory contains reusable policy-as-code guidance and severity gating rules.

The platform repository owns reusable implementations and compatibility testing. The security repository owns control intent, severity, evidence, and exception requirements. Application, deployment, infrastructure, and monitoring repositories own integration with their artifacts.

## Reviewed Tooling Boundary

The synthetic tests were last verified on 2026-07-15 with Kyverno CLI 1.18.2. This is a review boundary, not a permanent production recommendation. Pin the organization-approved version and rerun the full test suite before Kubernetes, Kyverno, policy, or exception changes.

## Examples

- admission policy standards
- image policy rules
- namespace constraints
- exception workflow templates

Included examples:

- [`kyverno/require-non-root.yaml`](kyverno/require-non-root.yaml)
- [`kyverno/disallow-latest-tag.yaml`](kyverno/disallow-latest-tag.yaml)
- [`kyverno/disallow-privileged-containers.yaml`](kyverno/disallow-privileged-containers.yaml)
- [`kyverno/wazuh-agent-policy-exception.yaml.example`](kyverno/wazuh-agent-policy-exception.yaml.example)

The executable policy examples use audit mode and synthetic tests. Do not apply them to a cluster until the target Kubernetes and Kyverno versions, scope, exclusions, reports, and rollback behavior have been reviewed.

Start policies in audit mode, test positive/negative/exception cases, remediate violations, and enable enforcement only after owners, monitoring, rollback, break-glass, and version compatibility are approved.

Run the synthetic Kyverno behavior tests with a pinned compatible CLI:

```bash
kyverno test repo-templates/platform-repo/policies/kyverno/tests --require-tests
```

Test policies again before every Kubernetes or Kyverno upgrade. CI policy evaluation and cluster admission should use compatible policy bundles, but runtime admission remains the authoritative protection against direct cluster changes.

The Wazuh PolicyException is a skeleton for private adaptation. It does not authorize privileged access. Kyverno PolicyExceptions must be explicitly enabled and validated against the pinned Kyverno version. Store exceptions in the configured, RBAC-restricted PolicyException namespace, bind them to the exact reviewed workload identity, and require an owner plus expiry. Never deploy the placeholder file as-is.

## Rule

Policies should be reusable and generic. Client-specific exceptions belong in private implementation repositories.

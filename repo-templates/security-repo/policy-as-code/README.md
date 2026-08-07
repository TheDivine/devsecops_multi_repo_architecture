# Security Policy as Code Baseline

## Purpose

Policy as code converts approved security requirements into versioned, reviewable, testable, and observable controls. It does not replace architecture review, threat modeling, secure development, vulnerability remediation, or accountable risk decisions.

This public-safe baseline defines the security requirement and governance contract. Reusable enforcement templates belong in the platform repository; environment-specific values, exceptions, evidence, and approvals belong in private implementation repositories.

## Repository Ownership

| Concern | Repository owner |
| --- | --- |
| Security intent, severity, evidence, and exception requirements | Security repository |
| Reusable Kyverno/OPA/admission templates and CI integration | Platform repository |
| Application-specific policy tests and build gates | Application repository |
| Environment overlays, enforcement mode, and promotion | Deployment repository |
| Cloud account, network, and managed-service guardrails | Infrastructure repository |
| Alert quality, routing metadata, and telemetry requirements | Monitoring repository |
| Public-safety, schema, link, and decision-record quality | Documentation repository |

See the reusable Kyverno examples in [`../../platform-repo/policies/`](../../platform-repo/policies/).

See the cross-repository [Policy as Code Operating Model](../../../docs/policy-as-code/operating-model.md) for enforcement layers, testing, rollout, and repository-specific examples.

## Minimum Policy Catalog

Evaluate these controls according to the real platform and risk:

- images use explicit immutable versions or digests and approved registries;
- workloads run as non-root where possible;
- privileged containers, host namespaces, hostPath volumes, and added capabilities are denied by default;
- seccomp and other supported runtime hardening are set;
- resource requests and limits are defined;
- service accounts and RBAC follow least privilege;
- secrets are referenced from approved secret systems and are not embedded in manifests;
- ingress, services, and network policies expose only intended paths;
- infrastructure-as-code changes are scanned and reviewed before apply;
- policy exceptions have an owner, reason, compensating controls, approval, expiry, and review date.

## Lifecycle

1. **Define:** write a plain-language requirement, owner, severity, scope, evidence, and failure behavior.
2. **Implement:** encode the requirement in a selected policy engine and pin the engine/tooling version.
3. **Test:** include positive, negative, and exception cases using sanitized fixtures.
4. **Audit:** deploy in non-blocking mode and measure violations, false positives, and operational impact.
5. **Remediate:** fix workloads and document any narrow, time-bounded exceptions.
6. **Enforce:** enable blocking only after owners, rollback, break-glass, and monitoring are ready.
7. **Review:** periodically review policy effectiveness, exceptions, engine upgrades, bypasses, and ownership.

Do not move directly from an untested template to cluster-wide enforcement.

## Wazuh DaemonSet Exception Pattern

A node-level Wazuh DaemonSet may conflict with the restricted baseline because it can require privileged access or hostPath mounts. Treat this as an exception case, not as a reason to weaken the baseline for every workload.

Approval requires:

- evidence that lower-privilege log collection cannot satisfy the agreed use case;
- the exact required host paths, namespaces, capabilities, devices, and socket access;
- read-only mounts and least privilege wherever technically possible;
- a dedicated namespace, service account, image digest, SBOM, vulnerability review, and egress restriction;
- GitOps review, drift monitoring, health checks, rollback, and upgrade tests;
- an exception owner, risk owner, compensating controls, approval reference, expiry, and scheduled review;
- validation after DOKS, Kubernetes, Wazuh, or policy-engine upgrades.

The platform template includes an audit-mode privileged-container policy and a public-safe PolicyException skeleton. The private implementation must bind an approved exception to the exact workload identity; do not use a broad namespace or wildcard exception.

If the policy engine evaluates both the DaemonSet and generated Pods, apply the approved exception identity label to the controller and Pod template. Validate controller rule autogeneration and PolicyException behavior against the pinned Kyverno version before relying on the exception.

## CI and Admission Layers

Use both layers where practical:

- **CI policy checks:** fast feedback on Kubernetes, Terraform/OpenTofu, Dockerfiles, and other declarative configuration before merge.
- **Admission policies:** protection against direct or drifted changes that reach the cluster API.

Pin policy engines and validation tools. Keep policies and tests in the same review flow, and fail the pipeline only according to the approved severity and rollout mode.

## Exception Record

Every exception should record:

- `<EXCEPTION_ID>` and affected policy/rule;
- exact workload, namespace, environment, and owner;
- business and technical justification;
- risk and data impact;
- compensating prevention, detection, and response controls;
- approval reference and approver;
- creation, expiry, and review dates;
- validation and rollback evidence;
- remediation or removal plan.

Do not store real customer identifiers, incidents, credentials, cluster data, or sensitive evidence in this public blueprint.

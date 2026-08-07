# Security Baseline

## Purpose

Define minimum security expectations for systems managed under this blueprint.

## Baseline Areas

- identity and access
- patching and vulnerability management
- host hardening
- audit logging
- malware scanning
- runtime detection
- backup and recovery controls

## Attack Surface and API Security Baseline

Before release and after significant architecture changes:

- inventory public web, API, GraphQL, webhook, partner, administrative, and management endpoints;
- identify which endpoints must be internet-accessible and remove, restrict, or monitor unnecessary exposure;
- prevent bypass of the approved CDN/WAF/API-gateway/origin path;
- enforce authentication, object- and function-level authorization, input validation, rate limits, and tenant isolation in application code;
- test IDOR and cross-tenant access explicitly; do not treat a WAF rule as the remediation;
- use scoped identity, signed requests or mTLS for external providers where supported;
- use provider IP allowlists only for stable published ranges and as one layer, with update and failover procedures;
- assign an owner and audit trail to every public or provider integration.

## Secure SDLC and CI/CD Baseline

Select tools according to the technology stack and validate their coverage. A useful minimum pipeline evaluates:

- secrets before merge;
- source code with an appropriate SAST tool;
- supported operating-system and application dependencies with SCA/dependency scanning;
- container images with Trivy or an equivalent scanner, using approved base images and an SBOM where required;
- Terraform/OpenTofu, Kubernetes, Dockerfiles, and other declarative configuration with IaC scanning and policy as code;
- high-risk deployed flows with DAST/API tests, including authorization and tenant-boundary cases.

Use incremental pull-request checks for fast feedback and scheduled full scans for broader coverage. Normalize and deduplicate results before assigning work. Introduce release blocking progressively based on agreed severity, exploitability, exposure, asset criticality, fix availability, and policy maturity; do not block every build on every untriaged result from day one.

Every bypass or accepted-risk decision requires an owner, justification, compensating controls, approval, expiry, and review.

## Vulnerability Management Baseline

- inventory all finding sources and identify authoritative versus duplicate results;
- maintain one normalized actionable backlog or an integrated system of record;
- prioritize with business context, exposure, exploitability, asset/data criticality, and compensating controls in addition to scanner severity;
- assign a service owner and remediation target to every actionable finding;
- verify the fix before closure and track repeat findings;
- separate product-code remediation, platform remediation, and runtime detection ownership;
- report backlog age, remediation performance, exceptions, recurrence, and control coverage rather than raw scanner totals alone.

Complete an architecture and operating-model assessment before committing to a full Wazuh, WAF, scanning, or policy rollout.

## Security Monitoring and SIEM Baseline

Before onboarding an environment, record and approve:

- identified log sources, formats, sensitivity, and source owners;
- agent deployment, configuration, upgrade, and offboarding ownership;
- alert triage and detection-rule ownership;
- a contextual severity model tied to asset criticality and control outcome;
- approved notification and ticket channels with secrets kept in private stores;
- retention, deletion, archival, backup, and restore targets;
- a documented triage, evidence, escalation, and decision workflow;
- an exception process with scope, risk, compensating control, owner, expiry, and review.

Use the [Wazuh/SIEM Integration Blueprint](../wazuh/README.md) as an adaptable reference pattern, not as production-ready configuration.

## Policy as Code Baseline

Before enforcing security policies, record and approve:

- the plain-language requirement, policy owner, scope, severity, and evidence;
- the selected and pinned policy engine and validation tooling;
- positive, negative, and exception tests;
- audit-mode findings and false-positive review;
- enforcement, rollback, break-glass, monitoring, and upgrade procedures;
- a narrow exception process with workload identity, risk owner, compensating controls, approval, expiry, and review.

Security requirements belong in the security repository, reusable enforcement templates in the platform repository, and environment-specific modes and exceptions in private deployment repositories. Use the [Security Policy as Code Baseline](../policy-as-code/README.md) and the reusable [platform policy templates](../../platform-repo/policies/).

## Review

Review the baseline before onboarding each new environment and after significant platform changes.

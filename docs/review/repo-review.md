# Repository Review

## What Was Added

This blueprint now includes a broader DevSecOps operating model covering security boundaries, GitOps promotion, CI/CD ownership, client onboarding, operations, quality gates, architecture diagrams, decision records, tooling references, and expanded repository templates.

It also includes a public-safe visual hero asset at `docs/assets/devsecops-blueprint-hero.svg` for use in the README, portfolio pages, or generated documentation.

The repository includes starter implementation examples for Ansible baselines, Kubernetes manifests, Traefik routing, security tooling, monitoring rules, and platform policies. These examples are intentionally generic and must be adapted in private implementation repositories before real use.

The security template now includes a public-safe [Wazuh/SIEM integration blueprint](../../repo-templates/security-repo/wazuh/README.md) covering architecture and fit review, WAF log onboarding, custom decoder and rule examples, alert operations, ownership, sizing, retention, escalation, and tool-category comparison.

The Wazuh blueprint records a reviewed Wazuh 4.14.6 stable reference boundary, keeps Wazuh 5.0 beta explicitly out of scope, and adds a reusable compatibility, hardening, and upgrade-gate checklist.

The repository also includes a cross-repository [Policy as Code Operating Model](../policy-as-code/operating-model.md), tested Conftest policies for application build handoff, Kubernetes deployment manifests, Terraform/OpenTofu destructive changes, and Prometheus alert metadata, plus Kyverno admission and exception tests. A root policy-validation workflow pins its action and policy CLI versions and verifies release checksums.

The blueprint now documents its [DevSecOps principles](../foundations/devsecops-principles.md), [responsibility model](../governance/devsecops-responsibility-model.md), [framework alignment](../governance/framework-alignment.md), and [research sources](../references/research-and-standards.md). The alignment uses NIST, OWASP, SLSA, CIS, MITRE ATT&CK, and CISA guidance as adaptable references and explicitly avoids certification or compliance claims.

## How To Use This Repo

Use this repository as a reference standard before creating real implementation repositories. Copy only the relevant template folders, replace placeholders in private repositories, and keep ownership boundaries explicit.

## Public Safety Notes

- This blueprint must contain placeholders only.
- Real credentials, customer names, domains, IP addresses, provider identifiers, and environment inventories belong in private implementation repositories.
- Deployment or infrastructure mutation commands are intentionally not included.
- Run sanitization checks before publishing derivative content.

## Suggested Next Improvements

- Expand the root validation workflow beyond policy tests to documentation links, formats, Terraform, Ansible, Kustomize, Helm, Compose, and public-safety checks.
- Harden all copied CI examples with minimal permissions, full-SHA action pinning, trusted release boundaries, SBOMs, provenance, and short-lived credentials where supported.
- Add a public-safe DevSecOps assessment pack with evidence, risk, RACI, exception, maturity, and roadmap templates.
- Add Wazuh decoder and rule behavior tests in a pinned, isolated Wazuh validation environment.
- Configure and review repository rulesets, required checks, ownership, dependency updates, and security features on the hosting platform.
- Add a rendered documentation site if this becomes a long-lived internal standard.

## Alignment With Repository Types

The app repo template focuses on source code, local development, CI, image creation, and security checks.

The deployment repo template focuses on manifests, environment overlays, GitOps application examples, promotion, and rollback.

The infra repo template focuses on Terraform/OpenTofu provisioning boundaries, Ansible configuration flow, state management, and placeholder inventories.

The platform repo template focuses on shared GitOps standards, policies, observability guidance, platform security, and operating-model documentation.

The security repo template focuses on baselines, audit, malware scanning, endpoint monitoring, and node onboarding.

The monitoring repo template focuses on metrics, dashboards, logs, alert routing, and observability ownership.

The docs repo remains the place for architecture, onboarding, runbooks, decision records, and operational procedures.

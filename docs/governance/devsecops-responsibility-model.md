# DevSecOps Responsibility Model

## Purpose

DevSecOps is shared responsibility, not shared ambiguity. This reference model separates enablement, implementation, operation, remediation, and risk acceptance.

Role names vary by organization. In a small team one person may hold several roles, but the decisions should remain distinct.

## What a DevSecOps or Security Platform Owner Normally Owns

- assess the delivery and runtime architecture with the relevant owners;
- define reusable security requirements, paved-road templates, and policy-as-code contracts;
- integrate proportionate SAST, SCA, secret, IaC, container, artifact, and deployment checks;
- secure CI/CD identities, permissions, runners, secrets, dependencies, and release boundaries;
- establish finding normalization, severity, routing, exception, evidence, and reporting models;
- connect runtime findings from WAF, cloud, host, container, and SIEM controls to accountable teams;
- tune controls with developers, platform engineers, operations, and security analysts;
- measure control coverage and remediation outcomes;
- explain residual risk and options to the accountable decision-maker.

This role enables and governs the system. It does not automatically own every code fix, production service, alert queue, or business risk decision.

## Responsibility Matrix

The table uses **A** for accountable, **R** for responsible, **C** for consulted, and **I** for informed. Assign real role names in the private implementation.

| Activity | Leadership / risk owner | Product / service owner | Application team | Platform / DevSecOps | Infrastructure / cloud | Security / AppSec | Security operations / SRE |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Risk appetite and material risk acceptance | A/R | C | I | C | C | C | I |
| Asset and data classification | C | A/R | C | C | C | C | I |
| Architecture and threat modeling | I | A | R | R | C | C | C |
| Secure coding, authorization, and business-logic fixes | I | A | R | C | I | C | I |
| Application dependency remediation | I | A | R | C | I | C | I |
| CI/CD platform, runner, and release security | I | C | C | A/R | C | C | I |
| Infrastructure, IAM, network, and cloud remediation | I | C | I | C | A/R | C | C |
| Kubernetes and shared platform guardrails | I | C | C | A/R | C | C | C |
| Control intent, security baseline, and exception criteria | I | C | C | R | C | A/R | C |
| Finding intake, normalization, and routing | I | C | C | C | C | A/R | C |
| WAF and perimeter control operation | I | C | C | C | A/R | C | C |
| SIEM detection content and alert triage | I | C | C | C | C | A | R |
| Application investigation during an incident | I | A | R | C | C | C | R |
| Containment, recovery, and service restoration | I | A | R | R | R | C | R |
| Backup and recovery testing | I | A | C | C | R | I | R |
| Compliance interpretation and legal sign-off | A | C | I | C | C | C | I |

The matrix is a starting point, not a universal organization chart. A managed SOC, external cloud provider, or outsourced development team requires a documented service boundary, escalation path, and evidence contract.

## What Should Be Delegated

Delegate remediation to the owner closest to the affected change:

- source-code, authorization, IDOR, input validation, and business-logic defects to the application team;
- dependency upgrades to the application or image owner;
- base-image and shared build-template changes to the platform or build owner;
- Terraform, cloud IAM, network, DNS, and host findings to infrastructure or cloud owners;
- Kubernetes manifests and runtime configuration to deployment or platform owners;
- WAF rules and origin restrictions to the edge or infrastructure owner, with application and security review;
- detection engineering and alert triage to security operations;
- service restoration and application evidence to the service owner and SRE/operations;
- material residual-risk acceptance to the authorized business or risk owner.

External providers can operate a control, but internal accountability remains. Define scope, service levels, access, notification, evidence, incident cooperation, and exit procedures before delegation.

## What Should Not Be Silently Assigned to One DevSecOps Engineer

- fixing all application vulnerabilities;
- approving their own high-risk exception;
- being the only person who understands or can operate CI/CD;
- providing 24/7 incident response without an agreed on-call model;
- owning legal or regulatory interpretation;
- accepting business downtime, data, or customer risk;
- administering production, reviewing the change, and approving deployment without compensating review.

## Vulnerability Ownership Rule

Use this flow for every finding:

1. The detection owner proves the finding and records evidence.
2. The asset owner confirms scope and business context.
3. The remediation owner fixes the underlying code, dependency, configuration, or infrastructure.
4. The control owner verifies the fix and checks for recurrence.
5. The authorized risk owner approves any residual risk or time-bound exception.

Scanner ownership is not remediation ownership. A central team should normalize duplicates and provide prioritization, but it should not become the permanent queue for issues owned elsewhere.

## Minimum Operating Agreements

- asset and service ownership register;
- severity and contextual-priority model;
- remediation and escalation targets;
- control and pipeline ownership;
- alert triage and on-call boundaries;
- exception and risk-acceptance workflow;
- incident roles and communication path;
- evidence location and retention;
- recurring review of overdue findings, noisy controls, and ownership gaps.

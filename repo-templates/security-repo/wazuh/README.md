# Wazuh/SIEM Integration Blueprint

This directory is a public-safe reference pattern for evaluating and structuring a Wazuh deployment. It shows how endpoint and application telemetry can move from a WAF or reverse-proxy host through a Wazuh agent, manager-side decoding and rules, dashboards, and governed notification channels.

The material is not a production-ready universal architecture. Adapt log formats, trust boundaries, capacity, detection logic, retention, access control, and escalation paths for each `<ENVIRONMENT>` and `<CUSTOMER_OR_PRODUCT>`.

## Compatibility Snapshot

This blueprint was reviewed on 14 July 2026 against the Wazuh 4.14 documentation, with Wazuh 4.14.6 as the current stable reference release. The example XML is well-formed and its synthetic fixtures have been checked against the documented decoder schema, but it has not yet been runtime-certified with `wazuh-logtest` on a Wazuh 4.14.6 manager.

Wazuh 5.0.0-beta1 is a pre-release and is outside this blueprint's supported reference boundary. Its manager paths and component model differ from 4.x, so perform a new architecture, migration, security, and test review before adopting 5.x. See [Version Compatibility and Hardening](version-compatibility-and-hardening.md).

## What Wazuh Can Help With

- Centralized collection and correlation of host, application, WAF, and selected network-security logs.
- Endpoint visibility, file integrity monitoring, security configuration assessment, inventory, and compliance evidence.
- Custom detections for normalized WAF events, including blocked requests and repeated suspicious behavior.
- A consistent alert severity, triage, dashboard, and notification operating model.

## What Wazuh Does Not Solve Alone

Wazuh is not a substitute for secure architecture, a secure software development lifecycle, patching, cloud hardening, tested backups, vulnerability remediation, incident response, EDR/XDR where required, or trained people with time to investigate alerts. It also does not make an unreviewed WAF rule or decoder reliable simply because an alert appears in a dashboard.

## Place in the DevSecOps Operating Model

Wazuh is one detection and visibility capability inside a wider operating model:

1. Architecture and discovery identify assets, data flows, risks, log sources, owners, and regulatory constraints.
2. Preventive controls reduce exposure through secure configuration, CI/CD gates, patching, network controls, and WAF policy.
3. Wazuh collects and correlates selected runtime evidence.
4. Named owners triage, escalate, tune, and document alerts.
5. Governance reviews coverage, exceptions, retention, outcomes, and control effectiveness.

Tool implementation follows architecture and discovery review because a technically working collector without defined assets, outcomes, ownership, and capacity usually creates noise rather than dependable detection. Use the [fit assessment](wazuh-fit-assessment.md) before committing to a design.

## Blueprint Contents

| Document | Purpose |
| --- | --- |
| [Architecture](architecture.md) | Reference traffic and log flows, boundaries, and assumptions. |
| [Version Compatibility and Hardening](version-compatibility-and-hardening.md) | Stable-version boundary, security controls, and upgrade gates. |
| [Wazuh Fit Assessment](wazuh-fit-assessment.md) | Decide whether Wazuh fits the environment and operating model. |
| [Agent Onboarding Checklist](agent-onboarding-checklist.md) | Prepare, enroll, validate, and hand over agents safely. |
| [WAF Log Integration](waf-log-integration.md) | Vendor-neutral WAF/reverse-proxy log integration pattern. |
| [Custom Decoders and Rules](custom-decoder-and-rules.md) | Defensive examples, rule range, MITRE mapping, and test approach. |
| [Alert Triage Workflow](alert-triage-workflow.md) | Repeatable analyst decision and escalation flow. |
| [Rule Tuning Process](rule-tuning-process.md) | Control noise without losing valuable detections. |
| [Dashboard Ownership](dashboard-ownership.md) | Define accountable owners, access, reviews, and change control. |
| [Retention and Sizing Notes](retention-and-sizing-notes.md) | Inputs for capacity, storage, recovery, and scaling decisions. |
| [Escalation and Notification](escalation-and-notification.md) | Severity-based routing and alert-fatigue controls. |
| [Wazuh vs Alternatives](wazuh-vs-alternatives.md) | Compare capability categories without forcing a tool choice. |

Safe sample artifacts are under [`examples/`](examples/). They contain documentation-only values and must be tested in a non-production environment before adaptation.

## Public-Safety Rules

Do not commit real manager addresses, enrollment material, credentials, customer identifiers, public IPs, internal hostnames, private domains, incident records, notification secrets, kubeconfigs, Terraform state, or Ansible vault data. Keep real values in the approved private configuration and secret-management systems.

## Implementation Gate

Before implementation, require approval of the fit assessment, architecture, data classification, ownership model, severity model, retention target, capacity estimate, test evidence, rollback approach, and exception process. Record version-specific Wazuh validation in the private implementation repository.

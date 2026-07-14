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

## Review

Review the baseline before onboarding each new environment and after significant platform changes.

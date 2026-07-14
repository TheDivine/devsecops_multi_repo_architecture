# Version Compatibility and Hardening

## Compatibility Status

This public-safe reference was reviewed on 14 July 2026.

| Item | Blueprint status |
| --- | --- |
| Stable documentation baseline | Wazuh 4.14.x |
| Current stable reference release | Wazuh 4.14.6, released 1 July 2026 |
| Runtime validation | Required: run `wazuh-logtest` and integration tests on a pinned 4.14.6 lab manager |
| Wazuh 5.0.0-beta1 | Pre-release; explicitly outside the supported reference boundary |
| Native WAF format | Not assumed; validate the actual `<WAF_PRODUCT_AND_VERSION>` schema |
| Production readiness | Not claimed; requires environment-specific architecture, security, capacity, recovery, and operations approval |

The 4.x examples use `/var/ossec` manager paths. Wazuh 5.0 beta introduces material architecture and compatibility changes, including a different manager installation path and removal or replacement of legacy components. Treat 5.x adoption as a migration project, not a routine template update.

## Version-Control Policy

- Pin manager, indexer, dashboard, agent, integration, and supporting component versions in the private implementation record.
- Confirm the vendor-supported compatibility matrix before mixing agent and central-component versions.
- Track release date, security advisories, known issues, end-of-support expectations, owner, and next review date.
- Subscribe the platform owner to official release and security notifications.
- Do not use `latest` container tags or unpinned package sources for a controlled implementation.
- Re-review decoders, rules, API consumers, dashboards, notification integrations, and backup compatibility after every material upgrade.

## Security Hardening Baseline

### Network and Trust

- [ ] Wazuh Manager, indexer, dashboard, API, and enrollment services are not exposed directly to the public internet unless an approved architecture explicitly requires and protects that exposure.
- [ ] Firewalls restrict agent, administrator, API, cluster, and integration flows to documented sources and destinations.
- [ ] TLS protects communications between central components using approved certificate authorities and hostname or node identity verification.
- [ ] Manager identity verification and, where required, agent identity verification are configured for enrollment.
- [ ] Time synchronization is monitored across agents and all central components.
- [ ] Production, non-production, and materially different trust domains are isolated according to the risk assessment.

### Identity and Access

- [ ] SSO and MFA are used for interactive administration where supported by the approved identity provider.
- [ ] RBAC separates platform administration, detection engineering, triage, read-only reporting, API automation, and audit responsibilities.
- [ ] Default, shared, stale, and emergency accounts are removed, disabled, or controlled through a documented break-glass process.
- [ ] Service accounts have minimum permissions, non-interactive use, named owners, rotation, and monitored activity.
- [ ] Access to raw events, exports, agent actions, rule changes, and security administration is reviewed periodically.

### Secrets and Certificates

- [ ] Enrollment material, API credentials, notification secrets, private keys, and backup keys are stored in approved secret-management systems, never in this repository.
- [ ] Certificate issuance, distribution, renewal, revocation, expiry monitoring, and recovery have named owners.
- [ ] Private keys are permission-restricted, encrypted at rest where required, and excluded from routine logs and support bundles.
- [ ] Root and administrative certificate recovery material is backed up separately with tested access controls.

### Agent Security

- [ ] Agents come from approved, integrity-verified packages and are patched through a controlled lifecycle.
- [ ] Agent groups and labels cannot move an asset into a weaker policy without approval.
- [ ] Log read permissions are least-privileged and exclude secrets or unnecessary personal data.
- [ ] Agent disconnects, configuration drift, queue pressure, collection failure, and unsupported versions generate owned operational signals.
- [ ] Remote configuration, upgrade, command, and active-response capabilities are disabled or approval-gated when not required.
- [ ] Agent offboarding revokes trust, removes routing, updates inventory, and applies the retention policy.

### Manager, Indexer, and Dashboard

- [ ] Central components use supported operating systems, hardened hosts or containers, minimal installed software, and controlled administrative access.
- [ ] Security patches and Wazuh updates follow tested maintenance and rollback procedures.
- [ ] Index lifecycle, shard/replica design, disk watermarks, data minimization, and retention are documented and monitored.
- [ ] Dashboards and APIs use least privilege, secure session settings, controlled exports, and auditable administrative changes.
- [ ] The platform monitors its own health: ingest delay, rejected events, decoder/rule errors, cluster state, disk pressure, certificate expiry, integration failure, and backup status.
- [ ] Backups cover configuration, custom content, dashboard objects, required index snapshots, and recovery material; restore tests prove RPO/RTO.

### Detection and Response

- [ ] Custom decoders and rules are version-controlled under the local configuration paths, not edited in upgrade-managed ruleset directories.
- [ ] Positive, negative, malformed, format-drift, correlation, and representative-volume fixtures are retained.
- [ ] Rule severity combines confidence, enforcement outcome, asset criticality, exposure, frequency, and corroborating evidence.
- [ ] MITRE ATT&CK mappings are reviewed classifications, not proof of attacker intent.
- [ ] Active response is separately threat-modeled, least-privileged, tested for failure and rollback, and authorized before enablement.
- [ ] Exceptions are narrow, owned, evidenced, time-bounded, and periodically reviewed.

## Upgrade Gate

Use this gate for stable patch, minor, or major upgrades:

1. Review official release notes, security advisories, breaking changes, known issues, and component compatibility.
2. Inventory current versions, custom rules/decoders, integrations, APIs, dashboards, agents, certificates, and unsupported dependencies.
3. Back up required configuration and data, then prove restoration in a representative test environment.
4. Upgrade a pinned non-production environment and validate enrollment, collection, decoding, rules, indexing, dashboards, notifications, RBAC, certificates, and recovery.
5. Run `wazuh-logtest` against the maintained fixture set and compare expected rule IDs, levels, fields, and correlation behavior.
6. Measure ingest, search, storage, queue, and alert behavior under representative peak load.
7. Approve rollout, rollback criteria, maintenance window, communications, ownership, and post-change monitoring.
8. Deploy by controlled group, pause on error thresholds, and preserve evidence for each stage.
9. Confirm versions, health, coverage, alert quality, backup status, and exception state after rollout.

Major-version upgrades, including 4.x to 5.x, require a new architecture decision and migration plan because paths, processes, data flows, APIs, and operational assumptions may change.

## Required Private Evidence

| Evidence | Placeholder |
| --- | --- |
| Approved version matrix | `<VERSION_COMPATIBILITY_RECORD>` |
| Architecture and threat model | `<ARCHITECTURE_AND_THREAT_MODEL>` |
| Network and certificate design | `<TRUST_AND_NETWORK_DESIGN>` |
| RBAC and access review | `<ACCESS_REVIEW_RECORD>` |
| Capacity and retention model | `<CAPACITY_AND_RETENTION_RECORD>` |
| Decoder/rule test report | `<WAZUH_LOGTEST_REPORT>` |
| Backup and restore evidence | `<RECOVERY_TEST_RECORD>` |
| Rollout and rollback approval | `<CHANGE_APPROVAL_RECORD>` |
| Operations handover | `<SIEM_OWNER_HANDOVER>` |

## Official References

- [Wazuh release notes](https://documentation.wazuh.com/current/release-notes/index.html)
- [Wazuh agent enrollment](https://documentation.wazuh.com/current/user-manual/agent/agent-enrollment/index.html)
- [Wazuh user administration and RBAC](https://documentation.wazuh.com/current/user-manual/user-administration/index.html)
- [Wazuh log collection configuration](https://documentation.wazuh.com/current/user-manual/reference/ossec-conf/localfile.html)
- [Wazuh custom rules](https://documentation.wazuh.com/current/user-manual/ruleset/rules/custom.html)
- [Wazuh GitHub releases](https://github.com/wazuh/wazuh/releases)

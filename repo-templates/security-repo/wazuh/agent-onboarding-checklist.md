# Wazuh Agent Onboarding Checklist

Use one reviewed record per asset class or controlled rollout group. Store real enrollment material and implementation values only in approved private systems.

## Prepare

- [ ] Asset owner, service, `<ENVIRONMENT>`, criticality, operating system, support window, and data classification are recorded.
- [ ] The approved Wazuh agent and manager versions are compatible.
- [ ] The exact package version, source, signature or checksum verification, and rollback artifact are recorded.
- [ ] Network flow, DNS or private addressing, time synchronization, proxy behavior, and certificate trust are validated.
- [ ] Manager identity verification is enabled where supported, and agent identity/enrollment controls match the approved threat model.
- [ ] Package source, integrity verification, patch ownership, and rollback method are approved.
- [ ] Required log files, formats, rotation behavior, permissions, and expected daily volume are documented.
- [ ] Least-privilege access is sufficient for the agent to read only approved sources.
- [ ] The destination agent group and policy inheritance have been reviewed.

## Deployment Method

- [ ] Standalone server agents use pinned, reviewed automation such as Ansible, with inventories and enrollment secrets kept private.
- [ ] Canary deployment, upgrade, rollback, and package/repository pinning are tested before wider rollout.
- [ ] DOKS node monitoring is evaluated against lower-privilege log-forwarding alternatives before selecting a DaemonSet.
- [ ] Any privileged DaemonSet documents exact host access, uses GitOps, and has a narrow policy-as-code exception with owner and expiry.
- [ ] DOKS node drain, replacement, autoscaling, and Kubernetes upgrade behavior are tested.

## Enroll

- [ ] Use the organization's private enrollment workflow; do not place keys, passwords, tokens, or real manager addresses in this repository.
- [ ] Assign a non-sensitive, consistent agent name and labels based on the approved naming standard.
- [ ] Bind the agent to the correct environment and policy group.
- [ ] Record who approved and performed enrollment, when it occurred, and which change or ticket authorized it.

## Configure Collection

- [ ] Add only approved `localfile` sources and confirm the declared `log_format` matches the actual one-line event format.
- [ ] Account for log rotation and delayed file creation.
- [ ] Exclude secrets, request bodies, session identifiers, or personal data that are not required for the detection use case.
- [ ] Estimate collection impact on the host, network, manager, and index storage.
- [ ] Document whether WAF, NGINX, application, operating-system, and container logs are authoritative or supplementary.

## Validate

- [ ] The agent reports as healthy and is associated with the expected asset and group.
- [ ] Test events arrive with the correct agent, source location, timestamp, and normalized fields.
- [ ] Decoder and rule behavior is tested with sanitized fixtures using `wazuh-logtest` on a non-production manager.
- [ ] Expected alerts appear at the approved severity without exposing restricted fields.
- [ ] Dashboard filters, notification thresholds, ticket routing, and deduplication work as designed.
- [ ] Negative tests confirm benign events do not generate high-severity alerts.
- [ ] Agent restart, host restart, log rotation, temporary disconnect, and recovery behavior are verified.

## Hand Over

- [ ] Agent, log-source, rule, platform, dashboard, and triage owners accept responsibility.
- [ ] Agent enrollment keys, certificates, and automation identities have rotation, revocation, and recovery procedures.
- [ ] Monitoring covers agent disconnects, collection failures, ingest delay, and storage pressure.
- [ ] Runbooks include upgrade, certificate or key rotation, troubleshooting, quarantine, and removal.
- [ ] Known exceptions have owner, reason, compensating control, expiry, and review date.
- [ ] Evidence and sign-off are linked from the private change record.

## Offboarding Trigger

Remove or reassign the agent when the asset is decommissioned, ownership changes, the environment is rebuilt, trust is lost, or the monitoring purpose expires. Confirm that credentials are revoked, routing is removed, inventory is updated, and retained data follows the approved policy.

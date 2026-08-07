# Wazuh Fit Assessment

Use this checklist during discovery. A checked box means the question has an evidenced answer, not that Wazuh is automatically approved.

## Outcomes and Scope

- [ ] The monitoring outcomes and decisions Wazuh must support are documented.
- [ ] In-scope environments, business services, and data classifications are named with public-safe identifiers.
- [ ] Wazuh's role is separated from WAF, IDS/IPS, EDR/XDR, observability, vulnerability management, and incident-response responsibilities.
- [ ] Architecture, security, privacy, legal, and operations stakeholders have reviewed the proposed scope.

## Assets and Log Sources

- [ ] Assets requiring monitoring are inventoried by type, operating system, location, criticality, and owner.
- [ ] Current WAF, reverse-proxy, application, operating-system, identity, cloud, container, and network log sources are catalogued.
- [ ] Each source has a known format, timestamp, rotation policy, expected volume, sensitivity, and authoritative owner.
- [ ] For managed Cloudflare WAF usage, the required Logpush/API dataset, plan entitlement, fields, destination, latency, privacy, and delivery monitoring are confirmed.
- [ ] Direct origin access and trusted client-IP restoration have been reviewed.
- [ ] Gaps such as unmanaged hosts, ephemeral workloads, unsupported systems, or encrypted/proprietary logs are recorded.
- [ ] The design identifies which systems support agents and which require syslog, API, or another collection pattern.

## People and Operating Model

- [ ] A named role will triage alerts during agreed coverage hours.
- [ ] Critical alerts have an on-call and escalation owner.
- [ ] Detection rules, agent lifecycle, manager platform, dashboard, and notification routes each have accountable owners.
- [ ] Expected ticket queues, response targets, decision records, and false-positive feedback loops are defined.
- [ ] The team has capacity and skills to operate the platform rather than only install it.

## Requirements and Integrations

- [ ] Compliance and reporting requirements identify controls, evidence, access, review frequency, and audit period.
- [ ] Expected events and alerts per day have been estimated from representative samples.
- [ ] Existing observability tools and their overlap with security-log collection are understood.
- [ ] Existing SIEM, EDR, XDR, SOAR, vulnerability scanning, CSPM, and CWPP capabilities are mapped to avoid duplicate cost and conflicting ownership.
- [ ] Cloud, container, and Kubernetes requirements cover ephemeral assets, identity, control-plane logs, runtime signals, and managed-service constraints.
- [ ] Ticketing, email, chat, and on-call integrations have approved data-handling and secret-management patterns.

## Data, Retention, and Resilience

- [ ] Retention and deletion targets are defined by log type, alert type, environment, and regulatory need.
- [ ] Raw-event versus alert-only storage decisions are explicit.
- [ ] Peak ingest, index growth, search concurrency, dashboard usage, and recovery objectives are estimated.
- [ ] Backup, restore, high availability, monitoring, patching, and upgrade responsibilities are assigned.
- [ ] Cross-border, privacy, access-control, and data-minimization constraints are approved.

## Decision Record

| Field | Assessment value |
| --- | --- |
| Decision | `<ADOPT_PILOT_DEFER_OR_REJECT>` |
| Environment | `<ENVIRONMENT>` |
| Business owner | `<CUSTOMER_OR_PRODUCT>` |
| SIEM owner | `<SIEM_OWNER>` |
| Primary use cases | `<APPROVED_USE_CASES>` |
| Material gaps | `<GAPS_AND_DEPENDENCIES>` |
| Pilot success measures | `<MEASURABLE_SUCCESS_CRITERIA>` |
| Review date | `<REVIEW_DATE>` |
| Approvers | `<APPROVER_ROLES>` |

## Fit Signals

Wazuh may be a reasonable candidate when the organization needs adaptable host monitoring, file integrity monitoring, compliance checks, vulnerability visibility, and log correlation, and has people who can own detection engineering and operations.

Reconsider or run a narrower pilot when managed-service constraints, very high ingest, advanced analytics, global support requirements, existing enterprise SIEM coverage, or limited operational capacity outweigh the expected benefit. Compare capability categories in [Wazuh vs Alternatives](wazuh-vs-alternatives.md).

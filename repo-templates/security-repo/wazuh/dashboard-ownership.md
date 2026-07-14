# Dashboard Ownership

## Purpose

A dashboard is an operational interface, not proof that monitoring works. Each view needs a defined audience, decision, data owner, quality measure, access model, and review cadence.

## Ownership Model

| Responsibility | Accountable role | Required outcome |
| --- | --- | --- |
| Dashboard service availability, upgrades, and recovery | Wazuh platform owner | Supported, monitored, recoverable service |
| Detection content and severity | Detection owner | Tested rules with clear intent and quality measures |
| WAF and application log meaning | Source/service owner | Stable schema, trustworthy fields, documented changes |
| Triage views and queues | `<SIEM_OWNER>` | Actionable queue aligned to coverage and response targets |
| Executive/risk view | Security or risk owner | Trends and control outcomes without misleading raw counts |
| Access and data use | Security and privacy owners | Least privilege, periodic review, approved exports |
| Notification links and ticket state | Integration owner | Correct routing, deduplication, and traceability |

Use named roles in the private implementation. Avoid a dashboard that is "owned" only by a broad team alias.

## Recommended Views

- **Operations health:** agent connectivity, event delay, decoder failures, ingest rate, index health, storage pressure, notification failures, and version status.
- **Triage queue:** new and unresolved high/critical alerts, asset criticality, enforcement outcome, age, assignee, and linked ticket.
- **WAF detections:** category, action, service, path class, source attribution, rule version, trends, and repeated activity.
- **Detection quality:** alerts per rule, true/false-positive disposition, duplicates, suppressed events, tuning changes, and aged exceptions.
- **Coverage:** expected versus reporting assets and log sources, with explicit blind spots.
- **Leadership summary:** material incidents, coverage gaps, response performance, risk decisions, and improvement work; avoid ranking teams by raw alert count.

## Access and Data Handling

- Apply role-based access and least privilege for administration, investigation, export, and read-only reporting.
- Separate production and non-production views where access, retention, or risk differs.
- Minimize sensitive request data and restrict raw-event access more tightly than aggregated views.
- Review user, service-account, shared-link, and integration access on a defined cadence.
- Log and review administrative changes, exports, saved-object changes, and access failures.
- Keep real URLs, identities, index names, and customer-specific filters in private configuration.

## Change Control

Every dashboard change should identify its owner, intended decision, data sources, filters, time zone, severity semantics, validation evidence, and rollback. Version dashboards or export definitions through the approved private repository where supported.

Changes to source schemas, decoder fields, rule IDs, agent labels, retention, or index patterns must trigger dashboard regression testing.

## Review Cadence

| Review | Suggested trigger |
| --- | --- |
| Queue health | Each staffed triage period |
| Platform and ingest health | Continuously monitored; operational review at least weekly |
| Detection quality | Monthly or after material rule/source changes |
| Access | Quarterly or on role/contract changes |
| Leadership view | Monthly or aligned to governance cycle |
| Full dashboard purpose review | At least annually or after architecture/ownership change |

Cadence must be adapted to risk and coverage. Remove or archive views that have no owner or decision use; an abandoned dashboard creates false confidence.

# Escalation and Notification

## Objective

Route the smallest useful alert context to the people who can act, at a frequency they can sustain. Notification is not a substitute for a staffed triage queue, ticket ownership, or incident-response process.

## Routing Model

| Contextual severity | Default route | Timing expectation | Example outcome |
| --- | --- | --- | --- |
| Critical | On-call plus incident channel and ticket | Immediate, according to approved incident target | Validate, acknowledge, and invoke incident process when criteria are met |
| High | Triage queue plus high-priority ticket; on-call when defined conditions apply | Prompt review during agreed coverage | Correlate, assign, remediate, or escalate |
| Medium | Triage queue or batched ticket | Review during staffed period | Investigate trends and tune/remediate as needed |
| Low/informational | Dashboard, search, or periodic report | No direct page | Context, hunting, coverage, and rule-quality review |

Contextual severity may differ from the raw Wazuh rule level. Routing should consider WAF outcome, confidence, asset criticality, exposure, frequency, corroboration, and business impact.

## Channel Patterns

- **Email:** send concise high/critical notifications to `<ALERT_EMAIL>` or a managed distribution role. Avoid attachments and sensitive raw logs; link to the authorized dashboard or ticket.
- **Slack or Teams:** use an approved integration or automation layer with a secret reference such as `<CHAT_INTEGRATION_SECRET_REF>`. Restrict channels, membership, retention, and fields; chat is not the system of record.
- **Jira or another ticket system:** create or update a deduplicated issue with owner, severity, asset reference, timestamps, rule version, WAF action, and an authorized evidence link. Use `<TICKET_PROJECT>` rather than a real project identifier in public templates.
- **On-call platform:** page only for conditions that require action outside the normal queue. Define acknowledgement, retry, fallback, and escalation-chain behavior.

Connector capabilities and supported versions change. Validate the chosen native integration, webhook, or intermediary automation against the target environment and keep credentials in its approved secret store.

## Threshold Design

Define thresholds from measured behavior and response capacity. Consider:

- severity and confidence;
- blocked versus allowed outcome;
- criticality and internet exposure of the target;
- event frequency, unique sources, and campaign scope;
- correlation with endpoint, identity, application, or IDS/IPS evidence;
- duplicate window and notification cooldown;
- staffed hours and escalation coverage.

A single blocked request normally should not wake on-call unless environment-specific evidence justifies it. A reported allowed exploit category against a critical public service may need urgent validation even at low volume.

## Minimum Notification Content

- alert and ticket reference;
- timestamp and `<ENVIRONMENT>`;
- non-sensitive asset/service reference and criticality;
- rule ID, rule version, contextual severity, and confidence;
- WAF outcome and summarized category;
- event count and time window;
- owner, expected action, and acknowledgement path;
- authorized dashboard/evidence link.

Do not include credentials, tokens, cookies, request bodies, customer data, internal topology, or unrestricted raw logs.

## On-Call Ownership

Document primary and fallback roles, coverage hours, acknowledgement target, escalation chain, incident declaration authority, communication owner, ticket owner, and service-owner contact. Test delivery and fallback regularly with synthetic public-safe events.

## Avoiding Alert Fatigue

- Page on required action, not merely on data arrival.
- Deduplicate and aggregate related alerts while retaining underlying evidence.
- Separate notification thresholds from detection and retention; a non-paged alert can remain searchable.
- Track pages per rule, acknowledgement time, false-positive rate, after-hours load, and unowned tickets.
- Fix broken parsing and duplicate collection before lowering severity.
- Give every route an owner and periodic test; remove stale destinations.
- Review exceptions and cooldowns so temporary relief does not become permanent blindness.

Use [Alert Triage Workflow](alert-triage-workflow.md) for analyst decisions and [Rule Tuning Process](rule-tuning-process.md) for controlled noise reduction.

## Pilot Default: Alert-Only Routing

For a new Wazuh pilot, default external email/chat/ticket notifications to agreed critical and high alerts only. Keep medium, low, and informational events in the dashboard or scheduled review until signal quality and triage capacity are measured. Send the minimum alert context and link back to the controlled system; do not send full raw events, request bodies, cookies, authorization headers, tokens, or sensitive customer data through notification channels.

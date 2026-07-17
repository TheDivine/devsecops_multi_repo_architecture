# Monitoring Policy as Code

## Purpose

Monitoring policy checks make alert and telemetry expectations reviewable before configuration is loaded. They do not prove that a query is meaningful, a route reaches the correct person, or an alert is operationally actionable; those require testing and ownership review.

## Policy Areas

- valid Prometheus and Alertmanager syntax;
- required severity, owner, summary, description, and runbook metadata;
- approved severity vocabulary;
- alert duration and anti-flapping expectations;
- routing ownership and safe default receivers;
- recording-rule naming and cardinality guidance;
- retention and data-classification controls;
- prohibition of real contact data in public templates;
- exception and noisy-alert review lifecycle.

## Validation Order

1. Run native validators such as `promtool check rules` and `amtool check-config`.
2. Run organization-specific policy tests.
3. Load configuration into a non-production or isolated validation environment.
4. exercise representative firing, recovery, silence, inhibition, and routing cases.
5. approve production promotion and observe reload health.

## Local Verification

Run policy unit tests:

```bash
conftest verify --policy repo-templates/monitoring-repo/policies/conftest
```

Evaluate a Prometheus rule file:

```bash
conftest test <PROMETHEUS_RULE_FILE> \
  --policy repo-templates/monitoring-repo/policies/conftest
```

The example policy requires `critical`, `high`, `warning`, or `info` severity and basic ownership/runbook metadata. Adapt the vocabulary to the approved incident and escalation model before enforcement.

## Ownership

- Service owner: alert intent, thresholds, and remediation.
- Monitoring owner: rule quality, routing integration, and platform health.
- Security owner: security-detection severity and evidence requirements.
- On-call owner: operational acceptance and escalation readiness.

Keep real email addresses, webhook URLs, schedules, ticket queues, and customer identifiers in private configuration.

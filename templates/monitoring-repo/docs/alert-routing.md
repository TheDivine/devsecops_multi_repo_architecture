# Alert Routing

## Purpose

Define how alerts reach the right owner without embedding real contact details in templates.

## Routing Inputs

- service
- environment
- severity
- owning team
- escalation policy reference

## Rules

- Alerts must be actionable.
- Critical alerts require a documented owner.
- Routing configuration must not expose private contact details in public repositories.
- Noisy alerts should be tuned or removed.

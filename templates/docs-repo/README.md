# Documentation Repository Template

This repository contains shared documentation for the organization or client. It is the best place to keep operational decisions visible without exposing sensitive infrastructure state or secrets.

## Contents

- architecture decisions
- diagrams
- onboarding guides
- operational runbooks
- incident response docs
- environment inventory
- access model
- security model

This repository may be shared more broadly than infrastructure repositories.

## Recommended Structure

| Path | Purpose |
|---|---|
| `architecture/decision-records/` | ADRs for deployment, security, runtime, and ownership decisions |
| `access/` | access model and review cadence |
| `inventory/` | sanitized environment and service inventory |
| `runbooks/` | deployment, rollback, backup, restore, and incident runbooks |
| `incidents/` | incident templates and sanitized post-incident records |
| `security/` | security model, exception process, and control ownership |

Do not store real credentials, private topology, private IP lists, or customer incident evidence in public documentation.

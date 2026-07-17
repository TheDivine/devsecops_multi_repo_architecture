# Security Gates

## Purpose

Define security checks expected before release or promotion.

## Required Gates

- secret scanning before merge
- source-code SAST appropriate to the technology stack
- dependency vulnerability scan
- container image scan
- infrastructure-as-code scan where applicable
- repository sensitive-data scan
- policy-as-code validation for Kubernetes resources
- policy-as-code validation for build handoff metadata, infrastructure plans, deployment artifacts, and monitoring rules where applicable
- DAST/API authorization testing for high-risk deployed flows
- review of privileged permissions
- review of exposed network surfaces

## Risk-Based Rollout

- Use fast incremental checks on pull requests and scheduled full scans for broader coverage.
- Normalize and deduplicate findings before creating remediation work.
- Start new gates in report/audit mode, measure accuracy and ownership, then enforce agreed thresholds.
- Combine scanner severity with exploitability, internet exposure, asset criticality, data sensitivity, fix availability, and compensating controls.
- Do not use WAF or SIEM detections as substitutes for fixing IDOR, broken authorization, insecure business logic, vulnerable dependencies, or unsafe configuration.
- Track tool and rule versions so the same policy can be reproduced and reviewed.
- Keep policy code and positive, negative, and exception tests in the same review boundary.
- Treat CI policy checks and runtime admission as complementary controls; neither replaces the other.

## Exception Handling

Security exceptions must include:

- affected component
- risk summary
- compensating control
- expiry date
- owner
- approval reference

Do not store sensitive vulnerability evidence in public blueprint repositories.

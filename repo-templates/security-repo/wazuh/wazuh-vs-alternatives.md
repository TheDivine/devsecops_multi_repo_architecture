# Wazuh vs Alternatives

## Decision Principle

Compare required capabilities, operating effort, data constraints, and integration fit rather than selecting a tool by category label. Wazuh can coexist with other platforms; overlap should have explicit ownership and cost justification.

## Conceptual Comparison

| Capability category | Potential strengths | Questions and trade-offs |
| --- | --- | --- |
| Wazuh | Adaptable endpoint visibility, file integrity monitoring, security configuration assessment, vulnerability visibility, compliance checks, and log correlation | Requires platform operations, detection ownership, tuning, capacity planning, upgrades, and validation of source/version support |
| Cloud-native logging/security | Tight integration with one cloud's identities, audit sources, managed services, and billing model | Multi-cloud/on-premises consistency, data-egress cost, retention, cross-account design, query skills, and provider lock-in |
| Datadog/Splunk/Elastic/Sentinel-style SIEM | Broad ingestion/search ecosystems, managed options, analytics, integrations, and enterprise workflows depending on product/tier | Licensing and ingest cost, implementation effort, data residency, content quality, feature overlap, and specialist skills |
| EDR/XDR | Endpoint prevention, behavioral detection, investigation, response, and vendor telemetry | Agent/platform coverage, response authority, data access, operating-system support, and whether general log/SIEM use cases are included |
| Vulnerability scanners | Purpose-built discovery, assessment, prioritization, and sometimes validation of vulnerabilities | Scan coverage, credentials, false positives, ephemeral assets, remediation ownership, and limited runtime log-correlation role |
| CSPM/CWPP | Cloud posture, workload risk, entitlement/context relationships, image/runtime or configuration coverage depending on product | Cloud/provider coverage, deployment model, runtime depth, overlap with native controls, and remediation workflow |

Product names in a category do not imply equivalent capability. Assess the actual edition, deployment model, supported versions, contracts, integrations, and team skills.

## Where Wazuh May Fit Well

- A team needs a reusable baseline for host telemetry, file integrity monitoring, inventory, compliance-oriented checks, and selected log correlation.
- The environment spans systems where an adaptable agent and manager model is useful.
- The organization can own platform lifecycle, detection engineering, tuning, triage, and storage.
- Open, version-controlled custom rules and decoders are important.
- A measured pilot demonstrates acceptable coverage, performance, and analyst outcomes.

## Where Another or Additional Capability May Be Better

- A managed cloud-native control provides deeper context and materially lower operating burden.
- Advanced endpoint prevention and response require a dedicated EDR/XDR platform.
- Very high ingest, long retention, complex analytics, or global operations need an enterprise architecture and support model not justified for a self-managed deployment.
- Cloud posture, entitlement, container runtime, or vulnerability workflows require purpose-built context and remediation features.
- An existing SIEM already meets the use cases, and adding Wazuh would duplicate collection and ownership.

## Non-Replacement Statement

Wazuh is not a full replacement for:

- secure SDLC practices, code review, dependency governance, and CI/CD security gates;
- secure architecture, identity design, network controls, and cloud hardening;
- patching and accountable vulnerability-management processes;
- WAF, IDS/IPS, EDR/XDR, CSPM/CWPP, or vulnerability scanners when their distinct capabilities are required;
- tested backup, recovery, incident response, and business-continuity processes;
- skilled analysts, service owners, and risk decisions.

Use the [Wazuh Fit Assessment](wazuh-fit-assessment.md) to record the decision and the [Retention and Sizing Notes](retention-and-sizing-notes.md) to test its operating assumptions.

# ADR-008: Use Risk-Based DevSecOps Framework Alignment

## Status

Accepted

## Context

The blueprint needs consistent principles and credible reference sources without presenting a generic template as certified, compliant, or universally production-ready. A single framework does not cover enterprise risk, secure development, application verification, supply-chain integrity, configuration hardening, and detection equally well.

Vendor articles can provide practical ideas but may reflect a product perspective and should not be the normative basis for architecture decisions.

## Decision

Use a layered, risk-based reference model:

- NIST CSF 2.0 for cybersecurity governance and risk outcomes;
- NIST SSDF 1.1 and OWASP SAMM 2 for secure-development practices and maturity;
- OWASP ASVS 5.0.0, OWASP Top 10:2025, and OWASP API Security Top 10:2023 for application and API requirements or awareness;
- SLSA 1.2 for software supply-chain integrity;
- applicable CIS Benchmarks for technology-specific hardening;
- MITRE ATT&CK for detection mapping.

Treat these as adaptable references. Every real implementation must select applicable requirements, record versions, assign owners, define evidence, and document exceptions. The blueprint makes no certification or compliance claim.

Primary standards and official documentation take precedence over secondary practitioner or vendor sources.

## Consequences

This gives reviewers a traceable basis for the blueprint and avoids dependence on one tool or vendor.

The tradeoff is that mappings and versions require maintenance, and real implementations still need architecture discovery, control selection, evidence collection, and independent compliance or legal review where applicable.

# DevSecOps Research and Standards

## Purpose

This bibliography records the sources that inform the blueprint. It separates normative or primary guidance from useful secondary perspectives.

Last reviewed: 2026-07-16. Verify current versions before adapting the blueprint to a real environment.

## Primary Sources

### Governance and Secure Development

- [NIST Cybersecurity Framework 2.0](https://www.nist.gov/publications/nist-cybersecurity-framework-csf-20) — high-level cybersecurity risk outcomes and common language.
- [NIST SP 800-218, Secure Software Development Framework 1.1](https://csrc.nist.gov/pubs/sp/800/218/final) — secure-development practices that can be integrated into an SDLC.
- [OWASP SAMM Model](https://owaspsamm.org/model/) — measurable software-security maturity across governance, design, implementation, verification, and operations.
- [CISA Secure by Design](https://www.cisa.gov/securebydesign) — principles for making customer security a core product outcome.

### Application and API Security

- [OWASP Application Security Verification Standard](https://owasp.org/www-project-application-security-verification-standard/) — application security requirements and verification criteria; latest stable version at review time: 5.0.0.
- [OWASP Top 10:2025](https://owasp.org/Top10/2025/0x00_2025-Introduction/) — awareness document for common web-application risk categories.
- [OWASP API Security Top 10:2023](https://owasp.org/API-Security/) — API-specific risks and defensive guidance.
- [OWASP Cheat Sheet Series](https://cheatsheetseries.owasp.org/) — focused implementation guidance for developers and defenders.

### Software Supply Chain and Platform Security

- [SLSA Specification 1.2](https://slsa.dev/spec/v1.2/) — incremental source and build supply-chain security guarantees.
- [OpenSSF Scorecard](https://github.com/ossf/scorecard) — repository and dependency security heuristics; use individual checks as evidence, not an aggregate score as proof of security.
- [CIS Benchmarks](https://www.cisecurity.org/cis-benchmarks) — consensus secure-configuration guidance for selected technologies.
- [Kubernetes Security Documentation](https://kubernetes.io/docs/concepts/security/) — Kubernetes security concepts and controls.

### Detection and Response

- [MITRE ATT&CK](https://attack.mitre.org/) — adversary behavior and detection taxonomy; current version at review time: v19.
- [Wazuh Documentation](https://documentation.wazuh.com/current/) — product behavior and supported configuration for the Wazuh reference pattern.

## Secondary Practitioner Sources

These articles are useful for practical framing, but product-neutral decisions in this blueprint should be validated against primary standards and official product documentation.

- [Qovery: 6 Best Practices to Automate DevSecOps in Days, Not Months](https://www.qovery.com/blog/6-best-practices-for-implementing-devsecops) — useful coverage of CI/CD security, scanning, policy as code, monitoring, training, and risk management.
- [Wiz: DevSecOps Best Practices to Help You Build a Secure Pipeline](https://www.wiz.io/academy/application-security/devsecops-best-practices) — useful emphasis on secure coding, automated testing, container security, threat modeling, contextual prioritization, incident readiness, and IaC.

Vendor examples are options, not architecture requirements. Select tools only after documenting outcomes, integration constraints, ownership, operational cost, data handling, and exit strategy.

## Source Evaluation Rules

- Prefer primary standards, official documentation, and maintained project sources.
- Record the reviewed version or date for controls that may change.
- Distinguish requirements from examples and vendor product claims.
- Do not copy a framework wholesale without applicability and risk review.
- Link a control to an owner, enforcement point, test, evidence, exception process, and review cadence.
- Do not describe a tool installation or scanner result as compliance.
- Recheck references before a client assessment, architecture decision, or production rollout.

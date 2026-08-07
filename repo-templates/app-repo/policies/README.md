# Application Policy as Code

## Purpose

Application policy checks verify structured build and security evidence before a trusted workflow publishes an artifact. They complement tests and scanners; they do not replace either.

Use policy for decisions such as:

- required tests and scans completed;
- approved dependency or license rules satisfied;
- build artifact is immutable;
- source revision, SBOM, provenance, and scan result are attached;
- release is produced only by a trusted workflow;
- an approved, unexpired exception exists when a blocking requirement cannot be met.

## Build Handoff Contract

The sample Conftest policy expects a synthetic YAML or JSON document shaped like this:

```yaml
artifact:
  image: <REGISTRY>/<IMAGE>@sha256:<DIGEST>
  source_revision: <FULL_COMMIT_SHA>
  sbom: <SBOM_REFERENCE>
  provenance: <PROVENANCE_REFERENCE>
  vulnerability_gate: passed
```

Real workflows should generate this document from trusted build outputs. Do not accept untrusted pull-request text as proof that a security gate passed.

## Local Verification

From the blueprint repository root:

```bash
conftest verify --policy repo-templates/app-repo/policies/conftest
conftest test <BUILD_METADATA_FILE> \
  --policy repo-templates/app-repo/policies/conftest
```

Pin Conftest and OPA versions in real CI. Keep positive, negative, and exception tests with the policy.

## Ownership Boundary

- Application team: local integration, remediation, and artifact correctness.
- Platform team: reusable policy bundle and trusted runner pattern.
- Security team: requirement, severity, evidence, and exception contract.
- Release owner: approval to publish or promote.

Store real registry names, artifact references, findings, and exception approvals only in private implementation systems.

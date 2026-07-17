# Platform DevSecOps Repository Template

This repository contains reusable platform modules.

## Contents

- CI templates
- security scanner policies
- DefectDojo integration scripts
- monitoring modules
- Kubernetes security modules
- policy-as-code templates
- starter templates

This is the internal platform product.

## Policy As Code

The platform repository owns reusable policy bundles, policy distribution, supported engine versions, admission integration, policy reports, and shared CI patterns. Consuming repositories still own artifact-specific tests and remediation.

See [`policies/README.md`](policies/README.md) and the cross-repository [Policy as Code Operating Model](../../docs/policy-as-code/operating-model.md).

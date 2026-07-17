# Deployment Policy as Code

## Purpose

Deployment policies evaluate rendered desired state before promotion. They provide early feedback and complement runtime admission controls.

Evaluate controls such as:

- immutable or explicitly versioned images;
- non-root execution and restricted security context;
- service-account token mounting and least privilege;
- resource requests and limits;
- approved registries and namespaces;
- ingress, service, and network exposure;
- environment promotion and rollback metadata;
- narrow, approved, and unexpired exceptions.

## Validation Order

1. Render Helm, Kustomize, Compose, or GitOps definitions.
2. Run native syntax and schema validation.
3. Run policy tests against the rendered output.
4. Verify image digest, provenance, SBOM, and approved source revision.
5. Apply environment-specific controls in the private implementation repository.
6. Admit the workload through the platform policy engine.

## Local Verification

Run the reference policy unit tests:

```bash
conftest verify --policy repo-templates/deployment-repo/policies/conftest
```

Evaluate rendered Kubernetes YAML:

```bash
kubectl kustomize <KUSTOMIZE_PATH> > <RENDERED_MANIFEST_FILE>
conftest test <RENDERED_MANIFEST_FILE> \
  --policy repo-templates/deployment-repo/policies/conftest
```

The sample policy checks a minimum workload security contract. Adapt it for service accounts, read/write paths, init containers, ephemeral containers, sidecars, jobs, and platform-injected fields before enforcement.

## Ownership

- Deployment owner: rendered state, promotion, rollback, and local exceptions.
- Platform owner: admission policy and shared policy bundle.
- Security owner: control intent, severity, and exception requirements.
- Application owner: image content and remediation of application-owned violations.

Do not place real cluster, namespace, registry, or exception data in this public blueprint.

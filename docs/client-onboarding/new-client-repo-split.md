# New Client Repository Split

## Recommended Split

```text
<client-or-project>-app
<client-or-project>-deployment
<client-or-project>-infra
<client-or-project>-docs
```

Add these when responsibilities require separate lifecycle control:

```text
<client-or-project>-platform
<client-or-project>-security
<client-or-project>-monitoring
```

## Split Criteria

- Use a separate deployment repository when environment overlays or promotion approvals are required.
- Use a separate infrastructure repository when provider access, state, or provisioning is involved.
- Use a separate security repository when hardening baselines and audit content are independently managed.
- Use a separate monitoring repository when alerting, dashboards, and telemetry are managed by an operations team.

## Do Not Split When

- The project is a prototype with no shared operational responsibility.
- There is no real environment lifecycle yet.
- A split would create ownership confusion without security or operational benefit.

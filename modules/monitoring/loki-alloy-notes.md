# Loki, Promtail, Or Alloy Notes

## VM Clients

Use Grafana Alloy or Promtail on each VM to ship container and system logs to Loki.

Minimum labels:

- `environment`
- `service`
- `host`
- `runtime`

## Kubernetes Clients

Use Alloy, Promtail, or an existing cluster log pipeline. Keep tenant credentials and endpoints in private configuration.

Do not commit real log samples from clients to this public repository.

# Firewall Matrix

Use this template to document allowed network paths before implementation.

| Source | Destination | Port | Protocol | Purpose | Owner |
|---|---|---:|---|---|---|
| internet | Traefik VM or load balancer | 443 | TCP | public HTTPS ingress | platform |
| Gitea runner | Gitea registry | 443 | TCP | image push/pull | platform |
| app VM | monitoring VM | 3100 | TCP | log shipping to Loki | monitoring |
| monitoring VM | app VM | 9100 | TCP | node exporter scrape | monitoring |
| monitoring VM | app service | 8000 | TCP | app metrics scrape | monitoring |

Do not store private IP addresses in public templates.

# DefectDojo VM Plan

## Purpose

Plan a private VM-based DefectDojo deployment when the client does not use Kubernetes.

## Baseline

- hardened Linux VM
- Docker or Docker Compose runtime
- restricted inbound access through VPN, SSO proxy, or trusted network
- outbound access to scanner artifact sources if needed
- encrypted backups for database and uploaded reports
- monitoring for service health, disk usage, and backup age

## Security Notes

- Store `DEFECTDOJO_API_KEY` only in private CI secrets.
- Do not expose DefectDojo publicly unless an approved access layer is in front of it.
- Keep uploaded findings private because they may contain sensitive paths or dependency information.

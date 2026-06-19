# Severity Gating Policy

## Default Strategy

| Severity | New Project | Legacy Project |
|---|---|---|
| Secret | block immediately | block immediately |
| Critical | block after initial baseline | no worse than baseline, then block |
| High | report first, block production after baseline | no worse than baseline |
| Medium | track | track |
| Low | optional tracking | optional tracking |

DAST runs against staging, not production. Production deployment requires manual approval.

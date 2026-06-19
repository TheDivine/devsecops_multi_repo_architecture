# Secret Handling Policy

## Rules

- Never commit real secrets.
- Use `.env.example` for variable names only.
- Store CI tokens in Gitea secrets or an approved secret manager.
- Store production runtime secrets in private deployment systems.
- Rotate exposed secrets immediately and record the incident in private documentation.

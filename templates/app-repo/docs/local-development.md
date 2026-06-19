# Local Development

## Purpose

Describe how developers run the application locally without using production configuration.

## Standard Flow

1. Copy `.env.example` to a local ignored file if the application requires environment variables.
2. Install dependencies using the project runtime.
3. Run tests locally before opening a pull request.
4. Use `docker-compose.yml.example` as a starting point for local-only service wiring.

## Rules

- Do not use production values for local development.
- Do not commit local override files.
- Keep local compose files separate from production deployment manifests.

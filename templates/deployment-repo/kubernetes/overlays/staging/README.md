# Staging Overlay

The staging overlay represents the pre-production environment used for validation.

## Responsibilities

- reference the approved staging image
- define staging resource sizing
- configure staging-safe ingress or routing placeholders
- include validation-specific settings

## Promotion Rule

Production should promote the same image digest that passed staging unless a documented exception exists.

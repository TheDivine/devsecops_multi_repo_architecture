# Public and Private Repository Boundary

## Public-Safe Content

Public repositories may contain:

- generic diagrams
- architecture decisions
- repo templates
- checklists
- non-executable examples
- placeholder-only configuration
- tool links and operating-model documentation

## Private Content

Private repositories are required for:

- customer-specific topology
- provider account references
- real deployment values
- environment inventory
- access-control assignments
- incident details
- production runbooks containing sensitive operational data

## Boundary Rule

If a file would let an unauthorized reader identify a customer, reach an environment, authenticate to a system, or infer private infrastructure, it does not belong in this blueprint.

## Examples

Use `<project-name>`, `<registry-url>`, `<cluster-name>`, and `<environment-name>` in public examples.

Use real values only in approved private implementation repositories with access control and review gates.

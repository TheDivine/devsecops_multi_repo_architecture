# Security Gates

## Purpose

Define security checks expected before release or promotion.

## Required Gates

- dependency vulnerability scan
- container image scan
- infrastructure-as-code scan where applicable
- repository sensitive-data scan
- policy-as-code validation for Kubernetes resources
- review of privileged permissions
- review of exposed network surfaces

## Exception Handling

Security exceptions must include:

- affected component
- risk summary
- compensating control
- expiry date
- owner
- approval reference

Do not store sensitive vulnerability evidence in public blueprint repositories.

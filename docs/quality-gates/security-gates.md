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
- SBOM generation for production images
- DefectDojo import when centralized triage is enabled

## Exception Handling

Security exceptions must include:

- affected component
- risk summary
- compensating control
- expiry date
- owner
- approval reference

Do not store sensitive vulnerability evidence in public blueprint repositories.

## DefectDojo Evidence

When DefectDojo is enabled, CI should import scanner reports using private runtime variables. The public blueprint provides only the reusable import pattern and placeholder examples.

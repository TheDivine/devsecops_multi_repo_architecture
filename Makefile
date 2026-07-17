.PHONY: help tree validate-docs validate-policies grep-secrets check-placeholders

CONFTEST ?= conftest
KYVERNO ?= kyverno

help:
	@printf '%s\n' 'Safe local commands:'
	@printf '%s\n' '  make tree                Show repository files up to depth 4'
	@printf '%s\n' '  make validate-docs       Check markdown files are non-empty'
	@printf '%s\n' '  make validate-policies   Run Conftest and Kyverno policy unit tests'
	@printf '%s\n' '  make grep-secrets        Search for assignment-like sensitive values'
	@printf '%s\n' '  make check-placeholders  Search for placeholder markers'

tree:
	@find . -maxdepth 4 -type f | sort

validate-docs:
	@find . -name '*.md' -type f -size 0 -print -quit | grep -q . && { echo 'Empty markdown file found'; exit 1; } || echo 'Markdown files are non-empty'

validate-policies:
	@command -v $(CONFTEST) >/dev/null || { echo 'Conftest is required'; exit 1; }
	@$(CONFTEST) verify --policy repo-templates/app-repo/policies/conftest
	@$(CONFTEST) verify --policy repo-templates/deployment-repo/policies/conftest
	@$(CONFTEST) verify --policy repo-templates/infra-repo/policies/conftest
	@$(CONFTEST) verify --policy repo-templates/monitoring-repo/policies/conftest
	@command -v $(KYVERNO) >/dev/null || { echo 'Kyverno CLI is required'; exit 1; }
	@$(KYVERNO) test repo-templates/platform-repo/policies/kyverno/tests --require-tests --remove-color

grep-secrets:
	@grep -RInE "(password|secret|token|client_secret|private_key|access_key)[[:space:]]*[:=][[:space:]]*['\"]?[^<'\"{}[:space:]]+" . --exclude-dir=.git || true

check-placeholders:
	@grep -RInE "(CHANGE_ME|example.com|TODO)" docs repo-templates README.md SECURITY.md CONTRIBUTING.md || true

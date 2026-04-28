.PHONY: help tree validate-docs grep-secrets check-placeholders

help:
	@printf '%s\n' 'Safe local commands:'
	@printf '%s\n' '  make tree                Show repository files up to depth 4'
	@printf '%s\n' '  make validate-docs       Check markdown files are non-empty'
	@printf '%s\n' '  make grep-secrets        Search for assignment-like sensitive values'
	@printf '%s\n' '  make check-placeholders  Search for placeholder markers'

tree:
	@find . -maxdepth 4 -type f | sort

validate-docs:
	@find . -name '*.md' -type f -size 0 -print -quit | grep -q . && { echo 'Empty markdown file found'; exit 1; } || echo 'Markdown files are non-empty'

grep-secrets:
	@grep -RInE "(password|secret|token|client_secret|private_key|access_key)[[:space:]]*[:=][[:space:]]*['\"]?[^<'\"{}[:space:]]+" . --exclude-dir=.git || true

check-placeholders:
	@grep -RInE "(CHANGE_ME|example.com|TODO)" docs repo-templates README.md SECURITY.md CONTRIBUTING.md || true

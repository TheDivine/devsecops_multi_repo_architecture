.PHONY: help tree validate validate-docs validate-structure grep-secrets check-placeholders

help:
	@printf '%s\n' 'Safe local commands:'
	@printf '%s\n' '  make tree                Show repository files up to depth 4'
	@printf '%s\n' '  make validate            Run all safe local repository checks'
	@printf '%s\n' '  make validate-docs       Check markdown files are non-empty'
	@printf '%s\n' '  make validate-structure  Check required blueprint files exist'
	@printf '%s\n' '  make grep-secrets        Search for assignment-like sensitive values'
	@printf '%s\n' '  make check-placeholders  Search for placeholder markers'

tree:
	@find . -maxdepth 4 -type f | sort

validate: validate-docs validate-structure grep-secrets check-placeholders

validate-docs:
	@find . -name '*.md' -type f -not -path './.git/*' -not -path './local-lab/*' -not -path './.codex/*' | while IFS= read -r file; do \
		test -s "$$file" || { echo "Empty markdown file: $$file"; exit 1; }; \
	done
	@echo 'Markdown files are non-empty'

validate-structure:
	@for path in \
		README.md \
		docs/index.md \
		docs/assessment/current-state-assessment.md \
		docs/implementation/production-hardening-guide.md \
		docs/implementation/demo-client-implementation-guide.md \
		templates/app-repo/README.md \
		templates/deployment-repo/README.md \
		templates/infrastructure-repo/README.md \
		modules/README.md \
		modules/defectdojo/README.md \
		scripts/defectdojo/reimport-scan.sh \
		policies/severity-gating.md \
		checklists/production-readiness-checklist.md \
		templates/monitoring-repo/README.md \
		templates/docs-repo/README.md; do \
		test -s "$$path" || { echo "Missing required file: $$path"; exit 1; }; \
	done
	@echo 'Required blueprint files are present'

grep-secrets:
	@grep -RInE "(password|secret|token|client_secret|private_key|access_key)[[:space:]]*[:=][[:space:]]*['\"]?[^<'\"{}[:space:]]+" . --exclude-dir=.git --exclude-dir=.codex --exclude-dir=local-lab || true

check-placeholders:
	@grep -RInE "(CHANGE_ME|example.com|TODO)" docs templates modules scripts policies checklists examples README.md SECURITY.md CONTRIBUTING.md || true

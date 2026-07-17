package main

import rego.v1

valid_rules := {
	"groups": [{
		"name": "synthetic",
		"rules": [{
			"alert": "SyntheticTargetDown",
			"annotations": {
				"description": "Synthetic target is unavailable.",
				"runbook_url": "https://docs.example.invalid/runbooks/synthetic-target-down",
				"summary": "Synthetic target is down",
			},
			"expr": "up == 0",
			"for": "5m",
			"labels": {
				"owner": "synthetic-owner",
				"severity": "critical",
			},
		}],
	}],
}

test_valid_alert_metadata_passes if {
	violations := deny with input as valid_rules
	count(violations) == 0
}

test_missing_owner_is_denied if {
	rule := valid_rules.groups[0].rules[0]
	invalid_rule := {
		"alert": rule.alert,
		"annotations": rule.annotations,
		"expr": rule.expr,
		"for": rule.for,
		"labels": {"severity": rule.labels.severity},
	}
	invalid := {"groups": [{"name": "synthetic", "rules": [invalid_rule]}]}
	violations := deny with input as invalid
	some message in violations
	contains(message, "owner label")
}

test_unknown_severity_is_denied if {
	rule := valid_rules.groups[0].rules[0]
	invalid_rule := object.union(rule, {
		"labels": object.union(rule.labels, {"severity": "urgent"}),
	})
	invalid := {"groups": [{"name": "synthetic", "rules": [invalid_rule]}]}
	violations := deny with input as invalid
	some message in violations
	contains(message, "approved severity")
}

test_missing_runbook_is_denied if {
	rule := valid_rules.groups[0].rules[0]
	invalid_rule := {
		"alert": rule.alert,
		"annotations": {
			"description": rule.annotations.description,
			"summary": rule.annotations.summary,
		},
		"expr": rule.expr,
		"for": rule.for,
		"labels": rule.labels,
	}
	invalid := {"groups": [{"name": "synthetic", "rules": [invalid_rule]}]}
	violations := deny with input as invalid
	some message in violations
	contains(message, "runbook_url")
}

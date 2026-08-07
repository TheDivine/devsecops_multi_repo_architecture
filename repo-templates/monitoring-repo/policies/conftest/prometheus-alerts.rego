package main

import rego.v1

allowed_severities := {"critical", "high", "info", "warning"}

alert_rules contains rule if {
	group := object.get(input, "groups", [])[_]
	rule := object.get(group, "rules", [])[_]
	object.get(rule, "alert", "") != ""
}

deny contains msg if {
	rule := alert_rules[_]
	labels := object.get(rule, "labels", {})
	severity := object.get(labels, "severity", "")
	not severity in allowed_severities
	msg := sprintf("Alert %q must use an approved severity.", [rule.alert])
}

deny contains msg if {
	rule := alert_rules[_]
	labels := object.get(rule, "labels", {})
	object.get(labels, "owner", "") == ""
	msg := sprintf("Alert %q must define an owner label.", [rule.alert])
}

deny contains msg if {
	rule := alert_rules[_]
	object.get(rule, "for", "") == ""
	msg := sprintf("Alert %q must define a for duration or an approved exception.", [rule.alert])
}

required_annotations := {"description", "runbook_url", "summary"}

deny contains msg if {
	rule := alert_rules[_]
	annotations := object.get(rule, "annotations", {})
	field := required_annotations[_]
	object.get(annotations, field, "") == ""
	msg := sprintf("Alert %q must define annotation %q.", [rule.alert, field])
}

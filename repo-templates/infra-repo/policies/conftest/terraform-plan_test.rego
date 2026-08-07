package main

import rego.v1

update_plan := {
	"format_version": "1.2",
	"resource_changes": [{
		"address": "example_resource.synthetic",
		"change": {"actions": ["update"]},
	}],
}

delete_plan := {
	"format_version": "1.2",
	"resource_changes": [{
		"address": "example_resource.synthetic",
		"change": {"actions": ["delete"]},
	}],
}

test_update_plan_passes if {
	violations := deny with input as update_plan
	count(violations) == 0
}

test_unapproved_delete_is_denied if {
	violations := deny with input as delete_plan
	some message in violations
	contains(message, "requires an exact approved exception")
}

test_exact_approved_delete_passes if {
	approved := [{
		"approved": true,
		"exception_id": "SYNTHETIC-EXCEPTION",
		"expires_on": "2099-12-31",
		"resource_address": "example_resource.synthetic",
	}]
	violations := deny with input as delete_plan with data.approved_destroy as approved
	count(violations) == 0
}

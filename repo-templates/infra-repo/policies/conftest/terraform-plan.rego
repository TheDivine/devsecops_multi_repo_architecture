package main

import rego.v1

destructive_changes contains change if {
	change := object.get(input, "resource_changes", [])[_]
	"delete" in object.get(change.change, "actions", [])
}

destroy_approved(address) if {
	exception := data.approved_destroy[_]
	exception.resource_address == address
	exception.approved == true
	object.get(exception, "exception_id", "") != ""
	object.get(exception, "expires_on", "") != ""
}

deny contains msg if {
	change := destructive_changes[_]
	not destroy_approved(change.address)
	msg := sprintf("Destructive change to %q requires an exact approved exception.", [change.address])
}

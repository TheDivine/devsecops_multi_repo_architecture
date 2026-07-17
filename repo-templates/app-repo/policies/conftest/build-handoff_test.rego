package main

import rego.v1

valid_handoff := {
	"artifact": {
		"image": "registry.example.invalid/application@sha256:aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
		"provenance": "provenance://synthetic-example",
		"sbom": "sbom://synthetic-example",
		"source_revision": "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb",
		"vulnerability_gate": "passed",
	},
}

test_valid_handoff_passes if {
	violations := deny with input as valid_handoff
	count(violations) == 0
}

test_mutable_image_is_denied if {
	invalid := object.union(valid_handoff, {
		"artifact": object.union(valid_handoff.artifact, {
			"image": "registry.example.invalid/application:latest",
		}),
	})
	violations := deny with input as invalid
	some message in violations
	contains(message, "immutable sha256 digest")
}

test_missing_provenance_is_denied if {
	invalid := {
		"artifact": {
			"image": valid_handoff.artifact.image,
			"sbom": valid_handoff.artifact.sbom,
			"source_revision": valid_handoff.artifact.source_revision,
			"vulnerability_gate": valid_handoff.artifact.vulnerability_gate,
		},
	}
	violations := deny with input as invalid
	some message in violations
	contains(message, "provenance")
}

test_failed_vulnerability_gate_is_denied if {
	invalid := object.union(valid_handoff, {
		"artifact": object.union(valid_handoff.artifact, {
			"vulnerability_gate": "failed",
		}),
	})
	violations := deny with input as invalid
	some message in violations
	contains(message, "approved passed status")
}

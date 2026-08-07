package main

import rego.v1

required_fields := {
	"image",
	"provenance",
	"sbom",
	"source_revision",
	"vulnerability_gate",
}

deny contains "Build handoff metadata must contain an artifact object." if {
	not input.artifact
}

deny contains msg if {
	input.artifact
	field := required_fields[_]
	object.get(input.artifact, field, "") == ""
	msg := sprintf("Artifact metadata field %q is required.", [field])
}

deny contains "Artifact image must use an immutable sha256 digest." if {
	image := object.get(input.artifact, "image", "")
	image != ""
	not regex.match(`@sha256:[a-f0-9]{64}$`, lower(image))
}

deny contains "Source revision must be a full 40-character Git commit SHA." if {
	revision := object.get(input.artifact, "source_revision", "")
	revision != ""
	not regex.match(`^[a-f0-9]{40}$`, lower(revision))
}

deny contains "Vulnerability gate must have the approved passed status." if {
	object.get(input.artifact, "vulnerability_gate", "") != "passed"
}

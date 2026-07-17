package main

import rego.v1

workload_kinds := {"DaemonSet", "Deployment", "Job", "StatefulSet"}

pod_spec := input.spec.template.spec if {
	input.kind in workload_kinds
}

pod_spec := input.spec.jobTemplate.spec.template.spec if {
	input.kind == "CronJob"
}

deny contains "Workloads must disable automatic service-account token mounting." if {
	spec := pod_spec
	object.get(spec, "automountServiceAccountToken", true) != false
}

deny contains "Workloads must set pod securityContext.runAsNonRoot to true." if {
	spec := pod_spec
	security_context := object.get(spec, "securityContext", {})
	object.get(security_context, "runAsNonRoot", false) != true
}

deny contains "Workloads must use seccompProfile RuntimeDefault." if {
	spec := pod_spec
	security_context := object.get(spec, "securityContext", {})
	seccomp := object.get(security_context, "seccompProfile", {})
	object.get(seccomp, "type", "") != "RuntimeDefault"
}

all_containers contains container if {
	spec := pod_spec
	container := object.get(spec, "containers", [])[_]
}

all_containers contains container if {
	spec := pod_spec
	container := object.get(spec, "initContainers", [])[_]
}

deny contains msg if {
	container := all_containers[_]
	security_context := object.get(container, "securityContext", {})
	object.get(security_context, "allowPrivilegeEscalation", true) != false
	msg := sprintf("Container %q must disable privilege escalation.", [container.name])
}

deny contains msg if {
	container := all_containers[_]
	security_context := object.get(container, "securityContext", {})
	object.get(security_context, "readOnlyRootFilesystem", false) != true
	msg := sprintf("Container %q must use a read-only root filesystem or an approved exception.", [container.name])
}

deny contains msg if {
	container := all_containers[_]
	security_context := object.get(container, "securityContext", {})
	capabilities := object.get(security_context, "capabilities", {})
	dropped := object.get(capabilities, "drop", [])
	not "ALL" in dropped
	msg := sprintf("Container %q must drop all Linux capabilities by default.", [container.name])
}

deny contains msg if {
	container := all_containers[_]
	mutable_image(container.image)
	msg := sprintf("Container %q must not use an unversioned or latest image.", [container.name])
}

mutable_image(image) if {
	endswith(lower(image), ":latest")
}

mutable_image(image) if {
	not contains(lower(image), "@sha256:")
	segments := split(image, "/")
	last_segment := segments[count(segments) - 1]
	not contains(last_segment, ":")
}

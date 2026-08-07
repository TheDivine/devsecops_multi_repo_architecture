package main

import rego.v1

secure_deployment := {
	"apiVersion": "apps/v1",
	"kind": "Deployment",
	"metadata": {"name": "synthetic-secure"},
	"spec": {
		"template": {
			"spec": {
				"automountServiceAccountToken": false,
				"securityContext": {
					"runAsNonRoot": true,
					"seccompProfile": {"type": "RuntimeDefault"},
				},
				"containers": [{
					"name": "app",
					"image": "registry.example.invalid/app@sha256:aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
					"securityContext": {
						"allowPrivilegeEscalation": false,
						"readOnlyRootFilesystem": true,
						"capabilities": {"drop": ["ALL"]},
					},
				}],
			},
		},
	},
}

test_secure_deployment_passes if {
	violations := deny with input as secure_deployment
	count(violations) == 0
}

test_latest_image_is_denied if {
	insecure := object.union(secure_deployment, {
		"spec": {
			"template": {
				"spec": object.union(secure_deployment.spec.template.spec, {
					"containers": [object.union(secure_deployment.spec.template.spec.containers[0], {
						"image": "registry.example.invalid/app:latest",
					})],
				}),
			},
		},
	})
	violations := deny with input as insecure
	some message in violations
	contains(message, "latest image")
}

test_writable_root_is_denied if {
	container := secure_deployment.spec.template.spec.containers[0]
	insecure_container := object.union(container, {
		"securityContext": object.union(container.securityContext, {
			"readOnlyRootFilesystem": false,
		}),
	})
	insecure := object.union(secure_deployment, {
		"spec": {
			"template": {
				"spec": object.union(secure_deployment.spec.template.spec, {
					"containers": [insecure_container],
				}),
			},
		},
	})
	violations := deny with input as insecure
	some message in violations
	contains(message, "read-only root filesystem")
}

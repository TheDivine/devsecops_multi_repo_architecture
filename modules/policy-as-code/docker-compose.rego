package dockercompose.security

deny[msg] {
  service_name := input.services[_]
  service := input.services[service_name]
  endswith(service.image, ":latest")
  msg := sprintf("service %s uses mutable latest image tag", [service_name])
}

deny[msg] {
  service_name := input.services[_]
  service := input.services[service_name]
  service.privileged == true
  msg := sprintf("service %s must not run privileged", [service_name])
}

deny[msg] {
  service_name := input.services[_]
  service := input.services[service_name]
  not service.healthcheck
  msg := sprintf("service %s must define a healthcheck", [service_name])
}

deny[msg] {
  service_name := input.services[_]
  service := input.services[service_name]
  not service.restart
  msg := sprintf("service %s must define a restart policy", [service_name])
}

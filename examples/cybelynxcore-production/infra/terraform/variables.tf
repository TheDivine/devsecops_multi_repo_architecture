variable "organization" {
  description = "Organization or tenant identifier."
  type        = string
}

variable "environment" {
  description = "Environment name."
  type        = string
}

variable "cluster_name" {
  description = "Kubernetes cluster name."
  type        = string
}

variable "domain" {
  description = "Base domain for the environment."
  type        = string
}

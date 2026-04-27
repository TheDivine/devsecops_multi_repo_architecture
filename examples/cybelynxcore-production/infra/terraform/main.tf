locals {
  common_tags = {
    organization = var.organization
    environment  = var.environment
    managed_by   = "terraform"
  }
}

# Wire provider-specific modules here in a private implementation repository.
# Example module boundaries:
# - network
# - compute
# - kubernetes_cluster
# - dns
# - registry
# - backup

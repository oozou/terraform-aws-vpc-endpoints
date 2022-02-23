locals {
  default_tags = {
    "Environment" = var.environment,
    "Terraform"   = "true"
  }

  tags = merge(
    var.tags,
    local.default_tags
  )
}

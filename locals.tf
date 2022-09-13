locals {
  default_security_groups = concat(var.is_create_default_security_group ? [aws_security_group.allow_all_internal[0].id] : [], var.security_group_ids)
  default_tags = {
    "Environment" = var.environment,
    "Terraform"   = "true"
  }

  tags = merge(
    var.tags,
    local.default_tags
  )
}

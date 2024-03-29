# interface endpoint
module "interface_endpoints" {
  source = "../../"

  vpc_id             = module.vpc.vpc_id
  security_group_ids = ["sg-12345678"]
  environment        = var.environment
  endpoints = {
    s3 = {
      # interface endpoint
      service = "s3"
      tags    = { Name = "s3-vpc-endpoint" }
    },
    sqs = {
      service             = "sqs"
      private_dns_enabled = true
      security_group_ids  = ["sg-987654321"]
      subnet_ids          = module.vpc.private_subnet_ids
      tags                = { Name = "sqs-vpc-endpoint" }
    }
  }

  tags = var.custom_tags
}

# gateway endpoint
module "gateway_endpoint" {
  source = "../../"

  vpc_id                           = module.vpc.vpc_id
  environment                      = var.environment
  is_create_default_security_group = false
  endpoints = {
    s3 = {
      # gateway endpoint
      service_type    = "Gateway"
      route_table_ids = ["rtb-xxxxxxxxxx", "rtb-xxxxxxxxxx"]
      service         = "s3"
      tags            = { Name = "s3-vpc-endpoint" }
    }
  }

  tags = var.custom_tags
}

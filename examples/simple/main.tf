# interface endpoint
module "interface_endpoints" {
  source = "../../"

  vpc_id             = module.vpc.vpc_id
  security_group_ids = ["sg-12345678"]
  environment        = "dev"
  endpoints = {
    s3 = {
      # interface endpoint
      service             = "s3"
      tags                = { Name = "s3-vpc-endpoint" }
    },
    sqs = {
      service             = "sqs"
      private_dns_enabled = true
      security_group_ids  = ["sg-987654321"]
      subnet_ids          = module.vpc.private_subnet_ids
      tags                = { Name = "sqs-vpc-endpoint" }
    }
  }

  tags = {
    custom = "true"
  }
}

# gateway endpoint
module "gateway_endpoint" {
  source = "../../"

  vpc_id             = module.vpc.vpc_id
  security_group_ids = [""]
  environment        = "dev"
  endpoints = {
    s3 = {
      # gateway endpoint
      service_type        = "Gateway"
      route_table_ids     = ["rtb-xxxxxxxxxx","rtb-xxxxxxxxxxx"]
      service             = "s3"
      tags                = { Name = "s3-vpc-endpoint" }
    }
  }

  tags = {
    custom = "true"
  }
}
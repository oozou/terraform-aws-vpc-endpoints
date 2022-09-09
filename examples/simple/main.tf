# interface endpoint
module "interface_endpoints" {
  source = "git::ssh://git@github.com:oozou/terraform-aws-vpc-endpoints.git"

  vpc_id             = "vpc-12345678"
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
      subnet_ids          = ["subnet-12345678", "subnet-87654321"]
      tags                = { Name = "sqs-vpc-endpoint" }
    }
  }

  tags = {
    custom = "true"
  }
}

# gateway endpoint
module "gateway_endpoint" {
  source = "git::ssh://git@github.com:oozou/terraform-aws-vpc-endpoints.git"

  vpc_id             = "vpc-12345678"
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
# AWS VPC Peering Terraform Module

Terraform module with vpc peering and route table resources on AWS.

## Usage

```terraform
module "endpoints" {
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
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_security_group.allow_all_internal](https://registry.terraform.io/providers/hashicorp/aws/4.2.0/docs/resources/security_group) | resource |
| [aws_vpc_endpoint.this](https://registry.terraform.io/providers/hashicorp/aws/4.2.0/docs/resources/vpc_endpoint) | resource |
| [aws_vpc.this](https://registry.terraform.io/providers/hashicorp/aws/4.2.0/docs/data-sources/vpc) | data source |
| [aws_vpc_endpoint_service.this](https://registry.terraform.io/providers/hashicorp/aws/4.2.0/docs/data-sources/vpc_endpoint_service) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_endpoints"></a> [endpoints](#input\_endpoints) | A map of interface and/or gateway endpoints containing their properties and configurations | `any` | `{}` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | To manage a resources with tags | `string` | n/a | yes |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | Default security group IDs to associate with the VPC endpoints | `list(string)` | `[]` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | Default subnets IDs to associate with the VPC endpoints | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to use on all resources | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC in which the endpoint will be used | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_endpoints"></a> [endpoints](#output\_endpoints) | Array containing the full resource object and attributes for all endpoints created |

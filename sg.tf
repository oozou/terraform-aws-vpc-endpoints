resource "aws_security_group" "allow_all_internal" {
  count = var.is_create_default_security_group ? 1 : 0
  name        = "allow_all_internal"
  description = "Allow All inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "traffic from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [data.aws_vpc.this.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(
    {
      Name = "allow_all_internal_security_group"
    },
    local.tags
  )
}

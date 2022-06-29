resource "aws_vpc" "my-vpc-demo" {
  cidr_block = var.VPC_CIDR
  enable_dns_hostnames = true
  instance_tenancy = "default"
  tags = {
    Name = "${var.ENV}-vpc"
  }
}

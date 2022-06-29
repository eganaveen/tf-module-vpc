resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.my-vpc-demo.id

  count = length(var.SUBNET_CIDR)
  cidr_block = element(var.SUBNET_CIDR, count.index)
  availability_zone = element(var.AZ, count.index )

  tags = {
    Name = "${var.ENV}-${element(var.AZ, count.index)}"
  }
}
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.my-vpc-demo.id

  count = length(var.PUBLIC_SUBNET_CIDR)
  cidr_block = element(var.PUBLIC_SUBNET_CIDR, count.index)
  availability_zone = element(var.AZ, count.index )
  tags = {
    Name = "${var.ENV}-pub-${element(var.AZ, count.index)}"
  }
}
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.my-vpc-demo.id

  count = length(var.PRIVATE_SUBNET_CIDR)
  cidr_block = element(var.PRIVATE_SUBNET_CIDR, count.index)
  availability_zone = element(var.AZ, count.index )
  tags = {
    Name = "${var.ENV}-priv-${element(var.AZ, count.index)}"
  }
}
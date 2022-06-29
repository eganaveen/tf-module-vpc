resource "aws_route_table" "my-rt" {
  vpc_id = aws_vpc.my-vpc-demo.id
#  count  = length(var.SUBNET_CIDR)
  route {
    cidr_block = var.DEFAULT_VPC_CIDR
    vpc_peering_connection_id = aws_vpc_peering_connection.peering.id
  }
  tags = {
    Name = "${var.ENV}-rt"
  }
}


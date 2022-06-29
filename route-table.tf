resource "aws_route_table" "example" {
  vpc_id = aws_vpc.my-vpc-demo.id
  count  = length(var.SUBNET_CIDR)
  route {
    cidr_block = element(var.SUBNET_CIDR,count.index )
    vpc_peering_connection_id = aws_vpc_peering_connection.peering.id
  }

  tags = {
    Name = "${var.ENV}-rt"
  }
}


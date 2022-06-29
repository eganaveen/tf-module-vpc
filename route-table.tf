resource "aws_route_table" "my-rt" {
  vpc_id = aws_vpc.my-vpc-demo.id
  route {
    cidr_block = var.DEFAULT_VPC_CIDR
    vpc_peering_connection_id = aws_vpc_peering_connection.peering.id
  }
  tags = {
    Name = "${var.ENV}-rt"
  }
}

resource "aws_route" "route" {
  route_table_id            = var.DEFAULT_ROUTE_TABLE_ID
  destination_cidr_block    = var.VPC_CIDR
  vpc_peering_connection_id = aws_vpc_peering_connection.peering.id
}
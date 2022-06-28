resource "aws_route_table" "route-table" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = var.DEFAULT_VPC_CIDR
    vpc_peering_connection_id = aws_vpc_peering_connection.peer-connection.id
  }
  tags = {
    Name = "${var.ENV}-route-table"
  }
}

resource "aws_route_table_association" "rt-associate" {
  count = length(var.SUBNET_CIDR)
  subnet_id      = element(var.SUBNET_CIDR, count.index)
  route_table_id = aws_route_table.route-table.id
}

resource "aws_route" "route" {
  route_table_id = var.DEFAULT_VPC_RT
  destination_cidr_block = var.DEFAULT_VPC_CIDR
  vpc_peering_connection_id = aws_vpc_peering_connection.peer-connection.id
}
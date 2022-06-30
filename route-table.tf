resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.my-vpc-demo.id
  route {
    cidr_block = var.DEFAULT_VPC_CIDR
    vpc_peering_connection_id = aws_vpc_peering_connection.peering.id
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "${var.ENV}-public-route-table"
  }
}

resource "aws_route_table_association" "public-route-association" {
  count = length(aws_subnet.public.*.id)
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.my-vpc-demo.id
  route {
    cidr_block = var.DEFAULT_VPC_CIDR
    vpc_peering_connection_id = aws_vpc_peering_connection.peering.id
  }
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw.id
  }
  tags = {
    Name = "${var.ENV}-private-route-table"
  }
}
resource "aws_route_table_association" "private-route-association" {
  count = length(aws_subnet.private.*.id)
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = aws_route_table.private-rt.id
}

resource "aws_route" "route" {
  route_table_id            = var.DEFAULT_ROUTE_TABLE_ID
  destination_cidr_block    = var.VPC_CIDR
  vpc_peering_connection_id = aws_vpc_peering_connection.peering.id
}
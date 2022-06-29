resource "aws_vpc_peering_connection" "peering" {
  peer_vpc_id   = aws_vpc.my-vpc-demo.id
  vpc_id        = var.DEFAULT_VPC_ID
  auto_accept   = true

  tags = {
    Name = "VPC Peering between ${var.ENV}-vpc and ${var.DEFAULT_VPC_ID}-vpc"
  }
}
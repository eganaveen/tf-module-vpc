resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my-vpc-demo.id

  tags = {
    Name = "${var.ENV}-igw"
  }
}
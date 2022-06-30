resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my-vpc-demo.id
  tags = {
    Name = "${var.ENV}-igw"
  }
}
resource "aws_eip" "eip" {
  vpc = true
}
resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.eip.id
  subnet_id = aws_subnet.public.*.id[0]
  tags = {
    Name = "${var.ENV}-ngw"
  }
  depends_on = [aws_internet_gateway.igw]
}
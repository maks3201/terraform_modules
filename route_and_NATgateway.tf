resource "aws_route_table" "rt" {
        vpc_id = data.aws_vpc.vpc.id
        route {
                cidr_block = var.route_table_cidr_block
                nat_gateway_id = aws_nat_gateway.nat_gw.id
                }
        depends_on = [aws_nat_gateway.nat_gw]
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.rt.id
        depends_on = [aws_route_table.rt,aws_subnet.subnet]
}

resource "aws_nat_gateway" "nat_gw" {
  subnet_id = data.aws_subnet.ex.id
  allocation_id = aws_eip.example.id
  depends_on = [aws_eip.example]
}

resource "aws_eip" "example" {
  vpc = true
}

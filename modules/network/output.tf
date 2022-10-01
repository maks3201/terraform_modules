output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_cidr" {
  value = aws_vpc.main.cidr_block
}

output "public_subnets_ids" {
  value = aws_subnet.public_subnets[*].id
}

output "env" {
  value = var.env
}
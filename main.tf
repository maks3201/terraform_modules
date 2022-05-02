provider "aws" {
region = var.region 
}

resource "aws_subnet" "subnet"{
	vpc_id = data.aws_vpc.vpc.id
	cidr_block = var.subnet_cidr_block
	map_public_ip_on_launch = false
	tags = {
		Name = "private_subnet" }
}

resource "aws_instance" "private_instance"{
	ami = data.aws_ami.ubuntu.id
	instance_type = var.instance_type
	key_name = var.key_name
	vpc_security_group_ids = var.vpc_security_group_ids
	subnet_id = aws_subnet.subnet.id
	depends_on = [aws_subnet.subnet]
}

resource "aws_instance" "public_instance"{
        ami = data.aws_ami.ubuntu.id
        instance_type = var.instance_type
        key_name = var.key_name
        vpc_security_group_ids = ["sg-0b0503ebc0e28010f"]
}


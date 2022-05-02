data "aws_vpc" "vpc"{
        filter {
                name = "tag:Name"
                values = ["default"]
        }
}

data "aws_ami" "ubuntu" {
        most_recent = true
        owners = ["099720109477"]
        filter {
                name = "name"
                values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
        }
}


data "aws_subnet" "ex" {
	availability_zone_id = aws_subnet.subnet.availability_zone_id
	filter {
                name = "default-for-az"
                values = [true]
        }
}

output "instance_public_ip"{
        value = aws_instance.public_instance.public_ip
}

output "instance_private_ip"{
        value = aws_instance.private_instance.private_ip
}

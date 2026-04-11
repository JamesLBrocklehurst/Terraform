// creation of network for the resources to operate in

data "aws_vpc" "default" {
    default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

// creating the security group for the server

resource "aws_security_group" "wp_sg" {
    name       = "wordpress-sg"
    description = "Allow HTTP and SSH"
    vpc_id     = data.aws_vpc.default.id

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

// creation of the EC2 instance for the wordpress server
module "ec2" {
  source = "./modules/ec2"
  ami_id = var.ami_id
  key_name = var.key_name
  subnet_id = data.aws_subnets.default.ids[0]
  vpc_id = [aws_security_group.wp_sg.id]
}
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

resource "aws_security_group" "webserver_sg" {
    name       = "webserver-sg"
    description = "Allow HTTP, HTTPS and SSH"
    vpc_id     = data.aws_vpc.default.id

    ingress {
        description = "HTTP"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "HTTPS"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = var.ssh_allowed_cidrs
    }

    egress {
        description = "Allow all outbound traffic"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

// creating the EC2 instance
resource "aws_instance" "webserver" {
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = data.aws_subnets.default.ids[0]
    vpc_security_group_ids = [aws_security_group.webserver_sg.id]
    associate_public_ip_address = true
    key_name = var.key_pair_name

user_data = file("${path.module}/cloud-init.yaml")

}

resource "aws_eip" "web_eip" {
  instance = aws_instance.webserver.id
  domain   = "vpc"
}

// Create an EC2 instance for WordPress

resource "aws_instance" "wordpress" {
    ami = var.ami_id
    instance_type = "t2.nano"
    subnet_id = var.subnet_id
    vpc_security_group_ids = var.vpc_id
    key_name = var.key_name

    user_data = file("${path.module}/user-data.sh")
    tags = {
        Names = "wordpress-ec2"
    }
}

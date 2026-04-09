resource "aws_instance" "this" {
  ami                     = "ami-0f1b092c39d616d45"
  instance_type           = var.instance_type
  subnet_id               = var.subnet_id
}


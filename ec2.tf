resource "aws_instance" "this" {
  ami                     = "ami-0f1b092c39d616d45"
  instance_type           = "t2.nano"
  subnet_id               = "var.subnet_id"
}
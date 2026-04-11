module "ec2" {
  source = "./modules/ec2"
  
  subnet_id      = var.subnet_id
  instance_type  = var.instance_type
}

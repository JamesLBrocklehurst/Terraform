module "ec2_web_server" {
  source = "./modules/ec2"

  instance_type     = var.instance_type
  ami_id            = var.ami_id
  key_pair_name     = var.key_pair_name
  ssh_allowed_cidrs = var.ssh_allowed_cidrs
  domain_name       = var.domain_name
}

module "route53" {
  source = "./modules/route53"

  domain_name = var.domain_name
  public_ip   = module.ec2_web_server.public_ip
}

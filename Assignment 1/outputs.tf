output "public_ip" {
    description = "the public IP address of the ec2 instance"
  value = module.ec2.public_ip
}

output "instance_id" {
    description = "the ID of the ec2 instance"
  value = module.ec2.instance_id
}
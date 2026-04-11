output "public_ip" {
    description = "the public IP address of the ec2 instance"
  value = aws_instance.wordpress.public_ip
}

output "instance_id" {
    description = "the ID of the ec2 instance"
  value = aws_instance.wordpress.id
}
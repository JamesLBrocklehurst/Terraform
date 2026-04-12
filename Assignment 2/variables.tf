variable "ami_id" {
  description = "AMI for the EC2 instance"
  type = string
}

variable "instance_type" {
  description = "EC2 instance type (e.g. t3.micro, t3.small)"
  type        = string
}

variable "key_pair_name" {
  description = "Name of an existing EC2 Key Pair for SSH. Set to null to disable SSH key access."
  type        = string
  default     = null
}

variable "ssh_allowed_cidrs" {
  description = "CIDR blocks permitted to reach port 22. Restrict to your IP in production."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "domain_name" {
  description = "Apex domain name passed into cloud-init for Certbot (e.g. jamesbrocklehurst.co.uk)"
  type        = string
}
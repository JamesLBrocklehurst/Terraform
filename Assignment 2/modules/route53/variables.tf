# =============================================================
# modules/route53/variables.tf
#
# All inputs the module needs – passed in by the root module.
# No defaults here (except optional ones): keeps the module
# explicit and prevents silent misconfiguration.
# =============================================================


variable "domain_name" {
  description = "Apex domain name passed into cloud-init for Certbot (e.g. jamesbrocklehurst.co.uk)"
  type        = string
}

variable "public_ip" {
  description = "Public IP address from the EC2 module"
  type        = string
}
## Terraform

This project folder contains 2 assignments further detailed below and a folder that had some testing to see how to get certain things to work.

### Assignment 1:

Deploy WordPress Using Terraform

**Objective**

Use Terraform to deploy a full WordPress stack on AWS.

Your setup should include:

EC2 instance running WordPress

Security groups

User data or cloud-init to install dependencies

A working public endpoint

All resources provisioned via Terraform

This assignment shows you how Terraform manages real infrastructure end-to-end.

**Minimum Requirements**

main.tf with AWS provider, EC2 resource and required settings

variables.tf for inputs

outputs.tf for instance details

User data script embedded or referenced

A successful WordPress installation

### Assignment 2:

EC2 Deployment with Cloud-Init

**Objective**

Configure a cloud-init file and use Terraform to automate an EC2 deployment.

Your task:

Write a cloud-init YAML file

Install and configure software on boot (e.g. NGINX or Apache)

Pass cloud-init to the EC2 instance through Terraform

Ensure the instance comes online fully configured with no manual steps


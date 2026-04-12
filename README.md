## Terraform

This project folder contains 2 assignments further detailed below and a folder that had some testing to see how to get certain things to work.

### Assignment 1:

Deploy WordPress Using Terraform

#### ***Objective***

Use Terraform to deploy a full WordPress stack on AWS.

Your setup should include:

EC2 instance running WordPress

Security groups

User data or cloud-init to install dependencies

A working public endpoint

All resources provisioned via Terraform

This assignment shows you how Terraform manages real infrastructure end-to-end.

#### ***Minimum Requirements***

main.tf with AWS provider, EC2 resource and required settings

variables.tf for inputs

outputs.tf for instance details

User data script embedded or referenced

A successful WordPress installation

#### ***Learning Outcomes***

During this assignment I had some inital troubles with deploying the user data onto the EC2 instance that was running after the Terraform apply. 

After some research, this came down to the type of instance I was trying to run...

I was trying to deploy a *Amazon Linux* image whilst trying to use a *bash* format file for the user data which is not supported.

Once I had noticed this I corrected the instance within the variables to a supported *ubuntu* image. In between this I ran *terraform destroy* so the environment was clean.

After the change was made I ran terraform plan and deploy again. After the deployment was complete the *user data"* script had now ran successfully and the wordpress server was accessible.

### Assignment 2:

EC2 Deployment with Cloud-Init

#### ***Objective***

Configure a cloud-init file and use Terraform to automate an EC2 deployment.

Your task:

Write a cloud-init YAML file

Install and configure software on boot (e.g. NGINX or Apache)

Pass cloud-init to the EC2 instance through Terraform

Ensure the instance comes online fully configured with no manual steps

### ***Learning Outcomes***

For this assignment I decided to go one step further than the initial assignment that was laid out. For this I added the self task of also linking the webserver to my custom domain.

I decided that this should also be all within a module meaning both the ec2 instane and route53 config would live in seperate modules.

This lead to some difficulties with working out how I needed to interact and set an output so that the route53 module could get the public IP of the EC2 instance once provisioned.

However, once this was done and all *terraform plan* did not run any errors *terraform apply* had no issues. Once the instance was up and running I was able to access the web server via both the Public IP and via the Domain Name. 

For me this showed that all I had learnt through out setting up the first assignment set me up for success on the second.
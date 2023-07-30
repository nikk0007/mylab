# Terraform

It is assumed that AWS credentials will be configured on the system from where we will run this terraform script. I have not provided the AWS CLI credentials inside the provider block.

- terraform init
- terraform validate
- terraform fmt
- terraform plan
- terraform apply -auto-approve
- terraform destroy -auto-approve


====================================================================

# Docker

docker build -t myimage:latest .
docker run -it myimage

=====================================================================

# Gitlab

Note that this template uses the hashicorp/terraform:light Docker image to run Terraform commands. We can choose other images based on our specific needs, such as images with additional tools for scanning and validation (e.g., tfsec).



# Terraform EC2 Provisioning

This example provisions one Amazon EC2 instance in an existing VPC subnet.

## Usage

1. Copy `terraform.tfvars.example` to `terraform.tfvars`.
2. Set the AWS region, subnet ID, SSH key pair name, and your public IP address.
3. Run:

```text
terraform init
terraform plan
terraform apply
```

The AWS provider uses the standard AWS credential chain, such as environment variables, an AWS profile, or an attached IAM role. Do not put access keys in Terraform files.

To remove the instance and security group:

```text
terraform destroy
```
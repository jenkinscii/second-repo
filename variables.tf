variable "aws_region" {
  description = "AWS region in which to create the instance."
  type        = string
  default     = "us-east-1"
}

variable "subnet_id" {
  description = "ID of an existing public subnet."
  type        = string
}

variable "ami_id" {
  description = "AMI ID compatible with the selected region and instance architecture."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Name of an existing EC2 key pair used for SSH access."
  type        = string
}

variable "admin_cidr" {
  description = "CIDR block allowed to connect over SSH, for example 203.0.113.10/32."
  type        = string
}

variable "name" {
  description = "Name assigned to the EC2 instance and security group."
  type        = string
  default     = "terraform-ec2"
}
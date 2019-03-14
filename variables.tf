variable "aws_region" {
  description = "Target region for creation of AWS assets"
  default = "us-west-1"
}

variable "aws_credential_file" {
  description = "Local source for TOML-formated AWS credential file"
  type = "string"
  default = ""
}

variable "aws_profile" {
  description = "Profile within var.aws_credential_file to use when accessing AWS"
  default = "default"
}

variable "release_phase" {
  description = "Deployment release phase"
  default = "dev"
}

variable "vault_bucket" {
  description = "S3 bucket acting as Vault backend"
  default = ""
}

variable "vpc_name" {
  description = "AWS name for VPC (default: <environment name>_vpc)"
  default = ""
}

variable "vpc_cidr" {
  description = "CIDR block for VPC network"
  default = "10.0.0.0/16"
}

variable "vpc_azs" {
  description = "Availability zones within aws_region in which to deploy Vault"
  default = ["us-west-1a", "us-west-1b"]
}

variable "private_subnets" {
  description = "Private subnet CIDRs to deploy Vault within"
  default = ["10.0.0.0/24", "10.0.2.0/24", "10.0.4.0/24"]
}

variable "ec2_vault_prefix" {
  description = "Server name prefix for autoscaled Vault instances"
  default = ""
}
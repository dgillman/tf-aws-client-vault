# AWS Client Vault Infrastructure

* This is a pre-release work in progress. The Design section indicates current direction, not complete functionality *

This project aims to demonstrate the creation of a HashiCorp Vault cluster in AWS, used for securely storing client credentials that be used to gain temporary credentials from the AWS [Security Token Service](https://docs.aws.amazon.com/STS/latest/APIReference/Welcome.html) (STS). In this way, high-level client credentials are protected and available only to those with an adequate need to know. All infrastructure work is performed with the derived (and short-lived) STS tokens.

## Design

This module deploys a Vault cluster: multiple EC2 instances, all running the Vault server software, balanced behind an ELB. The number of Vault servers may grow or shrink to meet demand, or to recover from an outage. The cluster number is maintained through an Auto Scaling Group (ASG). The Vault cluster is backed by an encrypted S3 backend.

This module relies on the [tf-aws-env](https://github.com/dgillman/tf-aws-env) module to define common project and environment properties, and upon the AWS Community [terraform-aws-vpc](https://github.com/terraform-aws-modules/terraform-aws-vpc) module to construct the basic networking infrastructure.

## TO DO
- implement initial cluster using HashiCorp's (terraform-aws-vault)[https://github.com/hashicorp/terraform-aws-vault] module
  - create Vault AMI to back Launch Template for Vault Server
  - install AWS secrets engine within Vault AMI
- determine whether Vault `init` process can be automated and encrypted root and unseal tokens stored securely
- lift off of VPC module to allow use of VPC retrieved by `data resource` or optionally created as barebones VPC if needed
  - optionally create private subnet (currently part of VPC module)
  - optionally create VPN (currently part of VPC module)
- implement kitchen-terraform testing with awspec

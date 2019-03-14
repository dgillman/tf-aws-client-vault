locals {
  vault_bucket = "${coalesce(var.vault_bucket, "${module.env.fullname}-vault")}"
  vault_ec2_name_prefix = "${coalesce(var.ec2_vault_prefix, "${module.env.fullname}-vault-")}"
  vpc_name = "${coalesce(var.vpc_name, "${module.env.fullname}_vpc")}"
  vpc_cidr = "${var.vpc_cidr}"
}
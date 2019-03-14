module "vpc" {
  source = "git@github.com:terraform-aws-modules/terraform-aws-vpc.git"
  version = "v1.59.0"

  name = "${local.vpc_name}"
  cidr = "${var.vpc_cidr}"
  azs = "${var.vpc_azs}"
  private_subnets = "${var.private_subnets}"

  enable_vpn_gateway = true

  tags = "${module.env.tags}"
}
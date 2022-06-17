module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "tf-cloudfront-alb-demo-vpc"
  cidr = var.vpc_cidr

  azs = ["${var.region}a", "${var.region}b"]
  public_subnets = [
    cidrsubnet(var.vpc_cidr, 8, 0),
    cidrsubnet(var.vpc_cidr, 8, 1)
  ]
  private_subnets = [
    cidrsubnet(var.vpc_cidr, 8, 2),
    cidrsubnet(var.vpc_cidr, 8, 3)
  ]

  enable_nat_gateway   = true
  single_nat_gateway   = false
  enable_dns_hostnames = true


  tags = local.tags

}


terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "4.23.0"
        }  
    }
    backend "s3" {
        bucket = "202210-demo-terraform"
        key    = "demo-terraform-vpc"
        region = "eu-central-1"
    }
}


provider "aws" {
  region = "eu-central-1"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "3.14.2"
  name = "${lookup(local.resource_prefix, terraform.workspace)}-${lookup(local.env, terraform.workspace)}"
  cidr = "${lookup(local.cidr, terraform.workspace)}"

  azs             = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  private_subnets = "${lookup(local.private_subnets, terraform.workspace)}"
  public_subnets  = "${lookup(local.public_subnets, terraform.workspace)}"

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "${lookup(local.env, terraform.workspace)}"
  }
}
module "default_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.13.1"
  name = "${lookup(local.resource_prefix, terraform.workspace)}-demo-${lookup(local.env, terraform.workspace)}-sg"
  vpc_id = module.vpc.vpc_id
  tags = {
    Terraform   = "true"
    Environment = "${lookup(local.env, terraform.workspace)}"
  }
}
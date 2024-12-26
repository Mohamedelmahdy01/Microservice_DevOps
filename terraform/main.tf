terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"
}

module "compute" {
  source         = "./modules/compute"
  subnet_id       = module.vpc.public_subnet_id
  instance_type  = var.instance_type
  ami_id         = var.ami_id
  security_group_ids = [module.security.security_group_id]
  ssh_key_name   = var.ssh_key_name
}

module "security" {
  source = "./modules/security"
  vpc_id = module.vpc.vpc_id
}
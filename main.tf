provider "aws" {
  region = "us-east-1"  # Change to your preferred region
}

module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name
}

module "subnet" {
  source       = "./modules/subnets"
  vpc_id       = module.vpc.vpc_id
  subnet_cidrs = var.subnet_cidrs
  azs          = var.azs
}

module "igw" {
  source = "./modules/igw"
  vpc_id = module.vpc.vpc_id
}

module "route" {
  source     = "./modules/RT"
  vpc_id     = module.vpc.vpc_id
  igw_id     = module.igw.igw_id
  subnet_ids = module.subnet.subnet_ids
}

module "security_group" {
  source = "./modules/Sg"
  vpc_id = module.vpc.vpc_id
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.0.1"
    }
  }
}

provider "aws" {
  profile = var.profile
  region  = var.region
}

module "myec2" {
  source = "../modules/ec2/"
  machine_type = "m5.xlarge"
}
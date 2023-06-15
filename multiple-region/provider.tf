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
  region  = var.region1
}

provider "aws" {
  profile = var.profile
  region  = var.region2
  alias   = "region2"
}
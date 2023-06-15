terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.0.1"
    }
  }
}

provider "aws" {
  profile = var.profile1
  region  = var.region1
}

provider "aws" {
  profile = var.profile2
  region  = var.region2
  alias   = "account2"
}
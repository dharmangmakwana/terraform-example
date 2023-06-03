terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.0.1"
     }
  }
}

provider "aws" {
  profile    = "${var.profile}"
  region     = "${var.region}"
}

locals {
  common_tags = {
      OwnerName = "DevOps Team"
      Deployment = var.deployment_type
  }
}
resource "aws_instance" "web" {
  ami = var.ami
  instance_type = var.instance_type
  count = var.deployment_type == "dev" ? var.web-count : 0
  tags = local.common_tags
}
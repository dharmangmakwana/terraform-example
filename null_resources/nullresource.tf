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

resource "aws_eip" "myeip" {
  depends_on = [ null_resource.health-checks ]
}

resource "null_resource" "health-checks" {
  provisioner "local-exec" {
    command = "curl https://google.com"
  }
}
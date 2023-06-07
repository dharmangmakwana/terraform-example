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

resource "aws_iam_user" "mobifin_user" {
  name = "devopsuser${count.index+1}"
  path = "/system/"
  count = var.web-count
}

output "arn" {
  value = aws_iam_user.mobifin_user[*].arn
}

output "name" {
  value = aws_iam_user.mobifin_user[*].name
}

output "combined" {
  value = zipmap(aws_iam_user.mobifin_user[*].arn, aws_iam_user.mobifin_user[*].name)
}
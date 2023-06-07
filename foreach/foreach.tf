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

# Method 1
resource "aws_iam_user" "mobifin_user" {
  path = "/system/"
  for_each = toset(var.set)
  # toset function is eliminating the duplicate values
  name = each.key
}

# Method 2
resource "aws_instance" "web" {
  ami = var.ami
  for_each = {
    web = "t2.micro"
    trn = "t2.large"
  }
  instance_type = each.value
  tags = {
    Name = each.key
  }
 
}
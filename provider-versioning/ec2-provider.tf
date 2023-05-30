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

resource "aws_instance" "web" {
  ami = "ami-0715c1897453cabd1"
  instance_type = "t2.micro"
  tags = {
    Name = "Web Server"
    CreatedBy = "Dharmang Makwana"
    Learning = "Terraform"
  }
}

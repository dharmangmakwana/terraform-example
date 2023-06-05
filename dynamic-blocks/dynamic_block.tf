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

locals {
  common_tags = {
    OwnerName  = "DevOps Team"
    Deployment = var.deployment_type
  }
}

data "aws_ami" "ami_id" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}
resource "aws_instance" "web" {
  ami           = data.aws_ami.ami_id.id
  instance_type = var.instance_type
  count         = var.deployment_type == "dev" ? var.web-count : 0
  tags          = local.common_tags
}

resource "aws_security_group" "newsg" {
  name        = "new-security-group"
  description = "My New Security Group"
  dynamic "ingress" {
    for_each = var.ingress_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

/*resource "aws_security_group" "newsg" {
  name = "new-security-group"
  description = "My New Security Group"
  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}*/
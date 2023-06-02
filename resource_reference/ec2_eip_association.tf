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

resource "aws_eip" "myeip" { 
}

resource "aws_instance" "web" {
  ami = var.ami
  instance_type = var.instance_type
  tags = {
    Name = "Web Server"
    CreatedBy = "Dharmang Makwana"
    Learning = "Terraform"
  }
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.web.id
  allocation_id = aws_eip.myeip.id
}

resource "aws_security_group" "WebSG" {
  name        = "WebSG"
  description = "Allow SSH inbound traffic"

  ingress {
    description      = "SSH from Akshardham Public IP"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.home_ip]
  }
}

resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = aws_security_group.WebSG.id
  network_interface_id = aws_instance.web.primary_network_interface_id
}
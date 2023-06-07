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

# Method 2
resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.keyname
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("./terraform-practice.pem")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum -y install httpd",
      "sudo systemctl start httpd"
    ]
  }

  provisioner "local-exec" {
    command = "echo 'Hello World' >> output.txt" 
  }
}
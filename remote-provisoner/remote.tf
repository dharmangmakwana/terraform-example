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
    on_failure = continue
    inline = [
      "sudo yum -y install httpd",
      "sudo systemctl start httpd"
    ]
  }

  provisioner "local-exec" {
    on_failure = continue
    when = destroy
    # when = destroy help us to executing below command before destroying the resource
    command = "echo 'Hello World' >> output.txt" 
  }
}

/*

Creation Time provisioner - > Creation time provisioner are run only during the creation, not during the updatation or any other life cycle. If the creation-time provisioner failes then the resource is marked as tainted.

Destroy Time Provisioner -> This will run before destroying the resources.

*/
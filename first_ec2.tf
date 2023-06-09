provider "aws" {
  profile = var.profile
  region  = var.region
}

resource "aws_instance" "web" {
  ami           = "ami-0715c1897453cabd1"
  instance_type = "t2.micro"
}
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

/* Creating Elastic IP And getting its value in variable */
resource "aws_eip" "myeip" {
}

output "eip" {
  value = aws_eip.myeip.public_ip
}

/* Creating S3 bucket And getting its domain name in variable */
resource "aws_s3_bucket" "mys3bucket" {
  bucket = "mys3bucket-dharmang"    
}

output "mys3bucket" {
  value = aws_s3_bucket.mys3bucket.bucket_domain_name
}
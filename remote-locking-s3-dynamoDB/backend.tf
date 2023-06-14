terraform {
  backend "s3" {
    bucket = "dm-terrraform-remote-state"
    key    = "network/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-remote-lock"
  }
}

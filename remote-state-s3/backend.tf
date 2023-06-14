terraform {
  backend "s3" {
    bucket = "dm-terrraform-remote-state"
    key    = "network/dm.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-remote-lock"
  }
}

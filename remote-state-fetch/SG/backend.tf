data "terraform_remote_state" "mys3" {
  backend = "s3"
  config = {
    bucket         = "dm-terrraform-remote-state"
    key            = "network/state.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-remote-lock"
  }
}
data "aws_secretsmanager_secret_version" "mysecret" {
  secret_id = "terraform-cred"
}

locals {
  db_cred = jsondecode(data.aws_secretsmanager_secret_version.mysecret.secret_string)
}

output "username" {
  value = local.db_cred.username
  sensitive = true
}
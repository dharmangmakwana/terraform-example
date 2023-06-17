terraform {
  cloud {
    organization = "skillcraftacademy"

    workspaces {
      name = "terraformcloud-remote-workspace"
    }
  }
}

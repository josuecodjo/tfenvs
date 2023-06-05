# Default provider
generate "provider" {
  path = "providers.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "default"
}
EOF
}

locals {
  dir = "${basename(get_terragrunt_dir())}"
}

remote_state {
  backend = "kubernetes"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    secret_suffix    = local.dir
    config_path = "~/.kube/config"
    load_config_file = true
    namespace = "super-secure-ns-terraform"
  }
}

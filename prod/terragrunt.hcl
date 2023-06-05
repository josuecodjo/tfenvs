include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "${get_parent_terragrunt_dir()}/src"
}

locals {
  dir = "${basename(get_terragrunt_dir())}"
  pod = yamldecode(file(find_in_parent_folders("container.yml")))
}

inputs = {
  my_ns = local.dir
  mycontainer = local.pod.container
}
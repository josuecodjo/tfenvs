include "root" {
  path = find_in_parent_folders()
}

locals {
  dir = "${basename(get_terragrunt_dir())}"
  pod = yamldecode(file(find_in_parent_folders("container-map.yml")))
}

inputs = {
  my_ns = local.dir
  mapcontainer = local.pod.container
  map_ns = local.pod.map-ns
}
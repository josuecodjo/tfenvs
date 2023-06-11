module "map-container" {
  for_each = var.mapcontainer

  source="git::https://github.com/josuecodjo/tfsource.git?ref=main"
  
  # Put it in vars !
  my_ns = var.map_ns[each.key]
  mycontainer = each.value
}